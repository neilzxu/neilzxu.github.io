# Personal website

Since I don't know how to use Haskell or websites or front end, it seems useful to leave myself instructions on how to run this thing.

## Build

If I've made changes to `site.hs` / probably other future `*.hs` files as well, then I need to:
```
stack build
stack exec site rebuild
```

Otherwise, if I've only changed some non logic / Haskell files, then I only need to:
```
stack exec site build
```

## Run website locally



