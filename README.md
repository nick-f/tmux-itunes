# Tmux iTunes

Tmux plugin that display current track name on your status bar.

Both iTunes and macOS Catalina's Music app are supported.

### Screenshot

![](/screenshots/tmux-itunes.png)

### Usage
__NOTICE: This plugin support macOS only.__

Add `#{current_track}` format string to your existing `status-right` tmux
option.

Here's the example in `.tmux.conf`:

    set -g status-right "♫: #{current_track} | %a %h-%d %H:%M "
    
### Installation with [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm) 

Add plugin to the list of TPM plugins in `.tmux.conf`:

    set -g @plugin 'nick-f/tmux-itunes'

Hit `prefix + I` to fetch the plugin and source it.

### License

[MIT](/LICENSE)
