#!/bin/bash
#### BEGIN SCRIPT ####

#### Begin GLOBAL VARS ####
    # Variables that may need to change
    GIT_DIR=$(git rev-parse --show-toplevel)
    BACK_DIR=$HOME/conf-$(date +%Y-%m-%d-%H-M)
    CTAGS_VERSION=5.8
    CTAGS_URL=http://prdownloads.sourceforge.net/ctags/ctags-$CTAGS_VERSION.tar.gz
    
    # Vars to keep track of installed configs
    FNT_INST=false
    XRE_INST=false
    VIM_INST=false
    ZSH_INST=false
    AWE_INST=false
    MUT_INST=false
#### END GLOBAL VARS ####

#### BEGIN MAIN ####
    echo "\t1 - Powerline Fonts"
    echo "\t2 - Solarized theme and Powerline fonts for Xterm and Urxvt"
    echo "\t3 - Vim config"
    echo "\t4 - zsh config"
    echo "\t5 - Awesome config"
    echo "\t6 - Mutt config"
    echo "Enter the numbers of the configs you would like to install seperated by spaces, or '0' to exit"
    
    read OPTIONS
    select opt in $OPTIONS; do
        if ["$opt" = "1"]; then
            echo "----[[ Installing Powerline Fonts ]]----"
            inst_FNT
            echo "----[[ Powerline Fonts Installed ]]----"
        elif [ "$opt" = "2" ]; then
            echo "----[[ Installing .Xresources ]]----"
            inst_XRE
            echo "----[[ .Xresources Installed ]]----"
        elif [ "$opt" = "3"]; then
            echo "----[[ Installing Vim Config ]]----"
            inst_VIM
            echo "----[[ Vim Config Installed ]]----"
        elif [ "$opt" = "4" ]; then
            echo "----[[ Installing zsh Config ]]----"
            inst_ZSH
            echo "----[[ zsh Config Installed ]]----"
        elif [ "$opt" = "5" ]; then
            echo "----[[ Installing AwesomeWM Config ]]----"
            inst_AWE
            echo "----[[ AwesomeWM Config Installed ]]----"
        elif [ "$opt" = "6" ]; then
            echo "#### MUTT INSTALL SCRIPT NOT COMPLETED! #####"
            echo "#### YOU MUST INSTALL MUTT CONF MANUALY #####"
        elif [ "$opt" = "0" ]; then
            echo "Exiting"
            exit
        else
            echo "Bad Option, exiting"
            exit
        fi
    done
#### END MAIN####

#### BEGIN FUNCTIONS ####
    #### BEGIN INSTALLER FNS ###
    function inst_FNT {
        if [[ $FNT_INST ]]; then
            echo "#### Powerline Fonts alread installed! Aborting ####"
            return
        fi
        
        cd $GIT_DIR
        echo "- Cloning Submodules -"
        git submodule update --init --recursive 
    
    
        echo "- Calling external font install script -"
        $GIT_DIR/resources/powerline-fonts/install.sh
        
        FNT_INST=true
        return
    }
    
        
    function inst_XRE {
        if [ $XRE_INST ]; then
            echo "#### .Xresources already installed! Aborting! ####"
            return
        fi
       
        if [[ ! $FNT_INST ]]; then
            echo "- Installing Powerline Fonts as a dependency -"
            inst_FON
        fi
        
        backup .Xresources
        place .Xresources
    
        XRE_INST=true
        return
    }
    
    function inst_VIM {
        if [ $VIM_INST ]; then
            echo "#### Vim config already installed! Aborting! ####"
            return
        fi
       
        if [[ ! $XRE_INST ]]; then
            echo "- Installing .Xresources as a dependency -"
            inst_XRE
        fi
    
        cd $GIT_DIR
        echo "- Cloning Submodules -"
        git submodule update --init --recursive 
        
        backup .vimrc
        backup .vim
        
        place .vimrc
        place .vim
    
        if [[ -z $(ctags --version | grep Exuberant) ]]; then
            echo "- Preparing to build Exuberant cTags -"
            mkdir $GIT_DIR/vim_build
            cd $GIT_DIR/vim_build
    
            echo "- Downloading source -"
            wget $CTAGS_URL
    
            echo "- Extracting source -"
            tar -xf ctags-$CTAGS_VERSION.tar.gz
            cd ctags-$CTAGS_VERSION
    
            echo "- Building ctags from source -"
            ./configure
            make
    
            echo "- Copying binary -"
            mkdir $HOME/.vim/bin
            cp ./ctags $HOME/.vim/bin/ctags
            
            echo "- Cleaning up build directories -"
            cd $GIT_DIR
            rm -rf $GIT_DIR/vim_build
        else
            echo "- Exuberant cTags is installed, linking binary -"
            mkdir $HOME/.vim/bin
            ln -s $(which ctags) ./ctags
        fi
        
        echo "####### WATCH FOR YouCompleteMe ERRORS #######"
        echo "# You will need to resolve any errore in     #"
        echo "# this section manually. Once you think      #"
        echo "# have fixed all dependency issues run       #"
        echo "# \$HOME/.vim/bundle/YouCompleteMe/install.sh #"
        echo "##############################################"
        
        echo "Compiling YouCompleteMe Dependencies"
        cd $HOME/.vim/bundle/YouCompleteMe
        ./install.sh #YouCompleteMe install script
        
        echo "##############################################"
        echo "# YouCompleteMe install script completed.    #"
        echo "# If YouCompleteMe does not work, see        #"
        echo "# https://github.com/Valloric/YouCompleteMe  #"
        echo "##############################################"
        VIM_INST=true
        return
    }
    
    function inst_ZSH {
        if [ $ZSH_INST ]; then
            echo "#### zsh config already installed! Aborting! ####"
            return
        fi
       
        if [[ ! $XRE_INST ]]; then
            echo "- Installing .Xresources as a dependency -"
            inst_XRE
        fi
    
        cd $GIT_DIR
        echo "- Cloning Submodules -"
        git submodule update --init --recursive 
        
        backup .zshrc
        backup .zsh
        
        place .zshrc
        place .zsh
    
        ZSH_INST=true
        return
    }
    
    function inst_AWE {
        if [ $AWE_INST ]; then
            echo "#### zsh config already installed! Aborting! ####"
            return
        fi
       
        if [[ ! $FNT_INST ]]; then
            echo "- Installing Powerline Fonts as a dependency -"
            inst_FNT
        fi
    
        cd $GIT_DIR
        echo "- Cloning Submodules -"
        git submodule update --init --recursive 
        
        backup .config/awesome
        
        place .config/awesome
    
        AWE_INST=true
        return
    }
    #### END INSTALLER FNS ####
    
    #### BEGIN HELPER FNS ####
    function backup {
        if [ ! -d "$BAK_DIR" ]; then
            mkdir $BAK_DIR
        fi
        if [ -n "$1" ]; then
            if [ -e "$HOME/$1" ]; then
                echo "- Backing up $1 -"
                mv $HOME/$1 $BACK_DIR/$1
            fi
        fi
    }
    
    function place {
        if [[ -d $1 ]]; then
            echo "- Placing $1 -"
            cp -r $GIT_DIR/$1 $HOME/$1
        elif [[ -e $1 ]]; then
            echo "- Placing $1 -"
            cp $GIT_DIR/$1 $HOME/$1
        else
            echo "#### Error placing $1 ####"
        fi
    }
    #### END HELPER FNS ####
#### END FUNCTIONS ####
#### END SCRIPT ####
