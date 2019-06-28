#!/usr/bin/env bats

@test "google should be immediately found" {
  run ./wait-for-healthy https://www.google.com/ -- echo 'success'
  
  [ "$output" = "success" ]
}

@test "google should be immediately found with HTTP method GET" {
  run ./wait-for-healthy https://www.google.com/ -m GET -- echo 'success'
  
  [ "$output" = "success" ]
}

@test "google should be immediately found with HTTP method (--method) GET" {
  run ./wait-for-healthy https://www.google.com/ --method=GET -- echo 'success'
  
  [ "$output" = "success" ]
}


@test "httpbin should respond with 200 with HTTP method POST" {
  run ./wait-for-healthy https://httpbin.org/status/200 -m POST -- echo 'success'
  
  [ "$output" = "success" ]
}

@test "httpbin should respond with 201 with HTTP method PUT" {
  run ./wait-for-healthy https://httpbin.org/status/201 -m PUT -- echo 'success'
  
  [ "$output" = "success" ]
}

@test "nonexistent server should not start command" {
  run ./wait-for-healthy -t 1 noserver -m GET -- echo 'success'

  [ "$status" -ne 0 ]
  [ "$output" != "success" ]
}
