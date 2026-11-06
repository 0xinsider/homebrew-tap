# 0xinsider Homebrew tap

Official Homebrew formulae for [0xinsider](https://0xinsider.com/developers), Polymarket analytics for sports and esports.

```sh
brew install 0xinsider/tap/oxinsider
0xinsider --help
```

The formula installs the `0xinsider` and `0xinsider-mcp` commands from the official npm package [`@0xinsider/mcp`](https://www.npmjs.com/package/@0xinsider/mcp): the CLI and the stdio MCP server. It depends on Homebrew's `node`.

## How releases reach the formula

The formula follows the npm `latest` of `@0xinsider/mcp` without a person in the loop. The [Follow npm](.github/workflows/follow-npm.yml) workflow runs every hour at minute 23, and on demand:

1. It reads `latest` from the npm registry, checks the tarball against npm's sha512 integrity, and computes its sha256.
2. It rewrites the formula's `url` and `sha256` together, then runs `brew audit --strict --online`, `brew install` and `brew test` on Linux and macOS.
3. Only when all of them pass does it commit the formula to `main`. A failure fails the run and leaves `main` as it was.

A new npm release reaches `brew upgrade 0xinsider/tap/oxinsider` within about an hour. To pick one up sooner, run the workflow by hand:

```sh
gh workflow run follow-npm.yml -R 0xinsider/homebrew-tap
```

Compare the two versions to check that the formula is current:

```sh
brew info 0xinsider/tap/oxinsider --json=v2 | jq -r '.formulae[0].versions.stable'
npm view @0xinsider/mcp version
```

GitHub disables a scheduled workflow in a public repository after 60 days without repository activity. If the formula lags npm and the workflow shows as disabled, re-enable it with `gh workflow enable follow-npm.yml -R 0xinsider/homebrew-tap`, then run it.

## Links

- API keys and setup: https://0xinsider.com/developers
- Authentication: https://0xinsider.com/auth.md
- Documentation: https://docs.0xinsider.com
- Go SDK: https://github.com/0xinsider/0xinsider-go
- Node.js and TypeScript SDK: https://github.com/0xinsider/0xinsider-node
- Rust SDK: https://github.com/0xinsider/0xinsider-rust
