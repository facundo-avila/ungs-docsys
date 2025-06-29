ALTER TABLE recruitment.password_reset
ADD COLUMN token VARCHAR(255) NOT NULL UNIQUE;