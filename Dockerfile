FROM maven:3.8.5-openjdk-17 AS build
COPY . .
RUN mvn install -DskipTests

FROM openjdk:17.0.1-jdk-slim
COPY --from=build /target/hng-stage-one-0.0.1-SNAPSHOT.jar hng-stage-one.jar

EXPOSE  8080
ENTRYPOINT ["java", "-jar","hng-stage-one.jar"]






