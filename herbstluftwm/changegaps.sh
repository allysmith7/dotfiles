#!/bin/env bash
# $1 - increase or decrease?
# $2 - frame gap or window gap?
# $3 - by how much?

case $1 in
+ | plus | add | increase)
    case $2 in
    f | frame)
        herbstclient set_attr settings.frame_gap $(($(herbstclient get_attr settings.frame_gap) + $3))
        notify-send "increased frame gaps by $3  ($(herbstclient get_attr settings.frame_gap))" -t 200
        ;;
    w | window)
        herbstclient set_attr settings.window_gap $(($(herbstclient get_attr settings.window_gap) + $3))
        notify-send "increased window gaps by $3  ($(herbstclient get_attr settings.window_gap))" -t 200
        ;;
    esac
    ;;
- | minus | subtract | decrease)
    current_frame_gap=$(herbstclient get_attr settings.frame_gap)
    current_window_gap=$(herbstclient get_attr settings.window_gap)
    echo $current_frame_gap $current_window_gap
    case $2 in
    f | frame)
        if [ $current_frame_gap -lt $3 ]
        then 
            herbstclient set_attr settings.window_gap 0
            notify-send "decreased frame gap by $current_frame_gap (at 0)" -t 200
        else
            herbstclient set_attr settings.frame_gap $(($(herbstclient get_attr settings.frame_gap) - $3))
            notify-send "decreased frame gap by $3 ($(herbstclient get_attr settings.frame_gap))" -t 200
        fi
        ;;
    w | window)
        if [ $current_window_gap -lt $3 ]
        then
            herbstclient set_attr settings.window_gap 0
            notify-send "decreased window gap by $current_window_gap (at 0)"
        else
            herbstclient set_attr settings.window_gap $(($(herbstclient get_attr settings.window_gap) - $3))
            notify-send "decreased window gaps by $3 ($(herbstclient get_attr settings.window_gap))"
        fi
        ;;
    esac
    ;;
esac
