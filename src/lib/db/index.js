import Database from "better-sqlite3";

// use the mounted path inside container
const db = new Database("src/lib/db/manga.db");

// ensure schema exists
db.prepare(`
  CREATE TABLE IF NOT EXISTS mangas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    author TEXT,
    status TEXT CHECK(status IN ('Ongoing','Completed')),
    rating INTEGER CHECK(rating BETWEEN 1 AND 10),
    review TEXT
  )
`).run();

export default db;
