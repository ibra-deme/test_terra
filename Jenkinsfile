pipeline {
    agent any
    environment {
        KUBECONFIG = credentials('Kube_token')
    }
    stages {
        stage('Init') {
            steps {
                bat "terraform init"
            }
        }
        stage('Plan') {
            steps {
                bat "terraform plan"
            }
        }
        stage('Apply') {
            steps {
                bat "terraform apply"
            }
        }
    }
}
