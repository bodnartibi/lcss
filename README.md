# lcss
low cost streaming stack

1. Use nginx config
2. Broadcast via rtmp:
* ```ffmpeg -hide_banner -fflags +genpts -stream_loop -1 -re -i <video> -c:v h264 -c:a aac -f flv rtmp://<IP>:<RTMP port>/show/<KEY>```
3. Watch it with MPV:
* ```mpv http://<IP>:<nginx port>//<KEY>.m3u8```
