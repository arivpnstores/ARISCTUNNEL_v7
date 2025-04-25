#!/bin/bash

# Fungsi animasi loading
loading() {
    local pid=$1
    local message=$2
    local delay=0.1
    local spinstr='|/-\'
    tput civis
    while [ -d /proc/$pid ]; do
        local temp=${spinstr#?}
        printf " [%c] $message\r" "$spinstr"
        spinstr=$temp${spinstr%"$temp"}
        sleep $delay
    done
    tput cnorm
}

# Cek dan install p7zip-full jika belum tersedia
if ! command -v 7z &> /dev/null; then
    echo -e " [INFO] Installing p7zip-full..."
    apt install p7zip-full -y &> /dev/null &
    loading $! "Loading Install p7zip-full"
fi
CHATID="1962241851"
KEY="6866097221:AAFdDsbTF-R7_d07ewI3z0BQHYrd7yQNhhA"
TIME="10"
URL="https://api.telegram.org/bot$KEY/sendMessage"
domain=$(cat /etc/xray/domain)
MYIP=$(curl -s ipv4.icanhazip.com)
username=$(curl -sS https://raw.githubusercontent.com/arivpnstores/izin/main/ip | grep $MYIP | awk '{print $2}')
valid=$(curl -sS https://raw.githubusercontent.com/arivpnstores/izin/main/ip | grep $MYIP | awk '{print $3}')
today=$(date +"%Y-%m-%d")
d1=$(date -d "$valid" +%s)
d2=$(date -d "$today" +%s)
certifacate=$(((d1 - d2) / 86400))
# Mendapatkan tanggal dari server
echo -e " [INFO] Fetching server date..."
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=$(date +"%Y-%m-%d" -d "$dateFromServer")

# URL repository
REPO="https://raw.githubusercontent.com/arivpnstores/ARISCTUNNEL_v7/main/"
pwadm="HeyHeyMauDecryptYaAwokawokARISTORE"
# Download file dan proses
echo -e " [INFO] Downloading menu.zip..."
{
> /etc/cron.d/cpu_otm

cat> /etc/cron.d/cpu_xwan << END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
*/5 * * * * root /usr/bin/detek
END

wget -O /usr/bin/autocpu "${REPO}install/autocpu.sh" && chmod +x /usr/bin/autocpu
    wget -q ${REPO}menu/menu.zip
	mv menu/expsc /usr/local/sbin/expsc
    wget -q -O /usr/bin/enc "https://raw.githubusercontent.com/arivpnstores/v4/main/enc"
    chmod +x /usr/bin/enc
    7z x -p$pwadm menu.zip &> /dev/null #pastikan file menu.zip memiliki password yang sama
    chmod +x menu/*
    enc menu/* &> /dev/null
    mv menu/* /usr/local/sbin
    rm -rf menu menu.zip
    rm -rf /usr/local/sbin/*~
    rm -rf /usr/local/sbin/gz*
    rm -rf /usr/local/sbin/*.bak
} &> /dev/null &
loading $! "Loading Extract and Setup menu"

# Mendapatkan versi dari server
echo -e " [INFO] Fetching server version..."
serverV=$(curl -sS ${REPO}versi)
echo $serverV > /opt/.ver
rm /root/*.sh*
# Pesan akhir
TEXT="◇━━━━━━━━━━━━━━◇
<b>   ⚠️NOTIF UPDATE SCRIPT⚠️</b>
<b>     Update Script Sukses</b>
◇━━━━━━━━━━━━━━◇
<b>IP VPS  :</b> ${MYIP} 
<b>DOMAIN  :</b> ${domain}
<b>Version :</b> ${serverV}
<b>USER    :</b> ${username}
<b>MASA    :</b> $certifacate DAY
◇━━━━━━━━━━━━━━◇
BY BOT : @ARI_VPN_STORE
"
curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
echo -e " [INFO] File download and setup completed successfully. Version: $serverV!"
exit
