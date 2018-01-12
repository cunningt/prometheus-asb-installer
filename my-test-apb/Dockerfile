FROM centos:7

MAINTAINER OpenShift Team <dev@lists.openshift.redhat.com>

USER root

# Add origin repo for including the oc client
COPY origin-extra-root /

# install ansible and deps
RUN INSTALL_PKGS="python-lxml pyOpenSSL python2-cryptography openssl java-1.8.0-openjdk-headless python2-passlib httpd-tools openssh-clients origin-clients" \
 && yum install -y --setopt=tsflags=nodocs $INSTALL_PKGS \
 && EPEL_PKGS="ansible python2-boto" \
 && yum install -y epel-release \
 && yum install -y --setopt=tsflags=nodocs $EPEL_PKGS \
 && rpm -V $INSTALL_PKGS $EPEL_PKGS

LABEL name="openshift/origin-ansible" \
      summary="OpenShift's installation and configuration tool" \
      description="A containerized openshift-ansible image to let you run playbooks to install, upgrade, maintain and check an OpenShift cluster" \
      url="https://github.com/openshift/openshift-ansible" \
      io.k8s.display-name="openshift-ansible" \
      io.k8s.description="A containerized openshift-ansible image to let you run playbooks to install, upgrade, maintain and check an OpenShift cluster" \
      io.openshift.expose-services="" \
      io.openshift.tags="openshift,install,upgrade,ansible" \
      atomic.run="once" \ 
      "com.redhat.apb.spec"=\
"dmVyc2lvbjogMS4wCm5hbWU6IGZ1c2UtcHJvbWV0aGV1cy1hcGIgCmRlc2NyaXB0aW9uOiBmdXNl\
LXByb21ldGhldXMtYXBiICAKYmluZGFibGU6IEZhbHNlCmFzeW5jOiBvcHRpb25hbAptZXRhZGF0\
YToKICBkb2N1bWVudGF0aW9uVXJsOiBodHRwczovL2dpdGh1Yi5jb20vcHJvbWV0aGV1cy8KICBp\
bWFnZVVybDogaHR0cHM6Ly9naXRodWIuY29tL3Byb21ldGhldXMvZG9jcy9ibG9iL21hc3Rlci9z\
dGF0aWMvcHJvbWV0aGV1c19sb2dvLnBuZz9yYXc9dHJ1ZQogIGRpc3BsYXlOYW1lOiBQcm9tZXRo\
ZXVzIChBUEIpCiAgbG9uZ0Rlc2NyaXB0aW9uOiBBbiBBUEIgdGhhdCBkZXBsb3kgUHJvbWV0aGV1\
cyB0byBPcGVuU2hpZnQKICBwcm92aWRlckRpc3BsYXlOYW1lOiAiUmVkIEhhdCwgSW5jLiIgCnBs\
YW5zOgogIC0gbmFtZTogZGVmYXVsdAogICAgZGVzY3JpcHRpb246IFRoaXMgcGxhbiBkZXBsb3lz\
IGEgc2luZ2xlIFByb21ldGhldXMgYXBwbGljYXRpb24KICAgIGZyZWU6IFRydWUKICAgIG1ldGFk\
YXRhOiB7fQogICAgcGFyYW1ldGVyczogW10K"

ENV USER_UID=1001 \
    HOME=/opt/app-root/src \
    WORK_DIR=/usr/share/ansible/openshift-ansible \
    OPTS="-v"

# Add image scripts and files for running as a system container
COPY root /
# Include playbooks, roles, plugins, etc. from this repo
COPY . ${WORK_DIR}

RUN /usr/local/bin/user_setup \
 && rm /usr/local/bin/usage.ocp

USER ${USER_UID}

WORKDIR ${WORK_DIR}
ENTRYPOINT [ "/usr/local/bin/entrypoint" ]
CMD [ "/usr/local/bin/run" ]
