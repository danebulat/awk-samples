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
    if (NR == 1)
        next

    printf format, $NF, $1 
    ++count
}

END {
    # Print total file count
    printf "\n\tFile count: %i\n\n", count
}

