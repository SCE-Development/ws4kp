#!/bin/sh
# Continuously stream the audio track of a local video file to an RTMP
# endpoint (the node-media-server "sound" channel), looping forever so the
# weather stream always has background music.
set -u

MUSIC_FILE="${MUSIC_FILE:-/media/combined.mp4}"
: "${RTMP_MUSIC_STREAM_URL:?RTMP_MUSIC_STREAM_URL must be set}"

echo "streaming music: ${MUSIC_FILE} -> ${RTMP_MUSIC_STREAM_URL}"

# Outer loop so we reconnect if the media server restarts or the connection
# drops. -stream_loop -1 loops the file itself; -re paces it at real time.
while true; do
  ffmpeg -hide_banner -loglevel warning \
    -re -stream_loop -1 -i "${MUSIC_FILE}" \
    -vn \
    -c:a aac -b:a 128k -ar 44100 -ac 2 \
    -f flv "${RTMP_MUSIC_STREAM_URL}"

  echo "music ffmpeg exited with code $?; retrying in 5s..."
  sleep 5
done
