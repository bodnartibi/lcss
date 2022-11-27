# lcss
low cost streaming stack
![GitHub Logo](/images/logo.png)

Dependencies:
apt install nginx libnginx-mod-rtmp

Usage:
1. Use "nginx.conf" on the server machine
* Read the config and rewrite what is needed
2. Use "cdn-nginx.conf" on CDN machines
* Read the config and rewrite what is needed
3. Broadcast via rtmp:
```bash
ffmpeg -hide_banner -fflags +genpts -stream_loop -1 -re -i <video> -c:v h264 -c:a aac -f flv rtmp://<IP>:<RTMP port>/show/<KEY>
```
4. Watch it with MPV:
```bash
mpv http://<IP>:<nginx port>/1/index.m3u8
```

Other:
* viewer_counter.sh is a slow cost solution to count viewers on the CDN machine

TODOs:
* deployment script
* better viewer counter, maybe use log-management stuffs
