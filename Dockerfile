FROM openjdk
ARG JAR_FILE=target/*.jar
COPY . /tmp_build
WORKDIR /tmp_build
RUN ./mvnw -T 1C clean install -Dmaven.test.skip -DskipTests -Dmaven.javadoc.skip=true \
    && cp ${JAR_FILE} /app.jar \
    && rm -fr *
EXPOSE 8080

ENTRYPOINT ["java","-jar","/app.jar"]
