import sqlite3

DB_PATH = 'ArabicSchool.db'

def migrate():
    conn = sqlite3.connect(DB_PATH)
    c = conn.cursor()
    # Add user_id column if it doesn't exist
    c.execute("""
        PRAGMA foreign_keys=off;
    """)
    c.execute("""
        ALTER TABLE students ADD COLUMN user_id INTEGER REFERENCES users(id) UNIQUE;
    """)
    c.execute("""
        PRAGMA foreign_keys=on;
    """)
    conn.commit()
    conn.close()
    print('Migration complete: user_id column added to students table.')

if __name__ == '__main__':
    migrate()
