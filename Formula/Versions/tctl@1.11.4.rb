class TctlAT1114 < Formula
  desc "Tetrate Service Bridge Command Line Interface 1.11.4"
  homepage "https://docs.tetrate.io/service-bridge/reference/cli/guide/"
  version "1.11.4"
  license "Commercial"
  conflicts_with "tctl", because: "Provides the same binary"

  if Hardware::CPU.intel?
    url "https://binaries.dl.tetrate.io/public/raw/versions/darwin-amd64-1.11.4/tctl"
    sha256 "d4f94b0419bfd0d592d945c4dda2ec5f5a8d57d85dfc43c8a7fbfe8b6e9ea6eb" # Intel
  else
    url "https://binaries.dl.tetrate.io/public/raw/versions/darwin-arm64-1.11.4/tctl"
    sha256 "1b115cdaf0d839b6c8431ce1ad79cbb466b8282cf5de6080237b4a3864583110" # ARM
  end

  def install
    bin.install "tctl" => "tctl-1.11.4"
    bin.install_symlink "tctl-1.11.4" => "tctl@1.11.4"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/tctl@1.11.4 version 2>&1")
  end
end
