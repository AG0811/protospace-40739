ProtoSpaceのER図


usersテーブル
email (string型, NOT NULL,ユ二ーク制約)
encrypted_password (string型, NOT NULL)
name (string型, NOT NULL)
profile (text型, NOT NULL)
occupation (text型, NOT NULL)
position (text型, NOT NULL)

prototypesテーブル
title (string型, NOT NULL)
catch_copy (text型, NOT NULL)
concept (text型, NOT NULL)
user (references型, NOT NULL,外部キー)
※imageはActiveStorageで実装するため含まない

commentsテーブル
content (text型,NOT NULL)
prototype (references型, NOT NULL,外部キー)
user (references型, NOT NULL,外部キー)