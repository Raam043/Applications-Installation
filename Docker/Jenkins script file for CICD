pipeline {
    agent any

    stages {
        stage('Git checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Raam043/Jenkins-project-test.git'
            }
        }
        stage('Docker image Build') {
            steps {
                sh 'docker stop docker_ramesh'
                sh 'docker rm -f docker_ramesh'
                sh 'docker image rm -f docker_ramesh'
                sh 'docker build -t docker_ramesh .'
            }
        }
        stage('Docker Conatiner run') {
            steps {
                sh 'docker run -d --name docker_ramesh -p 80:80 docker_ramesh'
                sh 'docker tag docker_ramesh raam043/httpd_project:latest'
            }
        }
        stage('Image push to DockerHub') {
            steps {
                withCredentials([string(credentialsId: 'DP', variable: 'DP')]) {
                    sh 'docker login -u raam043 -p ${DP}'
                    sh 'docker push raam043/httpd_project:latest'
            }
        }
        }
    }
}
