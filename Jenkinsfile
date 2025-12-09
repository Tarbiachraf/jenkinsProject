pipeline {
    agent any
    tools {
        maven '3.9.11'
    }
    options {
        timeout(time: 30, unit: 'MINUTES')
        buildDiscarder(logRotator(numToKeepStr: '10'))
    }

    parameters {
        string(name: 'BRANCH', defaultValue: 'main', description: 'Branche Git à build')
        booleanParam(name: 'DOCKER', defaultValue: false, description: 'Construire une image Docker ?')
    }

    stages {
        stage('checkout'){
            steps {
                echo "Checkout branch: ${params.BRANCH}"
                checkout([$class: 'GitSCM',
                          branches: [[name: "*/${params.BRANCH}"]],
                          userRemoteConfigs: [[url: 'https://github.com/Tarbiachraf/jenkinsProject.git']]])
            }
        }

        stage('Build') {
             steps {
                 echo 'Running mvn clean package'
                 sh 'mvn -B -DskipTests=true clean package' // -B pour batch (non interactif)
             }
        }

        stage('Unit Tests') {
            steps {
                echo "Running tests"
                sh 'mvn -B test'
            }
            post {
                always {
                    junit '**/target/surefire-reports/*.xml'
                }
            }
        }

        stage('Archive Artifact') {
            steps {
                archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
            }
        }

        stage('Build Docker (optional)') {
            when {
                expression { return params.DOCKER == true }
            }
            steps {
                script {
                    def imageTag = "mini-jenkins:${env.BUILD_NUMBER}"
                    sh "docker build -t ${imageTag} ."
                    echo "Image construite: ${imageTag}"
                }
            }
        }
    }
    post {
        success {
            echo "Pipeline réussi : ${env.JOB_NAME} #${env.BUILD_NUMBER}"
        }
        failure {
            echo "Pipeline échoué : ${env.JOB_NAME} #${env.BUILD_NUMBER}"
        }
        always {
            echo "Fin du pipeline (toujours exécuté)"
        }
    }
}