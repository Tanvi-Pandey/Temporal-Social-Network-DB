USE TemporalSocialNetworkDB;

-- Users
INSERT INTO users (username, email, bio) VALUES
('alice', 'alice@example.com', 'Coffee lover and software engineer.'),
('bob', 'bob@example.com', 'Photographer and traveler.'),
('charlie', 'charlie@example.com', 'Machine learning enthusiast.'),
('diana', 'diana@example.com', 'Bookworm and writer.'),
('ethan', 'ethan@example.com', 'Fitness addict.'),
('fiona', 'fiona@example.com', 'UI/UX Designer.'),
('george', 'george@example.com', 'Cybersecurity researcher.'),
('hannah', 'hannah@example.com', 'Music producer.'),
('ian', 'ian@example.com', 'Full Stack Developer.'),
('julia', 'julia@example.com', 'Nature photographer.');

-- User History
INSERT INTO user_history
(user_id, username, email, bio, valid_from, valid_to)
VALUES
(1,'alice','alice@example.com','Coffee enthusiast.','2024-01-01','2024-06-30'),
(3,'charlie','charlie@example.com','AI Student.','2024-02-01','2024-09-01');

-- Posts
INSERT INTO posts (user_id, current_content) VALUES
(1,'Learning SQL is fun!'),
(2,'Beautiful sunset today.'),
(3,'Started learning Temporal Databases.'),
(4,'Reading a great novel.'),
(5,'Morning workout complete.'),
(6,'Working on a UI redesign.'),
(7,'Cybersecurity tips coming soon.'),
(8,'New song releasing tomorrow.'),
(9,'Built my first REST API.'),
(10,'Nature always inspires me.');

-- Post Versions
INSERT INTO post_versions
(post_id, content, version_number, valid_from, valid_to)
VALUES
(1,'Learning SQL is fun!',1,'2025-01-01',NULL),
(2,'Beautiful sunset today.',1,'2025-01-01',NULL),
(3,'Started learning Temporal Databases.',1,'2025-01-01',NULL),
(4,'Reading a great novel.',1,'2025-01-01',NULL),
(5,'Morning workout complete.',1,'2025-01-01',NULL),
(6,'Working on a UI redesign.',1,'2025-01-01',NULL),
(7,'Cybersecurity tips coming soon.',1,'2025-01-01',NULL),
(8,'New song releasing tomorrow.',1,'2025-01-01',NULL),
(9,'Built my first REST API.',1,'2025-01-01',NULL),
(10,'Nature always inspires me.',1,'2025-01-01',NULL);

-- Comments
INSERT INTO comments (post_id, user_id, current_content) VALUES
(1,2,'Completely agree!'),
(1,3,'SQL is very useful.'),
(2,1,'Amazing picture!'),
(3,5,'Interesting topic.'),
(4,7,'Which book?'),
(5,4,'Keep it up!'),
(6,8,'Looking forward to it.'),
(7,9,'Great advice.'),
(8,10,'Can''t wait!'),
(9,6,'Nice project.');

-- Comment Versions
INSERT INTO comment_versions
(comment_id, content, version_number, valid_from, valid_to)
VALUES
(1,'Completely agree!',1,'2025-01-01',NULL),
(2,'SQL is very useful.',1,'2025-01-01',NULL),
(3,'Amazing picture!',1,'2025-01-01',NULL),
(4,'Interesting topic.',1,'2025-01-01',NULL),
(5,'Which book?',1,'2025-01-01',NULL),
(6,'Keep it up!',1,'2025-01-01',NULL),
(7,'Looking forward to it.',1,'2025-01-01',NULL),
(8,'Great advice.',1,'2025-01-01',NULL),
(9,'Can''t wait!',1,'2025-01-01',NULL),
(10,'Nice project.',1,'2025-01-01',NULL);

-- Friendships
INSERT INTO friendships
(user1_id,user2_id,status,valid_from,valid_to)
VALUES
(1,2,'accepted','2025-01-10',NULL),
(1,3,'accepted','2025-01-15',NULL),
(2,4,'pending','2025-02-01',NULL),
(5,6,'accepted','2025-03-01',NULL),
(7,8,'blocked','2025-03-20',NULL),
(9,10,'accepted','2025-04-01',NULL);

-- Reactions
INSERT INTO reactions
(post_id,user_id,reaction_type)
VALUES
(1,2,'like'),
(1,3,'love'),
(2,1,'wow'),
(3,4,'like'),
(4,5,'love'),
(5,6,'like'),
(6,7,'wow'),
(7,8,'sad'),
(8,9,'love'),
(9,10,'like'),
(10,1,'laugh');