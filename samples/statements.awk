#! /usr/bin/awk -f

{
    print "Filename:", $NF
    print "\tOwner:", ($3 == "" ? "--" : $3)
}
