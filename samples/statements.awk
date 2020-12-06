#! /usr/bin/awk -f

# Usage:
# ls -l | ./statements.awk

{
    print "Filename:", $NF
    print "\tOwner:", ($3 == "" ? "--" : $3)
}
