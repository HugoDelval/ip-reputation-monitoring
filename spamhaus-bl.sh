#!/bin/bash
#
# Copyright (C) 2017, OVH SAS
#
# This file is part of ip-reputation-monitoring.
#
# ip-reputation-monitoring is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.


# Directories computation
CURRENT_DIR=`dirname \`readlink -f $0\``
REPUTATION_DIR="${CURRENT_DIR}/reputation"

SPAMHAUS_SCRIPT="${REPUTATION_DIR}/spamhaus_monitor.py"
SPAMHAUS_DOMAIN_NAME=$(${REPUTATION_DIR}/get_secret.py SPAMHAUS_DOMAIN_NAME)

# Get SBL listings for domain and let python script parse content
curl --location --silent "http://www.spamhaus.org/sbl/listings/${SPAMHAUS_DOMAIN_NAME}" |  python3 ${SPAMHAUS_SCRIPT}
