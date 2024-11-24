# FrankenPHP & SPX integration

This repository provides a Docker-based infrastructure which can help to reproduce or debug issues related to the integration of FrankenPHP with SPX.

## Setup

First make sure that you have a clone of php-spx located at this relative path `../php-spx`.

Then run the following command to build the image:

```bash
./build.sh
```

And then run FrankenPHP:

```bash
docker run --rm -v $PWD:/app/public -p 8501:80 -p 8500:443 -p 8500:443/udp --cap-add=SYS_PTRACE --tty --name frankenphp-spx frankenphp-spx
> c (continue) / bt (backtrace)
```

## Starting a debugging session

Run the follwowing command to attach GDB to the FrankendPHP process (frankenphp-spx's PID1):

```bash
docker exec -it frankenphp-spx gdb -p 1
```

Then, in GDB's prompt, you will be able to enter commands such as `c` (continue) or `bt` (stack's backtrace).

## Testing SPX Web Interface

Run `composer update` to install dependencies:

```bash
docker exec frankenphp-spx bash -c  'cd public ; composer update'
```

Then you can access to SPX's web UI here https://localhost:8500/?SPX_KEY=dev&SPX_UI_URI=/

## Testing CLI Interface (Working)

Run CLI test:

```bash
docker exec -e SPX_ENABLED=1 -ti CONTAINER_ID php public/cli.php
```

You should see SPX profiling output in the terminal
