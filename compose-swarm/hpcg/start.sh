#!/bin/bash

for x in {1..8};do
   cp venus.yml venus_temp.yml
   sed -i'' -e "s/hpcg1/hpcg${x}/" venus_temp.yml ; sed -i'' -e "s/venus001/venus00${x}/" venus_temp.yml
   docker-compose -f venus_temp.yml up -d
   rm -f venus_temp.yml
done
