# # Build stage
# FROM maven:3.9-eclipse-temurin-11 AS build
# WORKDIR /app
# COPY . /app
# RUN mvn -DskipTests package

# # Run stage (Tomcat)
# FROM tomcat:9-jdk11
# RUN rm -rf /usr/local/tomcat/webapps/*
# # Deploy our WAR as ROOT.war
# COPY --from=build /app/target/B7iii_VotingApp_MavenProject_Final.war /usr/local/tomcat/webapps/ROOT.war
# EXPOSE 8080
# ENV DB_URL="jdbc:mysql://localhost:3306/votingappj2ee"
# ENV DB_USER="root"
# ENV DB_PASS="212004@ChiragShukla"
# CMD ["catalina.sh","run"]

# Build stage
FROM maven:3.9-eclipse-temurin-11 AS build
WORKDIR /app
COPY . /app
RUN mvn -DskipTests package

# Run stage (Tomcat)
FROM tomcat:9-jdk11
RUN rm -rf /usr/local/tomcat/webapps/*

# Deploy our WAR as ROOT.war
COPY --from=build /app/target/B7iii_VotingApp_MavenProject_Final.war /usr/local/tomcat/webapps/ROOT.war

# Railway provides PORT env variable
ENV PORT=8080

# Change Tomcat to listen on Railway's PORT
RUN sed -i 's/8080/${PORT}/g' /usr/local/tomcat/conf/server.xml

# Env for DB
ENV DB_URL="jdbc:mysql://mysql.railway.internal:3306/railway?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC"
ENV DB_USER="root"
ENV DB_PASS="SnFIeyTGihLVlamnNXBPvnjwTiphFTPB"

CMD ["catalina.sh","run"]
