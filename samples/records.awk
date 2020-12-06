#! /usr/bin/awk -f

# Description
# --------------------
#     Output the first 10 records in the passed input files
#
# Usage
# --------------------
#     $ ./records.awk input-file1 input-file2 ...


{
    print $0
    
    if (FNR == 10) {
        printf "\n\t%i records read in %s\n\n", FNR, FILENAME
        nextfile
    }
}

END {
    print "\tTotal records read:", NR
}
