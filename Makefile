
# 获取项目根目录
COMMON_SELF_DIR := $(dir $(lastword $(MAKEFILE_LIST)))
ROOT_DIR := $(abspath $(shell cd $(COMMON_SELF_DIR)/ && pwd -P))

# 构建产物目录
OUTPUT_DIR := $(ROOT_DIR)/lib

GO_WASM_EXEC := $(shell go env GOROOT)/misc/wasm/wasm_exec.js

# 构建
.PHONY: build
build: copy
		GOOS=js GOARCH=wasm go build -o ./lib/hash-file.wasm ./src/main.go

# 复制js
.PHONY: copy
copy: create_dir
		@cp $(GO_WASM_EXEC) ./lib

# 创建文件夹
.PHONY: create_dir
create_dir:
		if [ ! -d "$(OUTPUT_DIR)" ]; then \
				mkdir -p $(OUTPUT_DIR) \
		else \
				echo "Directory $(OUTPUT_DIR) exists."; \
		fi

# 清理
.PHONY: clean
clean:
		@-rm -vrf $(OUTPUT_DIR)

