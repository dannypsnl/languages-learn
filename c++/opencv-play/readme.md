# opencv-play
This part puts some openCV examples.<br>
## OpenCV Install
```bash
$ git clone https://github.com/opencv/opencv.git
$ mkdir release && cd release
$ cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local ..
$ make
$ sudo make install # (Because my prefix to /usr/local/, sudo is optional if your prefix has no sudo required)
```
