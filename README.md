<!-- Links -->

[evaera/moonwave]: https://github.com/evaera/moonwave
[upliftgames/wally]: https://github.com/upliftgames/wally
[url]: https://github.com/csqrl/url
[url/releases]: https://github.com/csqrl/url/releases
[url/wally]: https://wally.run/package/csqrl/url

<!-- Shields -->

[shields/github-release]: https://img.shields.io/github/v/release/csqrl/url?label=latest+release&style=flat
[shields/wally]: https://img.shields.io/endpoint?url=https://runkit.io/clockworksquirrel/wally-version-shield/branches/master/csqrl/url&color=blue&label=wally&style=flat

<!-- Badges -->

# URL

[![Latest GitHub version][shields/github-release]][url/releases] [![Latest Wally version][shields/wally]][url/wally]

Utility library for working with URLs in Luau.

## Documentation

Documentation, powered by [moonwave][evaera/moonwave], is available at https://csqrl.github.io/url.

## v0.x

For the time being, releases will remain at v0.x, and URL should not be considered 100% stable. This is in line with the [Semantic Versioning 2.0.0](https://semver.org) specification.

- Breaking changes may occur when the minor version is incremented.
- The patch version will be incremented for additions, non-breaking changes, and bug fixes.

This will remain the same until v1.x.

## Quick Start

URL is available from [Wally][url/wally] and [GitHub releases][url/releases].

### Wally

Wally is a CLI package manager (much like NPM, Yarn or Cargo) for Roblox by @UpliftGames. Find out more at https://github.com/upliftgames/wally.

```toml
# wally.toml

[dependencies]
URL = "csqrl/url@0.0.0"
```

```sh
$ wally install
```

### Manual Installation

Grab a copy from [GitHub releases][url/releases], and drop it into Studio.
