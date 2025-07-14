import sqlite3

DB_PATH = 'arabicschool.db'

def migrate_students():
    conn = sqlite3.connect(DB_PATH)
    c = conn.cursor()
    # Get all user ids and usernames with role student
    c.execute('SELECT id, username FROM users WHERE role = "student"')
    students = c.fetchall()  # List of (id, username)
    # Get all ids already in students table
    c.execute('SELECT id FROM students')
    existing_ids = set(row[0] for row in c.fetchall())
    # Insert missing ids with name = username
    inserted = 0
    for sid, username in students:
        if sid not in existing_ids:
            c.execute('INSERT INTO students (id, name) VALUES (?, ?)', (sid, username))
            inserted += 1
    conn.commit()
    conn.close()
    print(f"Inserted {inserted} missing student rows.")

if __name__ == '__main__':
    migrate_students()
