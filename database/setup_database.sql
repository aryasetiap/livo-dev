-- =====================================================
-- DATABASE SETUP SCRIPT FOR LIVO APP
-- =====================================================
-- This script sets up the complete database structure for the Livo social media app
-- Run this script in your Supabase SQL editor to initialize your database

-- 1. First, create the storage buckets
INSERT INTO storage.buckets (id, name, public)
VALUES
    ('profiles', 'profiles', true),
    ('posts', 'posts', true),
    ('stories', 'stories', false),
    ('messages', 'messages', false)
ON CONFLICT (id) DO NOTHING;

-- 2. Run the initial schema migration
-- (Copy the contents of 001_initial_schema.sql here or run it separately)

-- 3. Run the RLS policies migration
-- (Copy the contents of 002_rls_policies.sql here or run it separately)

-- 4. Create additional database functions for common operations

-- Function to get feed posts
CREATE OR REPLACE FUNCTION public.get_feed_posts(
    user_id UUID DEFAULT NULL,
    limit_count INTEGER DEFAULT 20,
    offset_count INTEGER DEFAULT 0
)
RETURNS TABLE (
    id UUID,
    user_id UUID,
    username TEXT,
    display_name TEXT,
    avatar_url TEXT,
    caption TEXT,
    media_urls TEXT[],
    media_types TEXT[],
    thumbnail_url TEXT,
    location TEXT,
    tags TEXT[],
    mentions UUID[],
    likes_count INTEGER,
    comments_count INTEGER,
    shares_count INTEGER,
    is_liked BOOLEAN,
    is_saved BOOLEAN,
    created_at TIMESTAMP WITH TIME ZONE,
    updated_at TIMESTAMP WITH TIME ZONE
) AS $$
BEGIN
    RETURN QUERY
    SELECT
        p.id,
        p.user_id,
        pr.username,
        pr.display_name,
        pr.avatar_url,
        p.caption,
        p.media_urls,
        p.media_types,
        p.thumbnail_url,
        p.location,
        p.tags,
        p.mentions,
        p.likes_count,
        p.comments_count,
        p.shares_count,
        EXISTS(SELECT 1 FROM public.likes l WHERE l.post_id = p.id AND l.user_id = get_feed_posts.user_id) as is_liked,
        EXISTS(SELECT 1 FROM public.saved_posts sp WHERE sp.post_id = p.id AND sp.user_id = get_feed_posts.user_id) as is_saved,
        p.created_at,
        p.updated_at
    FROM public.posts p
    JOIN public.profiles pr ON p.user_id = pr.id
    WHERE
        -- Show own posts
        p.user_id = get_feed_posts.user_id OR
        -- Show posts from followed users
        p.user_id IN (
            SELECT following_id
            FROM public.follows
            WHERE follower_id = get_feed_posts.user_id
        ) OR
        -- If no user_id provided, show all posts (for explore page)
        get_feed_posts.user_id IS NULL
    ORDER BY p.created_at DESC
    LIMIT limit_count
    OFFSET offset_count;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Function to follow a user
CREATE OR REPLACE FUNCTION public.follow_user(target_user_id UUID)
RETURNS BOOLEAN AS $$
BEGIN
    -- Prevent self-follow
    IF auth.uid() = target_user_id THEN
        RETURN FALSE;
    END IF;

    -- Check if already following
    IF EXISTS(
        SELECT 1 FROM public.follows
        WHERE follower_id = auth.uid() AND following_id = target_user_id
    ) THEN
        RETURN FALSE;
    END IF;

    -- Create follow relationship
    INSERT INTO public.follows (follower_id, following_id)
    VALUES (auth.uid(), target_user_id);

    -- Create notification
    INSERT INTO public.notifications (user_id, type, actor_id, title, body)
    VALUES (
        target_user_id,
        'follow',
        auth.uid(),
        'New Follower',
        'Someone started following you'
    );

    RETURN TRUE;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Function to unfollow a user
