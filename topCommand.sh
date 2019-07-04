#! /bin/bash

sort /root/.bash_history | uniq  -c |sort -nr |head