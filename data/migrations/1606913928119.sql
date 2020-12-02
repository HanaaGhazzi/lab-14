-- Create database with name lab 14 
```CREATE DATABASE lab14;```

--- Next i use the schema.sql file in the lab folder to populate new database from the terminal 
```prompt: psql -f /data/schema.sql -d lab14```

--- Next i use the seed.sql file in the lab folder to populate new database from the terminal 
```prompt: psql -f /data/seed.sql -d lab14```

--- creating a copy of the database with the following command:
```CREATE DATABASE lab14_normal WITH TEMPLATE lab14;```

-- the Migration step : 

```CREATE TABLE AUTHORS (id SERIAL PRIMARY KEY, name VARCHAR(255));```

---I use a simple subquery to retrieve unique author values from the books table and insert each one into the authors table
```INSERT INTO authors(name) SELECT DISTINCT author FROM books;```

--I add a column to the books table named author_id. This will connect each book to a specific author in the other table.
```ALTER TABLE books ADD COLUMN author_id INT;```

---I will modify the books table by removing the column named author. Now that the books table contains a author_id column which will become a foreign key, your table does not need to contain a string representing each author.
```ALTER TABLE books DROP COLUMN author;```

--- I will modify the data type of the author_id in the books table, setting it as a foreign key which references the primary key in the authors table. Now PostgreSQL knows HOW these 2 tables are connected.
```ALTER TABLE books ADD CONSTRAINT fk_authors FOREIGN KEY (author_id) REFERENCES authors(id);```