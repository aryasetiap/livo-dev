-- Livo App Initial Database Schema
-- This file contains the initial database setup for the Livo social media app

-- =====================================================
-- EXTENSIONS
-- =====================================================

-- Enable UUID generation
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Enable PostgREST for better API functionality
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- =====================================================
-- CORE TABLES
-- =====================================================

-- Users Profile Table (extends Supabase auth.users)
CREATE TABLE IF NOT EXISTS public.profiles (
    id UUID REFERENCES auth.users(id) ON DELETE CASCADE PRIMARY KEY,
    email TEXT NOT NULL,
    username TEXT UNIQUE,
    display_name TEXT,
    bio TEXT,
    avatar_url TEXT,
    website TEXT,
    location TEXT,
    followers_count INTEGER DEFAULT 0,
    following_count INTEGER DEFAULT 0,
    posts_count INTEGER DEFAULT 0,
    is_private BOOLEAN DEFAULT FALSE,
    is_verified BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Posts Table
CREATE TABLE IF NOT EXISTS public.posts (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    user_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE NOT NULL,
    caption TEXT,
    media_urls TEXT[], -- Array of media URLs (images/videos)
    media_types TEXT[], -- Array of media types ('image', 'video', 'carousel')
    thumbnail_url TEXT,
    location TEXT,
    tags TEXT[], -- Array of hashtags
    mentions UUID[], -- Array of mentioned user IDs
    likes_count INTEGER DEFAULT 0,
    comments_count INTEGER DEFAULT 0,
    shares_count INTEGER DEFAULT 0,
    is_archived BOOLEAN DEFAULT FALSE,
    is_sensitive BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Stories Table
CREATE TABLE IF NOT EXISTS public.stories (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    user_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE NOT NULL,
    media_url TEXT NOT NULL,
    media_type TEXT NOT NULL CHECK (media_type IN ('image', 'video')),
    thumbnail_url TEXT,
    caption TEXT,
    expires_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT (NOW() + INTERVAL '24 hours'),
    viewers_count INTEGER DEFAULT 0,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Story Viewers Table (who viewed which stories)
CREATE TABLE IF NOT EXISTS public.story_viewers (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    story_id UUID REFERENCES public.stories(id) ON DELETE CASCADE NOT NULL,
    viewer_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE NOT NULL,
    viewed_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    UNIQUE(story_id, viewer_id)
);

-- Likes Table
CREATE TABLE IF NOT EXISTS public.likes (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    user_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE NOT NULL,
    post_id UUID REFERENCES public.posts(id) ON DELETE CASCADE NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    UNIQUE(user_id, post_id)
);

-- Comments Table
CREATE TABLE IF NOT EXISTS public.comments (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    user_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE NOT NULL,
    post_id UUID REFERENCES public.posts(id) ON DELETE CASCADE NOT NULL,
    parent_id UUID REFERENCES public.comments(id) ON DELETE CASCADE, -- For nested comments
    content TEXT NOT NULL,
    mentions UUID[], -- Array of mentioned user IDs
    likes_count INTEGER DEFAULT 0,
    replies_count INTEGER DEFAULT 0,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Comment Likes Table
CREATE TABLE IF NOT EXISTS public.comment_likes (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    user_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE NOT NULL,
    comment_id UUID REFERENCES public.comments(id) ON DELETE CASCADE NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    UNIQUE(user_id, comment_id)
);

-- Follows Table
CREATE TABLE IF NOT EXISTS public.follows (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    follower_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE NOT NULL,
    following_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    UNIQUE(follower_id, following_id),
    CHECK(follower_id != following_id)
);

-- Saved Posts Table
CREATE TABLE IF NOT EXISTS public.saved_posts (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    user_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE NOT NULL,
    post_id UUID REFERENCES public.posts(id) ON DELETE CASCADE NOT NULL,
    collection_name TEXT DEFAULT 'General',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    UNIQUE(user_id, post_id)
);

-- Messages Table
CREATE TABLE IF NOT EXISTS public.messages (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    sender_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE NOT NULL,
    receiver_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE NOT NULL,
    conversation_id TEXT NOT NULL, -- Composite key for 1-to-1 conversations
    content TEXT,
    media_url TEXT,
    media_type TEXT CHECK (media_type IN ('text', 'image', 'video', 'audio')),
    is_read BOOLEAN DEFAULT FALSE,
    read_at TIMESTAMP WITH TIME ZONE,
    is_deleted BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Notifications Table
CREATE TABLE IF NOT EXISTS public.notifications (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    user_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE NOT NULL,
    type TEXT NOT NULL CHECK (type IN ('like', 'comment', 'follow', 'mention', 'message', 'post')),
    actor_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE, -- User who performed the action
    post_id UUID REFERENCES public.posts(id) ON DELETE CASCADE,
    comment_id UUID REFERENCES public.comments(id) ON DELETE CASCADE,
    message_id UUID REFERENCES public.messages(id) ON DELETE CASCADE,
    title TEXT,
    body TEXT,
    data JSONB, -- Additional notification data
    is_read BOOLEAN DEFAULT FALSE,
    read_at TIMESTAMP WITH TIME ZONE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- =====================================================
-- INDEXES FOR PERFORMANCE
-- =====================================================

-- Profiles indexes
CREATE INDEX IF NOT EXISTS idx_profiles_username ON public.profiles(username);
CREATE INDEX IF NOT EXISTS idx_profiles_email ON public.profiles(email);
CREATE INDEX IF NOT EXISTS idx_profiles_created_at ON public.profiles(created_at);

-- Posts indexes
CREATE INDEX IF NOT EXISTS idx_posts_user_id ON public.posts(user_id);
CREATE INDEX IF NOT EXISTS idx_posts_created_at ON public.posts(created_at DESC);
CREATE INDEX IF NOT EXISTS idx_posts_likes_count ON public.posts(likes_count DESC);
CREATE INDEX IF NOT EXISTS idx_posts_comments_count ON public.posts(comments_count DESC);
CREATE INDEX IF NOT EXISTS idx_posts_gin_tags ON public.posts USING GIN(tags);
CREATE INDEX IF NOT EXISTS idx_posts_gin_mentions ON public.posts USING GIN(mentions);

-- Stories indexes
CREATE INDEX IF NOT EXISTS idx_stories_user_id ON public.stories(user_id);
CREATE INDEX IF NOT EXISTS idx_stories_expires_at ON public.stories(expires_at);
CREATE INDEX IF NOT EXISTS idx_stories_created_at ON public.stories(created_at DESC);

-- Likes indexes
CREATE INDEX IF NOT EXISTS idx_likes_post_id ON public.likes(post_id);
CREATE INDEX IF NOT EXISTS idx_likes_user_id ON public.likes(user_id);
CREATE INDEX IF NOT EXISTS idx_likes_created_at ON public.likes(created_at DESC);

-- Comments indexes
CREATE INDEX IF NOT EXISTS idx_comments_post_id ON public.comments(post_id);
CREATE INDEX IF NOT EXISTS idx_comments_user_id ON public.comments(user_id);
CREATE INDEX IF NOT EXISTS idx_comments_parent_id ON public.comments(parent_id);
CREATE INDEX IF NOT EXISTS idx_comments_created_at ON public.comments(created_at DESC);
CREATE INDEX IF NOT EXISTS idx_comments_gin_mentions ON public.comments USING GIN(mentions);

-- Follows indexes
CREATE INDEX IF NOT EXISTS idx_follows_follower_id ON public.follows(follower_id);
CREATE INDEX IF NOT EXISTS idx_follows_following_id ON public.follows(following_id);
CREATE INDEX IF NOT EXISTS idx_follows_created_at ON public.follows(created_at DESC);

-- Messages indexes
CREATE INDEX IF NOT EXISTS idx_messages_conversation_id ON public.messages(conversation_id);
CREATE INDEX IF NOT EXISTS idx_messages_sender_id ON public.messages(sender_id);
CREATE INDEX IF NOT EXISTS idx_messages_receiver_id ON public.messages(receiver_id);
CREATE INDEX IF NOT EXISTS idx_messages_created_at ON public.messages(created_at DESC);
CREATE INDEX IF NOT EXISTS idx_messages_is_read ON public.messages(is_read);

-- Notifications indexes
CREATE INDEX IF NOT EXISTS idx_notifications_user_id ON public.notifications(user_id);
CREATE INDEX IF NOT EXISTS idx_notifications_type ON public.notifications(type);
CREATE INDEX IF NOT EXISTS idx_notifications_is_read ON public.notifications(is_read);
CREATE INDEX IF NOT EXISTS idx_notifications_created_at ON public.notifications(created_at DESC);

-- =====================================================
-- TRIGGERS FOR AUTOMATIC UPDATES
-- =====================================================

-- Function to update updated_at timestamp
CREATE OR REPLACE FUNCTION public.handle_updated_at()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Apply updated_at trigger to relevant tables
CREATE TRIGGER handle_profiles_updated_at
    BEFORE UPDATE ON public.profiles
    FOR EACH ROW
    EXECUTE FUNCTION public.handle_updated_at();

CREATE TRIGGER handle_posts_updated_at
    BEFORE UPDATE ON public.posts
    FOR EACH ROW
    EXECUTE FUNCTION public.handle_updated_at();

CREATE TRIGGER handle_stories_updated_at
    BEFORE UPDATE ON public.stories
    FOR EACH ROW
    EXECUTE FUNCTION public.handle_updated_at();

CREATE TRIGGER handle_comments_updated_at
    BEFORE UPDATE ON public.comments
    FOR EACH ROW
    EXECUTE FUNCTION public.handle_updated_at();

CREATE TRIGGER handle_messages_updated_at
    BEFORE UPDATE ON public.messages
    FOR EACH ROW
    EXECUTE FUNCTION public.handle_updated_at();

-- Function to update profile counts
CREATE OR REPLACE FUNCTION public.update_profile_counts()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_TABLE_NAME = 'posts' THEN
        IF TG_OP = 'INSERT' THEN
            UPDATE public.profiles
            SET posts_count = posts_count + 1
            WHERE id = NEW.user_id;
            RETURN NEW;
        ELSIF TG_OP = 'DELETE' THEN
            UPDATE public.profiles
            SET posts_count = posts_count - 1
            WHERE id = OLD.user_id;
            RETURN OLD;
        END IF;
    ELSIF TG_TABLE_NAME = 'follows' THEN
        IF TG_OP = 'INSERT' THEN
            UPDATE public.profiles
            SET following_count = following_count + 1
            WHERE id = NEW.follower_id;
            UPDATE public.profiles
            SET followers_count = followers_count + 1
            WHERE id = NEW.following_id;
            RETURN NEW;
        ELSIF TG_OP = 'DELETE' THEN
            UPDATE public.profiles
            SET following_count = following_count - 1
            WHERE id = OLD.follower_id;
            UPDATE public.profiles
            SET followers_count = followers_count - 1
            WHERE id = OLD.following_id;
            RETURN OLD;
        END IF;
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

-- Apply profile count triggers
CREATE TRIGGER update_profile_posts_count
    AFTER INSERT OR DELETE ON public.posts
    FOR EACH ROW
    EXECUTE FUNCTION public.update_profile_counts();

CREATE TRIGGER update_profile_follows_count
    AFTER INSERT OR DELETE ON public.follows
    FOR EACH ROW
    EXECUTE FUNCTION public.update_profile_counts();

-- Function to update post counts
CREATE OR REPLACE FUNCTION public.update_post_counts()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_TABLE_NAME = 'likes' THEN
        IF TG_OP = 'INSERT' THEN
            UPDATE public.posts
            SET likes_count = likes_count + 1
            WHERE id = NEW.post_id;
            RETURN NEW;
        ELSIF TG_OP = 'DELETE' THEN
            UPDATE public.posts
            SET likes_count = likes_count - 1
            WHERE id = OLD.post_id;
            RETURN OLD;
        END IF;
    ELSIF TG_TABLE_NAME = 'comments' THEN
        IF TG_OP = 'INSERT' THEN
            UPDATE public.posts
            SET comments_count = comments_count + 1
            WHERE id = NEW.post_id;
            RETURN NEW;
        ELSIF TG_OP = 'DELETE' THEN
            UPDATE public.posts
            SET comments_count = comments_count - 1
            WHERE id = OLD.post_id;
            RETURN OLD;
        END IF;
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

-- Apply post count triggers
CREATE TRIGGER update_posts_likes_count
    AFTER INSERT OR DELETE ON public.likes
    FOR EACH ROW
    EXECUTE FUNCTION public.update_post_counts();

CREATE TRIGGER update_posts_comments_count
    AFTER INSERT OR DELETE ON public.comments
    FOR EACH ROW
    EXECUTE FUNCTION public.update_post_counts();

-- Function to create notification on new follow
CREATE OR REPLACE FUNCTION public.create_follow_notification()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO public.notifications (user_id, type, actor_id, title, body)
    VALUES (
        NEW.following_id,
        'follow',
        NEW.follower_id,
        'New Follower',
        'Someone started following you'
    );
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Apply follow notification trigger
CREATE TRIGGER create_follow_notification_trigger
    AFTER INSERT ON public.follows
    FOR EACH ROW
    EXECUTE FUNCTION public.create_follow_notification();