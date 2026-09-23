# Official 0xinsider CLI and MCP server, packaged from the npm release.
class Oxinsider < Formula
  desc "Official CLI and MCP server for 0xinsider Polymarket sports analytics"
  homepage "https://0xinsider.com/developers"
  url "https://registry.npmjs.org/@0xinsider/mcp/-/mcp-2.1.3.tgz"
  sha256 "edd078e85a27f40259db4c848bd18b4984f143413a6e275ef2b7592a2bbb17d5"
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
