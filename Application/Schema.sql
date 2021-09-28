-- Your database schema. Use the Schema Designer at http://localhost:8001/ to add some tables.
CREATE TABLE links (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    url TEXT NOT NULL,
    last_visit TIMESTAMP WITH TIME ZONE DEFAULT NULL,
    visits INT DEFAULT 0 NOT NULL
);
