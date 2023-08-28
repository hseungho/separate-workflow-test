FROM gradle:6.8.2-jdk11 AS build
COPY --chown=gradle:gradle . /home/gradle/src

WORKDIR /home/gradle/src
RUN gradle build --no-daemon --exclude-task test

FROM adoptopenjdk/openjdk11:jre-11.0.15_10-ubuntu
LABEL maintainer="hseungho <hsh47607@naver.com>"
COPY --from=build /home/gradle/src/build/libs/*-SNAPSHOT.war /app/FOSSLight.war
WORKDIR /app
CMD ["java" , "-jar", "FOSSLight.war", "--server.port=8080"]
