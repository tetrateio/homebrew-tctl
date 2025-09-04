class TctlAT1126 < Formula
  desc "Tetrate Service Bridge Command Line Interface 1.12.6"
  homepage "https://docs.tetrate.io/service-bridge/reference/cli/guide/"
  version "1.12.6"
  license "Commercial"
  conflicts_with "tctl", because: "Provides the same binary"

  if Hardware::CPU.intel?
    url "https://binaries.dl.tetrate.io/public/raw/versions/darwin-amd64-1.12.6/tctl"
    sha256 "d73002dff245fdd4ed0f50b8e36be42a8910a1297c3a13d0356cb0bf54fe8490" # Intel
  else
    url "https://binaries.dl.tetrate.io/public/raw/versions/darwin-arm64-1.12.6/tctl"
    sha256 "173e76dbe320b324644e609d9a1a9f67ca986e9f215f202ed236dc0ed7e8d892" # ARM
  end

  def install
    bin.install "tctl" => "tctl-1.12.6"
    bin.install_symlink "tctl-1.12.6" => "tctl@1.12.6"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/tctl@1.12.6 version 2>&1")
  end
end
