# prometheus-asb-installer

`MINISHIFT_ENABLE_EXPERIMENTAL=y minishift start --openshift-version=v3.7.0-rc.0 --memory 4GB --service-catalog --extra-clusterup-flags "--loglevel 1 --service-catalog"`

Follow the directions in the ansible service broker README.md : https://github.com/openshift/ansible-service-broker/blob/master/README.md

`wget https://raw.githubusercontent.com/openshift/ansible-service-broker/master/scripts/run_latest_build.sh`
`chmod +x run_latest_build.sh`<br>
`ORIGIN_VERSION=v3.7.0-rc.0 ./run_latest_build.sh`
