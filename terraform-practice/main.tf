
provider "docker" {}


resource "docker_image" "nginx" {
         name = "nginx:latest"
         keep_locally = false
}

resource "docker_container" "nginx-ctr" {
         name = "my_nginx"
         image = docker_image.nginx.name
         
         ports {
              internal = 80
              external = 80
         }
}


resource "local_file" "first_file" {
       filename = "/Users/pushkarmondal/terraform-practice/demo.txt"
       content = "First file created by Terraform"
}

 
