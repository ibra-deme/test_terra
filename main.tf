provider "kubernetes" {
  config_path = "C:\\Users\\Administrator\\.kube\\config"
}



resource "kubernetes_deployment" "php-deployment" {

    metadata {
      name="application-base"
    }
    spec {
      replicas = 2
      selector {
        match_labels = {
            app = "app"
        }
      }
      template {
        metadata {
            labels = {
                app = "app"
            }
        }
        spec {
            container {
                image = "ibrademe/my_php_image"
                name = "php-apache-test"
                port {
                    container_port = 80
                }
                env {
                  name = "DATABASE_HOST"
                  value = "db"
                }
                env {
                  name = "DATABASE_USER"
                  value = "root"
                }
                env {
                  name = "DATABASE_PASSWORD"
                  value = "root"
                }
                env {
                  name = "DATABASE_NAME"
                  value = "fil_rouge"
                }
              
            }
        }
      }
    }
}

resource "kubernetes_service" "services-php" {

    metadata {
      name = "service-php"
      namespace = "default"
    }
    spec {
      selector = {
        app = "app"
      }
      port {
        name = "http"
        protocol = "TCP"
        port = 80
        node_port = 30104
        target_port = 80
      }
      type = "NodePort"
    }
  
}