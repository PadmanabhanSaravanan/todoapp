pipeline {
    agent any 

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from SCM
                checkout scm
            }
        }

        stage('Check Maven Installation') {
            steps {
                script {
                    // Check if Maven is installed
                    def mvnCheck = sh(script: 'mvn -v', returnStatus: true)
                    if (mvnCheck != 0) {
                        error("Maven is not installed. Please install Maven on the Jenkins agent.")
                    }
                }
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
