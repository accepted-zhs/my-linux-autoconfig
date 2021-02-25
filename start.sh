#!/bin/bash
install_basic_env(){
    cd ~
    echo Installing basic environment...
    sudo apt install -y build-essential
    sudo apt install -y git wget curl sed
}

install_vimplus(){
    echo Installing vimplus...
    git clone https://gitee.com/chxuan/vimplus.git
    cd vimplus
    ./install.sh
    cd ..
    cat ~/my-linux-autoconfig/templates/myconfig.vim >> ~/.vimrc.custom.config
    cat ~/my-linux-autoconfig/templates/cpp.cpp > ~/.vim/plugged/prepare-code/snippet/snippet.cpp
}

install_common_software(){
    echo Installing common software...
    mkdir tmp_dir
    cd tmp_dir
    echo SogouIme...
    wget https://ime.sogoucdn.com/dl/index/1612260778/sogoupinyin_2.4.0.3469_amd64.deb
    echo WPS...
    wget https://wdl1.cache.wps.cn/wps/download/ep/Linux2019/10161/wps-office_11.1.0.10161_amd64.deb
    echo Chrome...
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo apt install -y ./*.deb
}

install_deepin_wine(){
    echo Installing deepin-wine environment...
    mkdir ./deepintemp
    cd ./deepintemp
    wget http://packages.deepin.com/deepin/pool/non-free/d/deepin-wine/deepin-wine_2.18-22~rc0_all.deb
    wget http://packages.deepin.com/deepin/pool/non-free/d/deepin-wine/deepin-wine32_2.18-22~rc0_i386.deb
    wget http://packages.deepin.com/deepin/pool/non-free/d/deepin-wine/deepin-wine32-preloader_2.18-22~rc0_i386.deb
    wget http://packages.deepin.com/deepin/pool/non-free/d/deepin-wine-helper/deepin-wine-helper_1.2deepin8_i386.deb
    wget http://packages.deepin.com/deepin/pool/non-free/d/deepin-wine-plugin/deepin-wine-plugin_1.0deepin2_amd64.deb
    wget http://packages.deepin.com/deepin/pool/non-free/d/deepin-wine-plugin-virtual/deepin-wine-plugin-virtual_1.0deepin3_all.deb
    wget http://packages.deepin.com/deepin/pool/non-free/d/deepin-wine-uninstaller/deepin-wine-uninstaller_0.1deepin2_i386.deb
    wget http://packages.deepin.com/deepin/pool/non-free/u/udis86/udis86_1.72-2_i386.deb
    wget http://packages.deepin.com/deepin/pool/non-free/d/deepin-wine/deepin-fonts-wine_2.18-22~rc0_all.deb
    wget http://packages.deepin.com/deepin/pool/non-free/d/deepin-wine/deepin-libwine_2.18-22~rc0_i386.deb
    wget https://packages.deepin.com/deepin/pool/main/libj/libjpeg-turbo/libjpeg62-turbo_1.5.1-2_amd64.deb
    wget https://packages.deepin.com/deepin/pool/main/libj/libjpeg-turbo/libjpeg62-turbo_1.5.1-2_i386.deb
    sudo dpkg --add-architecture i386
    sudo apt update 
    echo Installing QQ...
    wget http://packages.deepin.com/deepin/pool/non-free/d/deepin.com.qq.im/deepin.com.qq.im_9.1.8deepin0_i386.deb
    sudo apt install -y ./*.deb
    cd ..
}

install_zsh(){
    echo Installing zsh...
    sudo apt install zsh -y
    cd ~
    echo Installing ohmyzsh...
    sh ~/my-linux-autoconfig/ohmyzsh/install.sh
    echo Installing plugins...
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/g' ~/.zshrc
    sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k\/powerlevel10k"/g' ~/.zshrc
}

install_fonts(){
    echo Installing Fira Code Fonts...
    mkdir -p ~/.local/share/fonts
    cp -rf ~/my-linux-autoconfig/fonts/*.otf ~/.local/share/fonts
    fc-cache -f -v
}

do_other_things(){
    echo "set max-value-size unlimited" >> ~/.gdbinit
}

echo BEGIN...
install_basic_env
install_vimplus
install_common_software
install_deepin_wine
install_zsh
install_fonts
do_other_things
echo DONE!
