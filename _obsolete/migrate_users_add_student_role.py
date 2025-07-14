import sqlite3
import traceback

DB_PATH = 'arabicschool.db'  # Updated DB filename

def migrate():
    try:
        conn = sqlite3.connect(DB_PATH)
        c = conn.cursor()
        # Drop users_new if it exists
        c.execute('DROP TABLE IF EXISTS users_new')
        # 1. Create new table with updated CHECK constraint
        c.execute('''
            CREATE TABLE users_new (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                username TEXT UNIQUE NOT NULL,
                password_hash TEXT,
                role TEXT NOT NULL CHECK(role IN ('super_admin', 'local_admin', 'teacher', 'student'))
            )
        ''')
        # 2. Copy data from old users table
        c.execute('''
            INSERT INTO users_new (id, username, password_hash, role)
            SELECT id, username, password_hash, role FROM users
        ''')
        # 3. Drop old users table
        c.execute('DROP TABLE users')
        # 4. Rename new table
        c.execute('ALTER TABLE users_new RENAME TO users')
        conn.commit()
        conn.close()
        print('Migration complete: users table now allows student role.')
    except Exception as e:
        print('Migration failed:')
        traceback.print_exc()

if __name__ == '__main__':
    migrate()
