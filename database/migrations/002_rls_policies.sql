-- Row Level Security (RLS) Policies for Livo App
-- This file contains security policies to control data access

-- =====================================================
-- ENABLE RLS ON ALL TABLES
-- =====================================================

ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.posts ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.stories ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.story_viewers ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.likes ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.comments ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.comment_likes ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.follows ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.saved_posts ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.messages ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.notifications ENABLE ROW LEVEL SECURITY;

-- =====================================================
-- PROFILES POLICIES
-- =====================================================

-- Users can view all profiles (for public viewing)
CREATE POLICY "Public profiles are viewable by everyone"
ON public.profiles FOR SELECT
USING (true);

-- Users can insert their own profile
CREATE POLICY "Users can create their own profile"
ON public.profiles FOR INSERT
WITH CHECK (auth.uid() = id);

-- Users can update their own profile
CREATE POLICY "Users can update own profile"
ON public.profiles FOR UPDATE
USING (auth.uid() = id)
WITH CHECK (auth.uid() = id);

-- Users can delete their own profile
CREATE POLICY "Users can delete own profile"
ON public.profiles FOR DELETE
USING (auth.uid() = id);

-- =====================================================
-- POSTS POLICIES
-- =====================================================

-- Authenticated users can view all posts
CREATE POLICY "Posts are viewable by authenticated users"
ON public.posts FOR SELECT
USING (auth.role() = 'authenticated');

-- Users can insert their own posts
CREATE POLICY "Users can create their own posts"
ON public.posts FOR INSERT
WITH CHECK (auth.uid() = user_id);

-- Users can update their own posts
CREATE POLICY "Users can update own posts"
ON public.posts FOR UPDATE
USING (auth.uid() = user_id)
WITH CHECK (auth.uid() = user_id);

-- Users can delete their own posts
CREATE POLICY "Users can delete own posts"
ON public.posts FOR DELETE
USING (auth.uid() = user_id);

-- =====================================================
-- STORIES POLICIES
-- =====================================================

-- Users can view stories from people they follow
CREATE POLICY "Stories from followed users are viewable"
ON public.stories FOR SELECT
USING (
    auth.role() = 'authenticated' AND
    (
        -- User can view their own stories
        auth.uid() = user_id OR
        -- User can view stories of people they follow
        user_id IN (
            SELECT following_id FROM public.follows
            WHERE follower_id = auth.uid()
        ) OR
        -- User can view stories that haven't expired yet
        expires_at > NOW()
    )
);

-- Users can insert their own stories
CREATE POLICY "Users can create their own stories"
ON public.stories FOR INSERT
WITH CHECK (auth.uid() = user_id);

-- Users can update their own stories
CREATE POLICY "Users can update own stories"
ON public.stories FOR UPDATE
USING (auth.uid() = user_id)
WITH CHECK (auth.uid() = user_id);

-- Users can delete their own stories
CREATE POLICY "Users can delete own stories"
ON public.stories FOR DELETE
USING (auth.uid() = user_id);

-- =====================================================
-- STORY VIEWERS POLICIES
-- =====================================================

-- Users can insert story viewers (when they view a story)
CREATE POLICY "Users can record story views"
ON public.story_viewers FOR INSERT
WITH CHECK (auth.uid() = viewer_id);

-- Users can view their own story views
CREATE POLICY "Users can view their story views"
ON public.story_viewers FOR SELECT
USING (auth.uid() = viewer_id);

-- Story owners can see who viewed their stories
CREATE POLICY "Story owners can view story viewers"
ON public.story_viewers FOR SELECT
USING (
    auth.uid() IN (
        SELECT user_id FROM public.stories
        WHERE id = story_id
    )
);

-- =====================================================
-- LIKES POLICIES
-- =====================================================

-- Authenticated users can view all likes
CREATE POLICY "Likes are viewable by authenticated users"
ON public.likes FOR SELECT
USING (auth.role() = 'authenticated');

-- Users can insert their own likes
CREATE POLICY "Users can create their own likes"
ON public.likes FOR INSERT
WITH CHECK (auth.uid() = user_id);

-- Users can delete their own likes
CREATE POLICY "Users can delete their own likes"
ON public.likes FOR DELETE
USING (auth.uid() = user_id);

-- =====================================================
-- COMMENTS POLICIES
-- =====================================================

-- Authenticated users can view all comments
CREATE POLICY "Comments are viewable by authenticated users"
ON public.comments FOR SELECT
USING (auth.role() = 'authenticated');

