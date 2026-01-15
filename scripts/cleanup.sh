#!/bin/bash
# cleanup.sh - Destroy Terraform infrastructure safely

echo "⚠️  WARNING: This will destroy all AWS infrastructure provisioned for this project."
read -p "Are you sure you want to proceed? (y/n): " confirm

if [[ $confirm == [yY] ]]; then
    cd terraform
    terraform init
    terraform destroy -auto-approve
    echo "✅ Infrastructure destroyed successfully."
else
    echo "❌ Cleanup cancelled."
fi
