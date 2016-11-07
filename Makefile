BUILD_DIR := /tmp/tutorial-meteor

bundle:
	mkdir -p $(BUILD_DIR)
	rm -rf $(BUILD_DIR)/bundle
	meteor build --directory $(BUILD_DIR)/ --architecture os.linux.x86_64 --server http://localhost:3000 --server-only

deploy: bundle
	cp -rf deploy/* $(BUILD_DIR)/
	cp -rf coldbrew.conf $(BUILD_DIR)/
	coldbrew deploy --app-dir $(BUILD_DIR) --dockerfile $(BUILD_DIR)/Dockerfile

.PHONY: deploy bundle
