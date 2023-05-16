`tmux new-session -s mysession` - Create new session
`tmux kill-session -t mysession` - Kill session
`tmux ls` - List sessions
`tmux attach-session -t mysession` - List sessions
`<prefix> (`, `<prefix> )` - Switch between the sessions
`<prefix> s` - Display sessions, possible switch
`:rename-session newmysessionname` - Rename the session
`<prefix>:` - Enter the tmux terminal
`<prefix> c` - Create new window
`<prefix> n` - Go to next window
`<prefix> p` - Go to previous window
`<prefix> w` - Show all windows and panes
`<prefix> z` - Toggle panel zoom
`<prefix> ;` - Focus previously focused panel
`<prefix> !` - Convert panel into window
`<prefix> x` - Close pane
`Ctrl+l` - Focus left panel
`Ctrl+h` - Focus right panel
`Ctrl+k` - Focus panel above
`Ctrl+j` - Focus panel bellow
`Ctrl+d` - Focus panel, if the panel is last on the screen the window will closed
`<prefix> q` - Show panel numbers
`<prefix> \` - Create vertical panel
`<prefix> -` - Create horizontal panel
`<prefix> o` - Create horizontal paned but use less then half of the space
`<prefix> }` - Swap current pane with the next one
`<prefix> {` - Swap current pane with the previous one
`<prefix> <window_number>` - Go to window by the number
`:move-window -t 4` - Update window number to `4`
`move-window -t -2` - Decrease window order on `-2` can be used `+5` etc.
`swap-window -s 1 -t 2` - Swap windows, `1` and `2` are window numbers
`swap-pane -U` - Swap pane up
`swap-pane -D` - Swap pane down

