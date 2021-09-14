FROM gitpod/workspace-full
SHELL ["/bin/bash", "-c"]

# Install Docksal
RUN set -ex; \
      sudo apt-get -qq update; \
      sudo curl -fsSL -o /tmp/docksal.zip https://github.com/docksal/docksal/archive/refs/heads/feature/gitpod.zip; \
      cd /tmp/; \
      unzip docksal.zip; \
      sudo cp docksal*/bin/fin /usr/local/bin/fin; \
      mkdir -p $HOME/.docksal/{alias,bin,machine,downloads,machine,stacks}; \
      cp -R docksal*/stacks/* $HOME/.docksal/stacks/; \
      sudo chmod +x /usr/local/bin/fin; \
      echo "DOCKSAL_VHOST_PROXY_PORT_HTTP=8080" >> $HOME/.docksal/docksal.env; \
      echo "DOCKSAL_VHOST_PROXY_PORT_HTTPS=8443" >> $HOME/.docksal/docksal.env; \
      echo "DOCKSAL_DNS_DISABLED=1" >> $HOME/.docksal/docksal.env; \
      mkdir -p $HOME/.ssh; \
      ssh-keygen -t rsa -b 4096 -f $HOME/.ssh/id_rsa -q -N ""; \
	chmod 600 $HOME/.ssh/id_rsa
