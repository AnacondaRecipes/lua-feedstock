for CHANGE in "activate" "deactivate"
do
	mkdir -p "${PREFIX}/etc/conda/${CHANGE}.d"
	cp "${RECIPE_DIR}/${CHANGE}.sh" "${PREFIX}/etc/conda/${CHANGE}.d/${PKG_NAME}_${CHANGE}.sh"
done

SHORT_VERSION="${PKG_VERSION%.*}"
sed -i.bak "s|@PKG_VERSION@|${SHORT_VERSION}|g" "${PREFIX}/etc/conda/activate.d/${PKG_NAME}_activate.sh"

if [ `uname` == Darwin ]; then
	make macosx INSTALL_TOP=$PREFIX MYCFLAGS="-fPIC -I$PREFIX/include" MYLDFLAGS="-Wl,-rpath,$PREFIX/lib"
	make macosx test
elif [ `uname` == Linux ]; then
	make linux INSTALL_TOP=$PREFIX MYCFLAGS="-fPIC -I$PREFIX/include -DLUA_USE_LINUX" MYLDFLAGS="-Wl,-rpath=$PREFIX/lib"
	make linux-readline test
fi
make install INSTALL_TOP=$PREFIX
