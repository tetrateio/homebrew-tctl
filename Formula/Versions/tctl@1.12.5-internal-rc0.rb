class TctlAT1125-internal-rc0 < Formula
  desc "Tetrate Service Bridge Command Line Interface 1.12.5-internal-rc0"
  homepage "https://docs.tetrate.io/service-bridge/reference/cli/guide/"
  version "1.12.5-internal-rc0"
  license "Commercial"
  conflicts_with "tctl", because: "Provides the same binary"

  if Hardware::CPU.intel?
    url "https://binaries.dl.tetrate.io/public/raw/versions/darwin-amd64-1.12.5-internal-rc0/tctl"
    sha256 "8db2769f071660bf516cd270e95319194a78b2cc8625fbc414da69f2b8a1af79" # Intel
  else
    url "https://binaries.dl.tetrate.io/public/raw/versions/darwin-arm64-1.12.5-internal-rc0/tctl"
    sha256 "acc868aab4e7db637e1fe65471522d4935d79d3d10d4d7656c39db3f8b02807c" # ARM
  end

  def install
    bin.install "tctl" => "tctl-1.12.5-internal-rc0"
    bin.install_symlink "tctl-1.12.5-internal-rc0" => "tctl@1.12.5-internal-rc0"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/tctl@1.12.5-internal-rc0 version 2>&1")
  end
end
