#!/bin/bash

sed -E -i.anonimo 's/([0-9]{1,3}\.){3}[0-9]{1,3}/X.X.X.X/g' $1
