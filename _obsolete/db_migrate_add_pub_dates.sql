-- Migration: Add publication date fields for dawra 1, 2, 3, and year end to classes table
ALTER TABLE classes ADD COLUMN dawra1_pub_start TEXT;
ALTER TABLE classes ADD COLUMN dawra1_pub_end TEXT;
ALTER TABLE classes ADD COLUMN dawra2_pub_start TEXT;
ALTER TABLE classes ADD COLUMN dawra2_pub_end TEXT;
ALTER TABLE classes ADD COLUMN dawra3_pub_start TEXT;
ALTER TABLE classes ADD COLUMN dawra3_pub_end TEXT;
ALTER TABLE classes ADD COLUMN year_pub_start TEXT;
ALTER TABLE classes ADD COLUMN year_pub_end TEXT;