CREATE OR REPLACE FUNCTION public.unfollow_user(target_user_id UUID)
RETURNS BOOLEAN AS $$
BEGIN
    -- Check if following exists
    IF NOT EXISTS(
        SELECT 1 FROM public.follows
        WHERE follower_id = auth.uid() AND following_id = target_user_id
    ) THEN
        RETURN FALSE;
    END IF;

    -- Remove follow relationship
    DELETE FROM public.follows
    WHERE follower_id = auth.uid() AND following_id = target_user_id;

    RETURN TRUE;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Function to like a post
CREATE OR REPLACE FUNCTION public.like_post(target_post_id UUID)
RETURNS BOOLEAN AS $$
BEGIN
    -- Check if already liked
    IF EXISTS(
        SELECT 1 FROM public.likes
        WHERE user_id = auth.uid() AND post_id = target_post_id
    ) THEN
        RETURN FALSE;
    END IF;

    -- Create like
    INSERT INTO public.likes (user_id, post_id)
    VALUES (auth.uid(), target_post_id);

    -- Create notification for post owner (if not own post)
    INSERT INTO public.notifications (user_id, type, actor_id, post_id, title, body)
    SELECT
        p.user_id,
        'like',
        auth.uid(),
        p.id,
        'New Like',
        'Someone liked your post'
    FROM public.posts p
    WHERE p.id = target_post_id AND p.user_id != auth.uid();

    RETURN TRUE;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Function to unlike a post
CREATE OR REPLACE FUNCTION public.unlike_post(target_post_id UUID)
RETURNS BOOLEAN AS $$
BEGIN
    -- Check if like exists
    IF NOT EXISTS(
        SELECT 1 FROM public.likes
        WHERE user_id = auth.uid() AND post_id = target_post_id
    ) THEN
        RETURN FALSE;
    END IF;

    -- Remove like
    DELETE FROM public.likes
    WHERE user_id = auth.uid() AND post_id = target_post_id;

    RETURN TRUE;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Function to save a post
CREATE OR REPLACE FUNCTION public.save_post(target_post_id UUID, collection_name TEXT DEFAULT 'General')
RETURNS BOOLEAN AS $$
BEGIN
    -- Check if already saved
    IF EXISTS(
        SELECT 1 FROM public.saved_posts
        WHERE user_id = auth.uid() AND post_id = target_post_id
    ) THEN
        RETURN FALSE;
    END IF;

    -- Save post
    INSERT INTO public.saved_posts (user_id, post_id, collection_name)
    VALUES (auth.uid(), target_post_id, collection_name);

    RETURN TRUE;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Function to unsave a post
CREATE OR REPLACE FUNCTION public.unsave_post(target_post_id UUID)
RETURNS BOOLEAN AS $$
BEGIN
    -- Check if saved
    IF NOT EXISTS(
        SELECT 1 FROM public.saved_posts
        WHERE user_id = auth.uid() AND post_id = target_post_id
    ) THEN
        RETURN FALSE;
    END IF;

    -- Remove saved post
    DELETE FROM public.saved_posts
    WHERE user_id = auth.uid() AND post_id = target_post_id;

    RETURN TRUE;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Function to get conversation messages
CREATE OR REPLACE FUNCTION public.get_conversation_messages(
    other_user_id UUID,
    limit_count INTEGER DEFAULT 50,
    offset_count INTEGER DEFAULT 0
)
RETURNS TABLE (
    id UUID,
    sender_id UUID,
    receiver_id UUID,
    content TEXT,
    media_url TEXT,
    media_type TEXT,
    is_read BOOLEAN,
    read_at TIMESTAMP WITH TIME ZONE,
    is_deleted BOOLEAN,
    created_at TIMESTAMP WITH TIME ZONE,
    updated_at TIMESTAMP WITH TIME ZONE
) AS $$
BEGIN
    RETURN QUERY
    SELECT
        m.id,
        m.sender_id,
        m.receiver_id,
        m.content,
        m.media_url,
        m.media_type,
        m.is_read,
        m.read_at,
        m.is_deleted,
        m.created_at,
        m.updated_at
    FROM public.messages m
    WHERE
        (
            (m.sender_id = auth.uid() AND m.receiver_id = other_user_id) OR
            (m.sender_id = other_user_id AND m.receiver_id = auth.uid())
        )
        AND m.is_deleted = FALSE
    ORDER BY m.created_at DESC
    LIMIT limit_count
    OFFSET offset_count;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Function to send a message
