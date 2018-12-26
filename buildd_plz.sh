#!/bin/bash

core_lib=core
if ! plz build //:$core_lib -c=dbg ; then
	echo Error occurred building $core_lib
	exit 1
fi

plz_out_dir=plz-out/bin
if ! chmod u+w $plz_out_dir/$core_lib.so ; then
	echo Error changing permissions on $core_lib
	exit 1
fi

if ! objcopy --only-keep-debug $plz_out_dir/$core_lib.so $plz_out_dir/$core_lib.debug ; then
	echo Error getting debug symbols from shared object $core_lib
	exit 1
fi
if ! strip $plz_out_dir/core.so ; then
	echo Error stripping debug symbols from $core_lib
	exit 1
fi

echo Build done successfully
