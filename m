Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B67D49212
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 12:35:55 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 57235df4;
	Mon, 18 Nov 2024 12:35:54 +0000 (UTC)
Received: from sender4-of-o55.zoho.com (sender4-of-o55.zoho.com
 [136.143.188.55])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 33c16565
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 12 Mar 2024 15:03:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1710255792; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=dHe6T8oQPtwDPzDwB8VcIh4l9YUkICHumFlaBs2ZrRfVMqmomYvwSdx3KeV8TX69NyKFntND6P+2sOxYH5UGn8Fjc5BrrqHfazaP5CPKydFwy0b2zHygd8rtGzk95oWx+23OoVQakEz0Dd8aQqnowxlXXOq/QMZUgAM6z3KHPOk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1710255792;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=whKMzBN0BPRcQH2cXPyll7r9Fi64EcZPvpX3+WOgHRo=; 
 b=X0CIwsv9V/c63frgs5i8em/lz1g5EP6SalTm936XZd7xOzh8HnVXuJubg536MQ8aj9JzrJQKq0qe2wlcjnep5ZDn2sUESqOYm3Jj5AgHzoCDQ7Mo/B+SQN8e3MRJS+jylLJ63v9btQPIHwcoLEjrHKpKO7jUNQquq8SQyBKnP/A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=christ-faesch.ch;
 spf=pass  smtp.mailfrom=24cdg@christ-faesch.ch;
 dmarc=pass header.from=<24cdg@christ-faesch.ch>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1710255792; 
 s=zoho; d=christ-faesch.ch; i=24cdg@christ-faesch.ch;
 h=Message-ID:Subject:Subject:From:From:To:To:Date:Date:In-Reply-To:Content-Type:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
 bh=whKMzBN0BPRcQH2cXPyll7r9Fi64EcZPvpX3+WOgHRo=;
 b=RCXVuswzfScP7RGjboznsEzPHLOtHkxvVQ1V5Lvbhb7k13ylwLp4eCCL4ublh5aV
 45QGmrSAaodys/0tA5NJyq7dgb2YpRs5OaImwlbytVYMUbMpdXyUqDW3PwyC0GW9tOk
 hnEW9keCYnoE0Zz/MVtmIxmHBW+CuZr43i5F/Krs=
Received: from buero.fritz.box (adsl-89-217-163-145.adslplus.ch
 [89.217.163.145]) by mx.zohomail.com
 with SMTPS id 1710255791716705.2815689699994;
 Tue, 12 Mar 2024 08:03:11 -0700 (PDT)
Message-ID: <1e1fb55992c5a7d4dafdfcec207b28d2b0478c6d.camel@christ-faesch.ch>
Subject: Friendly peer names in wg-quick
From: Andreas Christ <24cdg@christ-faesch.ch>
To: wireguard@lists.zx2c4.com
Date: Tue, 12 Mar 2024 16:03:09 +0100
In-Reply-To: 
Content-Type: text/plain; charset="ISO-8859-15"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-Mailman-Approved-At: Mon, 18 Nov 2024 12:35:39 +0000
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

Dear wg-quick developers and maintainers 

Peer names are a feature request since a long time, e.g., 
https://www.mail-archive.com/wireguard@lists.zx2c4.com/msg02262.html. I
understand that this feature is not added to wg itself. Instead, I
suggest to consider adding the option to define human readable peer names ("FriendlyName") to wg-quick. The 4 sequential patches below
demonstrate how FriendlyName could be implemented; example given is the
linux.bash version of wg-quick.

'wg-quick show' then produces the same output as 'wg show' plus human
readable peer names.

Andreas


[PATCH 1/4] FriendlyName as an extra configuration value in the [Peer]
sections

FriendlyName allows to give peers a human readable name. This commit
permits 
adding the extra configuration value and to retrieve those values. But
the 
values are not used, e.g., not displayed. 
--- 
src/wg-quick/linux.bash | 21 ++++++++++++++++++++- 
1 file changed, 20 insertions(+), 1 deletion(-) 

