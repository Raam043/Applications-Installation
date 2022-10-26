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
2. Install Kubernetes & Enable and Start kubelet service
    ```sh
    yum install -y kubelet kubeadm kubectl --disableexcludes=kubernetes
    sudo systemctl enable --now kubelet
    ```
3. Check the versions
   ```sh
   kubectl version
   kubelet --version
   kubeadm version
   ```
 
## `On Master Node:`
1. Initialize Kubernetes Cluster
    ```sh
    kubeadm init
    ```
2. kube configure setting
   ```sh
   mkdir -p $HOME/.kube
   sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
   sudo chown $(id -u):$(id -g) $HOME/.kube/config
   ```
   above commands are default after init and joining token will be generated at this moment
   
