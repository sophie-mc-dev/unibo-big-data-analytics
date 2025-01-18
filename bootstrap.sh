#!/usr/bin/env bash

# Update package lists
apt-get update

# Install Python, pip, and Java (required for Hadoop)
apt-get install -y python3 python3-pip default-jre

# Install essential tools and utilities
apt-get install -y mc wget

# Upgrade pip and setuptools to the latest versions
python3 -m pip install --upgrade pip setuptools

# Install Python libraries required for the project
pip3 install numpy pandas matplotlib seaborn jupyter scikit-learn

# Install the latest version of scikit-learn compatible with Python 3.11.5
pip3 install scikit-learn --upgrade

# Install and configure Hadoop (version 3.4.0)
if ! [ -d /usr/local/hadoop-3.4.0 ]; then
  wget https://dlcdn.apache.org/hadoop/common/hadoop-3.4.0/hadoop-3.4.0.tar.gz
  tar -C /usr/local -xvzf hadoop-3.4.0.tar.gz
  chown -R vagrant:vagrant /usr/local/hadoop-3.4.0
  rm hadoop-3.4.0.tar.gz
fi

# Configure Hadoop environment variables
if ! grep "export HADOOP_INSTALL=/usr/local/hadoop-3.4.0" /home/vagrant/.bashrc; then
  echo "export HADOOP_INSTALL=/usr/local/hadoop-3.4.0" >> /home/vagrant/.bashrc
fi
if ! grep "export HADOOP_HOME=/usr/local/hadoop-3.4.0" /home/vagrant/.bashrc; then
  echo "export HADOOP_HOME=/usr/local/hadoop-3.4.0" >> /home/vagrant/.bashrc
fi
if ! grep "export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/" /home/vagrant/.bashrc; then
  echo "export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/" >> /home/vagrant/.bashrc
fi
if ! grep "export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/" /usr/local/hadoop-3.4.0/etc/hadoop/hadoop-env.sh; then
  echo "export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/" >> /usr/local/hadoop-3.4.0/etc/hadoop/hadoop-env.sh
fi

# Generate SSH keys for localhost communication (if not already done)
if ! (echo exit | ssh localhost); then
  ssh-keygen -t rsa -P '' -f /home/vagrant/.ssh/id_rsa
  cat /home/vagrant/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
  chmod 0600 /home/vagrant/.ssh/authorized_keys
fi

# Set ownership for the vagrant user
chown -R vagrant:vagrant /home/vagrant/.ssh

# Print success message
echo "Provisioning completed successfully."
