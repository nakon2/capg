#!/bin/bash

echo -e "Hello World"

echo -e "Variable d'env $SHELL"

param1=$1
param2=$2
param3=$3

echo les trois parametres sont $param1 $param2 $param3

touch  $param1 $param2 $param3
