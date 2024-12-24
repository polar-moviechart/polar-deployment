# ------------- movie-service -------------
# 빌드
custom_build(
    # 컨테이너 이미지의 이름
    ref = 'movie-service',
    # 컨테이너 이미지를 빌드하기 위한 명령
    command = 'cd ../movie-service && ./gradlew bootBuildImage --imageName $EXPECTED_REF',
    # 새로운 빌드를 시작하기 위해 지켜봐야 하는 파일
    deps = ['build.gradle', 'src']
)

# 배포
k8s_yaml(
['../movie-service/k8s/deployment.yml', '../movie-service/k8s/service.yml', '../movie-service/k8s/configmap.yml']
)

# 관리
k8s_resource(
    'movie-service',
    port_forwards=['8081']
)
# ------------- user-service -------------
# 빌드
custom_build(
    # 컨테이너 이미지의 이름
    ref = 'user-service',
    # 컨테이너 이미지를 빌드하기 위한 명령
    command = 'cd ../user-service && ./gradlew bootBuildImage --imageName $EXPECTED_REF',
    # 새로운 빌드를 시작하기 위해 지켜봐야 하는 파일
    deps = ['build.gradle', 'src']
)

# 배포
k8s_yaml(
['../user-service/k8s/deployment.yml', '../user-service/k8s/service.yml', '../user-service/k8s/configmap.yml']
)

# 관리
k8s_resource(
    'user-service',
    port_forwards=['8082']
)

# ------------- edge-service -------------
# 빌드
custom_build(
    # 컨테이너 이미지의 이름
    ref = 'edge-service',
    # 컨테이너 이미지를 빌드하기 위한 명령
    command = 'cd ../edge-service && ./gradlew bootBuildImage --imageName $EXPECTED_REF',
    # 새로운 빌드를 시작하기 위해 지켜봐야 하는 파일
    deps = ['build.gradle', 'src']
)

# 배포
k8s_yaml(
['../edge-service/k8s/deployment.yml', '../edge-service/k8s/service.yml', '../edge-service/k8s/configmap.yml']
)

# 관리
k8s_resource(
    'edge-service',
    port_forwards=['8080'],
    resource_deps=['movie-service', 'user-service']
)
