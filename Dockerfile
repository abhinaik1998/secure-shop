# Use a lightweight base image with OpenJDK 8
FROM eclipse-temurin:8-jdk-alpine

# Set a non-root user for running the application
RUN adduser -D imagebuilder
USER imagebuilder

# Expose the port on which the application will run
EXPOSE 8070

# Copy the JAR file to the /usr/app directory
COPY target/shopping-cart*.jar /app/app.jar

# Set the working directory to /usr/app
WORKDIR /app

# Run the application using a non-root user
CMD ["java", "-jar", "app.jar"]
