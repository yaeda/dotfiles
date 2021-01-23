function usegmail
    command git config user.email "t.yaeda@gmail.com"
    command git config user.name "Takeshi Yaeda"
    command git config core.sshCommand "ssh -i $HOME/.ssh/id_rsa_github_tyaeda_gmail_com"
end

function brewup
    command brew -v update
    command env HOMEBREW_INSTALL_CLEANUP=1 brew upgrade --force-bottle
    command brew upgrade --cask
    command brew cleanup
    command brew doctor
    command brew bundle dump --force --global --describe
end

function allup
    if type -q brew
        set_color brgreen
        echo ">>> homebrew"
        set_color normal
        brewup
    end
    if type -q mas
        set_color brgreen
        echo ">>> mas"
        set_color normal
        mas upgrade
    end
    if type -q fisher
        set_color brgreen
        echo ">>> fisher"
        set_color normal
        echo "current" (fisher --version)
        fisher update
    end
    if type -q fish_update_completions
        fish_update_completions
    end
    if type -q nodebrew
        set_color brgreen
        echo ">>> nodebrew"
        set_color normal
        command nodebrew selfupdate
    end
    if type -q npm
        set_color brgreen
        echo ">>> npm"
        set_color normal
        command npm update -g npm
        command npm update -g
    end
end

function set_proxy --argument-names proxy_host proxy_port
    un_proxy
    if test (count $argv) -eq 2
        set_color brgreen
        echo -e "\t✔ set proxy as $proxy_host:$proxy_port"
        set_color normal

        set -l proxy_host_without_protocol (string split :// $proxy_host)[-1]

        set -Ux http_proxy $proxy_host:$proxy_port
        set -Ux https_proxy $proxy_host:$proxy_port
        set -Ux HTTP_PROXY $proxy_host:$proxy_port
        set -Ux HTTPS_PROXY $proxy_host:$proxy_port
        if type -q git
            command git config --global http.proxy $proxy_host:$proxy_port
            command git config --global https.proxy $proxy_host:$proxy_port
        end
        if type -q npm
            command npm config set proxy $proxy_host:$proxy_port
            command npm config set registry http://registry.npmjs.org/
            command npm config set strict-ssl false
        end
        if type -q apm
            command apm config set https-proxy $proxy_host:$proxy_port
        end
        if type -q curl
            echo "proxy = \"$proxy_host:$proxy_port\"" >>$HOME/.curlrc
        end
        set -l ssh_config $HOME/.ssh/config
        set -l ssh_config_proxy $HOME/.ssh/config.proxy
        if test ! -e $ssh_config
            command touch $ssh_config
        end
        if test -e $ssh_config_proxy
            echo "Include config.proxy" >>$ssh_config
        end
        set -l gradle_property $HOME/.gradle/gradle.properties
        if test -e $gradle_property
            echo "systemProp.http.proxyHost=$proxy_host_without_protocol" >>$gradle_property
            echo "systemProp.http.proxyPort=$proxy_port" >>$gradle_property
            echo "systemProp.https.proxyHost=$proxy_host_without_protocol" >>$gradle_property
            echo "systemProp.https.proxyPort=$proxy_port" >>$gradle_property
        end
        set -l processing_config $HOME/Library/Processing/preferences.txt
        if test -e $processing_config
            command sed -i '' -E "s:(proxy.(http|https|socks).host=):\1$proxy_host_without_protocol:g" $processing_config
            command sed -i '' -E "s:(proxy.(http|https|socks).port=):\1$proxy_port:g" $processing_config
        end
    end
end

function un_proxy
    set -Ue http_proxy
    set -Ue https_proxy
    set -Ue HTTP_PROXY
    set -Ue HTTPS_PROXY
    if type -q git
        command git config --global --unset http.proxy
        command git config --global --unset https.proxy
    end
    if type -q npm
        command npm config delete proxy
        command npm config delete registry
        command npm config delete strict-ssl
    end
    if type -q apm
        command apm config delete https-proxy
    end
    set -l curlrc $HOME/.curlrc
    if test -e $curlrc
        command sed -i '' -E "/^proxy.*\$/d" $curlrc
        #              |   `- sed(BSD) uses -E option as regexp script. sed(GNU) uses -r
        #              `-- sed(BSD) -i requires extension. Empty means overwrite
    end
    set -l ssh_config $HOME/.ssh/config
    if test -e $ssh_config
        command sed -i '' -E "/^Include config.proxy/d" $ssh_config
    end
    set -l gradle_property $HOME/.gradle/gradle.properties
    if test -e $gradle_property
        command sed -i '' -E "/^systemProp.https{0,1}.proxy(Host|Port).*\$/d" $gradle_property
    end
    set -l processing_config $HOME/Library/Processing/preferences.txt
    if test -e $processing_config
        command sed -i '' -E 's/(proxy.(http|https|socks).host=).*/\1/g' $processing_config
        command sed -i '' -E 's/(proxy.(http|https|socks).port=).*/\1/g' $processing_config
    end

    set_color brgreen
    echo -e "\t✔ reset proxy"
    set_color normal
end

function get_ip
    echo (ifconfig en0 | sed -n -E 's/^.*inet ([0-9]+\.[0-9]+\.[0-9]+\.[0-9]+).*$/\1/p')
    # ip addr show en0
end

function adbscap
    set -l path /sdcard/screen.png
    command adb shell screencap -p $path
    command adb pull $path
    command adb shell rm $path
end

function lsdsstore
    command find . -name ".DS_Store" -print
end

function rmdsstore
    command find . -name ".DS_Store" -delete
end

function x
    command arch -x86_64 $argv
end