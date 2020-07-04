clear all
close all
clc

fbeat = 4.4
fA = 20
v =343
vA = 13.3

k = 1 + fbeat/fA

top = k*v*(v-vA) - v*(v+vA)

bottom = v+vA + k*(v-vA)

vB = top / bottom
