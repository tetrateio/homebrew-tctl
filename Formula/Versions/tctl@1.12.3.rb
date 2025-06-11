class TctlAT1123 < Formula
  desc "Tetrate Service Bridge Command Line Interface 1.12.3"
  homepage "https://docs.tetrate.io/service-bridge/reference/cli/guide/"
  version "1.12.3"
  license "Commercial"
  conflicts_with "tctl", because: "Provides the same binary"

  if Hardware::CPU.intel?
    url "https://binaries.dl.tetrate.io/public/raw/versions/darwin-amd64-1.12.3/tctl"
    sha256 "a44edd05924a20c9386fa39717ee402ab0aaa82462dbab5df45e510f3e6d0c60" # Intel
  else
    url "https://binaries.dl.tetrate.io/public/raw/versions/darwin-arm64-1.12.3/tctl"
    sha256 "0f2b683fc3e1ba1b298c13ccbe79eaa6e74f44977aa4caeaa58f0adf274ba445" # ARM
  end

  def install
    bin.install "tctl" => "tctl-1.12.3"
    bin.install_symlink "tctl-1.12.3" => "tctl@1.12.3"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/tctl@1.12.3 version 2>&1")
  end
end
