#!/usr/bin/env bash

# Read command output line by line into array ${lines [@]}
# Bash 3.x: use the following instead:
#   IFS=$'\n' read -d '' -ra lines < <(lsblk --nodeps -no name,serial,size | grep "sd")
readarray -t lines < <(pactl list sinks | grep Name | cut -b 8-)

# Prompt the user to select one of the lines.
echo "Please select an output device:"
select choice in "${lines[@]}"; do
  [[ -n $choice ]] || { echo "Invalid choice. Please try again." >&2; continue; }
  break # valid choice was made; exit prompt.
done

# Split the chosen line into ID and serial number.
read -r _name output <<<"$choice"

echo "output selected: [$output]"
return_code=$(pactl set-default-sink $output)
echo $return_code
