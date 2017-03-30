#!/bin/bash
max_session=100
worker=nginx
session=$(netstat -nat | egrep 'ESTABLISHED|CLOSE_WAIT' | wc -l)


if which $worker &>/dev/null; then
        if [[ $session -gt $max_session ]]; then
                $worker -t
            if [[ $? -eq 0 ]]; then
            service $worker reload
        else
    echo $worker test configure fail.
            fi 
    
        elif [[ $session -lt $max_session ]]; then
    echo The connections $session execute has not been exceed limit.

        fi
        else
    echo $worker not found.
fi
