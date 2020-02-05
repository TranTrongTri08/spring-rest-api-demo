# Start with a base image containing Java runtime
FROM openjdk:8u141-jre

# Create directory "app"
RUN mkdir /app

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Define arg for the application's jar file
ARG JAR_FILE=target/rest-api-0.0.1-SNAPSHOT.jar

# Copy the application's jar to the container
COPY target/rest-api-0.0.1-SNAPSHOT.jar app/web-api/rest-api.jar

WORKDIR /app

# Run the jar file
CMD ["java", "-jar", "web-api/rest-api.jar"]
