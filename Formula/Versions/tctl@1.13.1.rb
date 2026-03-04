class TctlAT1131 < Formula
  desc "Tetrate Service Bridge Command Line Interface 1.13.1"
  homepage "https://docs.tetrate.io/service-bridge/reference/cli/guide/"
  version "1.13.1"
  license "Commercial"
  conflicts_with "tctl", because: "Provides the same binary"

  if Hardware::CPU.intel?
    url "https://binaries.dl.tetrate.io/public/raw/versions/darwin-amd64-1.13.1/tctl"
    sha256 "4abe966112bddddd40a80fae7d2849ca5ccc791949105f566d56402d34040f51" # Intel
  else
    url "https://binaries.dl.tetrate.io/public/raw/versions/darwin-arm64-1.13.1/tctl"
    sha256 "ec7136c202574736de15fd97a313eb582a666a5b8a834f4309a92bc13db90559" # ARM
  end

  def install
    bin.install "tctl" => "tctl-1.13.1"
    bin.install_symlink "tctl-1.13.1" => "tctl@1.13.1"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/tctl@1.13.1 version 2>&1")
  end
end
