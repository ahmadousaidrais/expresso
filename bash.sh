#! /bin/bash 
for release in $(helm list --all --all-namespaces -q); do
    helm uninstall "$release" --namespace $(helm list --all --all-namespaces | grep "$release" | awk '{print $2}')
done

kubectl delete jobs --all --all-namespaces
kubectl delete cronjob --all --all-namespaces
kubectl delete deploy  --all --all-namespaces
kubectl delete sts --all --all-namespaces
kubectl delete pvc  --all --all-namespaces
kubectl delete pv  --all --all-namespaces