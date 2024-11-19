* 각 어플리케이션의 jar파일 가져와서 이미지 빌드 후 어플리케이션 시작
  * docker-compose up movie-service edge-service user-service --build -d
* 각 어플리케이션 jar파일 빌드하는 명령어 (docker 디렉토리에서 입력해야 함)
  * ./build-services.sh
* 애플리케이션 내리기
  * docker stop edge-service movie-service user-service
* mysql 빼고 모두 종료
  * docker ps -q --filter "name!=polar-mysql" | xargs docker stop
