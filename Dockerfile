FROM adoptopenjdk/openjdk11:jre-11.0.15_10-ubuntu
LABEL maintainer="hseungho <hsh47607@naver.com>"
COPY --from=build /home/gradle/src/build/libs/*-SNAPSHOT.war /app/FOSSLight.war
WORKDIR /app
CMD ["java" , "-jar", "FOSSLight.war", "--server.port=8080"]
