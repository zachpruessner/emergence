# compile_protos.ps1
# $protoDir = "shared"
# $goOutDir = "server"
# $csOutDir = "client\gen"

# Ensure output dirs exist
# if (-not (Test-Path $goOutDir)) { New-Item -ItemType Directory -Path $goOutDir | Out-Null }
# if (-not (Test-Path $csOutDir)) { New-Item -ItemType Directory -Path $csOutDir | Out-Null }

$plugin = "C:\Users\zachp\.nuget\packages\grpc.tools\2.72.0\tools\windows_x64\grpc_csharp_plugin.exe"

# Go compilation
protoc -I="shared" --go_out="server" --go-grpc_out="server" "shared/packets.proto"

# C# compilation
protoc -I="shared" --csharp_out="client\gen" --grpc_out="client\gen" --plugin=protoc-gen-grpc=$plugin "shared/packets.proto"
