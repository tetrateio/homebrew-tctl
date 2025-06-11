class Tctl1121 < Formula
  desc "Tetrate Service Bridge Command Line Interface 1.12.1"
  homepage "https://docs.tetrate.io/service-bridge/reference/cli/guide/"
  version "1.12.1"
  license "Commercial"
  conflicts_with "tctl", because: "Provides the same binary"

  if Hardware::CPU.intel?
    url "https://binaries.dl.tetrate.io/public/raw/versions/darwin-amd64-1.12.1/tctl"
    sha256 "8b681cb9e3186a1eb63d7b715d5a9cbf79cc9d90051c34f7a40a9068b203a56e" # Intel
  else
    url "https://binaries.dl.tetrate.io/public/raw/versions/darwin-arm64-1.12.1/tctl"
    sha256 "baa742a2424d282d987a1c77df4e05c108b28cb4efe3a67ee3e0d37fbd1f4e31" # ARM
  end

  def install
    bin.install "tctl" => "tctl-1.12.1"
    bin.install_symlink "tctl-1.12.1" => "tctl@1.12.1"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/tctl@1.12.1 version 2>&1")
  end
end
