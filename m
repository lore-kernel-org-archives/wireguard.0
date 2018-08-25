Return-Path: jorgeanton@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 390850a1
 for <wireguard@lists.zx2c4.com>;
 Sat, 25 Aug 2018 01:28:51 +0000 (UTC)
Received: from mail-io0-x22e.google.com (mail-io0-x22e.google.com
 [IPv6:2607:f8b0:4001:c06::22e])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fea45a37
 for <wireguard@lists.zx2c4.com>;
 Sat, 25 Aug 2018 01:28:51 +0000 (UTC)
Received: by mail-io0-x22e.google.com with SMTP id e12-v6so8561003iok.12
 for <wireguard@lists.zx2c4.com>; Fri, 24 Aug 2018 18:42:04 -0700 (PDT)
MIME-Version: 1.0
From: Jorge AC <jorgeanton@gmail.com>
Date: Sat, 25 Aug 2018 03:41:51 +0200
Message-ID: <CAFafqTtD_Qk9pSZvurmg6tsWFyYLOarqJmA5bizpygxuOmPqbQ@mail.gmail.com>
Subject: [PATCH 1012/1012] Support for unicode interface names: only '%', ':'
 and '/' must be avoided
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

---
 src/tools/wg-quick/linux.bash | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/src/tools/wg-quick/linux.bash b/src/tools/wg-quick/linux.bash
index 48ce163..4317907 100755
--- a/src/tools/wg-quick/linux.bash
+++ b/src/tools/wg-quick/linux.bash
@@ -39,9 +39,9 @@ die() {
 parse_options() {
        local interface_section=0 line key value stripped
        CONFIG_FILE="$1"
-       [[ $CONFIG_FILE =~ ^[a-zA-Z0-9_=+.-]{1,15}$ ]] &&
CONFIG_FILE="/etc/wireguard/$CONFIG_FILE.conf"
+       [[ -e $CONFIG_FILE ]] || CONFIG_FILE="/etc/wireguard/$CONFIG_FILE.conf"
        [[ -e $CONFIG_FILE ]] || die "\`$CONFIG_FILE' does not exist"
-       [[ $CONFIG_FILE =~ (^|/)([a-zA-Z0-9_=+.-]{1,15})\.conf$ ]] ||
die "The config file must be a valid interface name, followed by
.conf"
+       [[ $CONFIG_FILE =~ (^|/)([^%:/]+)\.conf$ ]] || die "The config
file must be a valid interface name, followed by .conf"
        CONFIG_FILE="$(readlink -f "$CONFIG_FILE")"
        ((($(stat -c '0%#a' "$CONFIG_FILE") & $(stat -c '0%#a'
"${CONFIG_FILE%/*}") & 0007) == 0)) || echo "Warning: \`$CONFIG_FILE'
is world accessible" >&2
        INTERFACE="${BASH_REMATCH[2]}"
-- 
2.11.0
