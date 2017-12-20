#!/bin/bash -e

JENKINS_URL=https://jenkins.intranet.rog2.org

JENKINS_FILE=$1

JENKINS_CRUMB=$(curl -s "$JENKINS_URL/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,\":\",//crumb)")
curl -X POST -H $JENKINS_CRUMB -F "jenkinsfile=<$JENKINS_FILE" $JENKINS_URL/pipeline-model-converter/validate
