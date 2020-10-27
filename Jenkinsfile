pipeline {
  agent {
    dockerfile true
  }
  stages {
    stage('build') {
      steps {
        sh 'docker run -v /Users/jinhongkim/projects/MK-Runner/project:/app/project -e MKPATH=/app/project test produce'
      }
    }
    stage('test') {
      steps {
        sh 'Docker run -p 8000:8000 -v /Users/jinhongkim/projects/MK-Runner/project:/app/project -e MKPATH=/app/project test serve'
      }
    }
  }
}
