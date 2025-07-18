BEGIN TRANSACTION;
CREATE TABLE alembic_version (
	version_num VARCHAR(32) NOT NULL, 
	CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num)
);
CREATE TABLE announcements (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        class_id INTEGER NOT NULL,
        text TEXT NOT NULL,
        created_at TEXT NOT NULL,
        user_id INTEGER NOT NULL
    , expiry TEXT);
CREATE TABLE attendance (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        student_id INTEGER NOT NULL,
        class_id INTEGER NOT NULL,
        day TEXT NOT NULL,
        present INTEGER NOT NULL,
        UNIQUE(student_id, class_id, day)
    );
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
CREATE TABLE curriculum_groups (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        local_admin_id INTEGER NOT NULL, level_id INTEGER,
        FOREIGN KEY(local_admin_id) REFERENCES users(id)
    );
CREATE TABLE curriculum_items (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        group_id INTEGER NOT NULL,
        name TEXT NOT NULL,
        FOREIGN KEY(group_id) REFERENCES curriculum_groups(id)
    );
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
CREATE TABLE exams (

    id INTEGER PRIMARY KEY AUTOINCREMENT,

    class_id INTEGER NOT NULL,

    name TEXT NOT NULL,

    status TEXT NOT NULL DEFAULT 'active', -- 'active' or 'inactive'

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, curriculum_group_id INTEGER REFERENCES curriculum_groups(id), is_final INTEGER DEFAULT 0, weight REAL DEFAULT 1.0, dawra INTEGER DEFAULT 1, is_year_final INTEGER DEFAULT 0,

    FOREIGN KEY (class_id) REFERENCES classes(id)

);
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
CREATE TABLE homework (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        class_id INTEGER,
        due_date TEXT,
        description TEXT,
        files TEXT,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

','2025-06-02 18:45:45');
CREATE TABLE level_curriculum_items (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        level_id INTEGER NOT NULL,
        curriculum_item_id INTEGER NOT NULL,
        FOREIGN KEY(level_id) REFERENCES levels(id),
        FOREIGN KEY(curriculum_item_id) REFERENCES curriculum_items(id)
    );
CREATE TABLE level_groups (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    level_id INTEGER NOT NULL,
    group_id INTEGER NOT NULL,
    UNIQUE(level_id, group_id)
);
CREATE TABLE levels (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        local_admin_id INTEGER NOT NULL,
        FOREIGN KEY(local_admin_id) REFERENCES users(id)
    );
CREATE TABLE student_grades (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        student_id INTEGER NOT NULL,
        curriculum_item_id INTEGER NOT NULL,
        level INTEGER NOT NULL, comment TEXT, comment_updated_at TEXT, comment_user TEXT,
        FOREIGN KEY(student_id) REFERENCES "students_old"(id),
        FOREIGN KEY(curriculum_item_id) REFERENCES curriculum_items(id)
    );
CREATE TABLE student_super_badges (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        student_id INTEGER NOT NULL,
        super_badge_id TEXT NOT NULL,
        active INTEGER DEFAULT 1, created_at DATETIME,
        UNIQUE(student_id, super_badge_id)
    );
CREATE TABLE student_super_badges_notes (
        student_id INTEGER PRIMARY KEY,
        note TEXT,
        updated_at TEXT,
        user TEXT
    );
CREATE TABLE students (
        id INTEGER PRIMARY KEY,
        name TEXT NOT NULL,
        class_id INTEGER,
        email TEXT,
        phone TEXT,
        notes TEXT,
        alerts TEXT
    , date_of_birth TEXT, secondary_email TEXT);
CREATE TABLE "super_badges" (

    id TEXT PRIMARY KEY,

    name TEXT NOT NULL,

    icon_type TEXT,

    icon_value TEXT,

    created_at DATETIME

, active INTEGER DEFAULT 1);
	.st0{fill:none;stroke:#663333;stroke-width:2.4001;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:2.6131;}
	.st1{fill-rule:evenodd;clip-rule:evenodd;fill:#DE4C3C;}
	.st2{fill-rule:evenodd;clip-rule:evenodd;fill:#F7BB8F;}
	.st3{fill-rule:evenodd;clip-rule:evenodd;fill:#C84436;}
	.st4{fill-rule:evenodd;clip-rule:evenodd;fill:#FEC9A3;}
	.st5{fill-rule:evenodd;clip-rule:evenodd;fill:#393939;stroke:#000000;stroke-width:0.5;stroke-miterlimit:2.6131;}
	.st6{fill-rule:evenodd;clip-rule:evenodd;fill:#393939;}
]]></style><g><path class="st1" d="M61.44,0l13.52,10.99l17.2-2.76l6.21,16.28l16.28,6.21l-2.76,17.2l10.99,13.52l-10.99,13.52l2.76,17.2 l-16.28,6.21l-6.21,16.28l-17.2-2.76l-13.52,10.99l-13.52-10.99l-17.2,2.76l-6.21-16.28L8.23,92.16l2.76-17.2L0,61.44l10.99-13.52 l-2.76-17.2l16.28-6.21l6.21-16.28l17.2,2.76L61.44,0L61.44,0L61.44,0z M61.44,24.02c20.67,0,37.42,16.76,37.42,37.42 c0,20.67-16.76,37.42-37.42,37.42c-20.67,0-37.42-16.76-37.42-37.42C24.02,40.77,40.77,24.02,61.44,24.02L61.44,24.02L61.44,24.02z"/><path class="st3" d="M111.91,47.8l-0.02,0.12l10.99,13.52l-10.99,13.52l2.76,17.2l-16.28,6.21l-6.21,16.28l-17.2-2.76l-13.52,10.99 l-13.52-10.99l-17.2,2.76l-6.21-16.28l-0.86-0.33l13.82-7.87c6.49,5.42,14.85,8.69,23.97,8.69c20.66,0,37.42-16.75,37.42-37.42 c0-2.02-0.16-4.01-0.47-5.94L111.91,47.8L111.91,47.8z"/><path class="st5" d="M40.58,56.36h9.83c0.79,0,1.44,0.65,1.44,1.45v19.22c0,0.79-0.65,1.45-1.44,1.45l-9.83,0 c-0.79,0-1.45-0.65-1.45-1.45V57.81C39.14,57.01,39.79,56.36,40.58,56.36L40.58,56.36L40.58,56.36z"/><path class="st6" d="M51.85,71.31v5.72c0,0.79-0.65,1.45-1.44,1.45l-9.83,0c-0.79,0-1.45-0.65-1.45-1.45v-5.72H51.85L51.85,71.31z"/><path class="st0" d="M64.11,41.95c0.76-3.86,7.08-0.3,7.5,5.92c0.13,1.9-0.07,4.12-0.54,6.59h9.03c3.76,0.15,7.03,2.84,4.72,7.26 c0.53,1.92,0.61,4.18-0.83,5.07c0.18,3.04-0.66,4.92-2.23,6.41c-0.1,1.52-0.43,2.87-1.16,3.91c-1.21,1.71-2.2,1.3-4.11,1.3H61.24 c-2.42,0-3.73-0.67-5.31-2.65V58.77c4.55-1.23,6.96-7.45,8.18-11.53V41.95L64.11,41.95L64.11,41.95z"/><path class="st4" d="M64.11,41.95c0.76-3.86,7.08-0.3,7.5,5.92c0.13,1.9-0.07,4.12-0.54,6.59h9.03c3.76,0.15,7.03,2.84,4.72,7.26 c0.53,1.92,0.61,4.18-0.83,5.07c0.18,3.04-0.66,4.92-2.23,6.41c-0.1,1.52-0.43,2.87-1.16,3.91c-1.21,1.71-2.2,1.3-4.11,1.3H61.24 c-2.42,0-3.73-0.67-5.31-2.65V58.77c4.55-1.23,6.96-7.45,8.18-11.53V41.95L64.11,41.95L64.11,41.95z"/><path class="st2" d="M79.88,54.46h0.22c3.76,0.15,7.03,2.84,4.72,7.26c0.53,1.92,0.61,4.18-0.83,5.07 c0.18,3.04-0.66,4.92-2.23,6.41c-0.1,1.52-0.43,2.87-1.16,3.91c-1.21,1.71-2.2,1.3-4.11,1.3H61.24c-1.75,0-2.91-0.35-4.02-1.29 L79.88,54.46L79.88,54.46z"/></g></svg>','2025-05-14 19:08:39.322020',1);
CREATE TABLE support_material (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        level_id INTEGER,
        filename TEXT,
        original_filename TEXT,
        description TEXT,
        uploader TEXT,
        date TEXT
    );
CREATE TABLE teachers (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        user_id INTEGER NOT NULL,
        local_admin_id INTEGER NOT NULL, email TEXT, phone TEXT, notes TEXT, alerts TEXT, name TEXT,
        FOREIGN KEY(user_id) REFERENCES users(id),
        FOREIGN KEY(local_admin_id) REFERENCES users(id)
    );
CREATE TABLE "users" (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                username TEXT UNIQUE NOT NULL,
                password_hash TEXT,
                role TEXT NOT NULL CHECK(role IN ('super_admin', 'local_admin', 'teacher', 'student'))
            , created_by INTEGER, name TEXT, is_director INTEGER DEFAULT 0);
DELETE FROM "sqlite_sequence";
COMMIT;
