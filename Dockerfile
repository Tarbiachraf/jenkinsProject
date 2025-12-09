# Étape 1 : image Maven pour compiler
FROM maven:3.9.6-eclipse-temurin-17 AS builder
WORKDIR /app

# Copier le pom.xml et télécharger les dépendances
COPY pom.xml .
RUN mvn dependency:go-offline

# Copier le reste du projet
COPY . .

# Construire le jar
RUN mvn clean package -DskipTests

# Étape 2 : image finale minimaliste
FROM eclipse-temurin:17-jre
WORKDIR /app

# Copier le jar depuis builder
COPY --from=builder /app/target/*.jar app.jar

EXPOSE 8080

# Lancer l'application
ENTRYPOINT ["java", "-jar", "app.jar"]
