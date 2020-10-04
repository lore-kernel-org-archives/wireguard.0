Return-Path: <SRS0=EmC4=DQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC286C43457
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  9 Oct 2020 12:13:39 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3089A20709
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  9 Oct 2020 12:13:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="io4gQBUT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3089A20709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=riseup.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 30c611a3;
	Fri, 9 Oct 2020 11:40:14 +0000 (UTC)
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f9e22d13
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 4 Oct 2020 20:48:38 +0000 (UTC)
Received: from capuchin.riseup.net (capuchin-pn.riseup.net [10.0.1.176])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (Client CN "*.riseup.net",
 Issuer "Sectigo RSA Domain Validation Secure Server CA" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4C4GqT4HpTzDsZx
 for <wireguard@lists.zx2c4.com>; Sun,  4 Oct 2020 14:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1601846453; bh=LMKNr8Tx+CSKquVRzrIShAhLi8DIb5xS1kul97TSDPQ=;
 h=Subject:To:From:Date:From;
 b=io4gQBUTtxaP7qI7PzzX7b0RHY51rKm2aDhFgW/wxwRN0q4ag3K3/3igTq0FatDaS
 IFXzborG7Xh08xDMZTJuQYjt+G95G0fglKp+1vcAIexVDuoDwHYDbBxz3EYGkQsy9D
 X8vxdyHZuUZ2cSrBINf5VzWCl2QJBRThXPPeYPv4=
X-Riseup-User-ID: 3D73E0AA3FB61D39B7EADCC7670155331407766ED7E09310F816CE5B275EE6D1
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by capuchin.riseup.net (Postfix) with ESMTPSA id 4C4GqT0PfFz8vQ0
 for <wireguard@lists.zx2c4.com>; Sun,  4 Oct 2020 14:20:52 -0700 (PDT)
Subject: [PATCH] wg-quick linux: Add strip-and-eval cmd to extract keys from
 PostUp
To: wireguard@lists.zx2c4.com
From: Robin Schneider <ypid@riseup.net>
X-Forwarded-Message-Id: 
Message-ID: <be4e9109-399b-5520-e6fd-e7163350aaf0@riseup.net>
Date: Sun, 4 Oct 2020 23:20:49 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 09 Oct 2020 13:40:09 +0200
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

The manpage mentions the trick to use PostUp to read the PrivateKey (or
PresharedKey) from a command (or file). However, when you actually use
that you notice that this is currently not fully supported. The issue is
that

```Shell
wg syncconf wgnet0 <(wg-quick strip wgnet0)
```

from the manpage now breaks the VPN because it *removes* the private key
from the WireGuard interface. The reason is that `strip` removes PostUp
of course.

This patch tries to add full support to read WireGuard keys from files
or command outputs by evaluating PostUp using a best effort approach
(using regex). It will not work for everything but when you follow the
manpage closely, it will work.

I also propose to update the systemd template to make seamless use of
this. This is not a must because the sysadmin can easily change the
ExecReload using systemd drop-in files.

Note that the patchset is incomplete (currently only for Linux).
I don’t have all the other OSes laying around. When the patch looks ok, 
I can apply it to the other versions also.

Example use of this patch:
https://github.com/ypid/ansible-wireguard/tree/prepare-for-debops

Signed-off-by: Robin Schneider <ypid@riseup.net>
---
 src/man/wg-quick.8            |  9 +++++++++
 src/systemd/wg-quick@.service |  2 +-
 src/wg-quick/linux.bash       | 36 ++++++++++++++++++++++++++++++++---
 3 files changed, 43 insertions(+), 4 deletions(-)

diff --git a/src/man/wg-quick.8 b/src/man/wg-quick.8
index b84eb64..f620704 100644
--- a/src/man/wg-quick.8
+++ b/src/man/wg-quick.8
@@ -13,6 +13,8 @@ wg-quick - set up a WireGuard interface simply
 .I save
 |
 .I strip
+|
+.I strip-and-eval
 ] [
 .I CONFIG_FILE
 |
@@ -34,6 +36,7 @@ with all
 .BR wg-quick (8)-specific
 options removed, suitable for use with
 .BR wg (8).
+Use \fIstrip-and-eval\fP in case you use `PostUp' to read PrivateKey or PresharedKey from a file or command and need them in the output.
 
 \fICONFIG_FILE\fP is a configuration file, whose filename is the interface name
 followed by `.conf'. Otherwise, \fIINTERFACE\fP is an interface name, with configuration
@@ -256,6 +259,12 @@ sessions:
 
 \fB    # wg syncconf wgnet0 <(wg-quick strip wgnet0)\fP
 
+\fIstrip-and-eval\fP additionally extracts PrivateKey and PresharedKey from `PostUp` statements and translates them into configuration that
+.BR wg (8)
+does understand:
+
+\fB    # wg syncconf wgnet0 <(wg-quick strip-and-eval wgnet0)\fP
+
 .SH SEE ALSO
 .BR wg (8),
 .BR ip (8),
diff --git a/src/systemd/wg-quick@.service b/src/systemd/wg-quick@.service
index dbdab44..1d59446 100644
--- a/src/systemd/wg-quick@.service
+++ b/src/systemd/wg-quick@.service
@@ -15,7 +15,7 @@ Type=oneshot
 RemainAfterExit=yes
 ExecStart=/usr/bin/wg-quick up %i
 ExecStop=/usr/bin/wg-quick down %i
-ExecReload=/bin/bash -c 'exec /usr/bin/wg syncconf %i <(exec /usr/bin/wg-quick strip %i)'
+ExecReload=/bin/bash -c 'exec /usr/bin/wg syncconf %i <(exec /usr/bin/wg-quick strip-and-eval %i)'
 Environment=WG_ENDPOINT_RESOLUTION_RETRIES=infinity
 
 [Install]
diff --git a/src/wg-quick/linux.bash b/src/wg-quick/linux.bash
index e4d4c4f..89f9ef9 100755
--- a/src/wg-quick/linux.bash
+++ b/src/wg-quick/linux.bash
@@ -38,8 +38,11 @@ die() {
 }
 
 parse_options() {
+	local parsing_mode part_of_command peer_pubkey
 	local interface_section=0 line key value stripped v
+	declare -A peer_pubkey_to_psk
 	CONFIG_FILE="$1"
+	parsing_mode="${2:-safe}"
 	[[ $CONFIG_FILE =~ ^[a-zA-Z0-9_=+.-]{1,15}$ ]] && CONFIG_FILE="/etc/wireguard/$CONFIG_FILE.conf"
 	[[ -e $CONFIG_FILE ]] || die "\`$CONFIG_FILE' does not exist"
 	[[ $CONFIG_FILE =~ (^|/)([a-zA-Z0-9_=+.-]{1,15})\.conf$ ]] || die "The config file must be a valid interface name, followed by .conf"
@@ -63,12 +66,35 @@ parse_options() {
 			Table) TABLE="$value"; continue ;;
 			PreUp) PRE_UP+=( "$value" ); continue ;;
 			PreDown) PRE_DOWN+=( "$value" ); continue ;;
