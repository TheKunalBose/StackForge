# AWS Account Migration Complete

The infrastructure configuration has been updated to use the main AWS account (782815632884). The following changes were made:

1. Updated `main.tf` to use the default AWS provider configuration, which is already set up for account 782815632884
2. Updated `terraform.tfvars` to use the correct ARNs with account ID 782815632884

## Remaining Issues

When attempting to apply the changes, we encountered a permission issue:

```
Error: creating EKS Node Group (dev-eks:dev-eks-spot): operation error EKS: CreateNodegroup, https response error StatusCode: 403, RequestID: 6382199c-2746-4a4c-9cf2-b5b4526ddfaf, api error AccessDeniedException: User: arn:aws:iam::782815632884:user/user-infra is not authorized to perform: eks:CreateNodegroup
```

## Required IAM Permissions

To resolve this, you need to attach the following IAM policy to the user-infra IAM user:

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "eks:CreateNodegroup",
                "eks:DeleteNodegroup",
                "eks:DescribeNodegroup",
                "eks:ListNodegroups",
                "eks:UpdateNodegroupConfig",
                "eks:UpdateNodegroupVersion",
                "eks:ListUpdates",
                "eks:DescribeUpdate",
                "eks:TagResource",
                "eks:UntagResource",
                "eks:ListTagsForResource"
            ],
            "Resource": [
                "arn:aws:eks:us-east-1:782815632884:cluster/dev-eks",
                "arn:aws:eks:us-east-1:782815632884:nodegroup/dev-eks/*"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "iam:PassRole"
            ],
            "Resource": "arn:aws:iam::782815632884:role/EKSNodeRole",
            "Condition": {
                "StringEquals": {
                    "iam:PassedToService": "eks.amazonaws.com"
                }
            }
        }
    ]
}
```

After adding this policy to your IAM user, you can run `terraform apply` again to complete the node group creation.

