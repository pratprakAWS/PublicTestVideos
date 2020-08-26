#!/bin/bash

# Prerequisites 
# 1. Install ImageMagick cli
# 2. Install ffmpeg cli
# 3. Make script executable `chmod +x video_generator.sh`

# Generate the frames
for i in {0..300}
do
  echo "Generating frame $i"
  convert -background black -fill white -size 480x320 -pointsize 48 -gravity center label:${i} frame${i}.png
done

# Combine frames into H.264 MP4 video. (29.97fps & 30fps)
ffmpeg -framerate 30 -i frame%d.png -codec:v libx264 -pix_fmt yuv420p 30fps.mp4

# Clean up frames.
rm frame*.png