#!/usr/bin/env bash
#title           : ubooquity.sh
#description     : Launch ubooquity server. shell script in task manager
#date            : 20170807
#==============================================================================

### JAVA VARIABLES ###
# Java installation directory
JAVA_DIR=/var/packages/java/target/bin
# Maximum size of the Java runtime memory allocation pool. Default: 64MB
MEM=512m
### UBOOQUITY VARIABLES ###
# Ubooquity binary location
UBOOQUITY_BIN=/var/packages/Ubooquity/Ubooquity.jar
# Ubooquity working directory
WORK_DIR=/volume1/ebooks/.ubooquity
# Ubooquity process ID file location
PID_FILE=$WORK_DIR/ubooquity.pid
# Ubooquity library port
LIB_PORT=2202
# Ubooquity administration port
ADMIN_PORT=2203
### ENVIRONMENT VARIABLES ###
# Character encoding
ENCO=UTF-8
# Locale selection
LANG=en_US.$ENCO
### SCRIPT ###
# Workaround to read special characters properly
export LANG
# Kill previous process
if [ -f $PID_FILE ]; then
    pkill -F $PID_FILE > /dev/null 2>&1
fi
# Launch ubooquity
printf "Starting Ubooquity server...\n"
$JAVA_DIR/java -jar -Dfile.encoding=$ENCO -Xmx$MEM $UBOOQUITY_BIN \
               --adminport $ADMIN_PORT --libraryport $LIB_PORT \
               --workdir $WORK_DIR \
               --remoteadmin --headless & UBOOQUITY_PID=$!
echo $UBOOQUITY_PID > $PID_FILE
printf "Ubooquity is now running (pid: %d).\n" $UBOOQUITY_PID
exit 0