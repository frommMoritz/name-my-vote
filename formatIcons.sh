#!/bin/bash

cd icons

convert icon-max.png -resize 512 icon-512.png
convert icon-max.png -resize 256 icon-256.png
convert icon-max.png -resize 128 icon-128.png
convert icon-max.png -resize 64 icon-64.png
convert icon-max.png -resize 32 icon-32.png
convert icon-max.png -resize 16 icon-16.png
