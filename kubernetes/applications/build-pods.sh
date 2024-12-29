#!/bin/bash

# 서비스 디렉토리 목록 (이 파일의 디렉토리를 기준으로 설정)
services=(
  "./movie-service"
  "./user-service"
  "./edge-service"
)

echo "=== 모든 서비스 파드 빌드 시작 ==="

# 각 디렉토리에서 빌드 실행
for service in "${services[@]}"; do
  echo ">>> $service 빌드 시작"
  if [ -d "$service" ]; then
    (cd "$service" && kubectl apply -k .)
    if [ $? -eq 0 ]; then
      echo ">>> $service 파드 빌드 성공"
    else
      echo ">>> $service 파드 빌드 실패"
    fi
  else
    echo ">>> $service 디렉토리가 존재하지 않습니다."
  fi
done