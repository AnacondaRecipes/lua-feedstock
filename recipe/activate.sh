#!/bin/bash
export LUA_PATH="$CONDA_PREFIX/share/lua/@PKG_VERSION@/?.lua;$CONDA_PREFIX/share/lua/@PKG_VERSION@/?/init.lua;./?.lua"
export LUA_CPATH="$CONDA_PREFIX/lib/lua/@PKG_VERSION@/?.so;./?.so"
