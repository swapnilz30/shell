#!/bin/bash

err_msg()
{
    echo "Specify the parameter.Check the following example."
    echo "Example: sh git_push.sh -p <repo_path> -m <"Enter commit msg>" -d <branch_name>"
    exit 1
}
while getopts p:m:d: name
do
	case $name in
	    p)
	        repo_path="$OPTARG"
	    ;;
		m)
			git_msg="$OPTARG"
		;;
    	d)
			git_branch=$OPTARG
		;;
   		?)
			err_msg
          	;;
    esac
done;

if [[ ! -z $git_msg ]] && [[ ! -z $git_branch ]] && [[ ! -z $repo_path  ]]; then
    if [[ ! -d $repo_path ]]; then
        git add /Users/CyberSponse/PycharmProjects/$repo_path
        cd /Users/CyberSponse/PycharmProjects/$repo_path
        git commit -m "$git_msg"
        git push origin "$git_branch"
    fi
else
    err_msg
fi
