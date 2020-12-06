#! /usr/bin/awk -f


# EXAMPLE USAGE:
#
# ls -la | ./filemod.awk
# ls -la | ./filemod.awk -v c=u
# ls -la | ./filemod.awk -v c=l
#
# ls -1 | awk -v c=u -f filemod.awk    # Convert files to uppercase
# ls -1 | awk -v c=l -f filemod.awk    # Convert files to lowercase
# ls -1 | awk -f filemod.awk           # Convert files to lowercase (default)

BEGIN {

    # Cache script name so it's not effected
    script_name = "filemod.awk"

    # Convert lowercase by default
    switch (c)
    {
    case "l":
        convertLower = 1
        break
    case "u":
        convertLower = 0
        break
    default:
        convertLower = 1
        break
    }

    # Output initiation message
    if (convertLower)
        print "\nInitiated lowercase conversion...\n"
    else 
        print "\nInitiated uppercase conversion...\n"
}

# Append each passed record to an array
$NF !~ /^\./ && $1 !~ /^(total)/ { 
    # Skip processing record if it's this script
    if ($NF == script_name)
        next
    
    # Add filename to array
    files[i++] = $NF

    # Output added message
    msg_added = "Added!"
    printf "\t%-25s %s\n", $NF, msg_added
}

END {

    # Print start message
    printf "\nStarting conversion of %i files...\n\n", length(files)

    # Print files that will be converted
    for (i in files)
    {
        # Cache filename
        filename = files[i]
        
        # Cache target filename
        if (convertLower) 
            target = tolower(filename)
        else 
            target = toupper(filename)
        
        # Check if filename is already in target case
        if (filename == target)
        {
            printf "\t%-25s --> %s\n", filename, "NO CHANGE"
        }
        else
        {
            # Run mv command in shell
            command = sprintf("mv %s %s\n", filename, target)
            system(command)

            # Output previous and new filename
            printf "\t%-25s --> %s\n", filename, target
        }
    }
    
    # Print end message
    printf("\nFinished conversion!\n\n") 
}
