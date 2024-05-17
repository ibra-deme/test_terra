pipeline {
    agent any
    environment {
          // Assurez-vous que ce chemin mène à votre kubeconfig local généré par Minikube
        KUBECONFIG = "C:\\Users\\Administrator\\.kube\\config"
        // Chemin où se trouvent vos fichiers Terraform dans votre projet
        TERRA_DIR = "C:\\Users\\Administrator\\Desktop\\terraform"
    }
    stages {
        stage('Init') {
            steps {
                bat "terraform init"
            }
        }
        stage('Plan') {
            steps {
                bat "cd %TERRA_DIR% && terraform plan -out=tfplan"
            }
        }
        stage('Apply') {
            steps {
                bat "cd %TERRA_DIR% && terraform apply -auto-approve tfplan"
            }
        }
    }
}
