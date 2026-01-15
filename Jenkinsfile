pipeline {
    agent any

    tools {
        maven 'Maven 3' 
        jdk 'Java 21'   
    }

    environment {
        TOMCAT_IP = '34.224.51.100'
        TOMCAT_USER = 'tomcat'
        WAR_FILE = 'simple-java-docker/target/hello-world.war'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                dir('simple-java-docker') {
                    sh 'mvn clean package'
                }
            }
        }

        stage('Deploy') {
            steps {
                sshagent(['tomcat-ssh-key']) {
                    sh """
                        scp -o StrictHostKeyChecking=no ${WAR_FILE} ubuntu@${TOMCAT_IP}:/home/ubuntu/tmp/
                        ssh -o StrictHostKeyChecking=no ubuntu@${TOMCAT_IP} "sudo mv /home/ubuntu/tmp/hello-world.war /opt/tomcat/webapps/ && sudo systemctl restart tomcat"
                    """
                }
            }
        }

        stage('Health Check') {
            steps {
                sh "curl -f http://${TOMCAT_IP}:8080/hello-world/ || exit 1"
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