-- Users can insert their own comments
CREATE POLICY "Users can create their own comments"
ON public.comments FOR INSERT
WITH CHECK (auth.uid() = user_id);

-- Users can update their own comments
CREATE POLICY "Users can update own comments"
ON public.comments FOR UPDATE
USING (auth.uid() = user_id)
WITH CHECK (auth.uid() = user_id);

-- Users can delete their own comments
CREATE POLICY "Users can delete own comments"
ON public.comments FOR DELETE
USING (auth.uid() = user_id);

-- =====================================================
-- COMMENT LIKES POLICIES
-- =====================================================

-- Authenticated users can view all comment likes
CREATE POLICY "Comment likes are viewable by authenticated users"
ON public.comment_likes FOR SELECT
USING (auth.role() = 'authenticated');

-- Users can insert their own comment likes
CREATE POLICY "Users can create their own comment likes"
ON public.comment_likes FOR INSERT
WITH CHECK (auth.uid() = user_id);

-- Users can delete their own comment likes
CREATE POLICY "Users can delete their own comment likes"
ON public.comment_likes FOR DELETE
USING (auth.uid() = user_id);

-- =====================================================
-- FOLLOWS POLICIES
-- =====================================================

-- Users can view follows (public follow information)
CREATE POLICY "Follows are viewable by authenticated users"
ON public.follows FOR SELECT
USING (
    auth.role() = 'authenticated' AND
    (
        -- Users can see their own follows
        follower_id = auth.uid() OR
        -- Users can see their followers
        following_id = auth.uid()
    )
);

-- Users can insert their own follows
CREATE POLICY "Users can create their own follows"
ON public.follows FOR INSERT
WITH CHECK (auth.uid() = follower_id);

-- Users can delete their own follows
CREATE POLICY "Users can delete their own follows"
ON public.follows FOR DELETE
USING (auth.uid() = follower_id);

-- =====================================================
-- SAVED POSTS POLICIES
-- =====================================================

-- Users can view their own saved posts
CREATE POLICY "Users can view their own saved posts"
ON public.saved_posts FOR SELECT
USING (auth.uid() = user_id);

-- Users can insert their own saved posts
CREATE POLICY "Users can create their own saved posts"
ON public.saved_posts FOR INSERT
WITH CHECK (auth.uid() = user_id);

-- Users can delete their own saved posts
CREATE POLICY "Users can delete their own saved posts"
ON public.saved_posts FOR DELETE
USING (auth.uid() = user_id);

-- =====================================================
-- MESSAGES POLICIES
-- =====================================================

-- Users can view messages in conversations they are part of
CREATE POLICY "Users can view their own messages"
ON public.messages FOR SELECT
USING (
    auth.uid() = sender_id OR
    auth.uid() = receiver_id
);

-- Users can insert messages to conversations they are part of
CREATE POLICY "Users can create their own messages"
ON public.messages FOR INSERT
WITH CHECK (auth.uid() = sender_id);

-- Users can update their own messages (mark as read, etc.)
CREATE POLICY "Users can update their own messages"
ON public.messages FOR UPDATE
USING (
    auth.uid() = sender_id OR
    auth.uid() = receiver_id
)
WITH CHECK (
    auth.uid() = sender_id OR
    auth.uid() = receiver_id
);

-- Users can delete their own messages
CREATE POLICY "Users can delete their own messages"
ON public.messages FOR DELETE
USING (auth.uid() = sender_id);

-- =====================================================
-- NOTIFICATIONS POLICIES
-- =====================================================

-- Users can view their own notifications
CREATE POLICY "Users can view their own notifications"
ON public.notifications FOR SELECT
USING (auth.uid() = user_id);

-- Users can update their own notifications (mark as read)
CREATE POLICY "Users can update their own notifications"
ON public.notifications FOR UPDATE
USING (auth.uid() = user_id)
WITH CHECK (auth.uid() = user_id);

-- Users can delete their own notifications
CREATE POLICY "Users can delete their own notifications"
ON public.notifications FOR DELETE
USING (auth.uid() = user_id);

-- System/service role can insert notifications
CREATE POLICY "Service role can create notifications"
ON public.notifications FOR INSERT
WITH CHECK (auth.role() = 'service_role');

-- =====================================================
-- STORAGE POLICIES
-- =====================================================

