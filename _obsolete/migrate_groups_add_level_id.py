import sqlite3

DB_PATH = 'school.db'  # Change if your DB path is different

conn = sqlite3.connect(DB_PATH)
c = conn.cursor()

# 1. Add level_id column if it doesn't exist
def column_exists():
    c.execute("PRAGMA table_info(curriculum_groups)")
    return any(row[1] == 'level_id' for row in c.fetchall())

if not column_exists():
    c.execute('ALTER TABLE curriculum_groups ADD COLUMN level_id INTEGER')
    print("Added level_id column to curriculum_groups.")
else:
    print("level_id column already exists.")

# 2. Assign a default level_id to all groups with NULL level_id
# We'll use the first level for each local_admin
c.execute('SELECT id, local_admin_id FROM levels ORDER BY local_admin_id, id')
levels = c.fetchall()
admin_to_level = {}
for level_id, admin_id in levels:
    if admin_id not in admin_to_level:
        admin_to_level[admin_id] = level_id

for admin_id, default_level_id in admin_to_level.items():
    c.execute('UPDATE curriculum_groups SET level_id=? WHERE local_admin_id=? AND (level_id IS NULL OR level_id="")', (default_level_id, admin_id))
    print(f"Assigned level_id={default_level_id} for admin_id={admin_id}.")

conn.commit()
conn.close()
print("Migration complete. You can now restart your app.")
