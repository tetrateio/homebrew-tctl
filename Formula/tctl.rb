class Tctl < Formula
  # Use fully qualified formula name to ensure our version is used
  conflicts_with "tctl", because: "Provides the same binary"
  
  desc "Tetrate Service Bridge Command Line Interface"
  homepage "https://docs.tetrate.io/service-bridge/reference/cli/guide/"
  version "1.12.5-internal-rc0"
  license "Commercial"

  if Hardware::CPU.intel?
    url "https://binaries.dl.tetrate.io/public/raw/versions/darwin-amd64-#{version}/tctl"
    sha256 "397ac3a175b2c3cfc5822ab2a814e3b127dfb5775f55d58fe2b783d31137ec84" # Intel
  else
    url "https://binaries.dl.tetrate.io/public/raw/versions/darwin-arm64-#{version}/tctl"
    sha256 "065bbba61166b38a5116b0faf91926557a6b3b0d3fa7e82c3e06465043963d4b" # ARM
  end

  def install
    bin.install "tctl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tctl version", 2)
  end
end
