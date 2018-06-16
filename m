Return-Path: aleksandr.v.piskunov@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c9bc12ba
 for <wireguard@lists.zx2c4.com>;
 Sat, 16 Jun 2018 09:22:59 +0000 (UTC)
Received: from mail-it0-x243.google.com (mail-it0-x243.google.com
 [IPv6:2607:f8b0:4001:c0b::243])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 076209f1
 for <wireguard@lists.zx2c4.com>;
 Sat, 16 Jun 2018 09:22:59 +0000 (UTC)
Received: by mail-it0-x243.google.com with SMTP id j135-v6so5968991itj.1
 for <wireguard@lists.zx2c4.com>; Sat, 16 Jun 2018 02:27:13 -0700 (PDT)
MIME-Version: 1.0
From: "Aleksandr V. Piskunov" <aleksandr.v.piskunov@gmail.com>
Date: Sat, 16 Jun 2018 12:27:12 +0300
Message-ID: <CACsX8BiJJyTc8kS-_u4eMrDLgyOoNxKvhFL8YF1M2mnkKBOxTg@mail.gmail.com>
Subject: OpenWRT dynamic IP watchdog
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

I'm using OpenWRT routers to connect several networks (most behind
NAT) to the main one, with a public but dynamic IP. In order to keep
WireGuard connections alive in case of sudden endpoint IP change, some
kind of monitoring is required, so I adapted
https://github.com/WireGuard/WireGuard/blob/master/contrib/examples/reresolve-dns/reresolve-dns.sh
script to the specifics of OpenWRT networking system.
Tested it for a few weeks with a several IP changes, server downtimes,
etc.. seems to be working just fine.

If any OpenWRT wireguard package maintainers are reading this, please
review and consider for pushing to the wireguard-tools(?) package.


#!/bin/sh
# to be called from cron every 1..2 minutes
. /lib/functions.sh

check_peer_activity() {
  local cfg=$1
  local iface=$2
  local public_key
  local endpoint_host
  local endpoint_port
  local persistent_keepalive
  local last_handshake
  local idle_seconds

  config_get public_key "${cfg}" "public_key"
  config_get endpoint_host "${cfg}" "endpoint_host"
  config_get endpoint_port "${cfg}" "endpoint_port"
  config_get persistent_keepalive "${cfg}" "persistent_keepalive"

  # only process peers with endpoints and keepalive set
  [ -z ${endpoint_host} ] && return 0;
  [ -z ${persistent_keepalive} ] && return 0;

  # resolve endpoint and reconnect if not responding for too long
  last_handshake=`wg show ${iface} latest-handshakes | grep
${public_key} | awk '{print $2}'`
  [ -z ${last_handshake} ] && return 0;
  idle_seconds=$((`date +%s`-${last_handshake}))
  [ ${idle_seconds} -lt 150 ] && return 0;
  logger -t "wireguard_monitor" "${iface} endpoint
${endpoint_host}:${endpoint_port} is not responding for
${idle_seconds} seconds, trying to reconnect"
  wg set ${iface} peer ${public_key} endpoint
"${endpoint_host}:${endpoint_port}"
}

# query ubus for all active wireguard interfaces
wg_ifaces=`ubus -S call network.interface dump | jsonfilter -e
'@.interface[@.up=true]' | jsonfilter -a -e
'@[@.proto="wireguard"].interface' | tr "\n" " "`

# check every peer in every active wireguard interface
config_load network
for iface in $wg_ifaces; do
  config_foreach check_peer_activity "wireguard_${iface}" "${iface}"
done
