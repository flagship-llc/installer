#!/bin/bash
while getopts e: OPT
do
  case $OPT in
    e) pass=$OPTARG
       ;;
  esac
done
eval "echo $pass"
