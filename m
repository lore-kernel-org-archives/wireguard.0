Return-Path: <SRS0=wYFz=3R=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC4C1C33C9E
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Jan 2020 10:34:51 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4162221739
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Jan 2020 10:34:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=rfraile.eu header.i=@rfraile.eu header.b="XaHuPZt8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4162221739
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rfraile.eu
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 88232ccd;
	Tue, 28 Jan 2020 10:34:49 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4b163008
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Jan 2020 18:37:26 +0000 (UTC)
Received: from smtp-relay-03-5.dondominio.net (smtp-relay-03-5.dondominio.net
 [31.214.176.48])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 46b85e3e
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Jan 2020 18:37:26 +0000 (UTC)
Received: from localhost (smtp-relay-local.scip.local [127.0.0.1])
 by smtp-relay.dondominio.com (Postfix) with SMTP id C60FD40925
 for <wireguard@lists.zx2c4.com>; Fri, 24 Jan 2020 19:37:24 +0100 (CET)
Received: from mail-node.dondominio.com 
 by smtp-relay.dondominio.com (Postfix) with ESMTP id 31D5440858;
 Fri, 24 Jan 2020 19:37:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rfraile.eu; s=dddk;
 t=1579891043; bh=d3q1MpFaAxTqrFxoJTbS6FVeuxaNYEct1PqfoWLjkMU=;
 h=Content-Type:Date:From:To:Subject:Message-ID;
 b=XaHuPZt8ueEXo8w0qfThzJ4lK4jPfzZ3+YD32u/91oKSaE5KLBKH0ZSgzP2NPV4S9
 gp4Fq7yZladuAY/QchCI/BPekeEwtsEPEzyw86IJcBRyKGEMIkK5fq+QdSxPzstzlY
 JC07U2EZCc68TRHGqD3JYblCdmyS5duIjwuM9brg=
Received: from webmail.rfraile.eu (webmail-03.scip.local [172.21.33.135])
 (Authenticated sender: rfraile@rfraile.eu)
 by mail-node.dondominio.com (Postfix) with ESMTPA id 0CF5040154;
 Fri, 24 Jan 2020 19:37:23 +0100 (CET)
Received: from 2.154.21.178.dyn.user.ono.com ([2.154.21.178])
 via webmail-ha-01.scip.local ([172.21.33.131]) by webmail.rfraile.eu
 with HTTP (HTTP/1.1 POST); Fri, 24 Jan 2020 19:37:23 +0100
MIME-Version: 1.0
Date: Fri, 24 Jan 2020 19:37:23 +0100
From: Ricardo Fraile <rfraile@rfraile.eu>
To: wireguard@lists.zx2c4.com
Subject: [PATCH] wg-quick: Linux and FreeBSD: Add support to search domain in
 wg-quick
Message-ID: <39913106ac854a2f2515aa2ad10d71ad@rfraile.eu>
X-Sender: rfraile@rfraile.eu
User-Agent: DD Webmail
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
 (mail-node.dondominio.com [0.0.0.0]); Fri, 24 Jan 2020 19:37:23 +0100 (CET)
X-Mailman-Approved-At: Tue, 28 Jan 2020 11:34:47 +0100
Cc: kevin@darbyshire-bryant.me.uk, mdlayher@gmail.com
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hello,


This patch allows wg-quick to pass the search domain to resolvconf with 
the option 'DNSSearch=' as it already does with the 'DNS=' option. As an 
example:

[Interface]
...
DNSSearch = lan1.example.com, lan2.example.com
...

This was discussed previously a few times:

https://lists.zx2c4.com/pipermail/wireguard/2019-January/003811.html
https://lists.zx2c4.com/pipermail/wireguard/2018-May/002882.html
https://lists.zx2c4.com/pipermail/wireguard/2019-September/004578.html


Thanks,
Ricardo F.




diff --git a/src/man/wg-quick.8 b/src/man/wg-quick.8
index 6250adc..2094c30 100644
--- a/src/man/wg-quick.8
+++ b/src/man/wg-quick.8
@@ -1,4 +1,4 @@
-.TH WG-QUICK 8 "2016 January 1" ZX2C4 "WireGuard"
+.TH WG-QUICK 8 "2020 January 1" ZX2C4 "WireGuard"

  .SH NAME
  wg-quick - set up a WireGuard interface simply
