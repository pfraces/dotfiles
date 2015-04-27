Sublime Text 3
==============

Install Package Control extension
---------------------------------

https://sublime.wbond.net/installation

Install plugins
---------------

1.  Open the **command pallete** (`Ctrl+Shift+P`)
2.  Type `install` and select `Package Control: Install Package`

### Plugins

*   sublimelinter
*   sublimelinter jshint
*   tern for sublime: follow instructions at https://github.com/marijnh/tern_for_sublime

#### soda dark theme

    cd ~/.config/sublime-text-3/Packages
    git clone https://github.com/buymeasoda/soda-theme/ "Theme - Soda"

Edit user preferences (`Preferences > Settings - User`)

```json
{
  "theme": "Soda Dark 3.sublime-theme"
}
```

### SublimePrint

1.  Install enscript `sudo apt-get install enscript`
2.  Open the **command pallete** (`Ctrl+Shift+P`)
3.  Type `install` and select `Package Control: Install Package`
4.  Search for `simple print function`
5.  Configure it at: `Preferences > Package Settings > SublimePrint`
    *   available printers and default printers are in the user configuration

Configuration
-------------

Edit user preferences (`Preferences > Settings - User`)

### Disable automatic loading of last session

```json
{
  "hot_exit": false,
  "remember_open_files": false
}
```

### Disable word wrap

```json
{
  "word_wrap": "false"
}
```

### Indentation

```json
{
  "tab_size": 2,
  "translate_tabs_to_spaces": true
}
```

Reindent current buffer (`Preferences > Key Bindings - User`)

```json
{
  "keys": ["alt+shift+f"],
  "command": "reindent",
  "args": { "single_line": false }
}
```

### 80 chars indicator

```json
{
  "rulers": [80]
}
```

### Tern

```json
{
  "auto_complete_triggers": [{
    "selector": "source.js",
    "characters": "."
  }]
}
```
