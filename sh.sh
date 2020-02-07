#!/bin/bash
  
autobetaupdate () {
while true 
do
        sleep 30
        cd $1 && git pull > /var/log/git/${2}.log
        if [[ $? == 0 ]]
        then
                update_status=$(cat /var/log/git/${2}.log)

                if [[ "$update_status" == "Already up to date." ]]
                then
                        continue
                else
                /bin/systemctl restart ${2}.service
                fi

        fi
done
}
