#!/usr/bin/env bash

CONFIG="${HOME}/.i3/config"

if [[ -f "${CONFIG}" ]]; then
    rm "${CONFIG}"
fi

echo -e "# This file is auto-generated, do not make changes in it!" >> "${CONFIG}"
echo -e "# vim: set foldmethod=marker:" >> "${CONFIG}"

for FILE in base startup keybinds bar mode; do
    echo -e "\n# {{{ ${FILE}" >> "${CONFIG}"
    "${HOME}/.i3/config.d/${FILE}" >> "${CONFIG}"
    echo -e "# }}}" >> "${CONFIG}"
done
