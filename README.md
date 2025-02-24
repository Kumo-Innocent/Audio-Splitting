# Audio Splitting
This little bash script can split audio by segments of _X_ seconds.

## How to use
Help page :
```
./split.sh -h
./split.sh HELP
```

Install FFMPEG :
```
./split.sh FF-INSTALL
```

Example : Split input.m4a into files of 15 minutes.
```
./split.sh -t 900 -f input.m4a
```
