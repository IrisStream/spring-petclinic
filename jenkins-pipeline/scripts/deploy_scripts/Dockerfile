FROM deploy_env

ARG JAR_NAME

ENV ENV_JAR_NAME=$JAR_NAME

#Pull jar file
RUN mkdir /data

WORKDIR /data


# RUN curl -X GET -u deployment:123 http://nexus:8081/repository/maven-snapshots/org/springframework/samples/spring-petclinic/2.6.0-SNAPSHOT/maven-metadata.xml -O

# COPY get_name_of_snapshot.py /data/get_name_of_snapshot.py

RUN curl -X GET -u deployment:123 http://nexus:8081/repository/maven-snapshots/org/springframework/samples/spring-petclinic/2.6.0-SNAPSHOT/${ENV_JAR_NAME}.jar -O

# run

CMD java -jar *.jar
