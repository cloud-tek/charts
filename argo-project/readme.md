# argocd-project

HELM chart used to rapidly provision ArgoCD applications.
Requires a specific repository structure.
Will create the namespace if the namespace does not exist.


** Environment & location settings**
```yaml
global:
  region: westeurope
  environment: uat
```

**Repository structure**
```
<repository-root>
+ <app1-path-in-repo>
| L <global.region>
|   + <global.environment1>
|   | + Chart.yaml
|   | L values.yaml
|   L <global.environment2>
|     + Chart.yaml
|     L values.yaml
L <app2-path-in-repo>
  L <global.region>
    L <global.environment1>
      L manifests.yaml
```


