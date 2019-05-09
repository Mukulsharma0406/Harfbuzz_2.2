#!/bin/sh
# changing the permission of all files and folder as compilation process creates new files and folders
chmod 755 *

# Configuring Harfbuzz build with disabling default and optional components which are not required
./autogen.sh
echo "Harfbuzz Release build for x86_64 starts"
CC='clang' CXX='clang++ ' CXXFLAGS='-stdlib=libc++' ./configure --with-freetype=no --with-glib=no --with-cairo=no --with-fontconfig=no --enable-static


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

cd ../..

mkdir -p Libraries/IOS/release/x86_64/dynamic
mkdir -p Libraries/IOS/release/x86_64/static

cd -

cp -f src/.libs/libharfbuzz.0.dylib ../../Libraries/IOS/release/x86_64/dynamic/libharfbuzz.dylib
cp -f src/.libs/libharfbuzz.a ../../Libraries/IOS/release/x86_64/static/libharfbuzz.a

echo "Harfbuzz Release build process for x86_64 ends"

echo "----------------------------------------------------------------------------------"

reset

echo "Harfbuzz Release build for arm64 starts"

export MACOSX_DEPLOYMENT_TARGET=10.8
CC='clang' CXX='clang++' LD=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/ld LDFLAGS='-miphoneos-version-min=9.0 -v -arch arm64 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk' AS=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/as AR=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/ar LIBTOOL=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/libtool CXXFLAGS='-miphoneos-version-min=9.0 -v -stdlib=libc++ -pipe -arch arm64 -no-cpp-precomp -I/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/usr/include -I./include/  -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk -Wl,-headerpad_max_install_names' CFLAGS='-miphoneos-version-min=9.0 -v -pipe -arch arm64 -no-cpp-precomp -I/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/usr/include -I./include/  -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk -Wl,-headerpad_max_install_names' ./configure --with-freetype=no --with-glib=no --with-cairo=no --with-fontconfig=no --enable-static=yes --host=arm-apple-darwin --with-icu=no


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

cd ../..

mkdir -p Libraries/IOS/release/arm64/dynamic
mkdir -p Libraries/IOS/release/arm64/static

cd -

cp -f src/.libs/libharfbuzz.0.dylib ../../Libraries/IOS/release/arm64/dynamic/libharfbuzz.dylib
cp -f src/.libs/libharfbuzz.a ../../Libraries/IOS/release/arm64/static/libharfbuzz.a

echo "Harfbuzz Release build process for arm64 ends"



echo "Harfbuzz Debug build for x86_64 starts"
CC='clang' CXX='clang++' CXXFLAGS='-stdlib=libc++' ./configure --with-freetype=no --with-glib=no --with-cairo=no --with-fontconfig=no --enable-static CPPFLAGS=-DDEBUG CXXFLAGS="-g -O0"

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

cd ../..

mkdir -p Libraries/IOS/debug/x86_64/dynamic
mkdir -p Libraries/IOS/debug/x86_64/static

cd -

cp -f src/.libs/libharfbuzz.0.dylib ../../Libraries/IOS/debug/x86_64/dynamic/libharfbuzz.dylib
cp -f src/.libs/libharfbuzz.a ../../Libraries/IOS/debug/x86_64/static/libharfbuzz.a

echo "Harfbuzz Debug build process for x86_64 ends"

echo "Harfbuzz Debug build for arm64 starts"
CC='clang' CXX='clang++' LD=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/ld LDFLAGS='-miphoneos-version-min=9.0 -v -arch arm64 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk' AS=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/as AR=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/ar LIBTOOL=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/libtool CPPFLAGS=-DDEBUG CXXFLAGS='-g -O0 -miphoneos-version-min=9.0 -v -stdlib=libc++ -pipe -arch arm64 -no-cpp-precomp -I/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/usr/include -I./include/  -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk -Wl,-headerpad_max_install_names' CFLAGS='-miphoneos-version-min=9.0 -v -pipe -arch arm64 -no-cpp-precomp -I/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/usr/include -I./include/  -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk -Wl,-headerpad_max_install_names' ./configure --with-freetype=no --with-glib=no --with-cairo=no --with-fontconfig=no --enable-static=yes --host=arm-apple-darwin --with-icu=no


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

cd ../..

mkdir -p Libraries/IOS/debug/arm64/dynamic
mkdir -p Libraries/IOS/debug/arm64/static

cd -

cp -f src/.libs/libharfbuzz.0.dylib ../../Libraries/IOS/debug/arm64/dynamic/libharfbuzz.dylib
cp -f src/.libs/libharfbuzz.a ../../Libraries/IOS/debug/arm64/static/libharfbuzz.a

echo "Harfbuzz debug build process for arm64 ends"

cd ../../Libraries/IOS/debug
lipo -create arm64/static/libharfbuzz.a x86_64/static/libharfbuzz.a -o libharfbuzzfat.a

cd ../release 
lipo -create arm64/static/libharfbuzz.a x86_64/static/libharfbuzz.a -o libharfbuzzfat.a