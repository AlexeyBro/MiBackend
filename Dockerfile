FROM gradle:8.5.0-jdk17-jammy as build
COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
RUN ./gradlew shadowjar

FROM openjdk:22-slim
EXPOSE 80
COPY --from=build /home/gradle/src/build/libs/*.jar /app/app.jar
ENTRYPOINT ["java","-jar","/app/app.jar"]
