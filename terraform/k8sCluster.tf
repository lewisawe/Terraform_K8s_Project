# Kubernetes cluster
module "eks" {
  source         = "terraform-aws-modules/eks/aws"
  cluster_name   = "my-cluster"
  cluster_version = "1.21"

  vpc_id           = module.vpc.vpc_id
  subnets          = module.vpc.private_subnets
  cluster_create_timeout = "30m"

  node_groups = {
    eks_nodes = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1

      instance_type = "t3.medium"
      key_name      = "my-keypair"

      subnets = module.vpc.private_subnets

      tags = {
        Terraform   = "true"
        Environment = "dev"
      }

      volume_size = 20
    }
  }
}