diff --git a/src/wg-quick/linux.bash b/src/wg-quick/linux.bash 
index 4193ce5..388f256 100755 
--- a/src/wg-quick/linux.bash 
+++ b/src/wg-quick/linux.bash 
@@ -26,6 +26,7 @@ SAVE_CONFIG=0 
CONFIG_FILE="" 
PROGRAM="${0##*/}" 
ARGS=( "$@" ) 
+declare -A PEERS=( ) 

cmd() { 
    echo "[#] $*" >&2 
@@ -47,12 +48,16 @@ parse_options() { 
    ((($(stat -c '0%#a' "$CONFIG_FILE") & $(stat -c '0%#a'
"${CONFIG_FILE%/*}") & 0007) == 0)) || echo "Warning: `$CONFIG_FILE' is
world accessible" >&2 
    INTERFACE="${BASH_REMATCH[2]}" 
    shopt -s nocasematch 
+    local peer_id 
+    local peer_name 
+    local -i peer_section 
    while read -r line || [[ -n $line ]]; do 
        stripped="${line%%#*}" 
        key="${stripped%%=*}"; key="${key##*([[:space:]])}";
key="${key%%*([[:space:]])}" 
        value="${stripped#*=}"; value="${value##*([[:space:]])}";
value="${value%%*([[:space:]])}" 
-        [[ $key == "["* ]] && interface_section=0 
+        [[ $key == "["* ]] && interface_section=0 && peer_section=0 
        [[ $key == "[Interface]" ]] && interface_section=1 
+        [[ $key == "[Peer]" ]] && peer_section=1 && peer_id='' &&
peer_name='no name' 
        if [[ $interface_section -eq 1 ]]; then 
            case "$key" in 
            Address) ADDRESSES+=( ${value//,/ } ); continue ;; 
@@ -68,9 +73,23 @@ parse_options() { 
            SaveConfig) read_bool SAVE_CONFIG "$value"; continue ;; 
            esac 
        fi 
+        if [[ $peer_section -eq 1 ]]; then 
+            case "$key" in 
+            PublicKey) 
+                peer_id="$value" 
+                PEERS[$peer_id]="$peer_name" 
+                ;; 
+            FriendlyName) 
+                peer_name="$value" 
+                [ -n "$peer_id" ] && PEERS[$peer_id]="$peer_name" 
+                continue 
+                ;; 
+            esac 
+        fi 
        WG_CONFIG+="$line"$' ' 
    done < "$CONFIG_FILE" 
    shopt -u nocasematch 
+    # for i in "${!PEERS[@]}" ; do echo "${i} -> ${PEERS[$i]}" ; done 
} 

