# cddadockerwin
Docker image for cross compiling Catalcysm for Windows

## Use it
The image expects to find the Cataclysm-DDA source code in /tmp, so map your local path to /tmp in the image. You can then run make and pass flags as discussed in [COMPILING.MD](https://github.com/CleverRaven/Cataclysm-DDA/blob/master/COMPILING.md#make-flags).

Note that if built with LUA=1, the LUA_BINARY flag must be set to lua5.3, e.g. `LUA_BINARY=lua5.3`

A complete example is as follows:

```
docker run --rm -v /path/to/Cataclysm-DDA:/tmp ralreegorganon/cddadockerwin make RELEASE=1 TILES=1 SOUND=1 LUA=1 LOCALIZE=1 LUA_BINARY=lua5.3
```