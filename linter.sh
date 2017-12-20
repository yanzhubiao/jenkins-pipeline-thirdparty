#!/bin/bash -e

JENKINS_URL=https://jenkins.intranet.rog2.org

jenkinsfile=$1
crumb_header=$(curl -s "$JENKINS_URL/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,\":\",//crumb)")

curl -s -X POST \
    -H "$crumb_header" \
    -F "jenkinsfile=<$jenkinsfile" \
    "$JENKINS_URL/pipeline-model-converter/validate"
