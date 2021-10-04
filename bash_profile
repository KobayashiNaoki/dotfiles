# prompt
# https://qiita.com/caad1229/items/6d71d84933c8a87af0c4
function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
}
function trim_dir (){
    # https://qiita.com/watertight/items/84568d0b6ef77e00dac0
    echo $1 | sed -e '/^.\{20,\}$/s/^\(.\{10\}\).*\(.\{10\}\)$/\1...\2/'
}
function promps {
    # 色は気分で変えたいかもしれないので変数宣言しておく
    local  BLUE="\[\e[1;34m\]"
    local  RED="\[\e[1;31m\]"
    local  GREEN="\[\e[1;32m\]"
    local  WHITE="\[\e[00m\]"
    local  GRAY="\[\e[1;37m\]"
    case $TERM in
        xterm*) TITLEBAR='\[\e]0;\W\007\]';;
        *)      TITLEBAR="";;
    esac
    local BASE="\u@\h"
    PS1="${TITLEBAR}${GREEN}${BASE}${WHITE}:${BLUE}\$(trim_dir \W)${GREEN}\$(parse_git_branch)${BLUE}\$${WHITE} "
}
promps
# export PS1="[\u@\H:\W]$"

# alias
alias sl='ls'
alias l='ls -lvhoS --color=auto'
alias ls='ls --color=auto'
alias ll='ls -alvhoS --color=auto'
alias rm='rm -i' #削除に確認を行う
alias nv='nvidia-smi'
# alias less='lv'
alias swapfree='sudo swapoff -a; sudo swapon -a'
alias activate_101='activate pytorch_1.7.1_cuda10.1'
alias activate_102='activate pytorch_1.7.1_cuda10.2'
alias activate_110='activate pytorch_1.7.1_cuda11.0'
alias activate_111='activate pytorch_1.8.0_cuda11.1'
alias activate_19='activate pytorch_1.9.0_cuda11.1'
alias activate_allennlp_09='activate allennlp_0.9'

# User specidic environment and startup programs
export PATH=$HOME/.local/bin:$PATH
export LD_LIBRARY_PATH=$HOME/.local/lib:$LD_LIBRARY_PATH
export LD_RUN_PATH=$HOME/.local/lib:$LD_RUN_PATH
export PKG_CONFIG_PATH=$HOME/.local/lib/pkgconfig/:$PKG_CONFIG_PATH
export CPPFLAGS=-I$HOME/.local/include
export LDFLAGS=-L$HOME/.local/lib
export PATH=$HOME/downloads/lp_solve_5.5.2.5_exe_ux64:$PATH
export VIM=$HOME/.vim/
export VIMRUNTIME=$HOME/.local/share/vim/vim81
export PYLINTRC=$HOME/.config/pylintrc
# export TMPDIR=$HOME/.local/tmp

# emacs deamon
export EDITOR=emacs #lessなどでファイルを見ていてvで編集に入った時emacsが起動
alias emacs='emacsclient -nw -a ""'
alias eckill='emacsclient -e "(kill-emacs)"'

# screen
hostname=`hostname`
if [ $hostname != 'peter' \
     -a $hostname != 'alm' \
     -a $hostname != 'neoheidi' \
     -a $hostname != 'roger' \
     -a $hostname != 'kei' \
     -a $hostname != 'andy' ]; then
    if [ -z "$STY" ]; then
        # if [ $SHLVL = 1 ]; then
    	#screenの重複を防ぐ
        exec screen -xRR
        # :
    else
        echo "already screen is run"
    fi
fi

# pyenv
export PYENV_ROOT=$HOME/.pyenv
# export PATH=$PYENV_ROOT/bin:$PATH
# if command -v pyenv 1>/dev/null 2>&1; then
#     eval "$(pyenv init -)"
# fi
# eval "$(pyenv virtualenv-init -)"

# export PATH="$PYENV_ROOT/versions/anaconda3-5.1.0/bin:$PATH"
# . /home/lr/kobayasi/.pyenv/versions/anaconda3-5.1.0/etc/profile.d/conda.sh
export PATH="$PYENV_ROOT/versions/anaconda3-5.3.1/bin:$PATH"
. /home/lr/kobayasi/.pyenv/versions/anaconda3-5.3.1/etc/profile.d/conda.sh

