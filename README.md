# prometheus-asb-installer

Install the minishift addon for ansible-service-broker: 
- Clone https://github.com/minishift/minishift-addons
- cd add-ons
- minishift install ansible-service-broker
- minishift enable ansible-service-broker
- minishift enable admin-user
- make sure that the registry-route addon is disabled


`
MINISHIFT_ENABLE_EXPERIMENTAL=y minishift start --openshift-version=v3.7.0 --iso-url centos --memory 4GB --service-catalog --extra-clusterup-flags "--loglevel 1"

eval $(minishift docker-env)

docker login -u developer -p $(oc whoami -t) $(minishift openshift registry)

`
