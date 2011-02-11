#!/bin/bash

# Usage:
# bash scp.sh -e 
#	easy input
# bash scp.sh -s -f filename -d directory
#	note: directory can be "." for the home directory

USERNAME="ENTER YOUR USERNAME HERE (e.g. flast5)"

#echo "OPTIND starts at $OPTIND"
while getopts ":esf:d:" optname
  do
    case "$optname" in
	  "e")
		echo "Please, enter the name of the file you'd like to send:"
		read FILE
		echo "Please, enter the name of the sub-directory into which you'd like to put the file:"
		read DIR
		#echo "$FILE $USERNAME@linux.cs.mcgill.ca:/home/2011/pmoore6/$DIR"
		scp $FILE $USERNAME@linux.cs.mcgill.ca:/home/2011/pmoore6/$DIR
		COMPLETED=true
		break
		;;
	  "s")
	    #echo "Option $optname activated."
		SETTINGS=true
		COMPLETED=false
	    ;;
      "f")
        #echo "Option $optname has value $OPTARG"
		if [ $SETTINGS == true ]
			then
				FILE=$OPTARG
		fi
		#echo $FILE
        ;;
      "d")
        #echo "Option $optname has value $OPTARG"
		if [ $SETTINGS == true ]
			then
				DIREC=$OPTARG
		fi
		#echo $DIREC
        ;;
      "?")
        echo "Unknown option $OPTARG"
        ;;
      ":")
        echo "No argument value for option $OPTARG"
        ;;
      *)
      # Should not occur
        echo "Unknown error while processing options"
        ;;
    esac
    #echo "OPTIND is now $OPTIND"
  done
if [ $COMPLETED == false ]
	then
		echo "Securely copying..."
		scp $FILE $USERNAME@linux.cs.mcgill.ca:/home/2011/$USERNAME/$DIREC
fi