CREATE OR REPLACE FUNCTION public.send_message(
    receiver_id UUID,
    content TEXT DEFAULT NULL,
    media_url TEXT DEFAULT NULL,
    media_type TEXT DEFAULT 'text'
)
RETURNS UUID AS $$
DECLARE
    conversation_id TEXT;
    new_message_id UUID;
BEGIN
    -- Generate deterministic conversation ID
    IF auth.uid() < receiver_id THEN
        conversation_id = auth.uid()::text || '_' || receiver_id::text;
    ELSE
        conversation_id = receiver_id::text || '_' || auth.uid()::text;
    END IF;

    -- Create message
    INSERT INTO public.messages (
        sender_id,
        receiver_id,
        conversation_id,
        content,
        media_url,
        media_type
    )
    VALUES (
        auth.uid(),
        receiver_id,
        conversation_id,
        content,
        media_url,
        media_type
    )
    RETURNING id INTO new_message_id;

    -- Create notification
    INSERT INTO public.notifications (user_id, type, actor_id, message_id, title, body)
    VALUES (
        receiver_id,
        'message',
        auth.uid(),
        new_message_id,
        'New Message',
        'You received a new message'
    );

    RETURN new_message_id;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Function to mark messages as read
CREATE OR REPLACE FUNCTION public.mark_messages_read(other_user_id UUID)
RETURNS BOOLEAN AS $$
BEGIN
    -- Update unread messages from other user
    UPDATE public.messages
    SET is_read = TRUE, read_at = NOW()
    WHERE
        sender_id = other_user_id AND
        receiver_id = auth.uid() AND
        is_read = FALSE;

    RETURN TRUE;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Function to get notifications
CREATE OR REPLACE FUNCTION public.get_notifications(
    limit_count INTEGER DEFAULT 20,
    offset_count INTEGER DEFAULT 0
)
RETURNS TABLE (
    id UUID,
    type TEXT,
    actor_id UUID,
    actor_username TEXT,
    actor_display_name TEXT,
    actor_avatar_url TEXT,
    post_id UUID,
    comment_id UUID,
    message_id UUID,
    title TEXT,
    body TEXT,
    data JSONB,
    is_read BOOLEAN,
    read_at TIMESTAMP WITH TIME ZONE,
    created_at TIMESTAMP WITH TIME ZONE
) AS $$
BEGIN
    RETURN QUERY
    SELECT
        n.id,
        n.type,
        n.actor_id,
        actor.username as actor_username,
        actor.display_name as actor_display_name,
        actor.avatar_url as actor_avatar_url,
        n.post_id,
        n.comment_id,
        n.message_id,
        n.title,
        n.body,
        n.data,
        n.is_read,
        n.read_at,
        n.created_at
    FROM public.notifications n
    LEFT JOIN public.profiles actor ON n.actor_id = actor.id
    WHERE n.user_id = auth.uid()
    ORDER BY n.created_at DESC
    LIMIT limit_count
    OFFSET offset_count;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Function to mark notifications as read
CREATE OR REPLACE FUNCTION public.mark_notifications_read()
RETURNS BOOLEAN AS $$
BEGIN
    -- Mark all unread notifications as read
    UPDATE public.notifications
    SET is_read = TRUE, read_at = NOW()
    WHERE user_id = auth.uid() AND is_read = FALSE;

    RETURN TRUE;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- 5. Create initial admin user and settings (optional)
-- Uncomment and modify if needed

-- INSERT INTO public.profiles (id, email, username, display_name, is_verified)
-- VALUES (
--     'your-admin-user-id-here',
--     'admin@livo.app',
--     'admin',
--     'Livo Admin',
--     true
-- );

-- =====================================================
-- SETUP COMPLETE
-- =====================================================
-- Your database is now ready for the Livo app!
--
-- Next steps:
-- 1. Update your Supabase configuration in the Flutter app
-- 2. Test the authentication flow
-- 3. Upload some media files to storage buckets
-- 4. Start using the app!