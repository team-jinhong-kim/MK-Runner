pipeline {
  agent any
  stages {
    stage('build') {
      steps {
        sh 'build.sh'
      }
    }
    stage('test') {
      steps {
        sh 'serve.sh'
        sh 'curl localhost:8000'
      }
    }
  }
}
