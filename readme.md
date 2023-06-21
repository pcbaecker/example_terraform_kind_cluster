# Example Terraform with Kind Cluster and MetalLB

In this repository, I demonstrate how to utilize several robust tools on my MacBook to manage and orchestrate containerized applications. I make extensive use of Terraform, an open-source Infrastructure as Code (IaC) tool, that empowers me to define and provide datacenter infrastructure using a high-level, human-readable configuration language. One of the crucial elements of my setup is Kind (Kubernetes in Docker), a brilliant solution I've adopted for running local Kubernetes clusters employing Docker container nodes. This approach suits my needs perfectly for creating sandboxed environments right on my laptop. When it comes to service exposure within these Kubernetes clusters, I've incorporated MetalLB, a load-balancer designed specifically for bare metal Kubernetes clusters, to allocate and manage external access to my services. Last but not least, Docker, a platform that containerizes applications to automate their deployment and scaling, serves as the foundational technology for my entire setup. Docker's containerization brings unparalleled benefits in terms of isolation, portability, and control, ensuring that my applications work uniformly across different environments.

## Important

Please be aware that the contents of this repository have been exclusively tested on my M1 MacBook. Therefore, some aspects, especially those related to retrieving the IP Address, may vary significantly depending on your specific environment. This is particularly relevant if you are using different containerization technologies, such as Docker or Podman. As such, while I strive to provide content that is broadly applicable, some adjustments might be necessary to suit the particularities of your environment. Always ensure you understand the commands and configurations and their potential impact on your system before applying them.

## How to start

    terraform init
    terraform apply