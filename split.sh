#!/bin/bash

help() {
        echo "./split.sh -t 900 -f input.m4a --> split input.m4a into files of 15 minutes (=900 seconds)"
        echo "./split.sh HELP --> show this message"
        echo "./split.sh FF-INSTALL --> install ffmpeg"
        exit 0
}

if [ "$1" = "HELP" ]; then
        help
fi

if [ "$1" = "FF-INSTALL" ]; then
        brew install ffmpeg
        exit 0
fi

while getopts ":f:t:h" opts; do
        case ${opts} in
                t) SEGTIME=${OPTARG} ;;
                f) INFILE=${OPTARG} ;;
                h) help ;;
                *)
                        echo "Error: Invalid option" >&2
                        exit 1 ;;
        esac
done

if [ -z "$SEGTIME" ] || [ -z "$INFILE" ]; then
        echo "Error: Missing -t (segment time in seconds) or -f (input file)" >&2
	echo ""
	help
        exit 1
fi

EXT="${INFILE##*.}"

EXT="${EXT,,}"

echo "Detected file extension: $EXT"

ffmpeg -i "$INFILE" -f segment -segment_time "$SEGTIME" -c copy "out-%05d.$EXT"
