FROM adoptopenjdk/openjdk11:jre-11.0.15_10-ubuntu
LABEL maintainer="hseungho <hsh47607@naver.com>"
VOLUME /tmp
ARG JAR=build/libs/*.jar
COPY ${JAR} app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "-Dspring.profiles.active=prod", "/app.jar"]
