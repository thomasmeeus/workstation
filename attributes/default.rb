node.default['osxdefaults']['computername'] = 'KM-0334'
node.default['osxdefaults']['terminal']['profile'] = 'Solarized-Dark-ansi'
node.default['osxdefaults']['terminal']['profile'] = 'Solarized-Light-ansi'


node.default["sublime_use_nodejs"] = FALSE

node.default["sublime_text_packages"] = [
    {
        "name"   => "SideBarEnhancements",
        "source" => "https://github.com/titoBouzout/SideBarEnhancements",
        "branch" => "st3"
    },
    {
        "name"   => "GitGutter",
        "source" => "https://github.com/jisaacks/GitGutter.git",
        "branch" => "master"
    },
    {
        "name"   => "BracketHighlighter",
        "source" => "https://github.com/facelessuser/BracketHighlighter.git",
        "branch" => "ST3"
    },
    {
        "name"   => "Theme - Sodarized",
        "source" => "https://github.com/buymeasoda/soda-theme.git",
        "branch" => "master"
    },
    {
        "name"   => "ApplySyntax",
        "source" => "https://github.com/facelessuser/ApplySyntax.git",
        "branch" => "ST3"
    },
    {
        "name"   => "SublimeChef",
        "source" => "https://github.com/cabeca/SublimeChef.git",
        "branch" => "master"
    },
]

node.default["sublime_text"]["color_scheme"] = "Solarized Color Scheme (TextMate)"

node.default['sublime_text']['preferences'] = {}.tap do |prefs|
    prefs["color_scheme"] = node['sublime_text']['color_scheme']
    prefs["theme"] = "Soda Dark 3.sublime-theme"
    prefs["auto_complete"] = true
    prefs["auto_complete_commit_on_tab"] = true
    prefs["auto_complete_with_fields"] = true
    prefs["bold_folder_labels"] = true
    prefs["caret_style"] = "phase"
    prefs["detect_indentation"] = true
    prefs["fade_fold_buttons"] = true
    prefs["folder_exclude_patterns"] = [
        ".svn",
        ".git",
        ".hg",
        "CVS",
        "tmp",
        ".bundle",
        ".sass-cache",
        "log",
        "cache"
    ]
    prefs["highlight_modified_tabs"] = true
    prefs["highlight_line"] = true
    prefs["hot_exit"] = false
    prefs["draw_white_space"] = "all"
    prefs["ensure_newline_at_eof_on_save"] = true
    prefs["file_exclude_patterns"] = [
        ".DS_Store",
        ".gitkeep",
        "dump.rdb"
    ]
    prefs["remember_open_files"] = false
    prefs["save_on_focus_lost"] = true
    prefs["tab_size"] = 4
    prefs["translate_tabs_to_spaces"] = true
    prefs["trim_trailing_white_space_on_save"] = true
    prefs["line_padding_bottom"] = 1
    prefs["line_padding_top"] = 1
    prefs["fade_fold_buttons"] = false
    prefs["scroll_past_end"] = true
end
