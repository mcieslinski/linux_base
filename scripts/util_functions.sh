#!/bin/bash
lb_bak()
{
    if [[ "${1}" = "-r" ]]; then
        restored_file="${2%%.bak}"
        if [[ -e ${2} ]]; then
            test -e ${restored_file} && echo rm ${restored_file}
            test -e ${2} && echo mv ${2} ${restored_file}
        else
            echo "Neither ${2} nor ${restored_file} exist? This is pretty much not possible unless someone fucked with the code or the files."
            echo "Unfuck whatever you fucked and try this again."
            echo "A git checkout of the repo or specific files might do it."
        fi
    else
        test -e ${1} && echo cp ${1} "${1}.bak"
    fi
}

unsource()
{
    unset -f lb_bak
}
