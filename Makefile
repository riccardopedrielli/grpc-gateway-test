run:
	go run main.go

generate:
	protoc \
		-I ./proto \
		-I ./third_party/googleapis \
		--go_out           ./proto  --go_opt           paths=source_relative \
		--go-grpc_out      ./proto  --go-grpc_opt      paths=source_relative \
		--grpc-gateway_out ./proto  --grpc-gateway_opt paths=source_relative \
		./proto/helloworld/hello_world.proto

tools:
	go install \
		google.golang.org/protobuf/cmd/protoc-gen-go \
		google.golang.org/grpc/cmd/protoc-gen-go-grpc \
		github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-grpc-gateway
