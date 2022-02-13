FROM openjdk:17-jdk-slim
COPY app.jar /app.jar
WORKDIR /
EXPOSE 8080
ENTRYPOINT ["java","-jar","app.jar","-Dspring.profiles.active=prod"]
