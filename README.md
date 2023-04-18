# ps-cloud logstash
Logstash container with the required plugins to push to Azure Sentinel

To run this locally

Step 1 - set up the kubernetest cluster [org-118997105@github.com:portswigger-cloud/saas-platform-poc.git]

Pre requisites:
brew install lima
helm repo add falcosecurity https://falcosecurity.github.io/charts

limactl start --name=falco-k8s template://k8s --tty=false
// export kubeconfig.yaml which contains certs etc into local shell
mkdir -p "${HOME}/.lima/falco-k8s/conf"
export KUBECONFIG="${HOME}/.lima/falco-k8s/conf/kubeconfig.yaml"
limactl shell falco-k8s sudo cat /etc/kubernetes/admin.conf >$KUBECONFIG
chmod 0600 ${KUBECONFIG}
// to run falco on mac with this driver modern-bpf and with falcosidekick installed
helm install -f falco.yaml falco falcosecurity/falco --namespace falco --create-namespace 
helm repo add elastic https://helm.elastic.co
helm upgrade -f logstash.yaml logstash elastic/logstash --namespace observability --create-namespace