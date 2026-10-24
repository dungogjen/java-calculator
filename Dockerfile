FROM eclipse-temurin:17-jdk
WORKDIR /app
COPY . .
RUN chmod +x mvnw && ./mvnw -DskipTests package
CMD ["sh", "-c", "java -Dserver.port=${PORT:-8080} -jar $(find target -maxdepth 1 -name '*.jar' ! -name '*.original' | head -n 1)"]
