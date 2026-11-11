# Official 0xinsider CLI and MCP server, packaged from the npm release.
class Oxinsider < Formula
  desc "Official CLI and MCP server for 0xinsider Polymarket sports analytics"
  homepage "https://0xinsider.com/developers"
  url "https://registry.npmjs.org/@0xinsider/mcp/-/mcp-3.22.0.tgz"
  sha256 "20140da90a9aabd7c86bed76df41d09813ff2512a5c43b22c483303147888808"
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
