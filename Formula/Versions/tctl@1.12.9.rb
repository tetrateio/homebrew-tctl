class TctlAT1129 < Formula
  desc "Tetrate Service Bridge Command Line Interface 1.12.9"
  homepage "https://docs.tetrate.io/service-bridge/reference/cli/guide/"
  version "1.12.9"
  license "Commercial"
  conflicts_with "tctl", because: "Provides the same binary"

  if Hardware::CPU.intel?
    url "https://binaries.dl.tetrate.io/public/raw/versions/darwin-amd64-1.12.9/tctl"
    sha256 "13d358f04d6fa99f288b1fb089c9e15e0201cf6b296252350a92db069467e23b" # Intel
  else
    url "https://binaries.dl.tetrate.io/public/raw/versions/darwin-arm64-1.12.9/tctl"
    sha256 "8fd5645d0b2c1ca4dd2541a2d16112d5338d77d97aa9a72d0de2846bfc02ea6b" # ARM
  end

  def install
    bin.install "tctl" => "tctl-1.12.9"
    bin.install_symlink "tctl-1.12.9" => "tctl@1.12.9"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/tctl@1.12.9 version 2>&1")
  end
end