-- Enable RLS on storage
ALTER STORAGE bucket profiles ENABLE ROW LEVEL SECURITY;
ALTER STORAGE bucket posts ENABLE ROW LEVEL SECURITY;
ALTER STORAGE bucket stories ENABLE ROW LEVEL SECURITY;
ALTER STORAGE bucket messages ENABLE ROW LEVEL SECURITY;

-- Profiles bucket policies
CREATE POLICY "Users can upload their own profile pictures"
ON storage.objects FOR INSERT
WITH CHECK (
    bucket_id = 'profiles' AND
    auth.uid()::text = (storage.foldername(name))[1]
);

CREATE POLICY "Users can view their own profile pictures"
ON storage.objects FOR SELECT
USING (
    bucket_id = 'profiles' AND
    auth.uid()::text = (storage.foldername(name))[1]
);

CREATE POLICY "Users can update their own profile pictures"
ON storage.objects FOR UPDATE
USING (
    bucket_id = 'profiles' AND
    auth.uid()::text = (storage.foldername(name))[1]
);

CREATE POLICY "Users can delete their own profile pictures"
ON storage.objects FOR DELETE
USING (
    bucket_id = 'profiles' AND
    auth.uid()::text = (storage.foldername(name))[1]
);

-- Posts bucket policies
CREATE POLICY "Users can upload their own post media"
ON storage.objects FOR INSERT
WITH CHECK (
    bucket_id = 'posts' AND
    auth.uid()::text = (storage.foldername(name))[1]
);

CREATE POLICY "Authenticated users can view post media"
ON storage.objects FOR SELECT
USING (
    bucket_id = 'posts' AND
    auth.role() = 'authenticated'
);

CREATE POLICY "Users can update their own post media"
ON storage.objects FOR UPDATE
USING (
    bucket_id = 'posts' AND
    auth.uid()::text = (storage.foldername(name))[1]
);

CREATE POLICY "Users can delete their own post media"
ON storage.objects FOR DELETE
USING (
    bucket_id = 'posts' AND
    auth.uid()::text = (storage.foldername(name))[1]
);

-- Stories bucket policies
CREATE POLICY "Users can upload their own story media"
ON storage.objects FOR INSERT
WITH CHECK (
    bucket_id = 'stories' AND
    auth.uid()::text = (storage.foldername(name))[1]
);

CREATE POLICY "Users can view stories from followed users"
ON storage.objects FOR SELECT
USING (
    bucket_id = 'stories' AND
    auth.role() = 'authenticated' AND
    (
        auth.uid()::text = (storage.foldername(name))[1] OR
        auth.uid() IN (
            SELECT follower_id FROM public.follows
            WHERE following_id::text = (storage.foldername(name))[1]
        )
    )
);

CREATE POLICY "Users can update their own story media"
ON storage.objects FOR UPDATE
USING (
    bucket_id = 'stories' AND
    auth.uid()::text = (storage.foldername(name))[1]
);

CREATE POLICY "Users can delete their own story media"
ON storage.objects FOR DELETE
USING (
    bucket_id = 'stories' AND
    auth.uid()::text = (storage.foldername(name))[1]
);

-- Messages bucket policies
CREATE POLICY "Users can upload their own message media"
ON storage.objects FOR INSERT
WITH CHECK (
    bucket_id = 'messages' AND
    auth.uid()::text = (storage.foldername(name))[1]
);

CREATE POLICY "Users can view their own message media"
ON storage.objects FOR SELECT
USING (
    bucket_id = 'messages' AND
    (
        auth.uid()::text = (storage.foldername(name))[1] OR
        -- Check if user is part of the conversation
        EXISTS (
            SELECT 1 FROM public.messages
            WHERE (
                conversation_id = (storage.foldername(name))[2] AND
                (sender_id = auth.uid() OR receiver_id = auth.uid())
            )
        )
    )
);

CREATE POLICY "Users can update their own message media"
ON storage.objects FOR UPDATE
USING (
    bucket_id = 'messages' AND
    auth.uid()::text = (storage.foldername(name))[1]
);

CREATE POLICY "Users can delete their own message media"
ON storage.objects FOR DELETE
USING (
    bucket_id = 'messages' AND
    auth.uid()::text = (storage.foldername(name))[1]
);

-- =====================================================
-- HELPER FUNCTIONS FOR STORAGE
-- =====================================================

-- Function to extract folder name from storage path
CREATE OR REPLACE FUNCTION storage.foldername(text)
RETURNS text[] AS $$
BEGIN
    RETURN string_to_array($1, '/');
END;
$$ LANGUAGE plpgsql IMMUTABLE;