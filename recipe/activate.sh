#!/bin/bash
export LUA_PATH="$CONDA_PREFIX/share/lua/5.4/?.lua;$CONDA_PREFIX/share/lua/5.4/?/init.lua;./?.lua"
export LUA_CPATH="$CONDA_PREFIX/lib/lua/5.4/?.so;./?.so"
