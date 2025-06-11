class TctlAT1124 < Formula
  desc "Tetrate Service Bridge Command Line Interface 1.12.4"
  homepage "https://docs.tetrate.io/service-bridge/reference/cli/guide/"
  version "1.12.4"
  license "Commercial"
  conflicts_with "tctl", because: "Provides the same binary"

  if Hardware::CPU.intel?
    url "https://binaries.dl.tetrate.io/public/raw/versions/darwin-amd64-1.12.4/tctl"
    sha256 "0ec0636c2633fb24d7a829a6a444c7e3ec82c82f80cb4633b0216955d7912bfe" # Intel
  else
    url "https://binaries.dl.tetrate.io/public/raw/versions/darwin-arm64-1.12.4/tctl"
    sha256 "ca03442c75e6c7c166c16d7288e2856432647a6c278b8932772aa2a280f72f28" # ARM
  end

  def install
    bin.install "tctl" => "tctl-1.12.4"
    bin.install_symlink "tctl-1.12.4" => "tctl@1.12.4"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/tctl@1.12.4 version 2>&1")
  end
end
