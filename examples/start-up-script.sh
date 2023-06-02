#!/bin/bash

if ! which nvidia-smi > /dev/null; then
  mkdir -p /opt/google
  cd /opt/google || exit

  if ! which python3 > /dev/null; then
    if which yum > /dev/null; then
      yum install -y python3
    else
      apt-get install -y python3
    fi
  fi

  curl https://raw.githubusercontent.com/GoogleCloudPlatform/compute-gpu-installation/main/linux/install_gpu_driver.py --output install_gpu_driver.py
  python3 install_gpu_driver.py

  apt-get update
  apt-get upgrade 
  apt-get install -y libffi-dev
  apt-get install -y rustc
  apt-get install -y python3-pip
  pip3 install jupyterlab
  jupyter server extension enable --py jupyterlab --sys-prefix
  jupyter lab --ip 0.0.0.0 --port 8888 --no-browser
fi
