#!/bin/sh

# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# + Example build script for OS X                               +
# +                                                             +
# + Change the following assignments to adapt them to           +
# + your local settings:                                        +
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# The directory where the DLL will be built
build_dir="/tmp"

# My Acrobat Pro (2017) extension directory
target_dir="${HOME}/Library/Application Support/Adobe/Acrobat/11.0/Plug-ins"

# The delivery script
script="${HOME}/Lisp/pdf-plugin-tools/deliver.lisp"

# The LispWorks executable
lispworks="/Applications/LispWorks 6.0/LispWorks.app/Contents/MacOS/lispworks-6-0-0-macos-universal"

# The name of the plug-in (the .fmplugin file)
name=PDFLisp

# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# + Don't change anything below this point.                     +
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

cd "$build_dir"
if [ $? -eq 0 ]
then
  "$lispworks" -build "$script" "$name" "$build_dir"
  if [ $? -eq 0 ]
  then
    rm -rf "$target_dir/$name.acroplugin"
    mv "$build_dir/$name.acroplugin" "$target_dir/$name.acroplugin"
   if [ $? -ne 0 ]
   then
      echo "Couldn't copy the bundle to $target_dir."
   fi
  else
    echo "Couldn't build the loadable bundle."
  fi
else
  echo "Couldn't change to directory $build_dir."
fi
