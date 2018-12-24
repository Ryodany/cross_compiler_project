#!/bin/bash

error() {
	echo Installation failed
	exit 1
}

echo Installing libraries..
if ! cp -r debug_bin_unix/*.a /usr/local/lib ; then
	error
fi
if ! cp -r debug_bin_unix/*.so* /usr/local/lib ; then
	error
fi

echo Libraries installed
exit 0

