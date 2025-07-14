import sqlite3

DB_PATH = 'ArabicSchool.db'

conn = sqlite3.connect(DB_PATH)
c = conn.cursor()

# Check if 'level_id' column exists
c.execute("PRAGMA table_info(classes)")
columns = [row[1] for row in c.fetchall()]

if 'level_id' not in columns:
    print("Adding level_id column to classes table...")
    c.execute("ALTER TABLE classes ADD COLUMN level_id INTEGER")
    print("Done.")
else:
    print("level_id column already exists.")

conn.commit()
conn.close()
