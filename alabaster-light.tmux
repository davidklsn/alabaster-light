#!/bin/bash
bg="#F7F7F7"
fg="#000000"
status_bg="#DDDDDD"
status_fg="#474747"
accent="#007ACC"
blue="#325CC0"
yellow="#CB9000"
red="#AA3731"
green="#448C27"
cyan="#0083B2"
magenta="#7A3E9D"
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
sets() {
   local option=$1
   local value=$2
   tmux set-option -sq "$option" "$value"
}

# tmux 3.8 theme palette: menus, popups, copy mode, tree mode, clock etc.
# are drawn with the theme* colours, so map them to Alabaster and force the
# light set (an undetected background is otherwise treated as dark).
sets "theme"                  "light"
sets "light-theme-black"      "$fg"
sets "light-theme-white"      "$bg"
sets "light-theme-light-grey" "$selection"
sets "light-theme-dark-grey"  "$status_fg"
sets "light-theme-green"      "$green"
sets "light-theme-yellow"     "$yellow"
sets "light-theme-red"        "$red"
sets "light-theme-blue"       "$blue"
sets "light-theme-cyan"       "$cyan"
sets "light-theme-magenta"    "$magenta"

set "status" "on"
set "status-justify" "left"
set "status-left-length" "100"
set "status-right-length" "100"

# Modern style options
set "message-style"          "fg=$fg,bg=$status_bg"
set "message-command-style"  "fg=$accent,bg=$status_bg"
set "status-style"           "fg=$status_fg,bg=$status_bg"

setw "window-status-style"            "fg=$comment,bg=$status_bg"
setw "window-status-current-style"    "fg=$fg,bg=$status_bg"
setw "window-status-activity-style"   "fg=$yellow,bg=$status_bg"
setw "window-status-separator"        ""

set "window-style"           "fg=$comment"
set "window-active-style"    "fg=$fg"

set "pane-border-style"        "fg=$selection,bg=$bg"
set "pane-active-border-style" "fg=$accent,bg=$bg"

setw "display-panes-active-colour" "$yellow"
setw "display-panes-colour"        "$blue"

set "@prefix_highlight_fg"              "$bg"
set "@prefix_highlight_bg"              "$accent"
set "@prefix_highlight_copy_mode_attr"  "fg=$bg,bg=$accent"
set "@prefix_highlight_output_prefix"   ""

time_format=$(get "@time_format" "%R")
date_format=$(get "@date_format" "%d/%m/%Y")

set "status-left"  "#[fg=$bg,bg=$accent,bold] #S #[fg=$status_fg,bg=$status_bg,nobold,nounderscore,noitalics] "
set "status-right" "#[fg=$status_fg,bg=$status_bg]${time_format}  ${date_format} #[fg=$selection,bg=$status_bg]#[fg=$status_fg,bg=$selection] #h #[fg=$accent,bg=$selection,nobold]"

# Tabs show only the window number
set "window-status-format"         "#[fg=$comment,bg=$status_bg] #I "
set "window-status-current-format" "#[fg=$fg,bg=$selection,bold] #I #[nobold]"
