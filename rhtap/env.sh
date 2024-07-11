# from init
export REBUILD=true
export SKIP_CHECKS=true 

# from buildah-rhtap
TAG=$(git rev-parse HEAD)
export IMAGE_URL=quay.io/redhat-appstudio/dance-bootstrap-app:latest:jenkins-$TAG
export IMAGE=$IMAGE_URL
export RESULT_PATH=$DIR/results/temp/files/sbom-url
#export XDG_RUNTIME_DIR=/home/john/dev/auth-creds
 
export DOCKERFILE=
export CONTEXT=
export TLSVERIFY=false
export BUILD_ARGS="--authfile /home/john/dev/auth-creds/auth.json" 
export BUILD_ARGS_FILE=""

# from ACS_*.* 
export DISABLE_ACS=true
export ROX_CENTRAL_ENDPOINT=
export ROX_API_TOKEN= 
export INSECURE_SKIP_TLS_VERIFY=true 
export GITOPS_REPO_URL=https://github.com/northdepot/demo-jenkins-gitops

export PARAM_IMAGE=$IMAGE
export PARAM_IMAGE_DIGEST=latest

# From Summary 
export SOURCE_BUILD_RESULT_FILE= 
