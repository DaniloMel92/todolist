FROM ubuntu:latest AS build

RUN apt-get update
RUN apt-get install wget -y
RUN wget https://download.oracle.com/java/21/latest/jdk-21_linux-x64_bin.deb
RUN dpkg -i jdk-21_linux-x64_bin.deb
RUN apt-get install maven -y
COPY . .
FROM openjdk:22-slim-bullseye
EXPOSE 8080

COPY --from=build /target/todolist-0.0.1-SNAPSHOT.jar app.jar

ENTRYPOINT [ "java","-jar","app.jar" ]
