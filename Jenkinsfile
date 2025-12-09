pipeline {
    agent any

    tools {
        maven '3.9.11'
    }

    stages {
        stage('Checkout'){
            steps { checkout scm }
        }

        stage('Build'){
            steps { sh 'mvn clean package -DskipTests' }
        }

        stage('comm'){
            steps {
                sh 'ls -l'
                sh 'echo hello'
                sh 'pwd'
                sh 'git status'
            }
        }
    }
}