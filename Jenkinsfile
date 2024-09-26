pipeline {
    agent any 

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from SCM
                checkout scm
            }
        }

        stage('Build with Maven') {
            steps {
                // Run Maven build
                sh 'mvn clean package'
            }
        }
    }

    post {
        always {
            // Clean up workspace after build
            cleanWs()
        }
        success {
            // Notify on success
            echo 'Maven build succeeded!'
        }
        failure {
            // Notify on failure
            echo 'Maven build failed!'
        }
    }
}
