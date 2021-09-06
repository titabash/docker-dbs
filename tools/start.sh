tmux kill-session -t docker_dbs > /dev/null 2>&1
docker-compose up -d
array=$(docker ps --format '{{.Names}}' --filter 'name=_db')
NUM=0
for var in ${array[@]}
do
    if [ $NUM = 0 ]; then
        tmux new-session -s docker_dbs  -n ${var} -d "docker exec -it ${var} /bin/sh";
    else
        tmux new-window  -t docker_dbs:${NUM} -n ${var}  "docker exec -it ${var} /bin/sh";
    fi
    tmux split-window -h "docker logs -t ${var} -f"
    NUM=$((NUM+1))
done
LOCAL=$(docker ps --format '{{.Names}}' --filter 'name=_db' | grep local)
tmux select-window -t ${LOCAL}
tmux select-pane -t 0
tmux attach-session -t docker_dbs
