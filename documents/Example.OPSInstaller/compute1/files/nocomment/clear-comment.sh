#!/bin/bash 

sed '/^[[:blank:]]*#/d;s/#.*//' ${1} | sed '/^$/d' | tee ${1}.nocomment
