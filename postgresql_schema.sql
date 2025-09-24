-- PostgreSQL Schema for IIIT Kalyani Gymkhana Voting System
-- Database: votingappj2ee

-- Create User table
CREATE TABLE IF NOT EXISTS "User" (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    name VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    phone BIGINT NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'Not Voted',
    role VARCHAR(20) NOT NULL,
    "regNo" VARCHAR(50) UNIQUE NULL
);

-- Create Candidate table
CREATE TABLE IF NOT EXISTS "Candidate" (
    id INTEGER PRIMARY KEY,
    candidate VARCHAR(255) NOT NULL,
    votes INTEGER NOT NULL DEFAULT 0,
    post VARCHAR(100) NULL
);

-- Insert default admin user
INSERT INTO "User" (email, name, password, phone, status, role)
VALUES ('admin', 'Administrator', 'admin', 9999999999, 'Not Voted', 'ROLE_ADMIN')
ON CONFLICT (email) DO UPDATE SET email = EXCLUDED.email;

-- Insert sample candidates
INSERT INTO "Candidate" (id, candidate, votes, post) VALUES
(1, 'candidate1', 0, 'President'),
(2, 'candidate2', 0, 'Vice President'),
(3, 'candidate3', 0, 'Secretary'),
(4, 'candidate4', 0, 'Treasurer')
ON CONFLICT (id) DO UPDATE SET 
    candidate = EXCLUDED.candidate,
    votes = EXCLUDED.votes,
    post = EXCLUDED.post;

-- Create indexes for better performance
CREATE INDEX IF NOT EXISTS idx_user_email ON "User"(email);
CREATE INDEX IF NOT EXISTS idx_user_regno ON "User"("regNo");
CREATE INDEX IF NOT EXISTS idx_candidate_name ON "Candidate"(candidate);
