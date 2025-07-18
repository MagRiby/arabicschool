BEGIN TRANSACTION;
CREATE TABLE alembic_version (
	version_num VARCHAR(32) NOT NULL, 
	CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num)
);
INSERT INTO "alembic_version" VALUES('20240513_add_icon_type_and_icon_value_to_super_badges');
CREATE TABLE announcements (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        class_id INTEGER NOT NULL,
        text TEXT NOT NULL,
        created_at TEXT NOT NULL,
        user_id INTEGER NOT NULL
    , expiry TEXT);
INSERT INTO "announcements" VALUES(1,8,'Annonce1','2025-05-29 11:01:41',2,NULL);
INSERT INTO "announcements" VALUES(2,5,'annonce','2025-05-29 11:01:57',2,NULL);
INSERT INTO "announcements" VALUES(3,5,'annoce','2025-05-29 11:02:11',2,NULL);
INSERT INTO "announcements" VALUES(4,5,'asdas','2025-05-29 11:03:59',2,NULL);
INSERT INTO "announcements" VALUES(5,5,'<font color="#e75480" size="5"><b>asdas</b></font>','2025-05-29 11:07:35',2,NULL);
INSERT INTO "announcements" VALUES(6,5,'<font color="#e75480" size="5"><b>asdas</b></font>','2025-05-29 11:11:28',2,'2025-06-04T11:11');
INSERT INTO "announcements" VALUES(7,5,'<font color="#e75480" size="5"><b>asdas&nbsp;</b></font><span style="font-weight: bolder; color: rgb(231, 84, 128); font-size: x-large;">asdas</span><span style="font-weight: bolder; color: rgb(231, 84, 128); font-size: x-large;">asdas</span><span style="font-weight: bolder; color: rgb(231, 84, 128); font-size: x-large;">asdas</span><span style="font-weight: bolder; color: rgb(231, 84, 128); font-size: x-large;">asdas</span><span style="font-weight: bolder; color: rgb(231, 84, 128); font-size: x-large;">asdas</span><span style="font-weight: bolder; color: rgb(231, 84, 128); font-size: x-large;">asdas</span><span style="font-weight: bolder; color: rgb(231, 84, 128); font-size: x-large;">asdas</span><span style="font-weight: bolder; color: rgb(231, 84, 128); font-size: x-large;">asdas</span><span style="font-weight: bolder; color: rgb(231, 84, 128); font-size: x-large;">asdas</span><span style="font-weight: bolder; color: rgb(231, 84, 128); font-size: x-large;">asdas</span><span style="font-weight: bolder; color: rgb(231, 84, 128); font-size: x-large;">asdas</span><span style="font-weight: bolder; color: rgb(231, 84, 128); font-size: x-large;">asdas</span>','2025-05-29 11:22:48',2,'2025-06-04T11:11');
INSERT INTO "announcements" VALUES(8,5,'<font color="#e75480" size="5"><b>asdas&nbsp;</b></font><span style="font-weight: bolder; color: rgb(231, 84, 128); font-size: x-large;">asdas</span><span style="font-weight: bolder; color: rgb(231, 84, 128); font-size: x-large;">asdas</span><span style="font-weight: bolder; color: rgb(231, 84, 128); font-size: x-large;">asdas</span><span style="font-weight: bolder; color: rgb(231, 84, 128); font-size: x-large;">asdas</span><span style="font-weight: bolder; color: rgb(231, 84, 128); font-size: x-large;">asdas</span><span style="font-weight: bolder; color: rgb(231, 84, 128); font-size: x-large;">asdas</span><span style="font-weight: bolder; color: rgb(231, 84, 128); font-size: x-large;">asdas</span><span style="font-weight: bolder; color: rgb(231, 84, 128); font-size: x-large;">asdas</span><span style="font-weight: bolder; color: rgb(231, 84, 128); font-size: x-large;">asdas</span><span style="font-weight: bolder; color: rgb(231, 84, 128); font-size: x-large;">asdas</span><span style="font-weight: bolder; color: rgb(231, 84, 128); font-size: x-large;">asdas</span><span style="font-weight: bolder; color: rgb(231, 84, 128); font-size: x-large;">asdas</span>','2025-05-29 11:26:52',2,'2025-05-28T11:11');
INSERT INTO "announcements" VALUES(9,5,'<font color="#e75480" size="5"><b>asdas&nbsp;</b></font><span style="font-weight: bolder; color: rgb(231, 84, 128); font-size: x-large;">asdas</span><span style="font-weight: bolder; color: rgb(231, 84, 128); font-size: x-large;">asdas</span><span style="font-weight: bolder; color: rgb(231, 84, 128); font-size: x-large;">asdas</span><span style="font-weight: bolder; color: rgb(231, 84, 128); font-size: x-large;">asdas</span><span style="font-weight: bolder; color: rgb(231, 84, 128); font-size: x-large;">asdas</span><span style="font-weight: bolder; color: rgb(231, 84, 128); font-size: x-large;">asdas</span><span style="font-weight: bolder; color: rgb(231, 84, 128); font-size: x-large;">asdas</span><span style="font-weight: bolder; color: rgb(231, 84, 128); font-size: x-large;">asdas</span><span style="font-weight: bolder; color: rgb(231, 84, 128); font-size: x-large;">asdas</span><span style="font-weight: bolder; color: rgb(231, 84, 128); font-size: x-large;">asdas</span><span style="font-weight: bolder; color: rgb(231, 84, 128); font-size: x-large;">asdas</span><span style="font-weight: bolder; color: rgb(231, 84, 128); font-size: x-large;">asdas</span>','2025-05-29 11:27:09',2,'2025-06-05T11:11');
INSERT INTO "announcements" VALUES(10,5,'<font color="#007bff"><font size="5"><b style="">asdas&nbsp;</b></font><span style="font-weight: bolder; font-size: x-large;">asdas</span><span style="font-weight: bolder; font-size: x-large;">asdas</span><span style="font-weight: bolder; font-size: x-large;">asdas</span><span style="font-weight: bolder; font-size: x-large;">asdas</span><span style="font-weight: bolder; font-size: x-large;">asdas</span><span style="font-weight: bolder; font-size: x-large;">asdas</span><span style="font-weight: bolder; font-size: x-large;">asdas</span><span style="font-weight: bolder; font-size: x-large;">asdas</span><span style="font-weight: bolder; font-size: x-large;">asdas</span><span style="font-weight: bolder; font-size: x-large;">asdas</span><span style="font-weight: bolder; font-size: x-large;">asdas</span><span style="font-weight: bolder; font-size: x-large;">asdas</span></font>','2025-05-29 11:27:21',2,'2025-06-05T11:11');
INSERT INTO "announcements" VALUES(11,10,'<font size="5" color="#28a745">wawawia</font>','2025-05-30 09:34:08',2,'2025-06-05T09:34');
INSERT INTO "announcements" VALUES(12,5,'<font color="#000000" size="3"><b style="">asdas&nbsp;</b><span style="font-weight: bolder;">asdas</span><span style="font-weight: bolder;">asdas</span><span style="font-weight: bolder;">asdas</span><span style="font-weight: bolder;">asdas</span><span style="font-weight: bolder;">asdas</span><span style="font-weight: bolder;">asdas</span><span style="font-weight: bolder;">asdas</span><span style="font-weight: bolder;">asdas</span><span style="font-weight: bolder;">asdas</span><span style="font-weight: bolder;">asdas</span><span style="font-weight: bolder;">asdas</span><span style="font-weight: bolder;">asdas</span></font>','2025-05-30 09:49:10',2,'2025-06-05T11:11');
INSERT INTO "announcements" VALUES(13,5,'<span style="font-weight: bolder; color: rgb(0, 0, 0); font-size: medium;">asdas&nbsp;</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="font-weight: bolder; color: rgb(0, 0, 0); font-size: medium;">asdas&nbsp;</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="font-weight: bolder; color: rgb(0, 0, 0); font-size: medium;">asdas&nbsp;</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="font-weight: bolder; color: rgb(0, 0, 0); font-size: medium;">asdas&nbsp;</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="font-weight: bolder; color: rgb(0, 0, 0); font-size: medium;">asdas&nbsp;</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="font-weight: bolder; color: rgb(0, 0, 0); font-size: medium;">asdas&nbsp;</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="font-weight: bolder; color: rgb(0, 0, 0); font-size: medium;">asdas&nbsp;</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span><span style="color: rgb(0, 0, 0); font-size: medium; font-weight: bolder;">asdas</span>','2025-05-30 09:49:44',2,'2025-06-05T11:11');
INSERT INTO "announcements" VALUES(14,5,'<font color="#000000" size="3"><b>abc</b></font>','2025-06-25 21:34:45',2,'2025-06-05T11:11');
INSERT INTO "announcements" VALUES(15,5,'<font color="#000000" size="3"><b>abc</b></font>','2025-06-25 21:35:03',2,'2025-06-26T11:11');
INSERT INTO "announcements" VALUES(16,8,'Annonce1','2025-07-01 18:25:15',2,'2025-07-02T18:25');
INSERT INTO "announcements" VALUES(17,5,'<font color="#000000" size="3"><b>abc</b></font>','2025-07-08 10:43:03',2,'2025-07-09T11:11');
CREATE TABLE attendance (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        student_id INTEGER NOT NULL,
        class_id INTEGER NOT NULL,
        day TEXT NOT NULL,
        present INTEGER NOT NULL,
        UNIQUE(student_id, class_id, day)
    );
