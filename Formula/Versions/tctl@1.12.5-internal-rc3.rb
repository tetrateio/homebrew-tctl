class TctlAT1125-internal-rc3 < Formula
  desc "Tetrate Service Bridge Command Line Interface 1.12.5-internal-rc3"
  homepage "https://docs.tetrate.io/service-bridge/reference/cli/guide/"
  version "1.12.5-internal-rc3"
  license "Commercial"
  conflicts_with "tctl", because: "Provides the same binary"

  if Hardware::CPU.intel?
    url "https://binaries.dl.tetrate.io/public/raw/versions/darwin-amd64-1.12.5-internal-rc3/tctl"
    sha256 "10e7917cec5404c2659f953116e7a6e9f0d3fb8e90c9348d9aa7316bd31d69ce" # Intel
  else
    url "https://binaries.dl.tetrate.io/public/raw/versions/darwin-arm64-1.12.5-internal-rc3/tctl"
    sha256 "643b19209183fc1ee063f7e03689d038aa73c38e5b846cc839d47e26120213a1" # ARM
  end

  def install
    bin.install "tctl" => "tctl-1.12.5-internal-rc3"
    bin.install_symlink "tctl-1.12.5-internal-rc3" => "tctl@1.12.5-internal-rc3"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/tctl@1.12.5-internal-rc3 version 2>&1")
  end
end
