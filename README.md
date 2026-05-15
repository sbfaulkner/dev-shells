# dev-shells

Reusable [Nix flake](https://nixos.wiki/wiki/Flakes) dev shells. Activate a
dev environment in any project with a single line — no local `flake.nix`
required.

## Usage

### With direnv

Add to your project's `.envrc`:

```bash
use flake "github:sbfaulkner/dev-shells#ruby-3-3"
```

Shells compose freely — just add more `use flake` lines:

```bash
use flake "github:sbfaulkner/dev-shells#ruby-3-3"
use flake "github:sbfaulkner/dev-shells#sqlite"
```

Nix's content-addressed store ensures shared packages are never duplicated on
disk regardless of how many shells reference them.

Then run `direnv allow`.

### With `nix develop`

```bash
nix develop "github:sbfaulkner/dev-shells#ruby-3-3"
```

## Available shells

### Language shells

| Shell  | Packages           | Description                                     |
|--------|--------------------|-------------------------------------------------|
| `ruby-3-3` | `ruby_3_3`, `libyaml` | Ruby 3.3 with libyaml (native YAML support)      |
| `ruby-3-4` | `ruby_3_4`, `libyaml` | Ruby 3.4 with libyaml (native YAML support)      |
| `go-1-24`  | `go_1_24`, `gotools`  | Go 1.24 with standard dev tools (goimports etc.) |
| `go-1-25`  | `go_1_25`, `gotools`  | Go 1.25 with standard dev tools (goimports etc.) |

### Addon shells

| Shell    | Packages  | Description                        |
|----------|-----------|------------------------------------|
| `sqlite` | `sqlite`  | SQLite database and CLI             |
| `ragel`  | `ragel`   | Ragel state machine compiler        |

Helper binaries

The flake also provides small helper programs that are available inside the
corresponding dev shells:

- `ruby-bundle` — runs `bundle check` and `bundle install --path vendor/bundle` (installs into `vendor/bundle` by default) if gems are missing
- `go-mod`     — runs `go list -m all` and `go mod download` if modules are missing

These helpers are on PATH when you `nix develop` or `use flake` the language
shells, so a typical `.envrc` looks like:

```bash
use flake "github:sbfaulkner/dev-shells#ruby-3-4"
use flake "github:sbfaulkner/dev-shells#sqlite"

watch_file Gemfile
watch_file Gemfile.lock

# run the helper to ensure gems are installed (fast if already present)
ruby-bundle
```

Or for Go:

```bash
use flake "github:sbfaulkner/dev-shells#go-1-25"
use flake "github:sbfaulkner/dev-shells#ragel"

watch_file go.mod
watch_file go.sum

# ensure modules are downloaded
go-mod
```

## Supported systems

- `aarch64-darwin` (Apple Silicon)
- `x86_64-darwin` (Intel Mac)

## Development

To work on this repo locally:

```bash
git clone https://github.com/sbfaulkner/dev-shells
cd dev-shells
nix flake show      # inspect available outputs
nix develop .#ruby-3-3  # try a shell locally
```
