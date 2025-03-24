FROM maven:3.8.7-openjdk-17-slim as build
WORKDIR /app1
COPY . .
RUN ./mvnw package -DskipTest

FROM openjre:11-slim 
COPy --from=build app/target/*.jar app.jar
EXPOSE 8080
CMD ["java","-jar","app.jar"]
