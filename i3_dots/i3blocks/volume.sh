#!/bin/bash

# --- Output (Sink) Volume ---
SINK_LINE=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ 2>/dev/null)
if [ -z "$SINK_LINE" ]; then
    SINK_DISPLAY="Vol: N/A"
else
    SINK_VOL=$(echo "$SINK_LINE" | awk '{ printf "%.0f", $2 * 100 }')
    if echo "$SINK_LINE" | grep -q MUTED; then
        SINK_DISPLAY="Vol: (muted)"
    else
        SINK_DISPLAY="Vol: $SINK_VOL%"
    fi
fi

# --- Input (Source) Volume ---
SOURCE_LINE=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ 2>/dev/null)
if [ -z "$SOURCE_LINE" ]; then
    MIC_DISPLAY="Mic: N/A"
else
    MIC_VOL=$(echo "$SOURCE_LINE" | awk '{ printf "%.0f", $2 * 100 }')
    if echo "$SOURCE_LINE" | grep -q MUTED; then
        MIC_DISPLAY="Mic: (muted)"
    else
        MIC_DISPLAY="Mic: $MIC_VOL%"
    fi
fi

# Final output
echo "$SINK_DISPLAY | $MIC_DISPLAY"

if [ $BLOCK_BUTTON = 1 ];then
	exec pwvucontrol
fi
