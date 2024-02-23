FROM apon77/aosp:latest

RUN apt-get update && apt-get install neofetch -y 
    neofetch 
    free -h
    df -h
    nproc
    repo init -u https://github.com/ArrowOS/android_manifest.git -b arrow-13.1
    repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
    git clone https://github.com/Amritorock/local_manifest --depth 1 -b arrow .repo/local_manifests
    . build/envsetup.sh
    lunch arrow_r5x-userdebug
    mka bacon
    

RUN pip3 install jupyterlab

EXPOSE 8888

WORKDIR /home/jovy

CMD ["jupyter", "lab", "--NotebookApp.allow_root=true"]
