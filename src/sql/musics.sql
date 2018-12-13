#歌手
CREATE TABLE singer(
singer_Id int not null auto_increment PRIMARY key ,
singer_name_Chinese VARCHAR(50),
singer_name_Forgin VARCHAR(50),
singer_name_Art VARCHAR(50),
singer_Sex VARCHAR(10),
singer_Address VARCHAR(50),
singer_birthday DATE,
singer_Hobby VARCHAR(100),
singer_Production VARCHAR(1000),
singer_Debut DATE,
singer_Introduction VARCHAR(1000),
singer_Image VARCHAR(100),
company_Name VARCHAR(50),
singer_VisitorVolume int
)ENGINE=InnoDB DEFAULT CHARSET=utf8 auto_increment=94001;
#歌曲
CREATE TABLE song(
SONG_ID int not null auto_increment PRIMARY key ,
SONG_NAME VARCHAR(50) not null,
SINGER_ID int not null,
SONG_LRC VARCHAR(1000) ,
SONG_RELESETIME DATE,
SONG_LONGTIME VARCHAR(20),
SONG_NUMBEROFCLICK int,
SONG_PATH VARCHAR(50),
FOREIGN key(SINGER_ID) REFERENCES singer(singer_Id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 auto_increment=95001;
#专辑
CREATE TABLE special(
SPECIAL_ID int not null auto_increment PRIMARY key ,
SPECIAL_NAME VARCHAR(30) not null,
SPECIAL_IMAGE varchar(30) not null,
SONG_ID int not null,
SPECIAL_INTRODUCTION VARCHAR(30) not null,
SPECIAL_RELESETIME date,
SPECIAL_VISITORVOLUME int ,
FOREIGN key(SONG_ID) REFERENCES song(song_Id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 auto_increment=96001;
#资讯
create table information(
INFORMATION_ID int not null auto_increment PRIMARY key,
INFORMATION_TITLE VARCHAR(100) not NULL,
INFORMATION_INTRODUCTION VARCHAR(10000) 
)ENGINE=InnoDB DEFAULT CHARSET=utf8 auto_increment=97001;
#用户类型
CREATE TABLE userType(
USERTYPE_ID int not null auto_increment PRIMARY key ,
USERTYPE_NAME VARCHAR(20) not null
)ENGINE=InnoDB DEFAULT CHARSET=utf8 auto_increment=1;

INSERT INTO userType(USERTYPE_NAME) VALUES("普通会员");
INSERT INTO userType(USERTYPE_NAME) VALUES("会员");
INSERT INTO userType(USERTYPE_NAME) VALUES("管理员");

#用户
CREATE TABLE user(
USER_ID  int not null auto_increment PRIMARY key,
USER_NAME VARCHAR(30) not null,
COUNT_NAME VARCHAR(30) not null UNIQUE,
COUNT_PASSWORD VARCHAR(30) not null,
USER_SEX VARCHAR(10) not null,
USER_EMAIL VARCHAR(30) not null,
USER_IMAGE VARCHAR(30),
CREATE_DATE DATE,
USERTYPE_ID int not null,
FOREIGN key (userType_Id) REFERENCES userType(userType_Id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 auto_increment=1;
#歌手所有信息
CREATE VIEW generalWorks AS
SELECT 
singer.singer_Id,singer_name_Chinese,singer_name_Forgin,singer_name_Art,singer_Sex,singer_Address,singer_birthday,singer_Hobby,singer_Production,singer_Debut
,singer_Introduction
,singer_Image
,company_Name
,singer_VisitorVolume,
SONG_ID,SONG_NAME,SONG_LRC,SONG_RELESETIME,SONG_LONGTIME,SONG_NUMBEROFCLICK,SONG_PATH
from singer,song
where 
singer.singer_Id = song.singer_Id;

#歌曲类型
create table songType(
songType_Id int not null primary key auto_increment,
songType_Name VARCHAR(50)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 auto_increment=1;

insert songType(songType_Name) VALUES("民谣");
insert songType(songType_Name) VALUES("流行");
insert songType(songType_Name) VALUES("摇滚");
insert songType(songType_Name) VALUES("民谣");


#专辑所有信息
CREATE VIEW specialWorks AS
SELECT 
singer.singer_Id,singer_name_Chinese,singer_name_Forgin,singer_name_Art,singer_Sex,singer_Address,singer_birthday,singer_Hobby,singer_Production,singer_Debut
,singer_Introduction
,singer_Image
,company_Name
,singer_VisitorVolume,
song.SONG_ID,SONG_NAME,SONG_LRC,SONG_RELESETIME,SONG_LONGTIME,SONG_NUMBEROFCLICK,SONG_PATH,
SPECIAL_ID,SPECIAL_NAME,SPECIAL_IMAGE,SPECIAL_INTRODUCTION,SPECIAL_RELESETIME,SPECIAL_VISITORVOLUME
from singer,song,special
where 
singer.singer_Id = song.singer_Id and special.SONG_ID = song.SONG_ID;