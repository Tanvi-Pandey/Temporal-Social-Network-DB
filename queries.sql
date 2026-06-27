USE TemporalSocialNetworkDB;

-- Display all users
SELECT *
FROM users;

-- Display all current posts
SELECT *
FROM current_posts;

-- Display all current comments
SELECT *
FROM current_comments;

-- Display active friendships
SELECT *
FROM active_friendships;

-- View the complete version history of a post
SELECT
    post_id,
    version_number,
    content,
    valid_from,
    valid_to
FROM post_versions
WHERE post_id = 1
ORDER BY version_number;

-- View the complete version history of a comment
SELECT
    comment_id,
    version_number,
    content,
    valid_from,
    valid_to
FROM comment_versions
WHERE comment_id = 1
ORDER BY version_number;

-- View the profile history of a user
SELECT
    user_id,
    username,
    bio,
    valid_from,
    valid_to
FROM user_history
WHERE user_id = 1
ORDER BY valid_from;

-- Retrieve the version of a post at a specific point in time
SELECT
    post_id,
    content,
    version_number
FROM post_versions
WHERE post_id = 1
AND '2025-03-15'
BETWEEN valid_from
AND COALESCE(valid_to, '9999-12-31');

-- Count the number of edits for each post
SELECT
    post_id,
    COUNT(*) AS total_versions
FROM post_versions
GROUP BY post_id
ORDER BY total_versions DESC;

-- Find the most active users based on posts created
SELECT
    u.username,
    COUNT(p.post_id) AS total_posts
FROM users u
JOIN posts p
ON u.user_id = p.user_id
GROUP BY u.user_id, u.username
ORDER BY total_posts DESC;

-- Find the most reacted-to posts
SELECT
    p.post_id,
    p.current_content,
    COUNT(r.reaction_id) AS total_reactions
FROM posts p
LEFT JOIN reactions r
ON p.post_id = r.post_id
GROUP BY p.post_id, p.current_content
ORDER BY total_reactions DESC;

-- Count reactions by type
SELECT
    reaction_type,
    COUNT(*) AS total
FROM reactions
GROUP BY reaction_type
ORDER BY total DESC;

-- Find users with the most friendships
SELECT
    u.username,
    COUNT(f.friendship_id) AS total_friendships
FROM users u
JOIN friendships f
ON u.user_id = f.user1_id
OR u.user_id = f.user2_id
WHERE f.valid_to IS NULL
GROUP BY u.user_id, u.username
ORDER BY total_friendships DESC;

-- List comments for a specific post
SELECT
    u.username,
    c.current_content,
    c.created_at
FROM comments c
JOIN users u
ON c.user_id = u.user_id
WHERE c.post_id = 1
ORDER BY c.created_at;

-- Retrieve posts with their authors
SELECT
    p.post_id,
    u.username,
    p.current_content,
    p.created_at
FROM posts p
JOIN users u
ON p.user_id = u.user_id
ORDER BY p.created_at DESC;

-- Retrieve friendships active on a given date
SELECT
    user1_id,
    user2_id,
    status
FROM friendships
WHERE '2025-04-01'
BETWEEN valid_from
AND COALESCE(valid_to, '9999-12-31');