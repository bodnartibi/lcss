# lcss
low cost streaming stack
![GitHub Logo](/images/logo.png)

## Dependencies:
```bash
apt install -y nginx libnginx-mod-rtmp
```

## Usage:
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
or use the browser with the right addon. You need a browser supports MPEG-Dash + HLS playback. Firefox: https://addons.mozilla.org/en-US/firefox/addon/native-mpeg-dash-hls-playback/

## Test
### On CDN
```bash
wget http://localhost:63800/1/index.m3u8
```
Should give something like this:
```bash
# cat index.m3u8 
#EXTM3U
#EXT-X-VERSION:3
#EXT-X-MEDIA-SEQUENCE:98
#EXT-X-TARGETDURATION:2
#EXTINF:2.000,
98.ts
#EXTINF:2.000,
99.ts
#EXTINF:2.000,
100.ts
#EXTINF:2.000,
101.ts
#EXTINF:2.000,
102.ts
```

## Other:
* viewer_counter.sh is a slow cost solution to count viewers on the CDN machine
  * start like this for channel 1
```bash
 watch -n 1 "./viewer_counter.sh 1 > /usr/share/nginx/html/1/viewer_counter/1_count.html"
```

## TODOs:
* deployment script
* better viewer counter, maybe use log-management stuffs
