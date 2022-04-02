pushd ./service
helm lint
helm template --output-dir output test .
popd