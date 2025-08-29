class Tctl < Formula
  # Use fully qualified formula name to ensure our version is used
  conflicts_with "tctl", because: "Provides the same binary"
  
  desc "Tetrate Service Bridge Command Line Interface"
  homepage "https://docs.tetrate.io/service-bridge/reference/cli/guide/"
  version "1.12.5-internal-rc0"
  license "Commercial"

  if Hardware::CPU.intel?
    url "https://binaries.dl.tetrate.io/public/raw/versions/darwin-amd64-#{version}/tctl"
    sha256 "d4f94b0419bfd0d592d945c4dda2ec5f5a8d57d85dfc43c8a7fbfe8b6e9ea6eb" # Intel
  else
    url "https://binaries.dl.tetrate.io/public/raw/versions/darwin-arm64-#{version}/tctl"
    sha256 "1b115cdaf0d839b6c8431ce1ad79cbb466b8282cf5de6080237b4a3864583110" # ARM
  end

  def install
    bin.install "tctl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tctl version", 2)
  end
end
