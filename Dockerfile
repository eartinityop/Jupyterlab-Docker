FROM ubuntu:latest

RUN apt-get update && apt-get install neofetch && neofetch && df -h && nproc && free -h && apt-get install -y \
    python3-pip \
    build-essential \
    python3-dev \
    nodejs

RUN pip3 install jupyterlab

EXPOSE 8888

WORKDIR /home/jovy

CMD ["jupyter", "lab", "--NotebookApp.allow_root=true"]
