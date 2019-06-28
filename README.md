## Wait for another service to become healthy

`./wait-for-healthy` is a script designed to synchronize services like docker containers. It is [sh](https://en.wikipedia.org/wiki/Bourne_shell) and [alpine](https://alpinelinux.org/) compatible. It was inspired by [vishnubob/wait-for-it](https://github.com/vishnubob/wait-for-it) and [eficode/wait-for](https://github.com/eficode/wait-for).

When using this tool, you only need to pick the `wait-for-healthy` file as part of your project.

[![Build Status](https://travis-ci.org/ninjaneers-team/wait-for-healthy.svg?branch=master)](https://travis-ci.org/ninjaneers-team/wait-for-healthy)

## Usage

```
./wait-for-healthy url [-m method] [-t timeout] [-- command args]
  -q | --quiet                        Do not output any status messages
  -m | --method                       Set HTTP method (Default: GET)
  -t TIMEOUT | --timeout=timeout      Timeout in seconds, zero for no timeout
  -- COMMAND ARGS                     Execute command with args after the test finishes
```

**Important**: cUrl needs to be installed

## Examples

To check if [ninjaneers.de](https://ninjaneers.de) is healthy:

```
$ ./wait-for-healthy ninjaneers.de GET -- echo "Ninjaneers site is up"

Connection to ninjaneers.de [tcp/http] succeeded!
Ninjaneers site is up
```

To check any service which respond to a POST request healthy status (200, 201 HTTP status code):

```
$ ./wait-for-healthy anyservice:9000/api/status -m POST -- echo "Service is up and healthy"

Connection to anyservice:9000/api/status [tcp/http] succeeded!
Service site is healthy
```

## Testing

Ironically testing is done using [bats](https://github.com/sstephenson/bats), which on the other hand is depending on [bash](https://en.wikipedia.org/wiki/Bash_(Unix_shell)).

    docker build -t wait-for-healthy .
    docker run -t wait-for-healthy


