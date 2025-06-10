CHANGE="deactivate"
mkdir -p "${PREFIX}/etc/conda/${CHANGE}.d"
cp "${RECIPE_DIR}/${CHANGE}.sh" "${PREFIX}/etc/conda/${CHANGE}.d/${PKG_NAME}_${CHANGE}.sh"

CHANGE="activate"
mkdir -p "${PREFIX}/etc/conda/${CHANGE}.d"
cp "${RECIPE_DIR}/${CHANGE}.sh" "${PREFIX}/etc/conda/${CHANGE}.d/${PKG_NAME}_${CHANGE}.sh"
sed -i.bak "s|@PKG_VERSION@|${PKG_VERSION}|g" "${PREFIX}/etc/conda/${CHANGE}.d/${PKG_NAME}_${CHANGE}.sh"
sed -i.bak "s|@SHLIB_EXT@|${SHLIB_EXT}|g" "${PREFIX}/etc/conda/${CHANGE}.d/${PKG_NAME}_${CHANGE}.sh"

if [ `uname` == Darwin ]; then
	make macosx INSTALL_TOP=$PREFIX MYCFLAGS="-fPIC -I$PREFIX/include" MYLDFLAGS="-Wl,-rpath,$PREFIX/lib"
	make macosx test
elif [ `uname` == Linux ]; then
	make linux INSTALL_TOP=$PREFIX MYCFLAGS="-fPIC -I$PREFIX/include -DLUA_USE_LINUX" MYLDFLAGS="-Wl,-rpath=$PREFIX/lib"
	make linux-readline test
fi
make install INSTALL_TOP=$PREFIX
