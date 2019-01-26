# mini-indexes for cweb programs

the `master` branch of this project is a clone of Donald Knuth's
[ctwill](ftp://ftp.cs.stanford.edu/pub/ctwill) processor (that's
`ftp://ftp.cs.stanford.edu/pub/ctwill` as long as github doesn't support ftp
hosts). technically, `ctwill` is an extended version of the `cweave` program
from the
[cweb](https://github.com/ascherer/cweb) package. DEK uses this version – in
cooperation with the `refsort` and `twinx` tools and the special TeX macros
provided here – for producing printed books of his major cweb packages like
[the stanford graphbase](https://github.com/ascherer/sgb),
[mmix](https://github.com/ascherer/mmix), and cweb itself.

the process of using `ctwill` et al. seems to be quite involved, so you'll have
to dig into the code and documentation yourself, if you are brave enough to
experiment with this stuff.

the `local` branch of this project reworks the main sources and the build
process completely. the archival `diffs` files are mogrified into genuine
changefiles applicable to the original `cweave`, `common`,  and `prod` modules
from `cweb`. it also applies some spit and polish to the sources in order to
enable a clean compilation with gcc.

# news flash 2019

this project has come to an end. `ctwill` and its utilities has been fully integrated in the
[cwebbin](https://github.com/ascherer/cwebbin)
project and is now also part of the
[tex live](https://github.com/TeX-Live/texlive-source)
distribution.
