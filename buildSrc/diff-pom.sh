#!/bin/bash

current_version=3.4.20210509072026
next_version=3.5.0-SNAPSHOT

basedir=$HOME/.m2/repository/io/crnk

for path in $basedir/*; do
	name=$(basename $path)
	current_path=$path/$current_version/${name}-${current_version}.pom
	next_path=$path/$next_version/${name}-${next_version}.pom
	echo "diff ${current_path} ${next_path}"
	diff --strip-trailing-cr ${current_path} ${next_path}
done
