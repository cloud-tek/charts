package k8s_resources

default allow = false

allow {
  some c
  res := input.spec.template.spec.containers[c].resources
  res.requests.memory                       # requests.memory are defined and not null
  res.limits.memory                         # limits.memory are defined and not null
  res.requests.cpu                          # requests.cpu are defined and not null
  res.limits.memory == res.requests.memory  # limits.memory are equal to requests.memory
}
