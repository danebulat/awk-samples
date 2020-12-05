#! /usr/bin/awk -f


BEGIN {
    format = "%20-s%s\n"
    printf format, "Filename", "Permissions"
    printf format, "--------", "-----------"
}

{ printf format, $NF, $1 }
