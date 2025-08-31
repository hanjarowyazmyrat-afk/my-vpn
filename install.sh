#!/bin/bash
# Скрипт установки VLESS + Xray на Linux (Ubuntu/Debian)

# Обновляем систему
apt-get update && apt-get upgrade -y

# Устанавливаем необходимые пакеты
apt-get install -y curl unzip wget sudo

# Скачиваем Xray
bash <(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh) install

# Создаем конфиг VLESS
cat > /usr/local/etc/xray/config.json <<EOF
{
  "inbounds": [{
    "port": 443,
    "protocol": "vless",
    "settings": {
      "clients": [{"id": "11111111-1111-1111-1111-111111111111"}]
    },
    "streamSettings": {"network": "tcp"}
  }],
  "outbounds": [{"protocol": "freedom"}]
}
EOF

# Перезапускаем Xray
systemctl restart xray

echo "VPN установлен! Используй UUID 11111111-1111-1111-1111-111111111111"
