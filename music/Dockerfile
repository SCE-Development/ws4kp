# Streams looping background music (the audio track of combined.mp4) to the
# node-media-server "sound" RTMP endpoint. The weather streamer then muxes
# this audio into its live video output.
FROM alpine:3.20

RUN apk add --no-cache ffmpeg

COPY stream-music.sh /usr/local/bin/stream-music.sh
RUN chmod +x /usr/local/bin/stream-music.sh

ENTRYPOINT ["/usr/local/bin/stream-music.sh"]
