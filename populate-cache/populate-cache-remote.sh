#!/usr/bin/env bash

source .env

ssh $REMOTE_USER@$REMOTE_HOST "mkdir -p $REMOTE_WORKING_DIR"
scp populate-cache.sh $REMOTE_USER@$REMOTE_HOST:$REMOTE_WORKING_DIR
scp kill.sh $REMOTE_USER@$REMOTE_HOST:$REMOTE_WORKING_DIR

let "machine_id = 0"
for host in $(cat $IPS)
do
    echo "Run pm2 on $host"
    ssh $REMOTE_USER@$host "cd cytoscape-backend && PM2_HOME='/home/$REMOTE_USER/pm2home-$machine_id' node node_modules/.bin/pm2 start server.js"
    echo "Run populate-cache.sh on $host"
    ssh $REMOTE_USER@$host "nohup $REMOTE_WORKING_DIR/populate-cache.sh $machine_id &> tris-$machine_id.out &"
    let "machine_id = machine_id + 1"
done
