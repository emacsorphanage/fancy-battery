fancy-battery
=============

[![License GPL 3][badge-license]][copying]

Display battery status in Emacs mode line:

![Battery status in mode line](https://raw.githubusercontent.com/lunaryorn/fancy-battery.el/master/screenshot.png)

Provides `fancy-battery-mode`, which is like the built-in
`display-battery-mode`, but more fancy: It shows just the remaining time, and
uses colours to indicate the status of the battery.  It is also more
customizable.

Installation
------------

As usual, from [MELPA][] or [MELPA Stable][], with `M-x package-install RET
fancy-battery`.

In your [`Cask`][cask] file:

```cl
(source melpa)

(depends-on "fancy-battery")
```

In your `init.el`:

```cl
(add-hook 'after-init-hook #'fancy-battery-mode)
```

Customization
-------------

Add your own functions to `fancy-battery-status-update-functions` to receive
battery status updates.

Customize `fancy-battery-critical`, `fancy-battery-charging`, and
`fancy-battery-discharging` to change the status colours used by the default
mode line format.

Customize `fancy-battery-mode-line` to use your own mode line format for Fancy
Battery Mode.  See [Mode Line Format][] for documentation of the format, and
take a look at `fancy-battery-default-mode-line` to see how the default value is
built.

Customize `mode-line-misc-info` and `mode-line-format` to change the position at
which the battery status appears in the mode line.  Typically it's at the very
end after the minor mode list, so you may want to move `mode-line-misc-info`
more to the front of `mode-line-format`.

Customize `battery-update-interval` to change the interval at which battery
information is updated, and `battery-status-function` to add your own battery
status backend.

License
-------

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free Software
Foundation, either version 3 of the License, or (at your option) any later
version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with
this program.  If not, see http://www.gnu.org/licenses/.

See [`COPYING`][copying] for details.

[badge-license]: https://img.shields.io/badge/license-GPL_3-green.svg?dummy
[COPYING]: https://github.com/lunaryorn/fancy-battery.el/blob/master/COPYING
[Cask]: https://github.com/cask/cask
[MELPA]: http://melpa.milkbox.net
[MELPA Stable]: http://melpa-stable.milkbox.net
[Mode Line Format]: http://www.gnu.org/software/emacs/manual/html_node/elisp/Mode-Line-Format.html
