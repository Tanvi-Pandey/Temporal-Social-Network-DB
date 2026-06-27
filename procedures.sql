USE TemporalSocialNetworkDB;

DELIMITER $$

-- Create a new post
CREATE PROCEDURE create_post(
    IN p_user_id INT,
    IN p_content TEXT
)
BEGIN
    INSERT INTO posts (
        user_id,
        current_content
    )
    VALUES (
        p_user_id,
        p_content
    );

    INSERT INTO post_versions (
        post_id,
        content,
        version_number,
        valid_from,
        valid_to
    )
    VALUES (
        LAST_INSERT_ID(),
        p_content,
        1,
        NOW(),
        NULL
    );
END$$

-- Edit an existing post
CREATE PROCEDURE edit_post(
    IN p_post_id INT,
    IN p_content TEXT
)
BEGIN
    UPDATE posts
    SET current_content = p_content
    WHERE post_id = p_post_id;
END$$

-- Add friendship
CREATE PROCEDURE add_friendship(
    IN p_user1 INT,
    IN p_user2 INT
)
BEGIN
    INSERT INTO friendships (
        user1_id,
        user2_id,
        status,
        valid_from,
        valid_to
    )
    VALUES (
        p_user1,
        p_user2,
        'accepted',
        NOW(),
        NULL
    );
END$$

-- Remove friendship
CREATE PROCEDURE remove_friendship(
    IN p_friendship_id INT
)
BEGIN
    UPDATE friendships
    SET valid_to = NOW()
    WHERE friendship_id = p_friendship_id;
END$$

DELIMITER ;