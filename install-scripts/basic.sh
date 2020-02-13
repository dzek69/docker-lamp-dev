#!/bin/bash

# Basic stuff upgrade
apt-get update

# Basic stuff install
apt-get install tzdata curl apt-utils software-properties-common -y
apt-get update
apt-get upgrade -y
