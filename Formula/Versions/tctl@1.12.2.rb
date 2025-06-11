class TctlAT1122 < Formula
  desc "Tetrate Service Bridge Command Line Interface 1.12.2"
  homepage "https://docs.tetrate.io/service-bridge/reference/cli/guide/"
  version "1.12.2"
  license "Commercial"
  conflicts_with "tctl", because: "Provides the same binary"

  if Hardware::CPU.intel?
    url "https://binaries.dl.tetrate.io/public/raw/versions/darwin-amd64-1.12.2/tctl"
    sha256 "cda1e3404e867dc60a9ecb19d3c2116bcf61d9c36a5cac4779850de6a4a0d0e4" # Intel
  else
    url "https://binaries.dl.tetrate.io/public/raw/versions/darwin-arm64-1.12.2/tctl"
    sha256 "0204df0dc1c8b4b6b4ab7178735d2bd804080100f01c598b895263e4e066ee66" # ARM
  end

  def install
    bin.install "tctl" => "tctl-1.12.2"
    bin.install_symlink "tctl-1.12.2" => "tctl@1.12.2"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/tctl@1.12.2 version 2>&1")
  end
end
