function usegmail
    command git config user.email "t.yaeda@gmail.com"
    command git config user.name "Takeshi YAEDA"
end

function brewup
    command brew -v update
    command brew upgrade --force-bottole --cleanup
    command brew cleanup
    command brew cask cleanup
    command brew prune
    command brew doctor
end

function allup
    brewup
    if type -q fisher
        fisher up
    end
    if type -q nodebrew
        command nodebrew selfupdate
    end
    if type -q npm
        command npm update -g npm
        command npm update -g
    end
end

function set_proxy --argument-names proxy_host proxy_port
    un_proxy
    if test (count $argv) -eq 2
        set_color brgreen; echo -e "\t✔ set proxy as $proxy_host:$proxy_port"; set_color normal

        set -gx http_proxy $proxy_host:$proxy_port
        set -gx https_proxy $proxy_host:$proxy_port
        set -gx HTTP_PROXY $proxy_host:$proxy_port
        set -gx HTTPS_PROXY $proxy_host:$proxy_port
        if type -q npm
            command npm config set proxy $proxy_host:$proxy_port
            command npm config set registry http://registry.npmjs.org/
            command npm config set strict-ssl false
        end
        if type -q apm
            command apm config set https-proxy $proxy_host:$proxy_port
        end
        if type -q curl
            echo "proxy = \"$proxy_host:$proxy_port\"" >> $HOME/.curlrc
        end
        set -l gradle_property $HOME/.gradle/gradle.properties
        if test -e $gradle_property
            echo "systemProp.http.proxyHost=$proxy_host" >> $gradle_property
            echo "systemProp.http.proxyPort=$proxy_port" >> $gradle_property
        end
    end
end

function un_proxy
    set_color brgreen; echo -e "\t✔ reset proxy"; set_color normal

    set -ge http_proxy
    set -ge https_proxy
    set -ge HTTP_PROXY
    set -ge HTTPS_PROXY
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
    set -l gradle_property $HOME/.gradle/gradle.properties
    if test -e $gradle_property
        command sed -i '' -E "/^systemProp.http.proxy(Host|Port).*\$/d" $gradle_property
    end
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
