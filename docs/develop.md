# Development

TODO: write introduction about welcome to contribute

!!! danger
    magic does not support nightly, yet.
    We currently recommend following the [MAX nightly installation instructions](https://docs.modular.com/max/install) and use those globally installed binaries.

## MAX & Mojo

We will be using [`magic`](https://modul.ar/magic) to manage our package dependencies, including installing [MAX](https://www.modular.com/max) and [mojo](https://www.modular.com/mojo).
First, you can install `magic` with the following command.

```sh
curl -ssL https://modul.ar/magic-alpha | bash
```

## Dependencies

You can install all `tensorra` dependencies with the following command.

```bash
magic install -a
```

This will install all environments specified within `mojoproject.toml` into `.magic` directory.
You should only need to run this command once with a fresh clone.

## Magic

[Magic](https://modul.ar/magic) is built on top of [pixi](https://pixi.sh/latest/) and offers the same functionality.
There are a few commands that you will routinely use in your development.

-   **`magic run tests`** Run all tests in the `tests` directory.
-   **`magic run build`**: Will build `tensorra.mojopkg` in the `build` directory.
-   **`magic run -e docs serve`**: Start serving the mkdocs documentation.
    Changes will trigger a site refresh.
    We use `-e docs` to specify that we should include documentation dependencies.

!!! warning
    Instead of `pixi.toml`, we use `mojoproject.toml` which means you cannot use `pixi` commands directly.
    You can just replace `pixi` with `magic` from any resources.
