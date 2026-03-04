class TctlAT1128 < Formula
  desc "Tetrate Service Bridge Command Line Interface 1.12.8"
  homepage "https://docs.tetrate.io/service-bridge/reference/cli/guide/"
  version "1.12.8"
  license "Commercial"
  conflicts_with "tctl", because: "Provides the same binary"

  if Hardware::CPU.intel?
    url "https://binaries.dl.tetrate.io/public/raw/versions/darwin-amd64-1.12.8/tctl"
    sha256 "397ac3a175b2c3cfc5822ab2a814e3b127dfb5775f55d58fe2b783d31137ec84" # Intel
  else
    url "https://binaries.dl.tetrate.io/public/raw/versions/darwin-arm64-1.12.8/tctl"
    sha256 "065bbba61166b38a5116b0faf91926557a6b3b0d3fa7e82c3e06465043963d4b" # ARM
  end

  def install
    bin.install "tctl" => "tctl-1.12.8"
    bin.install_symlink "tctl-1.12.8" => "tctl@1.12.8"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/tctl@1.12.8 version 2>&1")
  end
end
