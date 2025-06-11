class TctlAT1120 < Formula
  desc "Tetrate Service Bridge Command Line Interface 1.12.0"
  homepage "https://docs.tetrate.io/service-bridge/reference/cli/guide/"
  version "1.12.0"
  license "Commercial"
  conflicts_with "tctl", because: "Provides the same binary"

  if Hardware::CPU.intel?
    url "https://binaries.dl.tetrate.io/public/raw/versions/darwin-amd64-1.12.0/tctl"
    sha256 "43c98641d7fcb07c78079e8c3895abd100bcfaa9a52b86e41c5f43dd4604aaa4" # Intel
  else
    url "https://binaries.dl.tetrate.io/public/raw/versions/darwin-arm64-1.12.0/tctl"
    sha256 "c78f0e1604be2ce41a3ae2538dd3373a7e36f175ed6e44580c339b934d28d94e" # ARM
  end

  def install
    bin.install "tctl" => "tctl-1.12.0"
    bin.install_symlink "tctl-1.12.0" => "tctl@1.12.0"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/tctl@1.12.0 version 2>&1")
  end
end
