pipeline {
    agent any

    stages {
        stage('Hello'){
            steps {
                echo "Hello Jenkins"
            }
        }

        stage('Info'){
            steps {
                echo "User: ${env.BUILD_USER}"
                echo "Branch: ${env.GIT_BRANCH}"
            }
        }
        stage('Finish'){
            steps {
                echo "Pipeline finished!"
            }
        }
    }
}