#!/usr/local/bin/zsh

#
# Run kubectl commands, GKE requires gcloud for helpers
#
function k() {

if [[ -z "$DOCKER_RAND_ID" ]]; then
  DOCKER_RAND_ID=$RANDOM
fi

#if [[ -z "$K8S_VERSION" ]]; then
#  K8S_VERSION="1.14"
#fi

docker run --name "$DOCKER_RAND_ID" --rm -ti \
  -v $(pwd):$(pwd) \
  -w $(pwd) \
  -e KUBE_EDITOR=vim \
  -v $HOME/.kube/config:/root/.kube/config \
  -v $HOME/.config/gcloud:/root/.config/gcloud \
  frealmyr/cloud-sdk-editors:latest kubectl $kns $argv[*]
}