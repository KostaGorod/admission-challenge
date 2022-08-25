#!/bin/bash
#add fix to exercise6-fix here
#set -x

# last=${@:$#} # last argument 
# other=${*%${!#}} # all arguments except the last

#retries_limit=999 #hehehe
dest_directory="${@:$#}"
bytes=0
exit_now() {
    echo exiting now...
    echo 0 #no bytes transfered
    exit 0 #dont fail the run
}

# determinate which server to transfer to 
dest_server="server1"
if [ "$(hostname)" == "server1" ]
then
    dest_server="server2"
fi

#check if there's at lesat 2 vars
var_count=$(echo ${@} | wc -w)
if [[ "$var_count" -lt "2" ]]
then
    echo "Must be at least 2 variables, while the last one is the destination"
    exit_now
fi

#wait for connection
retries=0
stop=0
until [ $stop -eq 1 ]
    do
        ssh $dest_server exit > /dev/null 
        if [ $? -ne 0 ]; then
            echo "no ssh connection, retrying ($retries)..."
            sleep 5
            ((retries=retries+1))
        else
            echo "connection to $dest_server is successful"
            stop=1
        fi
        # if [[ $retries -ge $retries_limit ]]; then
        #     stop=1
        #     #echo "connection failed..."
        #     exit_now
        # fi
        #echo $status
    done




#count bytes
for var in "${@%${!#}}"
do
    #no support for folders (out of scope)
    if [[ -d $var ]]; then
        echo "$var not a file"
        exit_now
    fi
    
    #reset each iteration
    filebyte=0
    #making sure to skip the blank line
    if [ "$var" != "" ]; then
    #checking if can access file
        ls -la $var > /dev/null #supress output when exit 0
        lsla=$?
        if [ $lsla -ne 0 ]; then
            echo "can't copy $var"
            exit_now
        fi
        #counting bytes
        filebyte=$(ls -la $var| cut -d ' ' -f5)
        bytes=$(($bytes+$filebyte))
    fi
done


#transfer
echo "trying to run: rsync -azI" ${@%${!#}}""$dest_server":"$dest_directory""
rsync -azI "${@%${!#}}""$dest_server":"$dest_directory"
if [ $? -ne 0 ]; then
    echo "error occured while transfering"
    exit_now
else
    echo "transfered"
fi
echo $bytes
#exit 0 << not sure if will pass test.
