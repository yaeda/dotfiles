#!/bin/sh

cli=/Applications/Karabiner.app/Contents/Library/bin/karabiner

$cli set option.emacsmode_controlPNBF_ex 1
/bin/echo -n .
$cli set remap.commandQ2commandW_commandshiftQ2commandQ 1
/bin/echo -n .
$cli set remap.jis_command2eisuukana_prefer_command 1
/bin/echo -n .
/bin/echo
