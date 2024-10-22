#!/bin/bash

for d in */ ; do
    echo "installing ${d}"
    bash ${d}install.sh
done