read_bool() { 
-- 
2.34.1 

[PATCH 2/4] Add 'show' as a new command to wg-quick

The new command 'show' forwards to wg show, unmodified. This is a
preparatory 
step to include human readable names of peers. 
--- 
src/wg-quick/linux.bash | 9 +++++++++ 
1 file changed, 9 insertions(+) 

diff --git a/src/wg-quick/linux.bash b/src/wg-quick/linux.bash 
index 388f256..95be1c3 100755 
--- a/src/wg-quick/linux.bash 
+++ b/src/wg-quick/linux.bash 
@@ -380,6 +380,11 @@ cmd_strip() { 
    echo "$WG_CONFIG" 
} 

+cmd_show() { 
+    [[ " $(wg show interfaces) " == *" $INTERFACE "* ]] || die
"`$INTERFACE' is not a WireGuard interface" 
+    wg show $INTERFACE 
+} 
+ 
# ~~ function override insertion point ~~ 

if [[ $# -eq 1 && ( $1 == --help || $1 == -h || $1== help ) ]]; then 
@@ -400,6 +405,10 @@ elif [[ $# -eq 2 && $1== strip ]]; then 
    auto_su 
    parse_options "$2" 
    cmd_strip 
+elif [[ $# -eq 2 && $1 == show ]]; then 
+    auto_su 
+    parse_options "$2" 
+    cmd_show 
else 
    cmd_usage 
    exit 1 
-- 
2.34.1 

[PATCH 3/4] wg-quick show labels peers by human readable name
("FriendlyName")

--- 
src/wg-quick/linux.bash | 16 +++++++++++++++- 
1 file changed, 15 insertions(+), 1 deletion(-) 

diff --git a/src/wg-quick/linux.bash b/src/wg-quick/linux.bash 
index 95be1c3..a8f135c 100755 
--- a/src/wg-quick/linux.bash 
+++ b/src/wg-quick/linux.bash 
@@ -382,7 +382,21 @@ cmd_strip() { 

cmd_show() { 
    [[ " $(wg show interfaces) " == *" $INTERFACE "* ]] || die
"`$INTERFACE' is not a WireGuard interface" 
-    wg show $INTERFACE 
+    local -i empty=0 
+    local -r regex='peer.*: .*(.{43}=)' 
+    while read -r line ; do 
+        if [ ${empty} -eq 1 ] ; then 
+            empty=0 
+            # echo "after an empty line; now $line" 
+            if [[ "${line}" =~ ${regex} ]] ; then 
+                local peer_id="${BASH_REMATCH[1]}" 
+                #echo "peer_id = ${peer_id}" 
+                [ -n "${peer_id}" ] &&    echo "[ ${PEERS[$peer_id]}
]" 
+            fi 
+        fi 
+        [ -z "${line}" ] && empty=1 
+        echo "${line}" 
+    done < <( WG_COLOR_MODE=always wg show $INTERFACE ) 
} 

# ~~ function override insertion point ~~ 
-- 
2.34.1

[PATCH 4/4] Honors environment variable WG_COLOR_CODE, see man wg

Relies on [ -t 1 ] to determine whether the output is a tty or a pipe. 
--- 
src/wg-quick/linux.bash | 7 +++++-- 
1 file changed, 5 insertions(+), 2 deletions(-) 

diff --git a/src/wg-quick/linux.bash b/src/wg-quick/linux.bash 
index a8f135c..4847fc7 100755 
--- a/src/wg-quick/linux.bash 
+++ b/src/wg-quick/linux.bash 
@@ -101,7 +101,7 @@ read_bool() { 
} 

auto_su() { 
-    [[ $UID == 0 ]] || exec sudo -p "$PROGRAM must be run as root.
Please enter the password for %u to continue: " -- "$BASH" -- "$SELF"
"${ARGS[@]}" 
+    [[ $UID == 0 ]] || exec sudo --preserve-env=WG_COLOR_MODE -p
"$PROGRAM must be run as root. Please enter the password for %u to
continue: " -- "$BASH" -- "$SELF" "${ARGS[@]}" 
} 

add_if() { 
@@ -382,6 +382,9 @@ cmd_strip() { 

cmd_show() { 
    [[ " $(wg show interfaces) " == *" $INTERFACE "* ]] || die
"`$INTERFACE' is not a WireGuard interface" 
+    if [ "${WG_COLOR_MODE:-auto}" == 'auto' ] ; then 
+        [ -t 1 ] && WG_COLOR_MODE='always' || WG_COLOR_MODE='never' 
+    fi 
    local -i empty=0 
    local -r regex='peer.*: .*(.{43}=)' 
    while read -r line ; do 
@@ -396,7 +399,7 @@ cmd_show() { 
        fi 
        [ -z "${line}" ] && empty=1 
        echo "${line}" 
-    done < <( WG_COLOR_MODE=always wg show $INTERFACE ) 
+    done < <( WG_COLOR_MODE="${WG_COLOR_MODE}" wg show $INTERFACE ) 
} 

# ~~ function override insertion point ~~ 
-- 
2.34.1


