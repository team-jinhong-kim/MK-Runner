pipeline {
    agent { docker { image'python:3.7' } }
    stages {
      stage('produce') {
      steps {
        sh 'docker build -t test .'
        sh 'docker run -v /Users/jinhongkim/projects/MK-Runner/project:/app/project -e MKPATH=/app/project test produce'
      }
    }
    stage('serve'){
      steps {
        sh 'Docker run -p 8000:8000 -v /Users/jinhongkim/projects/MK-Runner/project:/app/project -e MKPATH=/app/project test serve'
        sh 'curl -s -o /dev/null -I -w "%{http_code}" http://127.0.0.1:8000/'
      }
    }
  }
}
