#!/bin/env bash
# $1 - increase or decrease?
# $2 - frame gap or window gap?
# $3 - by how much?

case $1 in
+ | plus | add | increase)
    case $2 in
    f | frame)
        herbstclient set_attr settings.frame_gap $(($(herbstclient get_attr settings.frame_gap) + $3))
        notify-send "increased frame gaps by $3"
        ;;
    w | window)
        herbstclient set_attr settings.window_gap $(($(herbstclient get_attr settings.window_gap) + $3))
        notify-send "increased window gaps by $3"
        ;;
    esac
    ;;
- | minus | subtract | decrease)
    case $2 in
    f | frame)
        herbstclient set_attr settings.frame_gap $(($(herbstclient get_attr settings.frame_gap) - $3))
        notify-send "decreased frame gaps by $3"
        ;;
    w | window)
        herbstclient set_attr settings.window_gap $(($(herbstclient get_attr settings.window_gap) - $3))
        notify-send "decreased window gaps by $3"
        ;;
    esac
    ;;
esac
