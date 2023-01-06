#pushd ./service
# helm lint
helm template --debug --values ./values.ci.yaml --output-dir output test .
#popd
