# Kubernetes Cluster installation using kubeadm
Follow this documentation to set up a Kubernetes cluster on __Linux machines.

This documentation guides you in setting up a cluster with one master node and two worker nodes.

## Prerequisites: 
1. System Requirements 
    >Master & Nodes: t2.medium (2 CPUs and 2GB Memory)   
     

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

2. kube configure setting with default commands
   ```sh
   mkdir -p $HOME/.kube
   sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
   sudo chown $(id -u):$(id -g) $HOME/.kube/config
   ```
   
   if already Initialized use Cluster join command to get token details to join workers
   ```sh
   kubeadm token create --print-join-command
   ```

## `On Worker Nodes:`
1.  Output will be as shown below and run the this on worker nodes
  
    kubeadm join 172.31.25.79:6443 --token 8haora.ebxx9dbbu5eyiqv2 --discovery-token-ca-cert-hash
    sha256:51033461996687f19049f9d3dd89e5e9b3e59acd53af17c1ab67e724a1f59bb7
  
## `On Master Node:`  
1.  Verifying the cluster To Get Nodes status
    ```sh
    kubectl get nodes
    
    kubectl get pods -n kube-system -o wide
    kubectl get pods
    ```
    
2.  Deploy applications on pods

3.  Running `nginx` web server on pods
    ```sh
    kubectl create deployment ramesh-nginx --image=raam043/nginx
    kubectl expose deploy ramesh-nginx --port 80 --target-port 80 --type NodePort
    
    # verify the container running status
    kubectl get pods -o wide
    kubectl describe svc ramesh-nginx
    # you will get info of exposing port and Worker_IP:31622
    ```
    ![](https://github.com/Raam043/Applications-Installation/blob/main/Kubernetes/Pictures/ramesh-nginx.png)

4.  Running `tomcat` web application on pods
    ```sh
    kubectl create deployment ramesh-tomcat --image=raam043/tomcat
    kubectl expose deploy ramesh-tomcat --port 8080 --target-port 8080 --type NodePort
    ```
    
5. Usefull commands to manage service of Kubernetes
   ```sh
   # To verify the services
   kubectl get pods -o wide
   kubectl get services
   kubectl get deployments
   
   # To delete pods, service and deployments
   kubectl delete pods <pods_name>
   kubectl delete services <service_name>
   kubectl delete deployments <deployments_name>
   
   # To manage containers
   kubectl exec <container_name> -- ls
   kubectl exec -it <conatiner_name> -- bash
   ```
   
   
