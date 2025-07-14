import sqlite3
from werkzeug.security import generate_password_hash

DB_PATH = 'admin_users.db'

# CHANGE THESE VALUES AS NEEDED
username = 'admin'
password = 'admin123'

conn = sqlite3.connect(DB_PATH)
c = conn.cursor()
password_hash = generate_password_hash(password)
try:
    c.execute("INSERT INTO users (username, password_hash, role) VALUES (?, ?, 'super_admin')", (username, password_hash))
    conn.commit()
    print(f"Super admin created: username='{username}', password='{password}'")
except sqlite3.IntegrityError:
    print(f"Username '{username}' already exists.")
finally:
    conn.close()
