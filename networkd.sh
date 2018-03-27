#!/bin/bash
sed -i 's,ExecStartPre=/system/bin/network_zone,#ExecStartPre=/system/bin/network_zone,g' /etc/systemd/system/networkd.service
