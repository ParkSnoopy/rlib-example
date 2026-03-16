
pushd mydep

SETLOCAL
set RUSTFLAGS=-Cllvm-args=--irobf -Cllvm-args=--irobf-indbr -Cllvm-args=--irobf-icall -Cllvm-args=--irobf-indgv -Cllvm-args=--irobf-cse -Cllvm-args=--irobf-fla -Cllvm-args=--irobf-cie -Cllvm-args=--irobf-cfe
cargo +ollvm build --release
set RUSTFLAGS=
ENDLOCAL

popd

:: This `+ollvm` is for match pre-compiled rlib's rust version and 
::   this project's rust version
:: If compile with non-dev toolchain, may omit error:

::   error[E0514]: found crate `mydep` compiled by an incompatible version of rustc
::    --> src\main.rs:2:5
::     |
::   2 | use mydep;
::     |     ^^^^^
::     |
::     = note: the following crate versions were found:
::             crate `mydep` compiled by rustc 1.96.0-dev: \\?\C:\Users\ParkSnoopy\Desktop\rlib-example\mydep\target\release\libmydep.rlib
::     = help: please recompile that crate using this compiler (rustc 1.93.1 (01f6ddf75 2026-02-11)) (consider running `cargo clean` first)

cargo +ollvm rustc --release -- --extern mydep=mydep\target\release\libmydep.rlib
target\release\myproject.exe

::  MY_FIB_20: 6765 (108.6µs)
::  MY_FIB_20: 6765 (98.7µs)
::  MY_FIB_20: 6765 (105.4µs)
::  MY_FIB_20: 6765 (111.3µs)
::  MY_FIB_20: 6765 (125.8µs)
::  MY_FIB_20: 6765 (131.1µs)
::  MY_FIB_20: 6765 (123.9µs)
::  MY_FIB_20: 6765 (128.7µs)
::  MY_FIB_20: 6765 (112.2µs)
::  MY_FIB_20: 6765 (119µs)
:: DEP_FIB_20: 6765 (1.9846ms)
:: DEP_FIB_20: 6765 (3.1141ms)
:: DEP_FIB_20: 6765 (1.5865ms)
:: DEP_FIB_20: 6765 (1.3265ms)
:: DEP_FIB_20: 6765 (1.1987ms)
:: DEP_FIB_20: 6765 (1.7689ms)
:: DEP_FIB_20: 6765 (1.2198ms)
:: DEP_FIB_20: 6765 (1.6598ms)
:: DEP_FIB_20: 6765 (1.2669ms)
:: DEP_FIB_20: 6765 (1.6407ms)
::  MY_FIB_20: 6765 (131.6µs)
::  MY_FIB_20: 6765 (79.2µs)
::  MY_FIB_20: 6765 (78.1µs)
::  MY_FIB_20: 6765 (80.8µs)
::  MY_FIB_20: 6765 (72.3µs)
::  MY_FIB_20: 6765 (75.3µs)
::  MY_FIB_20: 6765 (78.8µs)
::  MY_FIB_20: 6765 (73µs)
::  MY_FIB_20: 6765 (69.6µs)
::  MY_FIB_20: 6765 (81.3µs)
:: DEP_FIB_20: 6765 (1.2752ms)
:: DEP_FIB_20: 6765 (1.3465ms)
:: DEP_FIB_20: 6765 (1.2563ms)
:: DEP_FIB_20: 6765 (1.3665ms)
:: DEP_FIB_20: 6765 (1.3432ms)
:: DEP_FIB_20: 6765 (1.3891ms)
:: DEP_FIB_20: 6765 (1.2855ms)
:: DEP_FIB_20: 6765 (1.3207ms)
:: DEP_FIB_20: 6765 (1.207ms)
:: DEP_FIB_20: 6765 (1.0585ms)
