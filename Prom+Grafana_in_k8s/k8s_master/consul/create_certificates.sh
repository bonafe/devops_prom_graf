export GOSSIP_ENCRYPTION_KEY=$(consul keygen)

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

go get -u github.com/cloudflare/cfssl/cmd/cfssl
go get -u github.com/cloudflare/cfssl/cmd/cfssljson

# Create certificate authority
cfssl gencert -initca certs/config/ca-csr.json | cfssljson -bare certs/ca

# Create private key and TLS certificate
cfssl gencert \
    -ca=certs/ca.pem \
    -ca-key=certs/ca-key.pem \
    -config=certs/config/ca-config.json \
    -profile=default \
    certs/config/consul-csr.json | cfssljson -bare certs/consul

# Create secret based on the certificates generated
kubectl create secret generic consul \
  --from-literal="gossip-encryption-key=${GOSSIP_ENCRYPTION_KEY}" \
  --from-file=certs/ca.pem \
  --from-file=certs/consul.pem \
  --from-file=certs/consul-key.pem
