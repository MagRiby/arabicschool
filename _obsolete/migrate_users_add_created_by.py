import sqlite3

DB_PATH = 'arabicschool.db'

with sqlite3.connect(DB_PATH) as conn:
    c = conn.cursor()
    # Add the created_by column if it doesn't exist
    c.execute("PRAGMA table_info(users)")
    columns = [col[1] for col in c.fetchall()]
    if 'created_by' not in columns:
        c.execute('ALTER TABLE users ADD COLUMN created_by INTEGER')
        print("created_by column added to users table.")
    else:
        print("created_by column already exists.")
    conn.commit()
