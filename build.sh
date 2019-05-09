#!/bin/sh
# changing the permission of all files and folder as compilation process creates new files and folders
chmod 755 *

# After unzip tar file, run autogen to to configure with default flags.
./autogen.sh

# Configuring Harfbuzz build with disabling default and optional components which are not required

echo "Harfbuzz Release build starts"
CXXFLAGS='-stdlib=libc++' ./configure --with-freetype=no --with-glib=no --with-cairo=no --with-fontconfig=no --enable-static

make clean
make

# In this folder output Harfbuzz libs are placed
cd src/.libs

# In output console print execubatble path of all dependent components  
otool -L libharfbuzz.0.dylib 
retval=$?

if [ $retval = "0" ]; then
	install_name_tool -id "@executable_path/../Frameworks/libharfbuzz.dylib" libharfbuzz.0.dylib
	# In output console print the changes executable path for libharfbuzz.dylib
	otool -L libharfbuzz.0.dylib 
	echo "Harfbuzz build is placed at src/.libs/libharfbuzz.0.dylib"
fi

cd ../..

cp -f src/.libs/libharfbuzz.0.dylib ../../Libraries/Mac/intel_64/release/dynamic/libharfbuzz.dylib
cp -f src/.libs/libharfbuzz.a ../../Libraries/Mac/intel_64/release/static/libharfbuzz.a

echo "Barfbuzz Release build process ends"

echo "----------------------------------------------------------------------------------"

echo "Harfbuzz Debug build starts"
CXXFLAGS='-stdlib=libc++' ./configure --with-freetype=no --with-glib=no --with-cairo=no --with-fontconfig=no --enable-static CPPFLAGS=-DDEBUG CXXFLAGS="-g -O0"

make clean
make

# In this folder output Harfbuzz libs are placed
cd src/.libs

# In output console print execubatble path of all dependent components  
otool -L libharfbuzz.0.dylib 
retval=$?

if [ $retval = "0" ]; then
	install_name_tool -id "@executable_path/../Frameworks/libharfbuzz.dylib" libharfbuzz.0.dylib
	# In output console print the changes executable path for libharfbuzz.dylib
	otool -L libharfbuzz.0.dylib 
	echo "Harfbuzz build is placed at src/.libs/libharfbuzz.0.dylib"
fi

cd ../..

cp -f src/.libs/libharfbuzz.0.dylib ../../Libraries/Mac/intel_64/debug/dynamic/libharfbuzz.dylib
cp -f src/.libs/libharfbuzz.a ../../Libraries/Mac/intel_64/debug/static/libharfbuzz.a

echo "Harfbuzz Debug build process ends"
