# prometheus-asb-installer


## Running on Minishift

### Install the minishift addon for ansible-service-broker: 
- Clone https://github.com/minishift/minishift-addons
- cd add-ons
- minishift install ansible-service-broker
- minishift enable ansible-service-broker
- minishift enable admin-user
- make sure that the registry-route addon is disabled


### Start Minishift and install the APB
``
MINISHIFT_ENABLE_EXPERIMENTAL=y minishift start --openshift-version=v3.7.0 --iso-url centos --memory 4GB --service-catalog --extra-clusterup-flags "--loglevel 1"
``

``
eval $(minishift docker-env)
``

``
docker login -u developer -p $(oc whoami -t) $(minishift openshift registry)
``

``
cd prometheus-apb
``

If using minishift, you need to use this script :

https://github.com/eriknelson/ansible-playbook-bundle/blob/3e872a10ba26d9e8377eed0a7eb1bee7de51b340/scripts/apb-docker-run.sh

``
apb-docker-run.sh prepare
``

``
apb-docker-run.sh build
``

``
apb-docker-run.sh push
``

If you log in to minishift console, you should now see a Prometheus (APB) as an option to install.


## Running on CDK

Make sure to start CDK with --service-catalog
Follow the directions here to install the Ansible Service Broker:
https://github.com/openshift/ansible-service-broker#deploy-an-openshift-origin-cluster-with-the-ansible-service-broker

### Create an alias for the APB tool
``
alias apb='docker run --rm --privileged -v $PWD:/mnt -v $HOME/.kube:/.kube -v /var/run/docker.sock:/var/run/docker.sock -u $UID docker.io/ansibleplaybookbundle/apb-tools'
``

### Install the APB

``
cd prometheus-apb
``

``
apb prepare
``

``
apb build
``

``
apb push
``

