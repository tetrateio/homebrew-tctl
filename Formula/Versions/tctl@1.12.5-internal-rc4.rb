class TctlAT1125-internal-rc4 < Formula
  desc "Tetrate Service Bridge Command Line Interface 1.12.5-internal-rc4"
  homepage "https://docs.tetrate.io/service-bridge/reference/cli/guide/"
  version "1.12.5-internal-rc4"
  license "Commercial"
  conflicts_with "tctl", because: "Provides the same binary"

  if Hardware::CPU.intel?
    url "https://binaries.dl.tetrate.io/public/raw/versions/darwin-amd64-1.12.5-internal-rc4/tctl"
    sha256 "80c87fe324998d771bf1a17f4913e8cd16c4a0017d6475c3fb3d87d97c45db5a" # Intel
  else
    url "https://binaries.dl.tetrate.io/public/raw/versions/darwin-arm64-1.12.5-internal-rc4/tctl"
    sha256 "13c79cba47ef09ba3fd2c0b5ff474d9d3673651eba64f866fa1a0fb6ff91cffb" # ARM
  end

  def install
    bin.install "tctl" => "tctl-1.12.5-internal-rc4"
    bin.install_symlink "tctl-1.12.5-internal-rc4" => "tctl@1.12.5-internal-rc4"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/tctl@1.12.5-internal-rc4 version 2>&1")
  end
end
