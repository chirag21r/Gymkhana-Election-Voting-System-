# Gymkhana-Election-Voting-System-


Built for IIIT Kalyani Gymkhana elections. Frontend: HTML/CSS (simple, clean). Backend: JSP/Servlets, MySQL, Tomcat, Maven.

Author: Chirag Shukla (2024)

## Prerequisites
- JDK 8+
- Maven
- MySQL 8+
- Apache Tomcat 8.5/9

## Setup (MySQL)
```sql
CREATE DATABASE IF NOT EXISTS votingappj2ee;
USE votingappj2ee;

CREATE TABLE IF NOT EXISTS Candidate (
  id INT PRIMARY KEY AUTO_INCREMENT,
  candidate VARCHAR(100) NOT NULL,
  votes INT NOT NULL DEFAULT 0,
  post VARCHAR(100) NULL
);

CREATE TABLE IF NOT EXISTS User (
  id INT PRIMARY KEY AUTO_INCREMENT,
  email VARCHAR(255) NOT NULL UNIQUE,
  name VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  phone BIGINT NOT NULL,
  status VARCHAR(20) NOT NULL,
  role VARCHAR(20) NOT NULL,
  regNo VARCHAR(50) UNIQUE NULL
);

INSERT INTO User (email,name,password,phone,status,role)
VALUES ('admin','Administrator','admin',9999999999,'Not Voted','ROLE_ADMIN')
ON DUPLICATE KEY UPDATE email=email;
```

## Build
```bash
cd B7iii_VotingApp_MavenProject_Final
mvn -DskipTests package
```
WAR will be at `target/B7iii_VotingApp_MavenProject_Final.war`.

## Run (Tomcat)
```bash
sudo cp target/B7iii_VotingApp_MavenProject_Final.war /var/lib/tomcat9/webapps/
sudo systemctl restart tomcat9
```
Open: `http://localhost:8080/B7iii_VotingApp_MavenProject_Final/`

## Login
- Admin: email `admin`, password `admin`
- Users can login with email OR registration number + password

## Notes
- DB credentials are configured in `src/main/java/com/conn/DBConnect.java`.
- Candidate names and posts can be edited in admin panel.


