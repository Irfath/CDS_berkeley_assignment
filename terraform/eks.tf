module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.15.3"

  cluster_name    = "berkeley-cluster"
  cluster_version = "1.32"

  vpc_id                         = module.vpc.vpc_id
  subnet_ids                     = module.vpc.private_subnets
  cluster_endpoint_public_access = true

  eks_managed_node_groups = {
    minimal = {
      # We only run ONE node to save money
      desired_size = 1
      min_size     = 1
      max_size     = 1

      instance_types = ["t3.small"] 
      
      capacity_type  = "SPOT" 
    }
  }
}