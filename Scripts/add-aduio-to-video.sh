#!/usr/bin/env bash

# Script: add_mp3_to_video.sh
# Adds an MP3 track to a video at a user-specified timestamp.
# Usage: ./add_mp3_to_video.sh <input_video> <input_audio>

set -euo pipefail

usage() {
  cat <<EOF
Usage: $0 <input_video> <input_audio>

<input_video>  Path to the source video file.
<input_audio>  Path to the MP3 audio file.

When prompted, enter the start time (SS, MM:SS or HH:MM:SS):
  • If ≤ video duration, music is delayed to play at that video timestamp.
  • If > video duration, music plays from that offset in the MP3, starting at video start.
EOF
  exit 1
}

# Verify arguments
[[ $# -eq 2 ]] || usage
VIDEO="$1"
AUDIO="$2"
[[ -f "$VIDEO" ]] || { echo "Error: Video not found: $VIDEO" >&2; exit 1; }
[[ -f "$AUDIO" ]] || { echo "Error: Audio not found: $AUDIO" >&2; exit 1; }

# Prompt user for start time
read -p "Enter start time (SS, MM:SS or HH:MM:SS): " RAW_TIME

# Convert time string to seconds
time_to_sec() {
  local t=${1//[!0-9:]/}
  IFS=":" read -r -a parts <<< "$t"
  case ${#parts[@]} in
    1) echo "${parts[0]}";;
    2) echo "$((10#${parts[0]}*60 + 10#${parts[1]}))";;
    3) echo "$((10#${parts[0]}*3600 + 10#${parts[1]}*60 + 10#${parts[2]}))";;
    *) echo "-1";;
  esac
}
START_SEC=$(time_to_sec "$RAW_TIME")
if [[ $START_SEC -lt 0 ]]; then
  echo "Error: Invalid time format." >&2
  exit 1
fi

# Get video duration (seconds)
VID_DUR=$(ffprobe -v error -select_streams v:0 -show_entries format=duration \
  -of csv=p=0 "$VIDEO" | cut -d. -f1)

# Build ffmpeg command dynamically
FFMPEG_CMD=(ffmpeg -y -i "$VIDEO")

if (( START_SEC <= VID_DUR )); then
  # Delay audio track within video timeline
  DELAY_MS=$((START_SEC * 1000))
  FILTER="[1]adelay=${DELAY_MS}|${DELAY_MS}:all=1[delayed];[0:a][delayed]amix=inputs=2:duration=first:dropout_transition=2[aud]"
  FFMPEG_CMD+=( -i "$AUDIO" -filter_complex "$FILTER" )
else
  # Trim audio start, align to video start
  FILTER="[1]atrim=start=${START_SEC},asetpts=PTS-STARTPTS[aud]"
  FFMPEG_CMD+=( -i "$AUDIO" -filter_complex "$FILTER" )
fi

# Output filename
OUT_FILE="${VIDEO%.*}_with_music.${VIDEO##*.}"

echo "Processing: video='$VIDEO', audio='$AUDIO', start=${START_SEC}s..."

# Add mapping and codec options
FFMPEG_CMD+=( -map 0:v -map "[aud]" -c:v copy -c:a aac -b:a 192k -shortest "$OUT_FILE" )

# Execute command
"${FFMPEG_CMD[@]}"

echo "Done: $OUT_FILE"