@@ -82,6 +82,10 @@ DNS servers. May be specified multiple times. Upon 
bringing the interface up, th
  .BR resolvconf (8)
  are undesirable, the PostUp and PostDown keys below may be used 
instead.
  .IP \(bu
+DNSSearch \(em a comma-separated list of domain names to be set as the 
interface's
+search for hostname lookups. This options runs in conjunction with DNS 
and only if that is
+already set. Only available on Linux and FreeBSD.
+.IP \(bu
  MTU \(em if not specified, the MTU is automatically determined from the 
endpoint addresses
  or the system default route, which is usually a sane choice. However, 
to manually specify
  an MTU to override this automatic discovery, this value may be 
specified explicitly.
@@ -124,6 +128,8 @@ traffic:
  .br
      \fBDNS = 10.200.100.1\fP
  .br
+    \fBDNSSearch = loc1.example.com, loc2.example.com\fP
+.br
      PrivateKey = oK56DE9Ue9zK76rAc8pBl6opph+1v36lm7cXXsQKrQM=
  .br

@@ -141,7 +147,7 @@ traffic:

  The `Address` field is added here in order to set up the address for 
the interface. The `DNS` field
  indicates that a DNS server for the interface should be configured via
-.BR resolvconf (8).
+.BR resolvconf (8), the `DNSSerach` field set the search domains with 
it too.
  The peer's allowed IPs entry implies that this interface should be 
configured as the default gateway,
  which this script does.

diff --git a/src/wg-quick/freebsd.bash b/src/wg-quick/freebsd.bash
index c390dcc..a108323 100755
--- a/src/wg-quick/freebsd.bash
+++ b/src/wg-quick/freebsd.bash
@@ -16,6 +16,7 @@ INTERFACE=""
  ADDRESSES=( )
  MTU=""
  DNS=( )
+DNS_SEARCH=( )
  TABLE=""
  PRE_UP=( )
  POST_UP=( )
@@ -85,6 +86,7 @@ parse_options() {
  			Address) ADDRESSES+=( ${value//,/ } ); continue ;;
  			MTU) MTU="$value"; continue ;;
  			DNS) DNS+=( ${value//,/ } ); continue ;;
+			DNSSearch) DNS_SEARCH+=( ${value//,/ } ); continue ;;
  			Table) TABLE="$value"; continue ;;
  			PreUp) PRE_UP+=( "$value" ); continue ;;
  			PreDown) PRE_DOWN+=( "$value" ); continue ;;
@@ -297,7 +299,11 @@ monitor_daemon() {
  HAVE_SET_DNS=0
  set_dns() {
  	[[ ${#DNS[@]} -gt 0 ]] || return 0
-	printf 'nameserver %s\n' "${DNS[@]}" | cmd resolvconf -a "$INTERFACE" 
-x
+	if [[ -n $DNS_SEARCH ]]; then
+		(printf 'nameserver %s\n' "${DNS[@]}" && printf 'search %s\n' 
"$DNS_SEARCH") | cmd resolvconf -a "$INTERFACE" -x
+	else
+		printf 'nameserver %s\n' "${DNS[@]}" | cmd resolvconf -a "$INTERFACE" 
-x
+	fi
  	HAVE_SET_DNS=1
  }

@@ -342,8 +348,9 @@ save_config() {
  	{ read -r _; while read -r _ _ _ address _; do
  		new_config+="Address = $address"$'\n'
  	done } < <(netstat -I "$INTERFACE" -n -W -f inet6)
-	while read -r address; do
-		[[ $address =~ ^nameserver\ ([a-zA-Z0-9_=+:%.-]+)$ ]] && 
new_config+="DNS = ${BASH_REMATCH[1]}"$'\n'
+	while read -r line; do
+		[[ $line =~ ^nameserver\ ([a-zA-Z0-9_=+:%.-]+)$ ]] && 
new_config+="DNS = ${BASH_REMATCH[1]}"$'\n'
+		[[ $line =~ ^search\ (.+)$ ]] && new_config+="DNSSearch = 
${BASH_REMATCH[1]/ /, }"$'\n'
  	done < <(resolvconf -l "$INTERFACE" 2>/dev/null)
  	[[ -n $MTU ]] && new_config+="MTU = $MTU"$'\n'
  	[[ -n $TABLE ]] && new_config+="Table = $TABLE"$'\n'
@@ -395,6 +402,7 @@ cmd_usage() {
  	  - Address: may be specified one or more times and contains one or 
more
  	    IP addresses (with an optional CIDR mask) to be set for the 
interface.
  	  - DNS: an optional DNS server to use while the device is up.
+	  - DNSSearch: Search list for host-name lookup to use while the 
device is up.
  	  - MTU: an optional MTU for the interface; if unspecified, 
auto-calculated.
  	  - Table: an optional routing table to which routes will be added; if
  	    unspecified or \`auto', the default table is used. If \`off', no 
routes
diff --git a/src/wg-quick/linux.bash b/src/wg-quick/linux.bash
index 7c2c002..1715354 100755
--- a/src/wg-quick/linux.bash
+++ b/src/wg-quick/linux.bash
@@ -16,6 +16,7 @@ INTERFACE=""
  ADDRESSES=( )
  MTU=""
  DNS=( )
+DNS_SEARCH=( )
  TABLE=""
  PRE_UP=( )
  POST_UP=( )
@@ -57,6 +58,7 @@ parse_options() {
  			Address) ADDRESSES+=( ${value//,/ } ); continue ;;
  			MTU) MTU="$value"; continue ;;
  			DNS) DNS+=( ${value//,/ } ); continue ;;
+			DNSSearch) DNS_SEARCH=${value//,/}; continue ;;
  			Table) TABLE="$value"; continue ;;
  			PreUp) PRE_UP+=( "$value" ); continue ;;
  			PreDown) PRE_DOWN+=( "$value" ); continue ;;
@@ -150,7 +152,11 @@ resolvconf_iface_prefix() {
  HAVE_SET_DNS=0
  set_dns() {
  	[[ ${#DNS[@]} -gt 0 ]] || return 0
-	printf 'nameserver %s\n' "${DNS[@]}" | cmd resolvconf -a 
"$(resolvconf_iface_prefix)$INTERFACE" -m 0 -x
+	if [[ -n $DNS_SEARCH ]]; then
+		(printf 'nameserver %s\n' "${DNS[@]}" && printf 'search %s\n' 
"$DNS_SEARCH") | cmd resolvconf -a 
"$(resolvconf_iface_prefix)$INTERFACE" -m 0 -x
+	else
+		printf 'nameserver %s\n' "${DNS[@]}" | cmd resolvconf -a 
"$(resolvconf_iface_prefix)$INTERFACE" -m 0 -x
+	fi
  	HAVE_SET_DNS=1
  }

@@ -253,8 +259,9 @@ save_config() {
  	for address in ${BASH_REMATCH[1]}; do
  		new_config+="Address = $address"$'\n'
  	done
-	while read -r address; do
-		[[ $address =~ ^nameserver\ ([a-zA-Z0-9_=+:%.-]+)$ ]] && 
new_config+="DNS = ${BASH_REMATCH[1]}"$'\n'
+	while read -r line; do
+		[[ $line =~ ^nameserver\ ([a-zA-Z0-9_=+:%.-]+)$ ]] && 
new_config+="DNS = ${BASH_REMATCH[1]}"$'\n'
+		[[ $line =~ ^search\ (.+)$ ]] && new_config+="DNSSearch = 
${BASH_REMATCH[1]/ /, }"$'\n'
  	done < <(resolvconf -l "$(resolvconf_iface_prefix)$INTERFACE" 
2>/dev/null || cat 
"/etc/resolvconf/run/interface/$(resolvconf_iface_prefix)$INTERFACE" 
2>/dev/null)
  	[[ -n $MTU && $(ip link show dev "$INTERFACE") =~ mtu\ ([0-9]+) ]] && 
new_config+="MTU = ${BASH_REMATCH[1]}"$'\n'
  	[[ -n $TABLE ]] && new_config+="Table = $TABLE"$'\n'
@@ -304,6 +311,7 @@ cmd_usage() {
  	  - Address: may be specified one or more times and contains one or 
more
  	    IP addresses (with an optional CIDR mask) to be set for the 
interface.
  	  - DNS: an optional DNS server to use while the device is up.
+	  - DNSSearch: Search list for host-name lookup to use while the 
device is up.
  	  - MTU: an optional MTU for the interface; if unspecified, 
auto-calculated.
  	  - Table: an optional routing table to which routes will be added; if
  	    unspecified or \`auto', the default table is used. If \`off', no 
routes
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
