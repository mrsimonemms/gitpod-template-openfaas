FROM gitpod/workspace-full
RUN sudo mkdir -p /opt/cni/bin \
  && sudo systemctl daemon-reload \
  && sudo systemctl start containerd \
  && curl -sSL https://github.com/containernetworking/plugins/releases/download/v0.8.5/cni-plugins-linux-amd64-v0.8.5.tgz | sudo tar -xz -C /opt/cni/bin \
  && mkdir -p $GOPATH/src/github.com/openfaas \
  && cd $GOPATH/src/github.com/openfaas/ && git clone --depth 1 --branch 0.13.0 https://github.com/openfaas/faasd \
  && sudo curl -fSLs "https://github.com/openfaas/faasd/releases/download/0.13.0/faasd" --output "/usr/local/bin/faasd" \
  && sudo chmod a+x "/usr/local/bin/faasd" \
  && cd $GOPATH/src/github.com/openfaas/faasd \
  && /usr/local/bin/faasd install
