export ./openrc
rally-manage db create
rally deployment create --fromenv --name=existing
rally deployment check
sudo pip install os-testr
rally verify create-verifier --type tempest --name tempest-verifier --version 15.0.0 --system-wide
rally verify configure-verifier --extend ./disable_glance_v1.conf
rally verify start --pattern tempest.api.identity.admin.v3.test_credentials.CredentialsTestJSON
