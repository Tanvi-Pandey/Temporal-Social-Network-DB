USE TemporalSocialNetworkDB;

DELIMITER $$

-- User Profile History
CREATE TRIGGER trg_before_user_update
BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
    INSERT INTO user_history (
        user_id,
        username,
        email,
        bio,
        valid_from,
        valid_to
    )
    VALUES (
        OLD.user_id,
        OLD.username,
        OLD.email,
        OLD.bio,
        OLD.created_at,
        NOW()
    );
END$$

-- Post Version History
CREATE TRIGGER trg_before_post_update
BEFORE UPDATE ON posts
FOR EACH ROW
BEGIN

    UPDATE post_versions
    SET valid_to = NOW()
    WHERE post_id = OLD.post_id
      AND valid_to IS NULL;

    INSERT INTO post_versions (
        post_id,
        content,
        version_number,
        valid_from,
        valid_to
    )
    VALUES (
        OLD.post_id,
        NEW.current_content,
        OLD.current_version + 1,
        NOW(),
        NULL
    );

    SET NEW.current_version = OLD.current_version + 1;
    SET NEW.last_updated = NOW();

END$$

-- Comment Version History
CREATE TRIGGER trg_before_comment_update
BEFORE UPDATE ON comments
FOR EACH ROW
BEGIN

    UPDATE comment_versions
    SET valid_to = NOW()
    WHERE comment_id = OLD.comment_id
      AND valid_to IS NULL;

    INSERT INTO comment_versions (
        comment_id,
        content,
        version_number,
        valid_from,
        valid_to
    )
    VALUES (
        OLD.comment_id,
        NEW.current_content,
        OLD.current_version + 1,
        NOW(),
        NULL
    );

    SET NEW.current_version = OLD.current_version + 1;
    SET NEW.last_updated = NOW();

END$$

DELIMITER ;