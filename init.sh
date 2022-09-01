#!/bin/bash

PROJECT_ID=$(gcloud config get-value project)
FOLDER_ID=$(gcloud projects describe ${PROJECT_ID} "--format=get(parent.id)")

kubectl apply -f - << EOF
apiVersion: resourcemanager.cnrm.cloud.google.com/v1beta1
kind: Folder
metadata:
  name: root-2
  namespace: config-control
  annotations:
    cnrm.cloud.google.com/deletion-policy: "abandon"
spec:
  displayName: "root-2"
  folderRef:
    external: "${FOLDER_ID}"
EOF
