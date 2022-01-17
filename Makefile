.PHONY: build
build: build-native-platform

.PHONY: build-native-platform
build-native-platform:
	docker build \
	--tag localhost/php-fpm-debian-10:latest .

.PHONY: build-all-platforms
build-all-platforms:
	docker buildx build --progress plain \
	--tag localhost/php-fpm-debian-10:latest \
	--platform linux/amd64,linux/arm64 .
	# TODO: make it work on linux/ar/v7 platform
	# --platform linux/amd64,linux/arm/v7,linux/arm64 .

.PHONY: test
test:
	bash ./tests/run-tests.sh
