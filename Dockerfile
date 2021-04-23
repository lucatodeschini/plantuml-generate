FROM adoptopenjdk/openjdk11

RUN apt-get update -y  && apt-get install -y git graphviz

COPY plantuml.jar /opt/plantuml.jar
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
