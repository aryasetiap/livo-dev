# Livo App Database Setup

This directory contains the database schema, security policies, and setup scripts for the Livo social media application.

## Files Overview

- `001_initial_schema.sql` - Core database tables and indexes
- `002_rls_policies.sql` - Row Level Security policies for data protection
- `setup_database.sql` - Complete setup script with helper functions
- `README.md` - This file

## Quick Setup

### 1. Create Supabase Project

1. Go to [supabase.com](https://supabase.com)
2. Create a new project
3. Note your project URL and anon key

### 2. Run Database Setup

1. Open the Supabase SQL Editor
2. Copy and paste the contents of `setup_database.sql`
3. Execute the script

### 3. Create Storage Buckuckets

The setup script automatically creates these storage buckets:
- `profiles` - User profile pictures (public)
- `posts` - Post media files (public)
- `stories` - Story media files (private)
- `messages` - Message media files (private)

### 4. Configure Flutter App

Update your Supabase configuration in `lib/src/core/config/supabase_config.dart`:

```dart
static const String _prodUrl = 'YOUR_SUPABASE_URL';
static const String _prodAnonKey = 'YOUR_SUPABASE_ANON_KEY';
```

## Database Schema

### Core Tables

#### `profiles`
User profiles extending Supabase auth.users
- id (UUID, Primary Key)
- email, username, display_name, bio, avatar_url
- followers_count, following_count, posts_count
- is_private, is_verified

#### `posts`
User posts with media content
- id (UUID, Primary Key)
- user_id (Foreign Key)
- caption, media_urls[], media_types[]
- likes_count, comments_count, shares_count
- location, tags[], mentions[]

#### `stories`
Ephemeral stories (24-hour expiry)
- id (UUID, Primary Key)
- user_id (Foreign Key)
- media_url, media_type, thumbnail_url
- expires_at, viewers_count

#### `likes`, `comments`, `follows`
Social interaction tables with proper relationships

#### `messages`
Private messaging system
- conversation_id for 1-to-1 chats
- content, media_url, media_type
- is_read, read_at

#### `notifications`
In-app notifications system
- type (like, comment, follow, mention, message)
- actor_id, post_id, comment_id, message_id
- is_read, read_at

## Security Features

### Row Level Security (RLS)

All tables have RLS policies that ensure:

- **Users can only modify their own data**
- **Public content is viewable by authenticated users**
- **Private content (stories, messages) is restricted**
- **Storage access is properly controlled**

### Data Validation

- Email format validation
- Username format validation (3-30 chars, alphanumeric + underscore/dot)
- Password minimum length (8 chars)
- Content length limits
- Foreign key constraints

### Automatic Features

- **Timestamp updates** with database triggers
- **Count updates** (followers, following, posts, likes, comments)
- **Notification creation** for social interactions
- **Story expiration** (24 hours)

## Helper Functions

The database includes these useful functions:

### Social Functions
- `follow_user(target_user_id)` - Follow a user
- `unfollow_user(target_user_id)` - Unfollow a user
- `like_post(post_id)` - Like a post
- `unlike_post(post_id)` - Unlike a post
- `save_post(post_id, collection_name)` - Save a post
- `unsave_post(post_id)` - Remove saved post

### Messaging Functions
- `send_message(receiver_id, content, media_url, media_type)` - Send message
- `get_conversation_messages(other_user_id)` - Get conversation history
- `mark_messages_read(other_user_id)` - Mark messages as read

### Feed Functions
- `get_feed_posts(user_id, limit, offset)` - Get personalized feed
- `get_notifications(limit, offset)` - Get user notifications
- `mark_notifications_read()` - Mark all notifications as read

## Performance Optimizations

### Indexes

All tables have optimized indexes for:
- Foreign key relationships
- Timestamp-based queries (created_at DESC)
- Search queries (username, tags)
- Array columns (mentions, tags)

### GIN Indexes

For array columns and full-text search:
- `posts.tags` (GIN)
- `posts.mentions` (GIN)
- `comments.mentions` (GIN)

## Storage Security

### Bucket Policies

- **profiles**: Users can only access their own profile pictures
- **posts**: Users can upload/view post media
- **stories**: Users can view stories from people they follow
- **messages**: Users can only view their own message media

### File Path Structure

```
profiles/{user_id}/{filename}
posts/{user_id}/{filename}
stories/{user_id}/{filename}
messages/{user_id}/{conversation_id}/{filename}
```

## Testing Your Setup

### 1. Authentication Test

```sql
-- Check if a user can create/view their profile
INSERT INTO public.profiles (id, email, username)
VALUES ('test-user-id', 'test@example.com', 'testuser');
```

### 2. RLS Test

```sql
-- Test if users can only see their own data
SELECT * FROM public.profiles WHERE id = 'test-user-id';
```

### 3. Function Test

```sql
-- Test social functions
SELECT public.follow_user('another-user-id');
SELECT public.like_post('some-post-id');
```

## Maintenance

### Regular Tasks

1. **Monitor storage usage** and clean up old files
2. **Check query performance** with slow query logs
3. **Backup your database** regularly
4. **Review RLS policies** when adding new features

### Story Cleanup

Consider setting up a cron job to clean up expired stories:

```sql
DELETE FROM public.stories WHERE expires_at < NOW();
```

## Troubleshooting

### Common Issues

1. **RLS Policy Violations**: Check that your policies allow the required operations
2. **Storage Access Issues**: Verify bucket policies are correctly configured
3. **Function Permissions**: Ensure functions have proper SECURITY DEFINER settings

### Debug Queries

```sql
-- Check RLS policies
SELECT * FROM pg_policies WHERE tablename = 'your_table';

-- Check storage policies
SELECT * FROM storage.policies;

-- Test functions with specific user
SET request.jwt.claims.sub = 'test-user-id';
SELECT * FROM public.profiles WHERE id = 'test-user-id';
```

## Support

If you encounter issues:

1. Check Supabase logs for detailed error messages
2. Verify your SQL was executed successfully
3. Ensure your Flutter app has correct Supabase configuration
4. Test with a simple query first

## Security Notes

- Always validate user input in your Flutter app
- Use parameterized queries (handled by Supabase client)
- Never expose service role keys in client-side code
- Regularly review and update RLS policies
- Monitor for unusual activity patterns