INSERT INTO "attendance" VALUES(1,6,5,'الاثنين',1);
INSERT INTO "attendance" VALUES(3,6,5,'2025-06-29',0);
INSERT INTO "attendance" VALUES(5,7,5,'2025-06-29',1);
INSERT INTO "attendance" VALUES(8,6,5,'2025-06-30',1);
INSERT INTO "attendance" VALUES(19,7,5,'2025-06-30',1);
INSERT INTO "attendance" VALUES(21,6,5,'2025-06-26',0);
INSERT INTO "attendance" VALUES(22,6,5,'2025-07-09',0);
INSERT INTO "attendance" VALUES(25,18,5,'2025-07-06',0);
INSERT INTO "attendance" VALUES(26,20,5,'2025-07-10',0);
INSERT INTO "attendance" VALUES(27,7,5,'2025-07-09',0);
INSERT INTO "attendance" VALUES(28,7,5,'2025-07-13',0);
INSERT INTO "attendance" VALUES(29,7,5,'2025-07-14',0);
INSERT INTO "attendance" VALUES(30,7,5,'2025-07-15',0);
CREATE TABLE class_courses (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        class_id INTEGER NOT NULL,
        curriculum_item_id INTEGER NOT NULL,
        FOREIGN KEY(class_id) REFERENCES classes(id),
        FOREIGN KEY(curriculum_item_id) REFERENCES curriculum_items(id)
    );
CREATE TABLE classes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        teacher_id INTEGER,
        local_admin_id INTEGER NOT NULL,
        level_id INTEGER, backup_teacher_id INTEGER, dawra1_pub_start TEXT, dawra1_pub_end TEXT, dawra2_pub_start TEXT, dawra2_pub_end TEXT, dawra3_pub_start TEXT, dawra3_pub_end TEXT, year_pub_start TEXT, year_pub_end TEXT,
        FOREIGN KEY(teacher_id) REFERENCES teachers(id),
        FOREIGN KEY(local_admin_id) REFERENCES users(id),
        FOREIGN KEY(level_id) REFERENCES levels(id)
    );
