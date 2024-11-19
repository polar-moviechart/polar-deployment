#!/bin/bash

# 서비스 디렉토리 목록 (이 파일의 디렉토리를 기준으로 설정)
services=(
  "../../movie-service"
  "../../edge-service"
  "../../user-service"
)

# 빌드 결과를 저장할 변수
success_count=0
fail_count=0

echo "=== 모든 서비스 빌드 시작 ==="

# 각 디렉토리에서 빌드 실행
for service in "${services[@]}"; do
  echo ">>> $service 빌드 시작"
  if [ -d "$service" ]; then
    (cd "$service" && ./gradlew clean build --no-daemon)
    if [ $? -eq 0 ]; then
      echo ">>> $service 빌드 성공"
      success_count=$((success_count + 1))
    else
      echo ">>> $service 빌드 실패"
      fail_count=$((fail_count + 1))
    fi
  else
    echo ">>> $service 디렉토리가 존재하지 않습니다."
    fail_count=$((fail_count + 1))
  fi
done

echo "=== 빌드 완료 ==="
echo "성공: $success_count, 실패: $fail_count"

# 실패가 있다면 종료 코드 설정
if [ $fail_count -ne 0 ]; then
  exit 1
fi
