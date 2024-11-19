# SPX Issue Reproduction

This repository demonstrates the issue with SPX UI not showing up in FrankenPHP.
Issue reference: https://github.com/NoiseByNorthwest/php-spx/issues/258

## Setup

```bash
# Build and run the container
docker build -t frankenphp-spx .
docker run --rm -v $PWD:/app/public -p 80:80 -p 443:443 -p 443:443/udp --tty frankenphp-spx
```

## Testing SPX Web Interface (Not Working)

1. Run `composer update` to install dependencies
2. Visit https://localhost/?SPX_KEY=dev&SPX_UI_URI=/
3. Expected: SPX UI should appear
4. Actual: SPX UI doesn't show up

## Testing CLI Interface (Working)

1. Get container ID:
   ```bash
   docker ps
   ```
2. Run CLI test:
   ```bash
   docker exec -e SPX_ENABLED=1 -ti CONTAINER_ID php public/cli.php
   ```
3. You should see SPX profiling output in the terminal
