#!/bin/bash

# define the letter scope.
x=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789

# loop then create the 10 letter string.
for i in {1..10}
do
  num=$[RANDOM%62]
  tmp=${x:num:1}
  pass=${pass}$tmp
done

# print the rand letter.
echo $pass
