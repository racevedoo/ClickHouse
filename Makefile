VERSION := 22.6.1-incognia
REMOTE ?= 889818756387.dkr.ecr.us-east-1.amazonaws.com/incognia/clickhouse

.PHONY: build push clickhouse

clickhouse:
	mkdir -p build && cd build && cmake -DCMAKE_BUILD_TYPE=Release .. && ninja -j 4 clickhouse
build:
	docker build --rm=false -t "${REMOTE}:${VERSION}" -f Dockerfile build/programs/
push:
	docker push "${REMOTE}:${VERSION}"
