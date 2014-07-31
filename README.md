fancy-battery
=============

[![License GPL 3][badge-license]][copying]

Display battery status in Emacs mode line ([Solarized Light][]):

![Battery status in mode line][screenshot]

Provides `fancy-battery-mode`, which is like the built-in
`display-battery-mode`, but more fancy: It shows just the remaining time, and
uses colours to indicate the status of the battery.  It is also more
customizable.

[badge-license]: https://img.shields.io/badge/license-GPL_3-green.svg?dummy
[COPYING]: https://github.com/lunaryorn/fancy-battery.el/blob/master/COPYING
[Solarized Light]: https://github.com/bbatsov/solarized-emacs
[screenshot]: https://raw.githubusercontent.com/lunaryorn/fancy-battery.el/master/screenshot.png

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

[Cask]: https://github.com/cask/cask
[MELPA]: http://melpa.milkbox.net
[MELPA Stable]: http://melpa-stable.milkbox.net

Appearance
----------

When the battery is charging, Fancy Battery shows the remaining time until full
charge in `fancy-battery-charging` face, which inherits from the built-in
`success` face:

![Charging time](https://raw.githubusercontent.com/lunaryorn/fancy-battery.el/master/images/charging-remaining-time.png)

If no information about the remaining time is available, it falls back to
the charge level of the battery.  If you prefer to always see the charge level,
set `fancy-battery-show-percentage` to `t`:

![Charging percentage](https://raw.githubusercontent.com/lunaryorn/fancy-battery.el/master/images/charging-percentage.png)

When the AC plug is disconnected, the text changes to the
`fancy-battery-discharging` face, which inherits from the built-in `warning`
face.  The time now indicates how long the battery will last.

![Discharging time](https://raw.githubusercontent.com/lunaryorn/fancy-battery.el/master/images/discharging-remaining-time.png)

As soon as the battery level gets critically low, the face changes to
`fancy-battery-critical`, which inherits form the built-in `error` face, to
indicate that you should really grab the AC plug now:

![Critical time](https://raw.githubusercontent.com/lunaryorn/fancy-battery.el/master/images/critical-remaining-time.png)

**Note:** On OS X Emacs currently fails to report critical battery status due to
an issue in `battery-pmset`.  See Emacs bug [#18157][] for details.

[#18157]: http://debbugs.gnu.org/cgi/bugreport.cgi?bug=18157

Customization
-------------

Add your own functions to `fancy-battery-status-update-functions` to receive
battery status updates.

Customize `fancy-battery-critical`, `fancy-battery-charging`, and
`fancy-battery-discharging` to change the status colours used by the default
mode line format.

Set `fancy-battery-show-percentage` to a non-nil value to show the load
percentage instead of the remaining time.  To use an entirely different format,
customize `fancy-battery-mode-line`.  See [Mode Line Format][] for documentation
of the format, and take a look at `fancy-battery-default-mode-line` to see how
the default value is built.

Customize `mode-line-misc-info` and `mode-line-format` to change the position at
which the battery status appears in the mode line.  Typically it's at the very
end after the minor mode list, so you may want to move `mode-line-misc-info`
more to the front of `mode-line-format`.

Customize `battery-update-interval` to change the interval at which battery
information is updated, and `battery-status-function` to add your own battery
status backend.

All options are available via `M-x customize-group RET fancy-battery`.

[Mode Line Format]: http://www.gnu.org/software/emacs/manual/html_node/elisp/Mode-Line-Format.html

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
