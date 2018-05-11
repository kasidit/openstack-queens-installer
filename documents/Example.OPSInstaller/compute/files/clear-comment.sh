#!/bin/bash 

sed '/^[[:blank:]]*#/d;s/#.*//' ${1} | sed '/^$/d' | tee nocomment/${1}.nocomment
