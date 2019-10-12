#!/usr/bin/env bash

CURRENT_TRACK_STR=$(osascript <<EOF
  set _versionString to system version of (system info)
  considering numeric strings
    if _versionString ≥ "10.15" then
      tell application "Music"
        if player state is stopped then
          return ""
        else
          if player state is paused then
            set playingState to "❚❚"
          else
            set playingState to "▶"
          end if

          return playingState & " " & name of current track & " - " & artist of current track
        end if
      end tell
    else
      tell application "iTunes"
        if player state is stopped then
          return ""
        else
          if player state is paused then
            set playingState to "❚❚"
          else
            set playingState to "▶"
          end if

          return playingState & " " & name of current track & " - " & artist of current track
        end if
      end tell
    end if
  end considering
EOF)

echo $CURRENT_TRACK_STR
