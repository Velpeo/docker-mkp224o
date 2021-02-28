# mkp224o - vanity address generator for ed25519 onion services

This tool generates vanity ed25519 ([hidden service version 3][v3],
formely known as proposal 224) onion addresses.

## To use, run:

Edit ``wordlist.txt`` to add desired filters for tor urls 
``nano wordlist.txt``

Run docker container with newly edited ``wordlist.txt`` interactively

``docker run -it -v `pwd`/results:/results -v `pwd`/wordlist.txt:/wordlist.txt velpeo/mkp224o``

- OR -
- 
Run docker container detach

``docker run -d -v `pwd`/results:/results -v `pwd`/wordlist.txt:/wordlist.txt velpeo/mkp224o``



### Requirements

* C99 compatible compiler (gcc and clang should work)
* libsodium (including headers)
* GNU make
* GNU autoconf (to generate configure script, needed only if not using release tarball)
* UNIX-like platform (currently tested in Linux and OpenBSD, but should
  also build under cygwin and msys2).

## Based of the work of

* https://github.com/cathugger/mkp224o
* https://github.com/realchrislovett/docker-mkp224o
* https://github.com/nwtgck/docker-mkp224o
* https://hub.docker.com/r/nwtgck/mkp224o
* https://hub.docker.com/r/alexhaydock/mkp224o

### Acknowledgements & Legal

To the extent possible under law, the author(s) have dedicated all
copyright and related and neighboring rights to this software to the
public domain worldwide. This software is distributed without any
warranty.
You should have received a copy of the CC0 Public Domain Dedication
along with this software. If not, see [CC0][].

* `keccak.c` is based on [Keccak-more-compact.c][keccak.c]
* `ed25519/{ref10,amd64-51-30k,amd64-64-24k}` are adopted from
  [SUPERCOP][]
* `ed25519/ed25519-donna` adopted from [ed25519-donna][]
* Idea used in `worker_fast()` is stolen from [horse25519][]
* base64 routines and initial YAML processing work contributed by
  Alexander Khristoforov (heios at protonmail dot com)
* Passphrase-based generation code and idea used in `worker_batch()`
  contributed by [foobar2019][]

[v3]: https://gitweb.torproject.org/torspec.git/plain/rend-spec-v3.txt
[OPTIMISATION]: ./OPTIMISATION.txt
[#27]: https://github.com/cathugger/mkp224o/issues/27
[keccak.c]: https://github.com/XKCP/XKCP/blob/master/Standalone/CompactFIPS202/C/Keccak-more-compact.c
[CC0]: https://creativecommons.org/publicdomain/zero/1.0/
[SUPERCOP]: https://bench.cr.yp.to/supercop.html
[ed25519-donna]: https://github.com/floodyberry/ed25519-donna
[horse25519]: https://github.com/Yawning/horse25519
[foobar2019]: https://github.com/foobar2019
