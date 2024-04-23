Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D09D4920F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 12:40:42 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 66a99bb2;
	Mon, 18 Nov 2024 12:36:08 +0000 (UTC)
Received: from mail-40132.protonmail.ch (mail-40132.protonmail.ch
 [185.70.40.132])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b3312ee1
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 23 Apr 2024 08:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail3; t=1713859943; x=1714119143;
 bh=aSKAC6MDt1Y6G5whkuNKvayh55d4bNwv0oDSMMUKsAk=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=Vx0LmuGD53fZPMZFMt6eZRb8z/04PSC9dMSJIZSRbr39ERVS7sncqNC/s3wRjFpaX
 a3Gk5s0dkyQI9ag7hJmSn0l8YMNR2YJgBkyWhMlTXMGEGvrkyjY72sdfcMqsV+Cuz3
 E0af9gAsP1Q4/yjDhJfd07+f7OgrVJc5TvmHRcHIuEpiNqEMUHIKmitLRu1Yt6RM0y
 6fq7gDXshhI0SBsJoT9ONp22DMp05N5QUsfaCPQDyWP6ChQvjLD0Ryg51CJBM/KqLf
 9W4uLMmCT2yNQBkCWANMfs/xgmBeS6ywSrjyzNyroVR+m/AVs9iVto7OGEZyudMBif
 y3fNxrY+HXqvg==
Date: Tue, 23 Apr 2024 08:12:19 +0000
To: wireguard@lists.zx2c4.com
From: Andrew Aladjev <andrew.aladjev@protonmail.com>
Cc: Andrew Aladjev <andrew.aladjev@gmail.com>
Subject: [PATCH] added global lock to linux wg quick,
 fixed race condition when 2 wg interfaces wanted to have the same
 table number
Message-ID: <20240423081212.12537-1-andrew.aladjev@protonmail.com>
Feedback-ID: 69562842:user:proton
X-Pm-Message-ID: 8767f2fd65e1bf3de58c69e96f38b0272cd06ae7
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

From: Andrew Aladjev <andrew.aladjev@gmail.com>

Signed-off-by: Andrew Aladjev <andrew.aladjev@gmail.com>
---
 src/wg-quick/linux.bash | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/src/wg-quick/linux.bash b/src/wg-quick/linux.bash
index 4193ce5..2a8fa16 100755
--- a/src/wg-quick/linux.bash
+++ b/src/wg-quick/linux.bash
@@ -27,6 +27,17 @@ CONFIG_FILE=3D""
 PROGRAM=3D"${0##*/}"
 ARGS=3D( "$@" )
=20
+LOCK_DIR_PATH=3D"/var/lock"
+mkdir -p "$LOCK_DIR_PATH"
+
+WG_QUICK_LOCK_PATH=3D"${LOCK_DIR_PATH}/wg-quick.lock"
+
+get_lock() {
+=09exec {FD}>"$WG_QUICK_LOCK_PATH" || exit 1
+=09flock -x "$FD" || exit 1
+=09trap "rm -f $WG_QUICK_LOCK_PATH" EXIT
+}
+
 cmd() {
 =09echo "[#] $*" >&2
 =09"$@"
@@ -210,16 +221,22 @@ remove_firewall() {
=20
 HAVE_SET_FIREWALL=3D0
 add_default() {
-=09local table line
+=09local proto=3D-4 iptables=3Diptables pf=3Dip
+=09[[ $1 =3D=3D *:* ]] && proto=3D-6 iptables=3Dip6tables pf=3Dip6
+
+=09local table
 =09if ! get_fwmark table; then
+=09=09# We are trying to get next global table number and use it with defa=
ult route.
+=09        # This process should be globaly locked.
+=09        get_lock
+
 =09=09table=3D51820
 =09=09while [[ -n $(ip -4 route show table $table 2>/dev/null) || -n $(ip =
-6 route show table $table 2>/dev/null) ]]; do
 =09=09=09((table++))
 =09=09done
 =09=09cmd wg set "$INTERFACE" fwmark $table
 =09fi
-=09local proto=3D-4 iptables=3Diptables pf=3Dip
-=09[[ $1 =3D=3D *:* ]] && proto=3D-6 iptables=3Dip6tables pf=3Dip6
+
 =09cmd ip $proto rule add not fwmark $table table $table
 =09cmd ip $proto rule add table main suppress_prefixlength 0
 =09cmd ip $proto route add "$1" dev "$INTERFACE" table $table
@@ -229,20 +246,26 @@ add_default() {
 =09printf -v nftcmd '%sadd chain %s %s preraw { type filter hook preroutin=
g priority -300; }\n' "$nftcmd" "$pf" "$nftable"
 =09printf -v nftcmd '%sadd chain %s %s premangle { type filter hook prerou=
ting priority -150; }\n' "$nftcmd" "$pf" "$nftable"
 =09printf -v nftcmd '%sadd chain %s %s postmangle { type filter hook postr=
outing priority -150; }\n' "$nftcmd" "$pf" "$nftable"
+
+=09local line
 =09while read -r line; do
 =09=09[[ $line =3D~ .*inet6?\ ([0-9a-f:.]+)/[0-9]+.* ]] || continue
 =09=09printf -v restore '%s-I PREROUTING ! -i %s -d %s -m addrtype ! --src=
-type LOCAL -j DROP %s\n' "$restore" "$INTERFACE" "${BASH_REMATCH[1]}" "$ma=
rker"
 =09=09printf -v nftcmd '%sadd rule %s %s preraw iifname !=3D "%s" %s daddr=
 %s fib saddr type !=3D local drop\n' "$nftcmd" "$pf" "$nftable" "$INTERFAC=
E" "$pf" "${BASH_REMATCH[1]}"
 =09done < <(ip -o $proto addr show dev "$INTERFACE" 2>/dev/null)
+
 =09printf -v restore '%sCOMMIT\n*mangle\n-I POSTROUTING -m mark --mark %d =
-p udp -j CONNMARK --save-mark %s\n-I PREROUTING -p udp -j CONNMARK --resto=
re-mark %s\nCOMMIT\n' "$restore" $table "$marker" "$marker"
 =09printf -v nftcmd '%sadd rule %s %s postmangle meta l4proto udp mark %d =
ct mark set mark \n' "$nftcmd" "$pf" "$nftable" $table
 =09printf -v nftcmd '%sadd rule %s %s premangle meta l4proto udp meta mark=
 set ct mark \n' "$nftcmd" "$pf" "$nftable"
+
 =09[[ $proto =3D=3D -4 ]] && cmd sysctl -q net.ipv4.conf.all.src_valid_mar=
k=3D1
+
 =09if type -p nft >/dev/null; then
 =09=09cmd nft -f <(echo -n "$nftcmd")
 =09else
 =09=09echo -n "$restore" | cmd $iptables-restore -n
 =09fi
+
 =09HAVE_SET_FIREWALL=3D1
 =09return 0
 }
--=20
2.40.1


