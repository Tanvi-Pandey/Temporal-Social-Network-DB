DROP DATABASE IF EXISTS TemporalSocialNetworkDB;

CREATE DATABASE TemporalSocialNetworkDB;

USE TemporalSocialNetworkDB;

-- Users
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    bio VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- User History
CREATE TABLE user_history (
    history_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    bio VARCHAR(255),
    valid_from TIMESTAMP NOT NULL,
    valid_to TIMESTAMP NULL
);

-- Posts
CREATE TABLE posts (
    post_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    current_content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    current_version INT DEFAULT 1,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Post Versions
CREATE TABLE post_versions (
    version_id INT AUTO_INCREMENT PRIMARY KEY,
    post_id INT NOT NULL,
    content TEXT NOT NULL,
    version_number INT NOT NULL,
    valid_from TIMESTAMP NOT NULL,
    valid_to TIMESTAMP NULL
);

-- Comments
CREATE TABLE comments (
    comment_id INT AUTO_INCREMENT PRIMARY KEY,
    post_id INT NOT NULL,
    user_id INT NOT NULL,
    current_content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    current_version INT DEFAULT 1,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Comment Versions
CREATE TABLE comment_versions (
    version_id INT AUTO_INCREMENT PRIMARY KEY,
    comment_id INT NOT NULL,
    content TEXT NOT NULL,
    version_number INT NOT NULL,
    valid_from TIMESTAMP NOT NULL,
    valid_to TIMESTAMP NULL
);

-- Friendships
CREATE TABLE friendships (
    friendship_id INT AUTO_INCREMENT PRIMARY KEY,
    user1_id INT NOT NULL,
    user2_id INT NOT NULL,
    status ENUM('pending', 'accepted', 'blocked') NOT NULL,
    valid_from TIMESTAMP NOT NULL,
    valid_to TIMESTAMP NULL
);

-- Reactions
CREATE TABLE reactions (
    reaction_id INT AUTO_INCREMENT PRIMARY KEY,
    post_id INT NOT NULL,
    user_id INT NOT NULL,
    reaction_type ENUM('like', 'love', 'laugh', 'wow', 'sad', 'angry') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);