FROM gitpod/workspace-full
SHELL ["/bin/bash", "-c"]

RUN sudo apt-get -qq update

# Install Docksal
RUN set -ex; \
      sudo curl -fsSL https://raw.githubusercontent.com/docksal/docksal/feature/gitpod/bin/fin -o /usr/local/bin/fin; \
      sudo chmod +x /usr/local/bin/fin; \
      fin config set --global DOCKSAL_VHOST_PROXY_PORT_HTTP=8080 DOCKSAL_VHOST_PROXY_PORT_HTTPS=8443 DOCKSAL_DNS_DISABLED=1; \
