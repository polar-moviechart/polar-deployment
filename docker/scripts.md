* 각 어플리케이션의 jar파일 가져와서 이미지 빌드 후 어플리케이션 시작
  * docker-compose up movie-service edge-service user-service --build -d
* 각 어플리케이션 jar파일 빌드하는 명령어 (docker 디렉토리에서 입력해야 함)
  * ./build-services.sh
* 애플리케이션 내리기
  * docker stop edge-service movie-service user-service
* mysql 빼고 모두 종료
  * docker ps -q | grep -v $(docker ps -q --filter "name=polar-mysql") | xargs -r docker stop

* 도커 명령어
  * 컨테이너 접근
    * docker exec -it user-service /bin/bash
  * 이미지 생성 - Dockerfile이 있는 디렉토리에서 실행
    * docker build -t movie-service:latest .

* 깃허브에서 도커 레지스트리에 접근하기 위해 토큰 등록
  * kubectl create secret docker-registry regcred \
    --docker-server=ghcr.io \
    --docker-username=stk346 \
    --docker-password=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