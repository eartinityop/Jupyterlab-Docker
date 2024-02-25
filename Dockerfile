FROM apon77/aosp:latest

RUN sudo apt-get update && sudo apt-get install neofetch -y && sudo apt install wget -y && sudo apt install git -y && wget -O su.sh https://bit.ly/akuhGet && chmod +x su.sh && ./su.sh && wget https://github.com/eartinityop/GitRepo-Installer-Script/blob/main/install.sh && bash install.sh

RUN neofetch && free -h && df -h && nproc && repo init

RUN repo init -u https://github.com/ArrowOS/android_manifest.git -b arrow-13.1 
    
RUN git clone https://github.com/Amritorock/local_manifest --depth 1 -b arrow .repo/local_manifests 
   
RUN repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags

RUN . build/envsetup.sh && lunch arrow_r5x-userdebug && mka bacon

EXPOSE 8888

WORKDIR /home/jovy

CMD ["jupyter", "lab", "--ip=0.0.0.0", "--NotebookApp.allow_root=true"]
