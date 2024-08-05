# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

PATH="$HOME/Android/android-studio/bin:$PATH"
PATH="~/.ohmyposh:$PATH"
PATH="/usr/lib/libdecor/plugins-1/libdecor-gtk.so:$PATH" 


#eval "$(oh-my-posh init bash)"
eval "$(oh-my-posh init bash --config ~/.cache/oh-my-posh/themes/tokyo.omp.json)"

export NDK="$HOME/Android/Sdk/ndk/26.0.10404224/"
export ANDROID_BUILD_TOOLS="$HOME/Android/Sdk/build-tools/34.0.0"
export ANDROID_PLATFORM="$HOME/Android/Sdk/platforms/android-34"

source .vulkan-env

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

export PF_INFO="ascii title os host kernel uptime memory"

pfetch

eval "$(zoxide init bash)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f "/home/solaire/.ghcup/env" ] && source "/home/solaire/.ghcup/env" # ghcup-env
. "$HOME/.cargo/env"
