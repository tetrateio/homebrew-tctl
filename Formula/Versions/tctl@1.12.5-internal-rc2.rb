class TctlAT1125-internal-rc2 < Formula
  desc "Tetrate Service Bridge Command Line Interface 1.12.5-internal-rc2"
  homepage "https://docs.tetrate.io/service-bridge/reference/cli/guide/"
  version "1.12.5-internal-rc2"
  license "Commercial"
  conflicts_with "tctl", because: "Provides the same binary"

  if Hardware::CPU.intel?
    url "https://binaries.dl.tetrate.io/public/raw/versions/darwin-amd64-1.12.5-internal-rc2/tctl"
    sha256 "494eb9623e37983374ec91ac1e67683c0122446d5cf27a2fbbe3ec363a5e30aa" # Intel
  else
    url "https://binaries.dl.tetrate.io/public/raw/versions/darwin-arm64-1.12.5-internal-rc2/tctl"
    sha256 "ae9183f7b0e93b07282ecc2c928d28b46f607ac0d781a8162aaeada9c9d66f4a" # ARM
  end

  def install
    bin.install "tctl" => "tctl-1.12.5-internal-rc2"
    bin.install_symlink "tctl-1.12.5-internal-rc2" => "tctl@1.12.5-internal-rc2"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/tctl@1.12.5-internal-rc2 version 2>&1")
  end
end
