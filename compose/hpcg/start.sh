#!/bin/bash

function imgrun {
    target=venus00${1}
    echo "> export DOCKER_HOST=tcp://${target}:2376"
    export DOCKER_HOST=tcp://${target}:2376
    export CNT=${1}
    docker-compose -f venus.yml up -d
}
function imgkill {
    target=venus00${1}
    echo "> export DOCKER_HOST=tcp://${target}:2376"
    export DOCKER_HOST=tcp://${target}:2376
    export CNT=${1}
    docker-compose -f venus.yml kill
    docker-compose -f venus.yml rm -f

}
IMAGE=192.168.12.11:5000/qnib/ib-bench:cos7
if [ "X${1}" == "Xup" ];then
    if [ "X${2}" != "X" ];then
        imgrun ${2}
    else
        for cnt in {1..8};do
            imgrun ${cnt} 
        done
    fi
elif [ "X${1}" == "Xdown" ];then
    if [ "X${2}" != "X" ];then
        imgkill ${2}
    else
        for cnt in {1..8};do
            imgkill ${cnt}
        done
    fi
else
    echo "please provide command 'start.sh (up|down)'"
fi
