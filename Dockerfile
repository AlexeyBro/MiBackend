FROM gradle:7-jdk AS build
COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src

FROM openjdk
EXPOSE 80
COPY --from=build /home/gradle/src/build/libs/*.jar /app/MiBackend-1.0-SNAPSHOT-all.jar
ENTRYPOINT ["java","-jar","/app/MiBackend-1.0-SNAPSHOT-all.jar"]

