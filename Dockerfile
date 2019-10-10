# FROM
# https://hub.docker.com/_/openjdk
# ( Docker Debian )
FROM openjdk:14-jdk-alpine 

# Set the working directory to /app
WORKDIR /app

# INSTALL GIT
RUN apk add git

# Clone 
RUN git clone https://github.com/spring-guides/gs-accessing-data-mysql.git .

# compile app
RUN cd complete && sh ./mvnw package

# Make port 8080 available to the world outside this container
EXPOSE 8080

RUN ls complete/target
# RUN echo '-----'
# RUN ls
# RUN sh ./complete/mvnw package

# Run .jar when the container launches
CMD ["java", "-jar", "./complete/target/accessing-data-mysql-0.0.1-SNAPSHOT.jar"]