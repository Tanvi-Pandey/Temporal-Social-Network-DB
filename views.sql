USE TemporalSocialNetworkDB;

-- Current Users
CREATE VIEW current_users AS
SELECT
    user_id,
    username,
    email,
    bio,
    created_at
FROM users;

-- Current Posts
CREATE VIEW current_posts AS
SELECT
    post_id,
    user_id,
    current_content,
    current_version,
    created_at,
    last_updated
FROM posts;

-- Current Comments
CREATE VIEW current_comments AS
SELECT
    comment_id,
    post_id,
    user_id,
    current_content,
    current_version,
    created_at,
    last_updated
FROM comments;

-- Active Friendships
CREATE VIEW active_friendships AS
SELECT
    friendship_id,
    user1_id,
    user2_id,
    status,
    valid_from
FROM friendships
WHERE valid_to IS NULL;

-- Current Post Versions
CREATE VIEW current_post_versions AS
SELECT
    post_id,
    content,
    version_number,
    valid_from
FROM post_versions
WHERE valid_to IS NULL;

-- Current Comment Versions
CREATE VIEW current_comment_versions AS
SELECT
    comment_id,
    content,
    version_number,
    valid_from
FROM comment_versions
WHERE valid_to IS NULL;