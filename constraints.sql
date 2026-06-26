USE TemporalSocialNetworkDB;

-- Users
ALTER TABLE users
ADD CONSTRAINT uq_users_username UNIQUE (username),
ADD CONSTRAINT uq_users_email UNIQUE (email);

-- User History
ALTER TABLE user_history
ADD CONSTRAINT fk_user_history_user
FOREIGN KEY (user_id)
REFERENCES users(user_id)
ON UPDATE CASCADE
ON DELETE CASCADE;

-- Posts
ALTER TABLE posts
ADD CONSTRAINT fk_posts_user
FOREIGN KEY (user_id)
REFERENCES users(user_id)
ON UPDATE CASCADE
ON DELETE CASCADE;

-- Post Versions
ALTER TABLE post_versions
ADD CONSTRAINT fk_post_versions_post
FOREIGN KEY (post_id)
REFERENCES posts(post_id)
ON UPDATE CASCADE
ON DELETE CASCADE;

-- Comments
ALTER TABLE comments
ADD CONSTRAINT fk_comments_post
FOREIGN KEY (post_id)
REFERENCES posts(post_id)
ON UPDATE CASCADE
ON DELETE CASCADE,

ADD CONSTRAINT fk_comments_user
FOREIGN KEY (user_id)
REFERENCES users(user_id)
ON UPDATE CASCADE
ON DELETE CASCADE;

-- Comment Versions
ALTER TABLE comment_versions
ADD CONSTRAINT fk_comment_versions_comment
FOREIGN KEY (comment_id)
REFERENCES comments(comment_id)
ON UPDATE CASCADE
ON DELETE CASCADE;

-- Friendships
ALTER TABLE friendships
ADD CONSTRAINT fk_friendships_user1
FOREIGN KEY (user1_id)
REFERENCES users(user_id)
ON UPDATE CASCADE
ON DELETE CASCADE,

ADD CONSTRAINT fk_friendships_user2
FOREIGN KEY (user2_id)
REFERENCES users(user_id)
ON UPDATE CASCADE
ON DELETE CASCADE,

ADD CONSTRAINT chk_different_users
CHECK (user1_id <> user2_id);

-- Reactions
ALTER TABLE reactions
ADD CONSTRAINT fk_reactions_post
FOREIGN KEY (post_id)
REFERENCES posts(post_id)
ON UPDATE CASCADE
ON DELETE CASCADE,

ADD CONSTRAINT fk_reactions_user
FOREIGN KEY (user_id)
REFERENCES users(user_id)
ON UPDATE CASCADE
ON DELETE CASCADE;

-- Additional Checks
ALTER TABLE post_versions
ADD CONSTRAINT chk_post_version
CHECK (version_number > 0);

ALTER TABLE comment_versions
ADD CONSTRAINT chk_comment_version
CHECK (version_number > 0);