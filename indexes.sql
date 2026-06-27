USE TemporalSocialNetworkDB;

-- Users
CREATE INDEX idx_users_username
ON users(username);

CREATE INDEX idx_users_email
ON users(email);

-- Posts
CREATE INDEX idx_posts_user
ON posts(user_id);

CREATE INDEX idx_posts_updated
ON posts(last_updated);

-- Post Versions
CREATE INDEX idx_post_versions_post
ON post_versions(post_id);

CREATE INDEX idx_post_versions_valid_from
ON post_versions(valid_from);

CREATE INDEX idx_post_versions_valid_to
ON post_versions(valid_to);

-- Comments
CREATE INDEX idx_comments_post
ON comments(post_id);

CREATE INDEX idx_comments_user
ON comments(user_id);

-- Comment Versions
CREATE INDEX idx_comment_versions_comment
ON comment_versions(comment_id);

CREATE INDEX idx_comment_versions_valid_from
ON comment_versions(valid_from);

CREATE INDEX idx_comment_versions_valid_to
ON comment_versions(valid_to);

-- Friendships
CREATE INDEX idx_friendships_users
ON friendships(user1_id, user2_id);

CREATE INDEX idx_friendships_status
ON friendships(status);

CREATE INDEX idx_friendships_valid_to
ON friendships(valid_to);

-- Reactions
CREATE INDEX idx_reactions_post
ON reactions(post_id);

CREATE INDEX idx_reactions_user
ON reactions(user_id);

CREATE INDEX idx_reactions_type
ON reactions(reaction_type);