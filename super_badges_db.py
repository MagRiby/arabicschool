import sqlite3
from datetime import datetime

DB_PATH = 'ArabicSchool.db'

def init_super_badges_table():
    conn = sqlite3.connect(DB_PATH, timeout=10, check_same_thread=False)
    c = conn.cursor()
    c.execute('''CREATE TABLE IF NOT EXISTS super_badges (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        icon TEXT NOT NULL,
        created_at TEXT NOT NULL
    )''')
    conn.commit()
    conn.close()

def add_super_badge(name, icon):
    conn = sqlite3.connect(DB_PATH, timeout=10, check_same_thread=False)
    c = conn.cursor()
    c.execute('INSERT INTO super_badges (name, icon, created_at) VALUES (?, ?, ?)',
              (name, icon, datetime.utcnow().isoformat()))
    badge_id = c.lastrowid
    conn.commit()
    conn.close()
    return badge_id

def get_super_badges():
    conn = sqlite3.connect(DB_PATH, timeout=10, check_same_thread=False)
    c = conn.cursor()
    c.execute('SELECT id, name, icon FROM super_badges ORDER BY created_at DESC')
    badges = [{'id': row[0], 'name': row[1], 'icon': row[2]} for row in c.fetchall()]
    conn.close()
    return badges
