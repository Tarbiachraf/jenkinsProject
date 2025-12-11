pipeline {
  agent any
  stages {
    stage('Checkout Code') {
      steps {
        git(url: 'https://github.com/Tarbiachraf/jenkinsProject.git', branch: 'main')
      }
    }

    stage('Build ') {
      steps {
        sh 'docker build -t mon-app . '
      }
    }

  }
}