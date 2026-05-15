# dev-shells

Reusable [Nix flake](https://nixos.wiki/wiki/Flakes) dev shells. Activate a
dev environment in any project with a single line — no local `flake.nix`
required.

## Usage

### With direnv

Add one line to your project's `.envrc`:

```bash
use flake "github:sbfaulkner/dev-shells#ruby"
```

Then run `direnv allow`. direnv will fetch the shell definition directly from
this repo and activate it whenever you enter the directory.

### With `nix develop`

```bash
nix develop "github:sbfaulkner/dev-shells#ruby"
```

## Available shells

| Shell  | Packages                              | Description                             |
|--------|---------------------------------------|-----------------------------------------|
| `ruby` | `ruby`, `libyaml`, `sqlite`            | Latest stable Ruby with common native deps      |
| `go`   | `go`, `gotools`, `ragel`               | Latest stable Go with tools and Ragel           |

## Supported systems

- `aarch64-darwin` (Apple Silicon)
- `x86_64-darwin` (Intel Mac)

## Development

To work on this repo locally:

```bash
git clone https://github.com/sbfaulkner/dev-shells
cd dev-shells
nix flake show   # inspect available outputs
nix develop .#ruby  # try a shell locally
```
