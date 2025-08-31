FROM ubuntu:22.04

# Обновляем систему и устанавливаем необходимые пакеты
RUN apt-get update && apt-get install -y \
    curl \
    sudo \
    unzip \
    git \
    && rm -rf /var/lib/apt/lists/*

# Скачиваем скрипт установки VPN (VLESS / Shadowsocks)
RUN curl -O https://raw.githubusercontent.com/your-repo/vpn-script/main/install.sh && chmod +x install.sh

# Запускаем скрипт при старте контейнера
CMD ["./install.sh"]
