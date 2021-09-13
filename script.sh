#!/bin/bash


if [[ "$#" == 0 ]]
then
	cat << TEXT_HERE
Welcome!
	Usage: $0 [-dhr]
		-d	will create a directory for each name passed in
		-h	will create a header file for each user passed in
		-dh	will create a directory for each name passed in and
			populate it with atouch list.txt
                while read line; do
                        echo $line >> list.txt
                done < $file
                touch ids.txt
                awk -F ',' '{print $1}' list.txt > ids.txt
                sed -i '1d' ids.txt
                file='ids.txt'
                while read line; do
                        mkdir $line
                done < $file
                rm list.txt
                rm ids.txt
 header file
		-r	will remove all existing header files corresponding
			to each user
TEXT_HERE
else
	file=$2
	while (( "$#" ))
	do
	case $1 in
	-d)
		# Create a sub directory in the current folder for each
		# name that is passed in
		touch list.txt
		while read line; do
			echo $line >> list.txt 
		done < $file
		touch ids.txt
	        awk -F ',' '{print $1}' list.txt > ids.txt
		sed -i '1d' ids.txt
		file='ids.txt'
		while read line; do
			mkdir $line
		done < $file
		rm list.txt
		rm ids.txt	
		shift
		;;
	-h)
		# Create AND populate a header file for each user
		# Format:
		# Name: Insert name from file
		# UserName: Insert ID from file
		# Section: Insert section from file
		# Email: Combine ID@Email Domain from file
		touch list.txt
		count=2
                while read line; do
                        echo $line >> list.txt
                done < $file
		touch ids.txt
		awk -F ',' '{print $1}' list.txt > ids.txt
		sed -i '1d' ids.txt
                file='ids.txt'
		while read line; do
			# touch $line.header.txt
		        touch name.txt
			touch userName.txt
			touch section.txt
			touch domain.txt
			

			# oh boy, this is about to get ugly
			awk -F ',' '{print $2}' list.txt > name.txt
			name=`head -$count name.txt | tail -1`
			echo "# Name: " $name >> $line.header.txt

			awk -F ',' '{print $1}' list.txt > userName.txt
			userName=`head -$count userName.txt | tail -1`
			echo "# Username: " $userName >> $line.header.txt

			awk -F ',' '{print $4}' list.txt > section.txt
			section=`head -$count section.txt | tail -1`
			echo "# Section: " $section >> $line.header.txt
			
			awk -F ',' '{print $3}' list.txt > domain.txt
			domain=`head -$count domain.txt | tail -1`
			domain=${domain:1}
			email="${userName}"
			email+="@"
			email+="${domain}"
			echo "# Email: " $email >> $line.header.txt

			((count++))	
									
		done < $file

		rm list.txt
		rm ids.txt
		rm name.txt
		rm userName.txt
		rm section.txt
		rm domain.txt
		shift
		;;
	-dh)
		# same
		touch list.txt
                while read line; do
                        echo $line >> list.txt
			echo list.txt
                done < $file
                touch ids.txt
                awk -F ',' '{print $1}' list.txt > ids.txt
                sed -i '1d' ids.txt
                file='ids.txt'
                while read line; do
                        mkdir $line
			cd $line
			touch $line.header.txt
			count=2

                        touch name.txt
                        touch userName.txt
                        touch section.txt
                        touch domain.txt


                        # oh boy, this is about to get ugly
                        awk -F ',' '{print $2}' list.txt > name.txt
                        name=`head -$count name.txt | tail -1`
                        echo "# Name: " $name >> $line.header.txt

                        awk -F ',' '{print $1}' list.txt > userName.txt
                        userName=`head -$count userName.txt | tail -1`
                        echo "# Username: " $userName >> $line.header.txt

                        awk -F ',' '{print $4}' list.txt > section.txt
                        section=`head -$count section.txt | tail -1`
                        echo "# Section: " $section >> $line.header.txt

                        awk -F ',' '{print $3}' list.txt > domain.txt
                        domain=`head -$count domain.txt | tail -1`
                        domain=${domain:1}
                        email="${userName}"
                        email+="@"
                        email+="${domain}"
                        echo "# Email: " $email >> $line.header.txt

                        ((count++))

                done < $file


        
                rm $userName/name.txt
                rm $userName/userName.txt
                rm $userName/section.txt
                rm $userName/domain.txt



                rm list.txt
                rm ids.txt

		shift
		;;
	-hd)
		# same
		shift
		;;
	-r)
		# removes

		# DIR=/bobn
		if [ -d "bobn" ]
	       	then
			rm -r bobn
		fi
		# FILE=/final/bobn.header.txt
		if [ -f "bobn.header.txt" ]
	       	then
			rm bobn.header.txt
		fi

		# DIR=jillt
                if [ -d "jillt" ]
		then
                        rm -r jillt
                fi
                # FILE=/final/jillt.header.txt
                if [ -f "jillt.header.txt" ]
	       	then
                        rm jillt.header.txt
                fi

		# DIR=/final/marthas
                if [ -d "marthas" ]
	       	then
                        rm -r marthas
              	fi
                # FILE=/final/marthas.header.txt
                if [ -f "marthas.header.txt" ]
	       	then
                        rm marthas.header.txt
                fi

		# DIR=/final/snoopd
                if [ -d "snoopd" ]
	       	then
                        rm -r snoopd
                fi
                # FILE=/final/snoopd.header.txt
                if [ -f "snoopd.header.txt" ]
	       	then
                        rm snoopd.header.txt
                fi

		# DIR=/final/coleca
                if [ -d "coleca" ]
	       	then
                        rm -r coleca
                fi
                # FILE=/final/coleca.header.txt
                if [ -f "coleca.header.txt" ]
	       	then
                        rm coleca.header.txt
                fi

		# DIR=/final/gregt
                if [ -d "gregt" ]
	       	then
                        rm -r gregt
                fi
                # FILE=/final/gregt.header.txt
                if [ -f "gregt.header.txt" ]
	       	then
                        rm gregt.header.txt
                fi

		shift
		;;
	

	classlist.txt)
		break
		;;
	*)
		echo "$1 is an invalid command"
		shift
		;;
esac
done
fi
