#!/bin/bash
sudo mkdir /var/lib/rally_container
sudo chown 65500 /var/lib/rally_container
cp ./openrc /var/lib/rally_container
docker run -it -v /var/lib/rally_container:/home/rally rallyforge/rally:0.9.1
export ./openrc
rally-manage db create
rally deployment create --fromenv --name=existing
rally deployment check
rally verify create-verifier --type tempest --name tempest-verifier --version 15.0.0
rally verify configure-verifier --extend ./disable_glance_v1.conf
rally verify start rally verify start --pattern tempest.api.identity.admin.v3.test_credentials.CredentialsTestJSON
