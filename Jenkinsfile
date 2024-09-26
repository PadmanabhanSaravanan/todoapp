pipeline {
    agent any 

    environment {
        MAVEN_HOME = '/usr/local/maven' // Adjust based on your setup
        PATH = "${env.MAVEN_HOME}/bin:${env.PATH}"
    }

    stages {
        stage('Clone Repository') {
            steps {
                // Clone the Git repository
                git url: 'https://github.com/PadmanabhanSaravanan/todoapp.git', branch: 'main'
            }
        }

        stage('Build with Maven') {
            steps {
                // Run Maven build
                sh 'mvn clean package'
            }
        }

        stage('Run Tests') {
            steps {
                // Run Maven tests
                sh 'mvn test'
            }
        }

        stage('Archive Artifacts') {
            steps {
                // Archive the JAR file and other artifacts
                archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
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
            echo 'Build and tests succeeded!'
        }
        failure {
            // Notify on failure
            echo 'Build or tests failed!'
        }
    }
}
