
-- drop database if exists StackOverflow_all;
-- CREATE DATABASE IF NOT EXISTS StackOverflow_all DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;
-- 
use StackOverflow_all;
 
-- create table badges (
--   Id INT NOT NULL PRIMARY KEY,
--   UserId INT,
--   Name VARCHAR(50),
--   Date DATETIME
-- );
 
-- CREATE TABLE comments (
--     Id INT NOT NULL PRIMARY KEY,
--     PostId INT NOT NULL,
--     Score INT NOT NULL,
--     Text TEXT,
--     CreationDate DATETIME,
--     UserId INT 
-- );
 
-- CREATE TABLE post_history (
--     Id INT NOT NULL PRIMARY KEY,
--     PostHistoryTypeId SMALLINT NOT NULL,
--     PostId INT NOT NULL,
--     RevisionGUID VARCHAR(256),
--     CreationDate DATETIME,
--     UserId INT,
--     Text TEXT
-- );

-- CREATE TABLE post_links (
--     Id INT NOT NULL PRIMARY KEY,  
--     CreationDate DATETIME,
--     PostId INT,
-- 	RelatedPostId INT,
-- 	LinkTypeId INT
-- );
 
-- CREATE TABLE posts (
--     Id INT NOT NULL PRIMARY KEY,
--     PostTypeId SMALLINT,
--     AcceptedAnswerId INT,
-- 	CreationDate DATETIME,
-- 	Score INT NULL,
-- 	ViewCount INT NULL,
-- 	Body text NULL,
-- 	OwnerUserId INT,
-- 	LastEditorUserId INT,
-- 	LastEditDate DATETIME,
-- 	LastActivityDate DATETIME,
-- 	Title varchar(256),
-- 	Tags VARCHAR(256),
-- 	AnswerCount INT,
-- 	CommentCount INT,
-- 	FavoriteCount INT,
-- 	CommunityOwnedDate DATETIME,
--     ParentId INT       
-- );

-- CREATE TABLE tags (
--     Id INT NOT NULL PRIMARY KEY,  
--     TagName VARCHAR(50),
--     Count INT,
-- 	ExcerptPostId INT,
-- 	WikiPostId INT
-- );
 
-- CREATE TABLE users (
--     Id INT PRIMARY KEY,
--     Reputation INT,
--     CreationDate DATETIME,
--     DisplayName VARCHAR(50) NULL,
--     LastAccessDate  DATETIME,
--     Views INT DEFAULT 0,
--     WebsiteUrl VARCHAR(256) NULL,
--     Location VARCHAR(256) NULL,
--     AboutMe TEXT NULL,
--     Age INT,
--     UpVotes INT,
--     DownVotes INT,
--     EmailHash VARCHAR(32)
-- );
 
-- CREATE TABLE votes (
--     Id INT NOT NULL PRIMARY KEY,
--     PostId INT NOT NULL,
--     VoteTypeId SMALLINT,
--     CreationDate DATETIME
-- );
 
-- load xml local infile '/Users/xubowen/Desktop/Study/StackOverflow/Badges.xml'
-- into table badges
-- rows identified by '<row>';
 
-- load xml local infile '/Users/xubowen/Desktop/Study/StackOverflow/Comments.xml'
-- into table comments
-- rows identified by '<row>';
 


load xml local infile '/Users/xubowen/Desktop/Study/Research/dataset/StackOverflow/PostLinks.xml'
into table post_links
rows identified by '<row>';
 
--  
-- load xml local infile '/Users/xubowen/Desktop/Project/ASE2016/ContextBased/dataset/StackOverflow/Posts.xml'
-- into table posts
-- rows identified by '<row>';

-- load xml local infile '/Users/xubowen/Desktop/Study/StackOverflow/Tags.xml'
-- into table tags
-- rows identified by '<row>';

 
-- load xml local infile '/Users/xubowen/Desktop/Study/StackOverflow/Users.xml'
-- into table users
-- rows identified by '<row>';
 
-- load xml local infile '/Users/xubowen/Desktop/Study/StackOverflow/Votes.xml'
-- into table votes
-- rows identified by '<row>';
 

 
-- create index comments_idx_1 on comments(PostId);
-- create index comments_idx_2 on comments(UserId); 

 
-- create index posts_idx_1 on posts(AcceptedAnswerId);
-- create index posts_idx_2 on posts(ParentId);
-- create index posts_idx_3 on posts(OwnerUserId);
-- create index posts_idx_4 on posts(LastEditorUserId);
 

