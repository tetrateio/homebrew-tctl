class Tctl < Formula
  # Use fully qualified formula name to ensure our version is used
  conflicts_with "tctl", because: "Provides the same binary"
  
  desc "Tetrate Service Bridge Command Line Interface"
  homepage "https://docs.tetrate.io/service-bridge/reference/cli/guide/"
  version "1.12.5-internal-rc0"
  license "Commercial"

  if Hardware::CPU.intel?
    url "https://binaries.dl.tetrate.io/public/raw/versions/darwin-amd64-#{version}/tctl"
    sha256 "8db2769f071660bf516cd270e95319194a78b2cc8625fbc414da69f2b8a1af79" # Intel
  else
    url "https://binaries.dl.tetrate.io/public/raw/versions/darwin-arm64-#{version}/tctl"
    sha256 "acc868aab4e7db637e1fe65471522d4935d79d3d10d4d7656c39db3f8b02807c" # ARM
  end

  def install
    bin.install "tctl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tctl version", 2)
  end
end
