FROM httpd 

MAINTAINER siva samana 

LABEL This is my first dockerifle integrate with jenkins

EXPOSE 80

COPY . /usr/local/apache2/htdocs


pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                git 'https://github.com/samanasiva28/dockerdummy.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t myapp:latest .'
            }
        }

        stage('Push Docker Image') {
            steps {
                withDockerRegistry(credentialsId: 'docker-hub', url: 'https://index.docker.io/v1/') {   [here we can give the credentials through the pipeline script
                                                                                                         it provides the url also and we can copy and paste the url ]
                    sh '''
                    docker tag myapp:latest sivasai2003/myapp:latest
                    docker push sivasai2003/myapp:latest
                    '''
                }
            }
        }
    }
}
