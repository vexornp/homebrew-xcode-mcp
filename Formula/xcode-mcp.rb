class XcodeMcp < Formula
  desc "MCP server that drives xcodebuild and parses build diagnostics"
  homepage "https://github.com/vexornp/XcodeMcp"
  url "https://github.com/vexornp/XcodeMcp/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "bd9861c83f0d186cb92d85e1fdc437783fdaedd80d1d53a72162db2288290430"
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
