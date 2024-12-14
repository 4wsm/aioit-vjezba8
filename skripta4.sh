#!/bin/bash

# Provjera i instalacija httpd
if ! rpm -q httpd &>/dev/null; then
    echo "httpd nije instaliran. Instaliram httpd..."
     dnf install -y httpd
else
    echo "httpd je već instaliran. Nadograđujem na zadnju verziju..."
     dnf upgrade -y httpd
fi

# Promjena porta u konfiguraciji
config_lokacija="/etc/httpd/conf/httpd.conf"
if grep -q "^Listen 80" "$config_lokacija"; then
    echo "Mijenjam port iz 80 u 81..."
     sed -i 's/^Listen 80/Listen 81/' "$config_lokacija"
    restart_needed=true
fi

# Provjera i restart httpd-a
if [ "$restart_needed" = true ]; then
    echo "Restartam httpd..."
     systemctl restart httpd
fi

# Osiguranje da je usluga pokrenuta
 systemctl enable httpd
 systemctl start httpd

echo "Konfiguracija završena."

