# Official 0xinsider CLI and MCP server, packaged from the npm release.
class Oxinsider < Formula
  desc "Official CLI and MCP server for 0xinsider Polymarket sports analytics"
  homepage "https://0xinsider.com/developers"
  url "https://registry.npmjs.org/@0xinsider/mcp/-/mcp-3.18.0.tgz"
  sha256 "661e985f5726341020593c03438390197ef7e36ff7dc14fbab80833c669d000a"
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
