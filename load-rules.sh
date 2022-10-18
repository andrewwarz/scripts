#!/bin/bash

#Download auditd.rules file

FILE='https://raw.githubusercontent.com/andrewwarz/files/main/audit.rules'

funcAudit () {
wget $FILE

mv -f audit.rules /etc/audit/rules.d
}

#Call on function

funcAudit

#Error Code check

if [ $? -eq 0 ]; then
        auditctl -R /etc/audit/rules.d/audit.rules && echo "Success! File moved and loaded into Auditctl."
else
        echo "Error downloading and moving file"
fi
