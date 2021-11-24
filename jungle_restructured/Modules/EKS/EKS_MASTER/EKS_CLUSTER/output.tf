output "cluster_name" {
    value = aws_eks_cluster.jungle_eks_cluster.name
}

output "cluster_endpoint" {
    value = aws_eks_cluster.jungle_eks_cluster.endpoint
}

output "certificate_authority" {
    value = aws_eks_cluster.jungle_eks_cluster.certificate_authority[0].data
}