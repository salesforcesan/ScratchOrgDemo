#!/bin/bash

DURATION=7

if [ "$#" -eq 1 ]; then
  DURATION=$1
fi

sfdx force:org:create --setdefaultusername -a santechorg -s -f config/project-scratch-def.json -d $DURATION
sfdx force:source:push -u dev-scratch-org
sfdx force:user:permset:assign -n santechorg
sfdx force:org:open -p /lightning/page/home
echo "Org is set up"
sfdx force:data:tree:import --plan data/export-demo-Broker__c-plan.json -u dev-scratch-org