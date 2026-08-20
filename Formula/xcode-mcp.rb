# TEMPLATE — rendered by .github/workflows/release.yml on tag push.
# The real formula (with TAG + SHA256 substituted) lives in:
#   https://github.com/vexornp/homebrew-xcode-mcp
#
# Users install via:
#   brew tap vexornp/xcode-mcp
#   brew install xcode-mcp
# Or one-liner:
#   brew install vexornp/xcode-mcp/xcode-mcp

class XcodeMcp < Formula
  desc "MCP server that drives xcodebuild and parses build diagnostics"
  homepage "https://github.com/vexornp/XcodeMcp"
  url "https://github.com/vexornp/XcodeMcp/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "ce7993975f47ffc145d04c5943c99305519033fb902d979b98f1a96ff2f9c98b"
  license "MIT"
  head "https://github.com/vexornp/XcodeMcp.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/xcode-mcp")
  end

  test do
    assert_match "xcode-mcp", shell_output("#{bin}/xcode-mcp --version")
  end
end
