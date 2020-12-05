#! /usr/bin/awk -f

# Usage:
# ls -l | ./printf.awk

BEGIN {
    # Define a format for printf so we can re-use it in
    # multiple calls to printf.
    format = "%20-s%s\n"
    printf format, "Filename", "Permissions"
    printf format, "--------", "-----------"
}

{ 
    printf format, $NF, $1 
    ++count
}

END {
    # Decrement count to disregard the first line 
    # output by ls -l
    count -= 1

    # Print total file count
    printf "\n\tFile count: %i\n\n", count
}

