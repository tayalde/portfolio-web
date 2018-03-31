pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        echo 'Building...'
        sh 'git pull'
        sh 'docker build -t portfolio-web .'
      }
    }
    stage('Test') {
      steps {
        echo 'Testing...'
        sh 'sudo docker run -d -p 5000:5000 portfolio-web'
        sh 'sudo docker ps -a | grep "portfolio-web"'
      }
    }
    stage('Deploy') {
      steps {
        echo 'Deploying...'
        sh '''aws ecr get-login --no-include-email --region us-west-2
				sudo docker tag portfolio-web:latest 369921852629.dkr.ecr.us-west-2.amazonaws.com/portfolio-web:latest'''
        sh 'sudo docker push 369921852629.dkr.ecr.us-west-2.amazonaws.com/portfolio-web:latest'
      }
    }
  }
}