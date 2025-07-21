class TctlAT1125 < Formula
  desc "Tetrate Service Bridge Command Line Interface 1.12.5"
  homepage "https://docs.tetrate.io/service-bridge/reference/cli/guide/"
  version "1.12.5"
  license "Commercial"
  conflicts_with "tctl", because: "Provides the same binary"

  if Hardware::CPU.intel?
    url "https://binaries.dl.tetrate.io/public/raw/versions/darwin-amd64-1.12.5/tctl"
    sha256 "2450e047eeadfa4c84d3ef65be7844f1b8e6e1b529a3d3d59b461196149ddfc8" # Intel
  else
    url "https://binaries.dl.tetrate.io/public/raw/versions/darwin-arm64-1.12.5/tctl"
    sha256 "eb617d8f264572e6bb111b88cb22434ef62eabd4c07d09acfa98394999d36624" # ARM
  end

  def install
    bin.install "tctl" => "tctl-1.12.5"
    bin.install_symlink "tctl-1.12.5" => "tctl@1.12.5"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/tctl@1.12.5 version 2>&1")
  end
end
