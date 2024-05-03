#!/usr/bin/bash

# K8S Secret Name
SECRET_NAME="jwt-secret"

# génération de la paie de clé rsa
openssl genpkey -algorithm RSA -out private_key.pem
openssl rsa     -pubout -in private_key.pem -out public_key.pem

# K8S create secret with generate keys
kubectl create secret generic $SECRET_NAME \
    --from-file=private_key.pem \
    --from-file=public_key.pem

# Delete Keys
rm -f private_key.pem public_key.pem

echo "Secret Kubernetes $SECRET_NAME créé avec succès !"