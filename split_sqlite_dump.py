schema_lines = []
data_lines = []

with open('dump.sql', encoding='utf-8') as infile:
    for line in infile:
        stripped = line.strip().lower()
        if stripped.startswith("create table") or stripped.startswith("create index") or stripped.startswith("pragma"):
            schema_lines.append(line)
        elif stripped.startswith("insert into"):
            data_lines.append(line)
        elif stripped.startswith("begin") or stripped.startswith("commit"):
            # Optionally include transaction statements in schema
            schema_lines.append(line)
        else:
            # Keep other lines (comments, etc.) in both
            schema_lines.append(line)

with open('schema.sql', 'w', encoding='utf-8') as schema_out:
    schema_out.writelines(schema_lines)

with open('data.sql', 'w', encoding='utf-8') as data_out:
    data_out.writelines(data_lines)

print("Split complete! Files: schema.sql and data.sql")