class TctlAT1130 < Formula
  desc "Tetrate Service Bridge Command Line Interface 1.13.0"
  homepage "https://docs.tetrate.io/service-bridge/reference/cli/guide/"
  version "1.13.0"
  license "Commercial"
  conflicts_with "tctl", because: "Provides the same binary"

  if Hardware::CPU.intel?
    url "https://binaries.dl.tetrate.io/public/raw/versions/darwin-amd64-1.13.0/tctl"
    sha256 "360dbc59ea6ef69fb40562d3de744105a67c87ca2e727b7968595a9d5566fe6b" # Intel
  else
    url "https://binaries.dl.tetrate.io/public/raw/versions/darwin-arm64-1.13.0/tctl"
    sha256 "579a7e89325860edf7b8409adf87d3873561a2e9ff0744c978a1d35cd9abc062" # ARM
  end

  def install
    bin.install "tctl" => "tctl-1.13.0"
    bin.install_symlink "tctl-1.13.0" => "tctl@1.13.0"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/tctl@1.13.0 version 2>&1")
  end
end