INSERT INTO "classes" VALUES(5,'الأول',8,2,6,9,'2025-07-14',NULL,'2025-07-14',NULL,'2025-07-14',NULL,'2025-07-14',NULL);
INSERT INTO "classes" VALUES(6,'الثاني',1,2,1,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "classes" VALUES(7,'الثالث',3,2,7,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "classes" VALUES(8,'الرابع',1,2,6,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "classes" VALUES(9,'الخامس',1,2,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "classes" VALUES(10,'السادس',7,2,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "classes" VALUES(12,'a1',8,2,1,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "classes" VALUES(13,'8',8,2,1,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
CREATE TABLE curriculum_groups (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        local_admin_id INTEGER NOT NULL, level_id INTEGER,
        FOREIGN KEY(local_admin_id) REFERENCES users(id)
    );
INSERT INTO "curriculum_groups" VALUES(9,'arabic 1',2,1);
INSERT INTO "curriculum_groups" VALUES(13,'arabic',2,6);
INSERT INTO "curriculum_groups" VALUES(15,'quran',2,6);
INSERT INTO "curriculum_groups" VALUES(16,'poetry',2,6);
INSERT INTO "curriculum_groups" VALUES(17,'anachid',2,1);
INSERT INTO "curriculum_groups" VALUES(18,'arabic 2',2,1);
INSERT INTO "curriculum_groups" VALUES(19,'hadith',2,6);
CREATE TABLE curriculum_items (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        group_id INTEGER NOT NULL,
        name TEXT NOT NULL,
        FOREIGN KEY(group_id) REFERENCES curriculum_groups(id)
    );
INSERT INTO "curriculum_items" VALUES(9,6,'asdasdasdasdasd');
INSERT INTO "curriculum_items" VALUES(10,1,'dfsdfsd');
INSERT INTO "curriculum_items" VALUES(11,4,'asdasd');
INSERT INTO "curriculum_items" VALUES(12,4,'asdasdas');
INSERT INTO "curriculum_items" VALUES(13,4,'asdas');
INSERT INTO "curriculum_items" VALUES(14,9,'arab1');
INSERT INTO "curriculum_items" VALUES(16,11,'asdasdasa');
INSERT INTO "curriculum_items" VALUES(18,13,'alif');
INSERT INTO "curriculum_items" VALUES(19,13,'ba2');
INSERT INTO "curriculum_items" VALUES(20,15,'fatiha');
INSERT INTO "curriculum_items" VALUES(21,9,'arab2');
INSERT INTO "curriculum_items" VALUES(22,16,'poem 1');
INSERT INTO "curriculum_items" VALUES(23,16,'poem 2');
CREATE TABLE events (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        class_id INTEGER NOT NULL,
        title TEXT NOT NULL,
        description TEXT,
        start DATETIME NOT NULL,
        end DATETIME,
        color TEXT,
        recurrence TEXT, recurrence_group_id TEXT, recurrence_end DATE,
        FOREIGN KEY(class_id) REFERENCES classes(id)
    );
INSERT INTO "events" VALUES(20,5,'green','','2025-05-28T19:16',NULL,'#10cb58','none',NULL,NULL);
INSERT INTO "events" VALUES(22,5,'pink','pink','2025-05-29T08:00','2025-05-29T09:00','#ff00dd','none',NULL,NULL);
INSERT INTO "events" VALUES(23,5,'yellow','','2025-05-26T08:00','2025-05-26T09:00','#e1ff00','none',NULL,NULL);
INSERT INTO "events" VALUES(24,5,'aaaaa','oooo','2025-06-02T08:00','2025-06-02T09:00','#fbff00','none',NULL,NULL);
INSERT INTO "events" VALUES(25,5,'hadath 123','','2025-06-26T08:00','2025-06-26T09:00','#3788d8','none',NULL,NULL);
INSERT INTO "events" VALUES(26,5,'event','','2025-07-03T08:00','2025-07-03T09:00','#d73737','none',NULL,NULL);
INSERT INTO "events" VALUES(27,5,'hissa1','','2025-07-01T08:00','2025-07-01T09:00','#ff0000','weekly',NULL,NULL);
INSERT INTO "events" VALUES(57,5,'rew','','2025-07-22T08:00:00','2025-07-08T09:00','#3788d8','weekly','rec_1751930895624','2025-07-28');
INSERT INTO "events" VALUES(58,8,'event1000','great event!','2025-07-14T08:00:00','2025-07-14T09:00','#d73795','weekly','rec_1752250320257','2025-08-01');
INSERT INTO "events" VALUES(59,8,'event1000','great event!','2025-07-21T08:00:00','2025-07-14T09:00','#d73795','weekly','rec_1752250320257','2025-08-01');
INSERT INTO "events" VALUES(60,8,'event1000','great event!','2025-07-28T08:00:00','2025-07-14T09:00','#d73795','weekly','rec_1752250320257','2025-08-01');
CREATE TABLE exams (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    class_id INTEGER NOT NULL,
    name TEXT NOT NULL,
    status TEXT NOT NULL DEFAULT 'active', -- 'active' or 'inactive'
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, curriculum_group_id INTEGER REFERENCES curriculum_groups(id), is_final INTEGER DEFAULT 0, weight REAL DEFAULT 1.0, dawra INTEGER DEFAULT 1, is_year_final INTEGER DEFAULT 0,
    FOREIGN KEY (class_id) REFERENCES classes(id)
);
INSERT INTO "exams" VALUES(7,5,'a','active','2025-07-02 13:53:32',13,0,1.0,1,0);
INSERT INTO "exams" VALUES(8,5,'b','active','2025-07-02 14:20:00',15,0,1.0,1,0);
INSERT INTO "exams" VALUES(9,5,'c','active','2025-07-02 14:26:52',15,0,1.0,1,0);
INSERT INTO "exams" VALUES(15,5,'final','active','2025-07-02 23:25:21',13,1,1.0,1,0);
INSERT INTO "exams" VALUES(16,5,'final','active','2025-07-02 23:44:16',16,1,2.0,1,0);
INSERT INTO "exams" VALUES(17,5,'r','active','2025-07-03 00:08:01',16,0,1.0,2,0);
INSERT INTO "exams" VALUES(18,5,'final','active','2025-07-03 00:08:16',16,1,1.0,2,0);
INSERT INTO "exams" VALUES(23,5,'awww','active','2025-07-03 00:26:52',16,0,1.0,3,0);
INSERT INTO "exams" VALUES(26,5,'rre','active','2025-07-03 18:20:52',13,0,1.0,2,0);
INSERT INTO "exams" VALUES(27,5,'9','active','2025-07-03 23:03:35',13,1,1.0,2,0);
INSERT INTO "exams" VALUES(29,5,'arab','active','2025-07-03 23:10:37',13,0,1.0,1,0);
INSERT INTO "exams" VALUES(34,5,'end2','active','2025-07-03 23:34:02',13,0,1.0,NULL,1);
INSERT INTO "exams" VALUES(36,5,'fgh','active','2025-07-04 19:28:33',15,0,1.0,3,0);
INSERT INTO "exams" VALUES(38,5,'rrr','active','2025-07-04 19:34:00',15,0,1.0,NULL,1);
CREATE TABLE grades (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    student_id INTEGER NOT NULL,
    exam_id INTEGER NOT NULL,
    grade TEXT, -- Can be numeric or letter
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(student_id, exam_id),
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (exam_id) REFERENCES exams(id)
);
INSERT INTO "grades" VALUES(2,6,8,'10','2025-07-03 23:01:08');
INSERT INTO "grades" VALUES(3,6,9,'0','2025-07-02 14:42:08');
INSERT INTO "grades" VALUES(4,7,8,'9','2025-07-02 14:42:19');
INSERT INTO "grades" VALUES(5,6,7,'5','2025-07-03 23:01:47');
INSERT INTO "grades" VALUES(6,7,7,'9','2025-07-02 14:45:21');
INSERT INTO "grades" VALUES(7,7,9,'5','2025-07-15 18:15:44');
INSERT INTO "grades" VALUES(8,6,15,'10','2025-07-02 23:40:34');
INSERT INTO "grades" VALUES(9,7,16,'9','2025-07-02 23:44:27');
INSERT INTO "grades" VALUES(10,6,17,'5','2025-07-03 17:46:48');
INSERT INTO "grades" VALUES(11,7,17,'6','2025-07-03 17:46:51');
INSERT INTO "grades" VALUES(12,6,26,'7','2025-07-03 18:21:00');
INSERT INTO "grades" VALUES(13,6,18,'10','2025-07-03 18:21:16');
INSERT INTO "grades" VALUES(14,6,16,'9','2025-07-03 18:21:36');
INSERT INTO "grades" VALUES(15,6,27,'9','2025-07-03 23:03:41');
INSERT INTO "grades" VALUES(16,6,34,'9','2025-07-04 19:33:49');
INSERT INTO "grades" VALUES(20,6,37,'9','2025-07-04 19:32:44');
INSERT INTO "grades" VALUES(26,6,38,'7','2025-07-04 19:34:07');
CREATE TABLE homework (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        class_id INTEGER,
        due_date TEXT,
        description TEXT,
        files TEXT,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );
INSERT INTO "homework" VALUES(6,10,'2025-06-02','tottoto','adler.pdf;20240508_114827000_iOS_1.jpg','2025-05-30 13:34:31');
INSERT INTO "homework" VALUES(7,7,'2025-06-13','divers','img-20250210-wa0052.jpg
','2025-06-02 18:45:45');
INSERT INTO "homework" VALUES(8,5,'2025-07-12','devoir 123','20240508_114827000_iOS_1.jpg','2025-06-26 01:36:04');
CREATE TABLE level_curriculum_items (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        level_id INTEGER NOT NULL,
        curriculum_item_id INTEGER NOT NULL,
        FOREIGN KEY(level_id) REFERENCES levels(id),
        FOREIGN KEY(curriculum_item_id) REFERENCES curriculum_items(id)
    );
INSERT INTO "level_curriculum_items" VALUES(1,1,1);
INSERT INTO "level_curriculum_items" VALUES(2,1,2);
INSERT INTO "level_curriculum_items" VALUES(3,1,3);
INSERT INTO "level_curriculum_items" VALUES(4,1,4);
INSERT INTO "level_curriculum_items" VALUES(5,1,5);
INSERT INTO "level_curriculum_items" VALUES(6,1,6);
INSERT INTO "level_curriculum_items" VALUES(7,1,7);
INSERT INTO "level_curriculum_items" VALUES(8,1,8);
INSERT INTO "level_curriculum_items" VALUES(9,4,9);
CREATE TABLE level_groups (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    level_id INTEGER NOT NULL,
    group_id INTEGER NOT NULL,
    UNIQUE(level_id, group_id)
);
INSERT INTO "level_groups" VALUES(1,1,3);
INSERT INTO "level_groups" VALUES(2,1,4);
INSERT INTO "level_groups" VALUES(4,4,6);
CREATE TABLE levels (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        local_admin_id INTEGER NOT NULL,
        FOREIGN KEY(local_admin_id) REFERENCES users(id)
    );
INSERT INTO "levels" VALUES(1,'الأول',2);
INSERT INTO "levels" VALUES(6,'الرابع',2);
INSERT INTO "levels" VALUES(7,'الخامس',2);
CREATE TABLE student_grades (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        student_id INTEGER NOT NULL,
        curriculum_item_id INTEGER NOT NULL,
        level INTEGER NOT NULL, comment TEXT, comment_updated_at TEXT, comment_user TEXT,
        FOREIGN KEY(student_id) REFERENCES "students_old"(id),
        FOREIGN KEY(curriculum_item_id) REFERENCES curriculum_items(id)
    );
INSERT INTO "student_grades" VALUES(1,6,18,0,'ddddd','2025-05-27 10:27:59','unknown');
INSERT INTO "student_grades" VALUES(2,6,19,1,'hhh','2025-05-27 10:27:54','unknown');
INSERT INTO "student_grades" VALUES(3,6,20,1,'','2025-05-01 13:42:29','unknown');
INSERT INTO "student_grades" VALUES(4,7,18,4,'asd','2025-07-12 10:26:26','najma');
INSERT INTO "student_grades" VALUES(5,7,19,3,NULL,NULL,NULL);
INSERT INTO "student_grades" VALUES(6,7,20,4,'ffff','2025-05-01 13:57:51','unknown');
INSERT INTO "student_grades" VALUES(7,6,22,3,'','2025-05-14 16:53:16','unknown');
INSERT INTO "student_grades" VALUES(8,6,23,0,'','2025-05-12 08:19:11','unknown');
INSERT INTO "student_grades" VALUES(9,7,22,0,'gggg','2025-05-28 13:18:47','unknown');
INSERT INTO "student_grades" VALUES(10,7,23,0,'','2025-05-28 13:18:55','unknown');
INSERT INTO "student_grades" VALUES(11,7,14,3,'','2025-06-02 13:25:12','unknown');
INSERT INTO "student_grades" VALUES(12,7,21,0,'','2025-06-02 13:25:12','unknown');
INSERT INTO "student_grades" VALUES(13,21,18,2,'fsdfsd','2025-07-12 10:38:12','najma');
INSERT INTO "student_grades" VALUES(14,21,19,3,'','2025-07-11 20:48:07','najma');
INSERT INTO "student_grades" VALUES(15,21,20,3,'','2025-07-11 20:48:07','najma');
INSERT INTO "student_grades" VALUES(16,21,22,4,'','2025-07-11 20:48:07','najma');
INSERT INTO "student_grades" VALUES(17,21,23,0,'','2025-07-11 20:48:07','najma');
CREATE TABLE student_super_badges (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        student_id INTEGER NOT NULL,
        super_badge_id TEXT NOT NULL,
        active INTEGER DEFAULT 1, created_at DATETIME,
        UNIQUE(student_id, super_badge_id)
    );
INSERT INTO "student_super_badges" VALUES(1,6,'4052473c-4ec3-4a17-a344-13b37d9c1396',1,2017);
INSERT INTO "student_super_badges" VALUES(2,6,'6fd31ea0-b424-4ca6-aee8-ac3316b96543',1,2017);
INSERT INTO "student_super_badges" VALUES(3,6,'16b643be-35d9-42f9-babe-191990c8be85',1,2017);
INSERT INTO "student_super_badges" VALUES(4,6,'d6e1f553-8e7e-4528-a2c3-66c669adcd72',0,2017);
INSERT INTO "student_super_badges" VALUES(5,6,'1426dcd3-d01e-4941-896b-0b190db5ff48',1,2017);
INSERT INTO "student_super_badges" VALUES(6,6,'ef2d9bd3-b68c-4cf0-bc37-bccc910afc3e',1,2017);
INSERT INTO "student_super_badges" VALUES(7,6,'55389e92-5bbf-4264-9813-13839216ab2b',0,2017);
INSERT INTO "student_super_badges" VALUES(8,6,'bfa4e5f6-a149-418c-b91d-af0a47f2708e',1,2017);
INSERT INTO "student_super_badges" VALUES(9,6,'3d76e8d7-feed-47fa-84b0-fbc150e956ad',0,'2025-06-02 15:20:09');
INSERT INTO "student_super_badges" VALUES(10,6,'be5bc098-13bb-42cf-88b0-e39e27a013eb',0,2017);
INSERT INTO "student_super_badges" VALUES(11,6,'c285dd96-a0c2-478e-86ab-6fe77bf09357',1,'2025-06-26 01:42:40');
INSERT INTO "student_super_badges" VALUES(12,6,'834db92d-44c7-4c45-b8c9-f6aa11fcedcb',0,2017);
INSERT INTO "student_super_badges" VALUES(13,6,'515f232b-3b79-4845-a624-96099074eb6d',0,'2025-06-02 15:20:49');
INSERT INTO "student_super_badges" VALUES(14,6,'eae43a90-8059-4f9c-b7f0-3fec5c26b754',1,2017);
INSERT INTO "student_super_badges" VALUES(15,7,'515f232b-3b79-4845-a624-96099074eb6d',1,2017);
INSERT INTO "student_super_badges" VALUES(16,7,'bfa4e5f6-a149-418c-b91d-af0a47f2708e',1,2017);
INSERT INTO "student_super_badges" VALUES(17,21,'834db92d-44c7-4c45-b8c9-f6aa11fcedcb',1,'2025-07-12 14:38:53');
INSERT INTO "student_super_badges" VALUES(18,21,'515f232b-3b79-4845-a624-96099074eb6d',0,'2025-07-12 15:20:32');
CREATE TABLE student_super_badges_notes (
        student_id INTEGER PRIMARY KEY,
        note TEXT,
        updated_at TEXT,
        user TEXT
    );
INSERT INTO "student_super_badges_notes" VALUES(6,'rrr','2025-06-02 09:52','');
INSERT INTO "student_super_badges_notes" VALUES(7,'ggggg','2025-06-02 08:54','');
INSERT INTO "student_super_badges_notes" VALUES(21,'ggg','2025-07-12 10:50','');
CREATE TABLE students (
        id INTEGER PRIMARY KEY,
        name TEXT NOT NULL,
        class_id INTEGER,
        email TEXT,
        phone TEXT,
        notes TEXT,
        alerts TEXT
    , date_of_birth TEXT, secondary_email TEXT);
INSERT INTO "students" VALUES(6,'نوفل الطالبي',6,'nawfal@gmail.com','','','asd','2025-07-17','');
INSERT INTO "students" VALUES(7,'سميحة الراوي',5,'samiha@gmail.com','','','','','');
INSERT INTO "students" VALUES(12,'عادل النمر',5,'barb@gmail.com','','','',NULL,NULL);
INSERT INTO "students" VALUES(18,'نوفل الراوي',5,'arawii@hotmail.com','','','','','');
INSERT INTO "students" VALUES(19,'عادل الطالبي',5,'adil@gmail.com','','','',NULL,NULL);
INSERT INTO "students" VALUES(20,'عادل الراوي',5,'arawii@hotmail.com','','','','','');
INSERT INTO "students" VALUES(21,'hassan3',5,'hrawii@hotmail.com','','','','','');
INSERT INTO "students" VALUES(22,'نوفل','','frawii@hotmail.com','','qwerty','','','');
INSERT INTO "students" VALUES(23,'سمير',8,'samir@gmail.com','','','','','');
CREATE TABLE "super_badges" (
    id TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    icon_type TEXT,
    icon_value TEXT,
    created_at DATETIME
, active INTEGER DEFAULT 1);
INSERT INTO "super_badges" VALUES('bfa4e5f6-a149-418c-b91d-af0a47f2708e','svg','svg','<svg xmlns="http://www.w3.org/2000/svg" shape-rendering="geometricPrecision" text-rendering="geometricPrecision" image-rendering="optimizeQuality" fill-rule="evenodd" clip-rule="evenodd" viewBox="0 0 438 512.01"><path fill="#26292B" fill-rule="nonzero" d="M12.39 96.25h64.26c-.03-10.18.06-6.99.23-18.08V37.73h282.28v40.49c.08 11.25.06 8.04-.06 18.07h66.54v.03c6.3 0 11.56 4.95 11.85 11.31.9 18.52.73 36.72-1.53 53.67-2.34 17.61-6.92 33.87-14.83 47.78-7.78 13.68-18.77 25.06-33.97 33.19-14.1 7.54-28.08 11.98-50 12.86-7.1 23.94-33.07 45.13-52.79 63.09-23.78 18.17-41.69 31.87-27.77 73.82h6.99c16.62 0 30.19 13.57 30.19 30.19v12.16h16.79c8.17 0 15.62 3.34 21.03 8.73 5.39 5.4 8.73 12.82 8.73 21.02v20.19c0 3.77-3.07 6.84-6.85 6.84H102.6c-3.78 0-6.84-3.07-6.84-6.84v-20.19c0-8.16 3.33-15.58 8.72-20.98l.05-.04c5.4-5.39 12.82-8.73 20.98-8.73h16.78v-12.16c0-16.55 13.64-30.19 30.19-30.19h9.59c12.43-39.58-3.86-52.4-26.37-70.13-26.04-15.62-47.01-47.08-58.74-66.96-22.73-.72-32.29-5.02-46.69-12.78-15.11-8.14-26.01-19.53-33.7-33.21-7.8-13.88-12.31-30.11-14.6-47.71-2.17-16.7-2.35-34.57-1.49-52.77v-.33c0-6.58 5.33-11.9 11.91-11.9zm345.44 43.45c-1.49 29.14-4.12 51.71-7.81 69.62 7.74-1.63 14.11-4.1 19.3-7.34 6.2-3.86 10.82-8.93 14.24-15.02 3.69-6.58 6.01-14.37 7.44-23.13 1.18-7.29 1.73-15.38 1.92-24.11h-34.54l-.55-.02zm-280.16 0h-31.2c.15 8.73.64 16.85 1.74 24.22 1.31 8.83 3.47 16.63 6.96 23.14 3.23 6.05 7.68 11.1 13.77 14.96 4.86 3.1 10.81 5.49 18.05 7.11-5.15-20.25-7.97-43.1-9.32-69.43z"/><path fill="#FFCE6B" fill-rule="nonzero" d="M358.38 127.82h41.77c2.62 0 4.75 2.12 4.75 4.73 0 23.91-2.16 44.51-10.98 60.22-8.77 15.62-26.29 27.68-52.7 29.43-4.19 8.48-5.38 15.44-10.55 21.33 42.32-1.12 66.72-16.71 80.15-40.31 14.18-24.97 16.55-59.21 14.82-95.03h-67.26v19.63z"/><path fill="#fff" fill-rule="nonzero" d="M77.52 108.15H12.39c-1.77 35.81.51 70.03 14.55 95 13.25 23.57 37.45 39.15 79.59 40.34-3.23-5.9-2.53-12.09-8.75-20.46-26.13-2.23-44.66-14.66-53.07-30.39-8.42-15.71-10.21-36.25-10.21-60.1a4.75 4.75 0 0 1 4.74-4.74h38.28v-19.65z"/><path fill="#26292B" fill-rule="nonzero" d="M307.59 434.35v.04h2.98c8.17 0 15.63 3.33 21.02 8.73 5.4 5.4 8.74 12.82 8.74 21.02v41.02c0 3.78-3.08 6.85-6.85 6.85H102.6c-3.77 0-6.85-3.07-6.85-6.85v-41.02c0-8.16 3.34-15.58 8.74-20.97l.04-.05c5.4-5.4 12.82-8.73 20.98-8.73h2.98v-.04h179.1z"/><path fill="#fff" fill-rule="nonzero" d="M272.67 454.72h-134.8c-4.56 0-8.69 1.85-11.67 4.83l-.05.04a16.475 16.475 0 0 0-4.82 11.68v20.37h193.42v-20.37c0-4.52-1.84-8.65-4.87-11.68-2.98-2.98-7.11-4.87-11.67-4.87h-25.54zm-76.94-57.92h24.55v-68.76c-85.58-30.43-94.33-134.96-114.74-280.12H86.97v103.34c1.71 39.31 8.3 68.41 17.37 90.7 8.99 22.02 20.54 37.41 32.36 49.38 8.62 8.75 17.64 15.83 25.9 22.34 31.8 24.98 40.98 35.89 33.13 83.12z"/><path fill="#FFCE6B" fill-rule="nonzero" d="M218.9 396.8h24.07c-14.98-49.06 6.5-65.44 34.8-87.05 31.04-23.7 71.39-54.47 71.39-155.74V47.92H104.85c13.18 93.71 21.21 170.49 48.28 221.32 10.74 18.22 22.63 32.75 35.84 43.02 6.41 4.73 13.42 8.82 21.11 12.25 2.79 1.11 5.63 2.07 8.53 2.85v.57l.29.11v68.76z"/><path fill="#26292B" fill-rule="nonzero" d="m233.53 100.38 6.46 15.73 5.93 14.45 32.6 2.46c4.63.34 8.11 4.38 7.77 9.01a8.435 8.435 0 0 1-3.25 6.04l-24.67 20.91 7.73 31.69c1.09 4.5-1.68 9.04-6.18 10.13-2.36.57-4.72.09-6.6-1.15l-27.55-17.06-27.76 17.19c-3.95 2.43-9.12 1.21-11.55-2.73a8.378 8.378 0 0 1-1.02-6.38l7.73-31.69-24.96-21.16c-3.54-2.99-3.98-8.3-.98-11.84a8.36 8.36 0 0 1 5.79-2.95l32.6-2.47L218 100.38c2.87-6.99 12.72-6.84 15.53 0z"/><path fill="#fff" fill-rule="nonzero" d="m225.77 102.74 14.6 35.57 38.41 2.9-29.41 24.92 9.11 37.35-32.71-20.26-32.72 20.26 9.11-37.35-29.4-24.92 38.4-2.9 14.61-35.57z"/><path fill="#fff" d="m289.27 257.78-.28.37c-3.09-2.23-6.63-3.04-10.62-2.4-3.98.63-7.1 2.51-9.34 5.59l-.38-.27c2.24-3.09 3.04-6.64 2.4-10.63-.64-3.98-2.5-7.1-5.58-9.33.09-.13 9.3 2.28 10.89 2.03 3.99-.64 7.1-2.5 9.35-5.6l.38.28c-2.24 3.08-3.05 6.63-2.4 10.62.62 3.98 2.49 7.1 5.58 9.34zm34.84-62.8-.28.38c-3.09-2.24-6.63-3.04-10.62-2.4-3.98.63-7.1 2.49-9.34 5.58l-.38-.27c2.24-3.09 3.03-6.63 2.4-10.62-.64-3.99-2.5-7.1-5.58-9.34l.27-.38c3.09 2.24 6.64 3.05 10.62 2.4 3.98-.63 7.11-2.49 9.35-5.58l.38.27c-2.24 3.09-3.05 6.63-2.41 10.62.62 3.99 2.49 7.1 5.59 9.34zm8.22-86.64-.5.7c-5.65-4.1-12.14-5.57-19.43-4.4-7.29 1.16-12.99 4.57-17.09 10.23l-.7-.5c4.1-5.66 5.58-12.14 4.39-19.44-1.17-7.3-4.58-13-10.22-17.08l.5-.69c5.66 4.09 12.14 5.56 19.44 4.4 7.29-1.17 12.98-4.58 17.08-10.24l.69.5c-4.09 5.65-5.56 12.14-4.4 19.43 1.17 7.3 4.58 13 10.24 17.09z"/><path fill="#252D32" fill-rule="nonzero" d="M67.04 0h317.48c6.52 0 12.46 2.67 16.74 6.96 4.29 4.28 6.96 10.21 6.96 16.74 0 6.53-2.67 12.47-6.96 16.75-4.28 4.29-10.22 6.96-16.74 6.96H67.04c-6.53 0-12.46-2.67-16.74-6.96-4.29-4.28-6.96-10.22-6.96-16.74 0-6.54 2.67-12.47 6.96-16.75C54.58 2.67 60.51 0 67.04 0z"/><path fill="#fff" d="m102.12 37.06-4.98-26.71h-30.1c-3.67 0-7.02 1.51-9.43 3.92-2.41 2.42-3.92 5.76-3.92 9.43s1.51 7.02 3.92 9.44c2.41 2.41 5.76 3.92 9.43 3.92h35.08z"/><path fill="#FFCE6B" d="m102.12 37.06-4.98-26.71h287.38c3.66 0 7.01 1.51 9.43 3.92 2.41 2.42 3.92 5.76 3.92 9.44 0 3.66-1.51 7.01-3.92 9.43-2.42 2.41-5.77 3.92-9.43 3.92h-282.4z"/></svg>','2025-05-14 12:24:11.825765',0);
INSERT INTO "super_badges" VALUES('eae43a90-8059-4f9c-b7f0-3fec5c26b754','url','url','https://uxwing.com/wp-content/themes/uxwing/download/sport-and-awards/1st-prize-icon.svg','2025-05-14 12:25:03.905163',1);
INSERT INTO "super_badges" VALUES('3d76e8d7-feed-47fa-84b0-fbc150e956ad','king','url','https://uxwing.com/wp-content/themes/uxwing/download/sport-and-awards/crown-color-icon.svg','2025-05-14 12:56:59.819701',1);
INSERT INTO "super_badges" VALUES('c285dd96-a0c2-478e-86ab-6fe77bf09357','numero1','url','https://uxwing.com/wp-content/themes/uxwing/download/sport-and-awards/first-icon.svg','2025-05-14 13:12:27.017970',1);
INSERT INTO "super_badges" VALUES('834db92d-44c7-4c45-b8c9-f6aa11fcedcb','svg3','svg','<svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 122.88 122.88" style="enable-background:new 0 0 122.88 122.88" xml:space="preserve"><style type="text/css"><![CDATA[
	.st0{fill:none;stroke:#663333;stroke-width:2.4001;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:2.6131;}
	.st1{fill-rule:evenodd;clip-rule:evenodd;fill:#DE4C3C;}
	.st2{fill-rule:evenodd;clip-rule:evenodd;fill:#F7BB8F;}
	.st3{fill-rule:evenodd;clip-rule:evenodd;fill:#C84436;}
	.st4{fill-rule:evenodd;clip-rule:evenodd;fill:#FEC9A3;}
	.st5{fill-rule:evenodd;clip-rule:evenodd;fill:#393939;stroke:#000000;stroke-width:0.5;stroke-miterlimit:2.6131;}
	.st6{fill-rule:evenodd;clip-rule:evenodd;fill:#393939;}
]]></style><g><path class="st1" d="M61.44,0l13.52,10.99l17.2-2.76l6.21,16.28l16.28,6.21l-2.76,17.2l10.99,13.52l-10.99,13.52l2.76,17.2 l-16.28,6.21l-6.21,16.28l-17.2-2.76l-13.52,10.99l-13.52-10.99l-17.2,2.76l-6.21-16.28L8.23,92.16l2.76-17.2L0,61.44l10.99-13.52 l-2.76-17.2l16.28-6.21l6.21-16.28l17.2,2.76L61.44,0L61.44,0L61.44,0z M61.44,24.02c20.67,0,37.42,16.76,37.42,37.42 c0,20.67-16.76,37.42-37.42,37.42c-20.67,0-37.42-16.76-37.42-37.42C24.02,40.77,40.77,24.02,61.44,24.02L61.44,24.02L61.44,24.02z"/><path class="st3" d="M111.91,47.8l-0.02,0.12l10.99,13.52l-10.99,13.52l2.76,17.2l-16.28,6.21l-6.21,16.28l-17.2-2.76l-13.52,10.99 l-13.52-10.99l-17.2,2.76l-6.21-16.28l-0.86-0.33l13.82-7.87c6.49,5.42,14.85,8.69,23.97,8.69c20.66,0,37.42-16.75,37.42-37.42 c0-2.02-0.16-4.01-0.47-5.94L111.91,47.8L111.91,47.8z"/><path class="st5" d="M40.58,56.36h9.83c0.79,0,1.44,0.65,1.44,1.45v19.22c0,0.79-0.65,1.45-1.44,1.45l-9.83,0 c-0.79,0-1.45-0.65-1.45-1.45V57.81C39.14,57.01,39.79,56.36,40.58,56.36L40.58,56.36L40.58,56.36z"/><path class="st6" d="M51.85,71.31v5.72c0,0.79-0.65,1.45-1.44,1.45l-9.83,0c-0.79,0-1.45-0.65-1.45-1.45v-5.72H51.85L51.85,71.31z"/><path class="st0" d="M64.11,41.95c0.76-3.86,7.08-0.3,7.5,5.92c0.13,1.9-0.07,4.12-0.54,6.59h9.03c3.76,0.15,7.03,2.84,4.72,7.26 c0.53,1.92,0.61,4.18-0.83,5.07c0.18,3.04-0.66,4.92-2.23,6.41c-0.1,1.52-0.43,2.87-1.16,3.91c-1.21,1.71-2.2,1.3-4.11,1.3H61.24 c-2.42,0-3.73-0.67-5.31-2.65V58.77c4.55-1.23,6.96-7.45,8.18-11.53V41.95L64.11,41.95L64.11,41.95z"/><path class="st4" d="M64.11,41.95c0.76-3.86,7.08-0.3,7.5,5.92c0.13,1.9-0.07,4.12-0.54,6.59h9.03c3.76,0.15,7.03,2.84,4.72,7.26 c0.53,1.92,0.61,4.18-0.83,5.07c0.18,3.04-0.66,4.92-2.23,6.41c-0.1,1.52-0.43,2.87-1.16,3.91c-1.21,1.71-2.2,1.3-4.11,1.3H61.24 c-2.42,0-3.73-0.67-5.31-2.65V58.77c4.55-1.23,6.96-7.45,8.18-11.53V41.95L64.11,41.95L64.11,41.95z"/><path class="st2" d="M79.88,54.46h0.22c3.76,0.15,7.03,2.84,4.72,7.26c0.53,1.92,0.61,4.18-0.83,5.07 c0.18,3.04-0.66,4.92-2.23,6.41c-0.1,1.52-0.43,2.87-1.16,3.91c-1.21,1.71-2.2,1.3-4.11,1.3H61.24c-1.75,0-2.91-0.35-4.02-1.29 L79.88,54.46L79.88,54.46z"/></g></svg>','2025-05-14 19:08:39.322020',1);
INSERT INTO "super_badges" VALUES('515f232b-3b79-4845-a624-96099074eb6d','المواظبة','svg','<svg width=''32'' height=''32'' viewBox=''0 0 24 24''><rect x=''10'' y=''15'' width=''4'' height=''5'' fill=''#8d6e63''/><circle cx=''12'' cy=''10'' r=''6'' fill=''#66bb6a''/></svg>','2025-05-14 19:30:07.925942',1);
INSERT INTO "super_badges" VALUES('b995b195-947b-44bb-90f6-7b7cec7ff736','award2','svg','<svg width=''32'' height=''32'' viewBox=''0 0 24 24''><path fill=''#90caf9'' d=''M2 17l2.5-2.5 3 3L5 20l-3-3z''/><path fill=''#1976d2'' d=''M12 2l4 4-7.5 7.5-4-4z''/><circle cx=''17'' cy=''7'' r=''2'' fill=''#ffd700''/></svg>',NULL,0);
CREATE TABLE support_material (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        level_id INTEGER,
        filename TEXT,
        original_filename TEXT,
        description TEXT,
        uploader TEXT,
        date TEXT
    );
INSERT INTO "support_material" VALUES(2,6,'level6_20250706221918_Deuxieme_etape-Zyad.pdf','Deuxieme_etape-Zyad.pdf','z','Admin','2025-07-06 22:19');
INSERT INTO "support_material" VALUES(4,1,'level1_20250707112542_drawingstuff.png','drawingstuff.png','hjmghcbxbxbvxbv','Admin','2025-07-07 11:25');
INSERT INTO "support_material" VALUES(5,6,'level6_20250707112610_drawingstuff.png','drawingstuff.png','adsdasgfsdfgdgdgdf','Admin','2025-07-07 11:26');
CREATE TABLE teachers (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        user_id INTEGER NOT NULL,
        local_admin_id INTEGER NOT NULL, email TEXT, phone TEXT, notes TEXT, alerts TEXT, name TEXT,
        FOREIGN KEY(user_id) REFERENCES users(id),
        FOREIGN KEY(local_admin_id) REFERENCES users(id)
    );
INSERT INTO "teachers" VALUES(8,26,2,'oustad7@gmail.com','','','','oustad sab3a');
INSERT INTO "teachers" VALUES(9,27,2,'oustad8@gmail.com','5143679876','','','oustad tamanya');
CREATE TABLE "users" (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                username TEXT UNIQUE NOT NULL,
                password_hash TEXT,
                role TEXT NOT NULL CHECK(role IN ('super_admin', 'local_admin', 'teacher', 'student'))
            , created_by INTEGER, name TEXT, is_director INTEGER DEFAULT 0);
INSERT INTO "users" VALUES(1,'admin','scrypt:32768:8:1$0qD8WfT3sK6LmKcy$b3337929e5d17de79fa4f9a4951e71782eeecd56c18b9073d28ff295ecf5e7874e069a5b73cde4bda059ebcbe2c7c958f68bf159b36e7d8486339e3265c76f4e','super_admin',NULL,NULL,0);
INSERT INTO "users" VALUES(2,'najma','scrypt:32768:8:1$UtZzaWZu2rKRiCff$ad50c08ea95422e52b6ff3f7c965dce7578475c9ba143288cdc4f934ec2249caf6b279a801c898010910f751318362b318bba7e6395f9c247ef3477ec525a4c6','local_admin',NULL,'najma najmi',0);
INSERT INTO "users" VALUES(6,'nawfal@gmail.com','scrypt:32768:8:1$zCC2hjkgq6axHgtU$ecadeb1dc450a68a3f81be7f71da6e04dea5f9776abefdb23fba43255393a6ddab580ef5acd7a2ddd4d00facddd6d28b7abe7f7bee863e1f1d2226b514a0849e','student',NULL,NULL,0);
INSERT INTO "users" VALUES(7,'samiha@gmail.com','pbkdf2:sha256:600000$t1WpvLKm2zZSN7uy$f45e05d520db0bb4c3a883bea73e29eeaa02942e1a0ac931d9012830ea69883e','student',NULL,NULL,0);
INSERT INTO "users" VALUES(12,'barb@gmail.com','pbkdf2:sha256:600000$8Sg00OnnD4icgmQ9$a3e529c49494df1d239262ce258541f09cbd890036646218efd551ffc01322ba','student',NULL,NULL,0);
INSERT INTO "users" VALUES(13,'batata','scrypt:32768:8:1$YrDPi141nE8PBf92$e10b4a950f1ef0de1cd3d2aa9d4751f1132962412c118b5c0926df3e1a6f3cfda7cbb7e3f1984b832f5fbe3a09b05332ba77fea8bdafd2c49abfc612d5e55430','local_admin',NULL,'ليلى الشريف',1);
INSERT INTO "users" VALUES(16,'lima@gmail.com','pbkdf2:sha256:600000$UkGvNtL4Zi1oU29p$6735f8832a04cfedb1c7b6173a6282bf06f188f920f97c544414880376e05e44','local_admin',NULL,'lima limi',0);
INSERT INTO "users" VALUES(18,'arawii@gmail.com','pbkdf2:sha256:600000$IOPooYBaR9xiJrZ8$72345347d1411d6ff750fa5d364420d10bca15afbf2f5aa5dc0d59573c11d39b','student',NULL,NULL,0);
INSERT INTO "users" VALUES(19,'adil@gmail.com','pbkdf2:sha256:600000$gJnnoTtohHHJxRzA$6d9d43f22d2e24c1a215c7de5d9602bc7b6f31a7593eef49b563ce72d535a569','student',NULL,NULL,0);
INSERT INTO "users" VALUES(20,'arawii@hotmail.com','pbkdf2:sha256:600000$nLozOSl7il4NzeXB$0c3247a6daff3a7eb66ca586d209ef3207c8379e2595af1cafa2e2d4059f9957','student',NULL,NULL,0);
INSERT INTO "users" VALUES(24,'frawii@hotmail.com','pbkdf2:sha256:600000$miPcaNaS2xu96AWB$8b063dcd3c4902ed6bfd7ad5e2adfb08d0ba1f0d4d88dd97e77f1e74dfb30f9a','student',NULL,NULL,0);
INSERT INTO "users" VALUES(25,'hrawii@hotmail.com','pbkdf2:sha256:600000$xYTdpeu9Brd6n8Pg$c84dd5f8db2d44e3c2485cb3f160c59115719aa4303a02323de7c49c039941bf','student',NULL,NULL,0);
INSERT INTO "users" VALUES(26,'oustad7@gmail.com','pbkdf2:sha256:600000$YWVCbuXR47AbHmgK$be7d0d3563a8b82e9077d0169ca5ca3c64c60a56d8cae32c2ee82d4cb96f9d1f','teacher',2,NULL,0);
INSERT INTO "users" VALUES(27,'oustad8@gmail.com','pbkdf2:sha256:600000$YS5TtjIrhLIwbSQ0$1e741ebe68e02a843dbfd773c67203dcc8e99fc8f75489350ef2f7d7606cdbf5','teacher',2,NULL,0);
INSERT INTO "users" VALUES(28,'samir@gmail.com','pbkdf2:sha256:600000$eWFzy3VtIRA0wwrK$c2357b3594b7d0e4e9462130000cfaa3e2681738499b6e151bd038f3e22ee514','student',NULL,NULL,0);
DELETE FROM "sqlite_sequence";
INSERT INTO "sqlite_sequence" VALUES('levels',7);
INSERT INTO "sqlite_sequence" VALUES('teachers',9);
INSERT INTO "sqlite_sequence" VALUES('classes',13);
INSERT INTO "sqlite_sequence" VALUES('curriculum_groups',19);
INSERT INTO "sqlite_sequence" VALUES('curriculum_items',23);
INSERT INTO "sqlite_sequence" VALUES('level_curriculum_items',9);
INSERT INTO "sqlite_sequence" VALUES('level_groups',4);
INSERT INTO "sqlite_sequence" VALUES('users',28);
INSERT INTO "sqlite_sequence" VALUES('student_grades',17);
INSERT INTO "sqlite_sequence" VALUES('student_super_badges',18);
INSERT INTO "sqlite_sequence" VALUES('events',60);
INSERT INTO "sqlite_sequence" VALUES('homework',8);
INSERT INTO "sqlite_sequence" VALUES('announcements',17);
INSERT INTO "sqlite_sequence" VALUES('exams',39);
INSERT INTO "sqlite_sequence" VALUES('grades',29);
INSERT INTO "sqlite_sequence" VALUES('attendance',30);
INSERT INTO "sqlite_sequence" VALUES('support_material',5);
COMMIT;