# cuda
export PATH=/usr/local/cuda/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH

# export PATH=$HOEM/.local/cuda/bin:$PATH
# export LD_LIBRARY_PATH=$HOME/.local/cuda/lib64:$LD_LIBRARY_PATH

# export PATH=$HOME/.local/cuda-10.2/bin:$PATH
# export LD_LIBRARY_PATH=$HOME/.local/cuda-10.2/lib64:$LD_LIBRARY_PATH
# export PATH=$HOME/.local/cuda-11.0/bin:$PATH
# export LD_LIBRARY_PATH=$HOME/.local/cuda-11.0/lib64:$LD_LIBRARY_PATH

# moses-decidder
export PATH=$HOME/Gitclone/mosesdecoder/scripts/tokenizer:$PATH
export PATH=$HOME/Gitclone/mosesdecoder/scripts/generic:$PATH
export PATH=$HOME/Gitclone/mosesdecoder/scripts/ems/support:$PATH
export PATH=$HOME/Gitclone/mosesdecoder/scripts/training:$PATH

# paired_bootstrap
#export PATH=$HOME/paired_bootstrap_v13a:$PATH
#export PATH=$HOME/paired_bootstrap_v13a/perllib:$PATH

# GIZA++
# export PATH=$HOME/giza-pp/GIZA++-v2:$PATH

# git
export GIT_EDITOR=emacs

# conda
# alias "activate=source $PYENV_ROOT/versions/miniconda3-4.3.30/bin/activate"
# alias "deactivate=source $PYENV_ROOT/versions/miniconda3-4.3.30/bin/deactivate"
# alias "activate=source $PYENV_ROOT/versions/anaconda3-5.1.0/bin/activate"
# alias "deactivate=source $PYENV_ROOT/versions/anaconda3-5.1.0/bin/deactivate"
alias "activate=source $PYENV_ROOT/versions/anaconda3-5.3.1/bin/activate"
alias "deactivate=source $PYENV_ROOT/versions/anaconda3-5.3.1/bin/deactivate"

# theano
# export MKL_THREADING_LAYER=GNU
# export CPATH=/usr/local/cudnn/include:$CPATH
# export CPLUS_INCLUDE_PATH=$CPATH
# export LD_LIBRARY_PATH=/usr/local/cudnn/lib64:$LD_LIBRARY_PATH
# export LIBRARY_PATH=/usr/local/cudnn/lib64:$LIBRARY_PATH

# sentence piece
export PROTOBUF=$HOME/.local
export PROTOC=$PROTOBUF/bin/protoc
export PROTOBUF_LIBS="-L$PROTOBUF/lib -lprotobuf -D_THREAD_SAFE"
export PROTOBUF_CFLAGS="-I$PROTOBUF/include -D_THREAD_SAFE"

# boost
export BOOST_ROOT=$HOME/.local/boost_1_67_0
export PATH=$BOOST_ROOT/bin:$PATH
export LD_LIBRARY_PATH=$BOOST_ROOT/lib:$LD_LIBRARY_PATH

# mecab with neologd
alias mecab="mecab -d $HOME/.local/lib/mecab/dic/mecab-ipadic-neologd"

# ffmpeg
# export LD_LIBRARY_PATH=$HOME/ffmpeg_build/lib:$LD_LIBRARY_PATH

# intel MKL
export LD_LIBRARY_PATH=$HOME/intel/lib:$LD_LIBRARY_PATH
export MKL=$HOME/intel/mkl
export MKL_ROOT=$HOME/intel/mkl

# Perl
export PATH=$HOME/.plenv/bin:$PATH
export EXPATLIBPATH=$HOME/.local/lib
export EXPATINCPATH=$HOME/.local/include
export PERL5LIB=$HOME/.local/lib/perl5/site_perl:$PERL5LIB
eval "$(plenv init -)"

# PyRouge
export PATH=$HOME/pyrouge_pip/bin:$PATH

# Go lang
export GOROOT=$HOME/.local/go
export PATH=$PATH:$GOROOT/bin

# Zpar
export ZPAR_LIBRARY_DIR=$HOME/resource/Zpar/python-zpar/zpar/dist
source "$HOME/.cargo/env"

# rust
export PATH=$PATH:$HOME/.cargo/bin
