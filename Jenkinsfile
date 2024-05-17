pipeline {
    agent any

    stages {
        stage('test') {
            steps {
                bat "terraform init"
            }
        }
        stage('test') {
            steps {
                bat "terraform plan"
            }
        }
        stage('test') {
            steps {
                bat "terraform apply"
            }
        }
    }
}