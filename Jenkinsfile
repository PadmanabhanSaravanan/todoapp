pipeline {
    agent {
        docker {
            image 'maven:3.8.6-jdk-11'  // Use an appropriate Maven image
            args '-v /var/jenkins_home:/var/jenkins_home' // To persist Jenkins home, if needed
        }
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build with Maven') {
            steps {
                sh 'mvn clean package'
            }
        }
    }

    post {
        always {
            cleanWs()
        }
        success {
            echo 'Maven build succeeded!'
        }
        failure {
            echo 'Maven build failed!'
        }
    }
}