-			PostUp) POST_UP+=( "$value" ); continue ;;
+			PostUp) POST_UP+=( "$value" );
+				if [[ $parsing_mode == "unsafe" ]]; then
+					part_of_command=""
+					if [[ $value =~ ^wg\ +set\ +%i\ +private-key\ +(.+)$ ]]; then
+						key='PrivateKey'
+						part_of_command="${BASH_REMATCH[1]}"
+					elif [[ $value =~ ^wg\ +set\ +%i\ +peer\ +(.+)\ +preshared-key\ +(.+)$ ]]; then
+						key='PresharedKey'
+						peer_pubkey="${BASH_REMATCH[1]}"
+						part_of_command="${BASH_REMATCH[2]}"
+					fi
+					if [[ -n "$part_of_command" ]]; then
+						part_of_command="${part_of_command//%i/$INTERFACE}"
+						value="$(eval "cat $part_of_command")"
+						case "$key" in
+							PresharedKey) peer_pubkey_to_psk["$peer_pubkey"]="$value" ;;
+							*) WG_CONFIG+="$key = $value"$'\n' ;;
+						esac
+					fi
+				fi
+				continue ;;
 			PostDown) POST_DOWN+=( "$value" ); continue ;;
 			SaveConfig) read_bool SAVE_CONFIG "$value"; continue ;;
 			esac
 		fi
 		WG_CONFIG+="$line"$'\n'
+		if [[ $interface_section -eq 0 && $key == 'PublicKey' && -n "${peer_pubkey_to_psk[$value]}" ]]; then
+			WG_CONFIG+="PresharedKey = ${peer_pubkey_to_psk[$value]}"$'\n'
+		fi
 	done < "$CONFIG_FILE"
 	shopt -u nocasematch
 }
@@ -224,7 +250,7 @@ add_default() {
 	cmd ip $proto rule add not fwmark $table table $table
 	cmd ip $proto rule add table main suppress_prefixlength 0
 
-	local marker="-m comment --comment \"wg-quick(8) rule for $INTERFACE\"" restore=$'*raw\n' nftable="wg-quick-$INTERFACE" nftcmd 
+	local marker="-m comment --comment \"wg-quick(8) rule for $INTERFACE\"" restore=$'*raw\n' nftable="wg-quick-$INTERFACE" nftcmd
 	printf -v nftcmd '%sadd table %s %s\n' "$nftcmd" "$pf" "$nftable"
 	printf -v nftcmd '%sadd chain %s %s preraw { type filter hook prerouting priority -300; }\n' "$nftcmd" "$pf" "$nftable"
 	printf -v nftcmd '%sadd chain %s %s premangle { type filter hook prerouting priority -150; }\n' "$nftcmd" "$pf" "$nftable"
@@ -298,7 +324,7 @@ execute_hooks() {
 
 cmd_usage() {
 	cat >&2 <<-_EOF
-	Usage: $PROGRAM [ up | down | save | strip ] [ CONFIG_FILE | INTERFACE ]
+	Usage: $PROGRAM [ up | down | save | strip | strip-and-eval ] [ CONFIG_FILE | INTERFACE ]
 
 	  CONFIG_FILE is a configuration file, whose filename is the interface name
 	  followed by \`.conf'. Otherwise, INTERFACE is an interface name, with
@@ -381,6 +407,10 @@ elif [[ $# -eq 2 && $1 == strip ]]; then
 	auto_su
 	parse_options "$2"
 	cmd_strip
+elif [[ $# -eq 2 && $1 == strip-and-eval ]]; then
+	auto_su
+	parse_options "$2" "unsafe"
+	cmd_strip
 else
 	cmd_usage
 	exit 1
-- 
2.20.1

