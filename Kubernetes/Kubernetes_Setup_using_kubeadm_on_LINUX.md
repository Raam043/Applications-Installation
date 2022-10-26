# Kubernetes Cluster installation using kubeadm
Follow this documentation to set up a Kubernetes cluster on __Linux machines.

This documentation guides you in setting up a cluster with one master node and two worker nodes.

## Prerequisites: 
1. System Requirements 
    >Master: t2.medium (2 CPUs and 2GB Memory)   
    >Worker Nodes: t2.micro 

1. Open Below ports in the Security Group. 
   #### Master node: 
    `6443  
    2379-2380  
    10250
    10251
    10252
    4443 
    443
    80
    22
    8080 `

   #### Worker node:
    `179
    30000-32767
    80
    22
    10250`  

   ### `On Master and Worker:`
   Perform all the commands as root user unless otherwise specified
 
## Docker setup and Configuration setting for all nodes
   Connect to the nodes with ssh 22 (Using MobaXterm for multi executive) 
   
1. Install Docker and Start services
   ```sh
   yum install -y docker
   systemctl enable docker
   systemctl start docker
   ```
   
2. Disable swap & Disable SELinux
   ```sh
   swapoff -a
   setenforce 0
   sed -i 's/enforcing/disabled/g' /etc/selinux/config
   grep disabled /etc/selinux/config | grep -v '#'
   sed -i 's/^SELINUX=enforcing$/SELINUX=permissive/' /etc/selinux/config
   ```
   
## Kubernetes Setup
1. Add yum repository for kubernetes packages 
    ```sh
    cat <<EOF | sudo tee /etc/yum.repos.d/kubernetes.repo
    [kubernetes]
    name=Kubernetes
    baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-\$basearch
    enabled=1
    gpgcheck=1
    gpgkey=https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
    exclude=kubelet kubeadm kubectl
    EOF
    ```
1. Install Kubernetes & Enable and Start kubelet service
    ```sh
    yum install -y kubelet kubeadm kubectl --disableexcludes=kubernetes
    sudo systemctl enable --now kubelet
    ```

## `On Master Node:`
1. Initialize Kubernetes Cluster
    ```sh
    kubeadm init --apiserver-advertise-address=<MasterServerIP> --pod-network-cidr=192.168.0.0/16
    ```
1. Create a user for kubernetes administration  and copy kube config file.   
    ``To be able to use kubectl command to connect and interact with the cluster, the user needs kube config file.``  
    In this case, we are creating a user called `kubeadmin`
    ```sh
    useradd kubeadmin 
    mkdir /home/kubeadmin/.kube
    cp /etc/kubernetes/admin.conf /home/kubeadmin/.kube/config
    chown -R kubeadmin:kubeadmin /home/kubeadmin/.kube
    ```
1. Deploy Calico network as a __kubeadmin__ user. 
	> This should be executed as a user (heare as a __kubeadmin__ )
    
    ```sh
    sudo su - kubeadmin 
    curl https://docs.projectcalico.org/manifests/calico-typha.yaml -o calico.yaml
    kubectl apply -f calico.yaml
    ```

1. Cluster join command
    ```sh
    kubeadm token create --print-join-command
    ```
## `On Worker Node:`
1. Add worker nodes to cluster 
    > Use the output from __kubeadm token create__ command in previous step from the master server and run here.

1. Verifying the cluster
    To Get Nodes status
    ```sh
    kubectl get nodes
    ```
    To Get component status
    ```sh
    kubectl get cs
    ```
