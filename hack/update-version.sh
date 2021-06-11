#! /bin/bash

USED_VER="${VERSION:-stable}"
echo "Updating templates using argo-workflows version $USED_VER..."

sed -i "s/stable/$USED_VER/" manifests/bases/kustomization.yaml
echo "# This is an auto-generated file. DO NOT EDIT" > helm/argo-workflows/templates/resources.yaml
echo "# VERSION=$USED_VER" >> helm/argo-workflows/templates/resources.yaml
kubectl kustomize manifests/namespaced >> helm/argo-workflows/templates/resources.yaml
git checkout -- manifests/bases/kustomization.yaml
