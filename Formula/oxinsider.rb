# Official 0xinsider CLI and MCP server, packaged from the npm release.
class Oxinsider < Formula
  desc "Official CLI and MCP server for 0xinsider Polymarket sports analytics"
  homepage "https://0xinsider.com/developers"
  url "https://registry.npmjs.org/@0xinsider/mcp/-/mcp-3.24.0.tgz"
  sha256 "e19401bb668a5d9ab7193768b44bd010b7de41b38a39430361a7a586a0749c47"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match "0xinsider", shell_output("#{bin}/0xinsider --help")
  end
end
