class TctlAT1127 < Formula
  desc "Tetrate Service Bridge Command Line Interface 1.12.7"
  homepage "https://docs.tetrate.io/service-bridge/reference/cli/guide/"
  version "1.12.7"
  license "Commercial"
  conflicts_with "tctl", because: "Provides the same binary"

  if Hardware::CPU.intel?
    url "https://binaries.dl.tetrate.io/public/raw/versions/darwin-amd64-1.12.7/tctl"
    sha256 "34aa5b71dd2fc57d2420b2dd7a75aa0de2e610af7b212b162ecf54c8b642e724" # Intel
  else
    url "https://binaries.dl.tetrate.io/public/raw/versions/darwin-arm64-1.12.7/tctl"
    sha256 "aa87850e2b6d5ec4dfe11afb60ca3bffd67670c7cb28b1c7de561e5913dff90e" # ARM
  end

  def install
    bin.install "tctl" => "tctl-1.12.7"
    bin.install_symlink "tctl-1.12.7" => "tctl@1.12.7"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/tctl@1.12.7 version 2>&1")
  end
end
