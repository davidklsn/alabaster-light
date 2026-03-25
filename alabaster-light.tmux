#!/bin/bash
bg="#F7F7F7"
fg="#000000"
status_bg="#DDDDDD"
status_fg="#474747"
accent="#007ACC"
blue="#325CC0"
yellow="#CB9000"
red="#AA3731"
comment="#9DA39A"
selection="#E3E3E3"

get() {
   local option=$1
   local default_value=$2
   local option_value="$(tmux show-option -gqv "$option")"
   if [ -z "$option_value" ]; then
      echo "$default_value"
   else
      echo "$option_value"
   fi
}
set() {
   local option=$1
   local value=$2
   tmux set-option -gq "$option" "$value"
}
setw() {
   local option=$1
   local value=$2
   tmux set-window-option -gq "$option" "$value"
}

set "status" "on"
set "status-justify" "left"
set "status-left-length" "100"
set "status-right-length" "100"

# Modern style options
set "message-style"          "fg=$fg,bg=$status_bg"
set "message-command-style"  "fg=$accent,bg=$status_bg"
set "status-style"           "fg=$status_fg,bg=$status_bg"

setw "window-status-style"            "fg=$comment,bg=$status_bg"
setw "window-status-activity-style"   "fg=$yellow,bg=$status_bg"
setw "window-status-separator"        ""

set "window-style"           "fg=$comment"
set "window-active-style"    "fg=$fg"

set "pane-border-style"        "fg=$selection,bg=$bg"
set "pane-active-border-style" "fg=$accent,bg=$bg"

set "display-panes-active-colour" "$yellow"
set "display-panes-colour"        "$blue"

set "@prefix_highlight_fg"              "$bg"
set "@prefix_highlight_bg"              "$accent"
set "@prefix_highlight_copy_mode_attr"  "fg=$bg,bg=$accent"
set "@prefix_highlight_output_prefix"   ""

time_format=$(get "@time_format" "%R")
date_format=$(get "@date_format" "%d/%m/%Y")

set "status-left"  "#[fg=$bg,bg=$accent,bold] #S #[fg=$accent,bg=$status_bg,nobold,nounderscore,noitalics]"
set "status-right" "#[fg=$status_fg,bg=$status_bg]${time_format}  ${date_format} #[fg=$selection,bg=$status_bg]#[fg=$status_fg,bg=$selection] #h #[fg=$accent,bg=$selection,nobold]"

set "window-status-format"         "#[fg=$comment,bg=$status_bg] #I #W "
set "window-status-current-format" "#[fg=$fg,bg=$selection,bold] #I #W #[fg=$selection,bg=$status_bg,nobold]"
