#!/bin/bash



#files=( "/etc/passwd" "/etc/group" "/etc/hosts" )
#printf "%s\n" "${files[@]}"

url=("https://www.youtube.com/watch?v=NSssW0duUkQ&list=PLS1QulWo1RIaJECMeUT4LFwJ-ghgoSH6n&index=16" "https://www.youtube.com/watch?v=K17DGXWqYDM&index=18&list=PLS1QulWo1RIaJECMeUT4LFwJ-ghgoSH6n" "https://www.youtube.com/watch?v=R4hQkcjDbDw&list=PLS1QulWo1RIaJECMeUT4LFwJ-ghgoSH6n&index=19" "https://www.youtube.com/watch?v=BTzav965P7w&index=20&list=PLS1QulWo1RIaJECMeUT4LFwJ-ghgoSH6n" )
#ns=( 192.168.1.10 192.168.1.12 )

for var in "${url[@]}"
do
  ./video_downloads.pl ${var}
  echo "${var} Downloaded"
  # do something on $var
done


