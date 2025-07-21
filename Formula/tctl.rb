class Tctl < Formula
  # Use fully qualified formula name to ensure our version is used
  conflicts_with "tctl", because: "Provides the same binary"
  
  desc "Tetrate Service Bridge Command Line Interface"
  homepage "https://docs.tetrate.io/service-bridge/reference/cli/guide/"
  version "1.12.5-internal-rc0"
  license "Commercial"

  if Hardware::CPU.intel?
    url "https://binaries.dl.tetrate.io/public/raw/versions/darwin-amd64-#{version}/tctl"
    sha256 "2450e047eeadfa4c84d3ef65be7844f1b8e6e1b529a3d3d59b461196149ddfc8" # Intel
  else
    url "https://binaries.dl.tetrate.io/public/raw/versions/darwin-arm64-#{version}/tctl"
    sha256 "eb617d8f264572e6bb111b88cb22434ef62eabd4c07d09acfa98394999d36624" # ARM
  end

  def install
    bin.install "tctl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tctl version", 2)
  end
end
