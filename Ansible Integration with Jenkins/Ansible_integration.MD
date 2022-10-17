# Ansible integration with Jenkins



### Prerequisites:
1. Ansible server **[Installation steps](https://github.com/Raam043/Applications-Installation/blob/main/Ansible/Install-Config_steps)**
2. Jenkins Server **[Installation steps](https://github.com/Raam043/Applications-Installation/blob/main/Jenkins/Installation%20commands)**

### Integration Setps

Install "publish Over SSH"
 - `Manage Jenkins` > `Manage Plugins` > `Available` > `Publish over SSH` 

Enable connection between Ansible and Jenkins
- `Manage Jenkins` > `Configure System` > `Publish Over SSH` > `SSH Servers` 

	- SSH Servers:
		- Hostname:`<ServerIP>`
		- username: `root`
		- password: `*******`

Test the connection "Test Connection"
