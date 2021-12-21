#!/bin/bash

GRANT_FILE=$(mktemp)
OUTPUT_FILE=$(mktemp)

# Generate command to get privileges for all user
mysql -BN -e "SELECT CONCAT('SHOW GRANTS FOR ''',user,'''@''',host,''';') FROM mysql.user" > $GRANT_FILE

# Get privileges for all user
echo "User | Host | Database.Table | Privileges" > $OUTPUT_FILE
mysql -sN -e "source $GRANT_FILE" | sed -e 's/^GRANT \(.*\) ON \(.*\) TO \([^@]*\)@\(.*\).*/\3 | \4 | \2 | \1/' | sed -e 's/ IDENTIFIED BY [^|]*/ /' | sed -e 's/ WITH GRANT [^|]*/ /' | sort -k1 >> $OUTPUT_FILE

# Display result output
cat $OUTPUT_FILE | sed s/\'//g | sed s/\`//g | column -ts '|'

rm $GRANT_FILE $OUTPUT_FILE

