#!/bin/bash
echo "$2  $1" | sha256sum -c --quiet && echo "$1: OK" || echo "$1: FAILED"
