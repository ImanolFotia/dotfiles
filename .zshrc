# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/solaire/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi


PATH="$HOME/Android/android-studio/bin:$PATH"
PATH="$HOME/.ohmyposh:$PATH"
PATH="/usr/lib/libdecor/plugins-1/libdecor-gtk.so:$PATH"

PATH="$HOME/.cargo/bin:$PATH"
PATH="$HOME/.local/bin/c3:$PATH"

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_DIR="$HOME/.config"

#eval "$(oh-my-posh init bash)"
eval "$(oh-my-posh init zsh --config ~/.cache/oh-my-posh/themes/atomic.omp.json)"

export NDK="$HOME/Android/Sdk/ndk/26.0.10404224/"
export ANDROID_BUILD_TOOLS="$HOME/Android/Sdk/build-tools/34.0.0"
export ANDROID_PLATFORM="$HOME/Android/Sdk/platforms/android-34"

source "$HOME/.vulkan-env"

# Setting the LG_WEBOS_TV_SDK_HOME variable to the parent directory of CLI
export LG_WEBOS_TV_SDK_HOME="$HOME/webOS_TV_SDK"

if [ -d "$LG_WEBOS_TV_SDK_HOME/CLI/bin" ]; then
  # Setting the WEBOS_CLI_TV variable to the bin directory of CLI
  export WEBOS_CLI_TV="$LG_WEBOS_TV_SDK_HOME/CLI/bin"
  # Adding the bin directory of CLI to the PATH variable
  export PATH="$PATH:$WEBOS_CLI_TV"
fi

export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools

#export PATH=$PATH:$HOME/bin/JetBrains\ Rider-2022.3.1

unset rc

export PF_INFO="ascii title os kernel de uptime memory palette"
export PF_COLOR=1
pfetch

eval "$(zoxide init zsh)"

export PATH
export EDITOR=nvim
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
