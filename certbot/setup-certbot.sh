#!/bin/bash

# 변수 설정
DOMAIN="api.polar-moviechart.com"

echo "=== Certbot 설치 및 SSL 인증서 발급 ==="

# Certbot 설치
echo "[1/5] Certbot 설치 중..."
sudo apt update && sudo apt install -y certbot python3-certbot-nginx || {
    echo "Certbot 설치 실패!";
    exit 1;
}

# Certbot SSL 인증서 발급
echo "[2/5] SSL 인증서 발급 중..."
sudo certbot --nginx -d $DOMAIN || {
    echo "SSL 인증서 발급 실패!";
    exit 1;
}

# Certbot 자동 갱신 설정 테스트
echo "[3/5] Certbot 자동 갱신 테스트 중..."
sudo certbot renew --dry-run || {
    echo "자동 갱신 테스트 실패!";
    exit 1;
}

# Nginx 서비스 재시작
echo "[4/5] Nginx 재시작 중..."
sudo systemctl restart nginx || {
    echo "Nginx 재시작 실패!";
    exit 1;
}

# 완료 메시지
echo "[5/5] 완료: SSL 인증서가 성공적으로 설정되었습니다."
echo "https://$DOMAIN 에 접속해 확인하세요."
