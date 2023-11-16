#!/bin/bash

num1=80
num2=40

let sum=num1+num2    #inside the let variable value assignment, no need for $(??/)
let diff=num1-num2
let prod=num1*num2
let quot=num1/num2
let rem=num1%num2

echo $sum $diff $prod $quot $rem