#!/bin/bash

# 설정할 YAML 파일 경로
CONFIG_FILE="nginx-config.yml"

# Nginx 사이트 설정 디렉토리
SITES_AVAILABLE_DIR="/etc/nginx/sites-available"
SITES_ENABLED_DIR="/etc/nginx/sites-enabled"

# Nginx 설정 파일 복사할 경로
CONFIG_DEST="$SITES_AVAILABLE_DIR/api.polar-moviechart.com"

# Nginx 설정 파일이 존재하는지 확인
if [ ! -f "$CONFIG_FILE" ]; then
    echo "설정 파일이 존재하지 않습니다: $CONFIG_FILE"
    exit 1
fi

# Nginx 설정 파일을 sites-available 디렉토리로 복사
echo "설정 파일을 $SITES_AVAILABLE_DIR로 복사 중..."
sudo cp "$CONFIG_FILE" "$CONFIG_DEST"

# 심볼릭 링크가 이미 존재하면 삭제 후 다시 생성
if [ -f "$SITES_ENABLED_DIR/api.polar-moviechart.com" ] || [ -L "$SITES_ENABLED_DIR/api.polar-moviechart.com" ]; then
    echo "기존 링크 또는 파일 삭제 중..."
    sudo rm "$SITES_ENABLED_DIR/api.polar-moviechart.com"
fi

# 심볼릭 링크 생성
echo "심볼릭 링크를 $SITES_ENABLED_DIR로 생성 중..."
sudo ln -s "$CONFIG_DEST" "$SITES_ENABLED_DIR/api.polar-moviechart.com"

# Nginx 설정 테스트
echo "Nginx 설정 파일 테스트 중..."
sudo nginx -t

# default 서버 블록이 존재하면 삭제
if [ -f /etc/nginx/sites-enabled/default ]; then
    echo "default 서버 블록을 비활성화 중..."
    sudo rm /etc/nginx/sites-enabled/default
else
    echo "default 서버 블록이 존재하지 않음"
fi

# Nginx 재시작
echo "Nginx를 재시작 중..."
sudo systemctl restart nginx

echo "Nginx 설정이 완료되었습니다."
