#!/bin/bash
sudo mkdir /var/lib/rally_container
sudo chown 65500 /var/lib/rally_container
cp -t /var/lib/rally_container openrc disable_glance_v1.conf  run_tests.sh
sudo chmod a+x /var/lib/rally_container/run_test.sh
docker run -it -v /var/lib/rally_container:/home/rally rallyforge/rally:0.9.1 ./run_test.sh
