# name your files here
source_file='hello.c'
target_file='hello'

# set up variables for file-names
cdate=$(date +%Y%m%dT%H%M%s)
backuptargetname=$target_file$cdate
backupsourcename=$source_file$cdate


## crappy loop that does versioning, checks mtime on file to see 
## if hello.c is modified newer than 'hello' - if so then move it to old_targets 
## dir and remake with clang 
printf '\n%s\n' "Checking if main.c is newer than main binary"
if [ "$source_file" -nt "$target_file" ]
then
    printf '%s\n\n' "$source_file is newer than $target_file , moving old to $newtargetname
    and compiling"
    mv $target_file old_targets/$backuptargetname
    cp $source_file old_targets/$backupsourcename
    time clang $source_file -o $target_file
    chmod 744 ./$target_file

fi


# if we made it this far, start the program
printf '\n%s\n' "Loading main binary "
./$target_file
echo "done"
