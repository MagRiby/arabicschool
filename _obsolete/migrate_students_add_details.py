import sqlite3
import traceback

DB_PATH = 'arabicschool.db'  # Use your actual DB filename

def migrate():
    try:
        conn = sqlite3.connect(DB_PATH)
        c = conn.cursor()
        # Add new columns if they do not exist
        for col in ['email', 'phone', 'notes', 'alerts']:
            try:
                c.execute(f"ALTER TABLE students ADD COLUMN {col} TEXT")
                print(f"Added column: {col}")
            except sqlite3.OperationalError as e:
                if 'duplicate column name' in str(e):
                    print(f"Column already exists: {col}")
                else:
                    raise
        conn.commit()
        conn.close()
        print('Migration complete: students table now has email, phone, notes, alerts columns.')
    except Exception as e:
        print('Migration failed:')
        traceback.print_exc()

if __name__ == '__main__':
    migrate()
