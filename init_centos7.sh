
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo

curl -o /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo

yum makecache


yum install -y bash-completion vim wget screen net-tools tree lrzsz nmap nc htop docker 


echo -e '
{\n
  "registry-mirrors": ["https://registry.docker-cn.com"]\n
}\n
'>>/etc/docker/daemon.json

systemctl enable docker
systemctl restart docker



setenforce 0
cp /etc/selinux/config /etc/selinux/config.backup
sed -i 's#SELINUX=enforcing#SELINUX=disabled#' /etc/selinux/config

cp /etc/ssh/sshd_config /etc/ssh/sshd_config.backup
echo -e "ClientAliveInterval 60\nClientAliveCountMax 3\n" >>/etc/ssh/sshd_config
systemctl restart sshd.service


