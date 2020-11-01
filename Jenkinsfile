node {
  stage('Clone Repository'){
    checkout scm
  }

  stage('build'){
    app = docker.build('team-jinhong-kim/mk-runner:test')
    sh 'docker run -v /Users/jinhongkim/projects/MK-Runner/project:/app/project -e MKPATH=/app/project test produce > ./project/.tar.gz'
  }
  stage('test'){
    sh 'cat ./project/.tar.gz | docker run -t -d -p 8000:8000 -v /Users/jinhongkim/projects/MK-Runner/project:/app/project -e MKPATH=/app/project -i test serve'
    sh 'sleep 5'
    sh 'curl localhost:8000'
    sh 'docker stop $(docker ps -aq)'
  }
}
