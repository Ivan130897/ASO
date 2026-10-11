#!/bin/bash

bytes=$1

b_a_gb() {
	resultado=$(echo "scale=2; $bytes / (1024 ^ 3)" | bc)
	echo "$bytes bytes son $resultado gigabytes."
}

b_a_gb
