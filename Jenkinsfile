pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t myapp:1.0 .'
            }
        }

        stage('Run container') {
            steps {
                sh 'docker run --rm myapp:1.0'
            }
        }
    }
}
