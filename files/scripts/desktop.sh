set -oue pipefail

for file in /usr/share/applications/rofi.desktop \
             /usr/share/applications/rofi-theme-selector.desktop \
             /usr/share/applications/nwg-panel-config.desktop; do
    if [ -f "$file" ]; then
        echo "Testing changes for $file:"
        sed '/^NoDisplay=/{
            s/NoDisplay=false/NoDisplay=true/
        }
        /^NoDisplay=/!{
            $a\NoDisplay=true
        }' "$file"
        echo "--------------------------"
    else
        echo "File $file does not exist."
    fi
done
