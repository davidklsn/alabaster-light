#!/bin/bash
black="#F7F7F7"
blue="#325CC0"
yellow="#CB9000"
red="#AA3731"
white="#000000"
pink="#7A3E9D"
pastel_blue="#007ACC"
visual_grey="#E3E3E3"
comment_grey="#9DA39A"
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
set "status-right-attr" "none"
set "message-fg" "$white"
set "message-bg" "$black"
set "message-command-fg" "$white"
set "message-command-bg" "$black"
set "status-attr" "none"
set "status-left-attr" "none"
setw "window-status-fg" "$comment_grey"
setw "window-status-bg" "$black"
setw "window-status-attr" "none"
setw "window-status-activity-bg" "$black"
setw "window-status-activity-fg" "$yellow"
setw "window-status-activity-attr" "none"
setw "window-status-separator" ""
set "window-style" "fg=$comment_grey"
set "window-active-style" "fg=$white"
set "pane-border-fg" "$visual_grey"
set "pane-border-bg" "$black"
set "pane-active-border-fg" "$pastel_blue"
set "pane-active-border-bg" "$black"
set "display-panes-active-colour" "$yellow"
set "display-panes-colour" "$blue"
set "status-bg" "#DDDDDD"
set "status-fg" "#474747"
set "@prefix_highlight_fg" "$black"
set "@prefix_highlight_bg" "$pastel_blue"
set "@prefix_highlight_copy_mode_attr" "fg=$black,bg=$pastel_blue"
set "@prefix_highlight_output_prefix" ""
time_format=$(get "@time_format" "%R")
date_format=$(get "@date_format" "%d/%m/%Y")
set "status-right" "#[fg=#474747,bg=#DDDDDD,nounderscore,noitalics]${time_format}  ${date_format} #[fg=$visual_grey,bg=#DDDDDD]#[fg=#474747,bg=$visual_grey]#[fg=#474747, bg=$visual_grey]#[fg=$pastel_blue,bg=$visual_grey,nobold,nounderscore,noitalics]#[fg=#474747,bg=$visual_grey,nobold] #h #[fg=$yellow, bg=$pastel_blue]#[fg=$red,bg=$yellow]"
set "status-left" "#[fg=$black,bg=$pastel_blue,nobold] #S #{prefix_highlight}#[fg=$pastel_blue,bg=#DDDDDD,nobold,nounderscore,noitalics]"
set "window-status-format" "#[fg=#DDDDDD,bg=#DDDDDD,nobold,nounderscore,noitalics] #[fg=#474747,bg=#DDDDDD] #I #W #[fg=#DDDDDD,bg=#DDDDDD,nobold,nounderscore,noitalics]"
set "window-status-current-format" "#[fg=#DDDDDD,bg=$visual_grey,nobold,nounderscore,noitalics] #[fg=$white,bg=$visual_grey,nobold] #I #W #[fg=$visual_grey,bg=#DDDDDD,nobold,nounderscore,noitalics]"
