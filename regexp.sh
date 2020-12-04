#!/bin/bash

echo "Interface: ens192"; echo  "MAC                     IP"; (ip a s ens192 | sed -n 2,3p | awk '{print $2}') | column

