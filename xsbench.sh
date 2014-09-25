#!/bin/bash
#
#  Copyright 2014 (c) Citrix
#
#  This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, version only.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program.  If not, see <http://www.gnu.org/licenses/>.

#########
## Path to Extra Files
#####

xsbenchcfg="/root/xsbench/xsbench.cfg"
xsbenchfct="/root/xsbench/xsbench.fct"

#########
## Load Configuration
#####

[ ! -f "${xsbenchcfg}" ] && echo "Unable to find ${xsbenchcfg}" && exit
. ${xsbenchcfg}

#########
## Load Helpers
#####

[ ! -f "${xsbenchfct}" ] && echo "Unable to find ${xsbenchfct}" && exit
. ${xsbenchfct}

#########
## Main Script
#####

case $1 in
    clones_create)
        clones_create || exit 1
        ;;
    clones_destroy)
        clones_destroy || exit 1
        ;;
    clones_start)
        clones_start || exit 1
        ;;
    clones_shutdown)
        clones_shutdown || exit 1
        ;;
    srs_create)
        # Create the SRs _and_ the corresponding VDIs
        vdis_create || exit 1
        ;;
    srs_destroy)
        srs_destroy || exit 1
        ;;
    vbds_create)
        vbds_create || exit 1
        ;;
    qdisk_plug)
        qdisk_plug || exit 1
        ;;
    blkbk_plug)
        blkbk_plug || exit 1
        ;;
    vms_bench_run)
        vms_bench_run || exit 1
        ;;
    dom0_bench_run)
        dom0_bench_run || exit 1
        ;;
    *)
	echo "Usage: $0 " >&2
	echo "       {clones_create|clones_destroy}" >&2
	echo "       {clones_start|clones_shutdown}" >&2
	echo "       {srs_create|srs_destroy}" >&2
	echo "       {vbds_create|qdisk_plug|blkbk_plug}" >&2
	echo "       {vms_bench_run|dom0_bench_run}" >&2
	exit 1
	;;
esac

exit 0
