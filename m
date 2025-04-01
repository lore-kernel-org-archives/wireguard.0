Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0802C54E93
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 20 May 2025 23:11:28 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d6db5054;
	Tue, 20 May 2025 19:55:22 +0000 (UTC)
Received: from mail-40136.protonmail.ch (mail-40136.protonmail.ch
 [185.70.40.136])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f356b840
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 1 Apr 2025 18:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=itrooz.fr;
 s=protonmail2; t=1743532344; x=1743791544;
 bh=cmHEmRG9iso5bBXFv/vYkQsh9H+jXmwomy3/60UmPRM=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
 List-Unsubscribe:List-Unsubscribe-Post;
 b=jiBVo4puiE5GH/wRtqv6tHmN7pULEg3IOUHF63K2uFcqwmgZw8+o9oNhwPdrsPxhg
 DwxB7ptwkkzKoUw4JCDPUMw/9NRb3dDKNl2Xt3o1xcoIbwBN2P6y/EYxSxLaLZKkXk
 kIU1qeF2jlETpA7iZlwNCzyKc3xi7wkEyA6mJWi215MRPmQUF3j1vuUUG941H8KHHK
 9E/KanqFGq4wse2nPsCxn+PS5O6R7yxsuHQT2zrvYgg8LT7jZoPAqbCU3ik36K56kx
 yjxMrrgddewbBsUuhtvhIyh+TgNACGgFSAHAzAMXA+xyEIVcbs/6TBQkvMVErj43/g
 uSoILMC0ktrqg==
Date: Tue, 01 Apr 2025 18:32:19 +0000
To: wireguard@lists.zx2c4.com
From: iTrooz <hey@itrooz.fr>
Cc: iTrooz <hey@itrooz.fr>
Subject: [PATCH] add variable `WG_QUICK_ROUTING_MODE` to wg-quick to force
 using fwmark for routing
Message-ID: <20250401183207.238784-1-hey@itrooz.fr>
Feedback-ID: 63092453:user:proton
X-Pm-Message-ID: 38e245fb51c804c139b27d0f763c52d931a3cca3
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 20 May 2025 19:52:08 +0000
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

rationale: Using an Endpoint that is part of a network in AllowedIPs
(e.g. Endpoint=3D162.12.13.1 and AllowedIPs=3D162.12.13.0/24) will cause a
looping route when enabling a wireguard connection, because of the
routes created by AllowedIPs values. This could be solved using the
more advanced fwmark-based routing (that you describe as "Improved
Rule-based Routing"), but it only takes effect when AllowedIPs contains
0.0.0.0/0. This patch allow users to override that behaviour in a
simply way.

This patch does not fix the root problem, which could be addressed in
one of the following ways:
- Finding Endpoints that are part of networks present in AllowedIPs,
and only enabling fwmark routing for them
- Always use fwmark routing, even if we don't need it
I do not have enough knowledge to choose which option to implement
(although I prefer #2 because of implementation simplicity). I would
like to submit another patch for this, but I will need guidance on what
option to choose.
---
 src/wg-quick/linux.bash | 55 ++++++++++++++++++++++-------------------
 1 file changed, 30 insertions(+), 25 deletions(-)

diff --git a/src/wg-quick/linux.bash b/src/wg-quick/linux.bash
index 4193ce5..3b1225e 100755
--- a/src/wg-quick/linux.bash
+++ b/src/wg-quick/linux.bash
@@ -99,7 +99,7 @@ del_if() {
 =09local table
 =09[[ $HAVE_SET_DNS -eq 0 ]] || unset_dns
 =09[[ $HAVE_SET_FIREWALL -eq 0 ]] || remove_firewall
-=09if [[ -z $TABLE || $TABLE =3D=3D auto ]] && get_fwmark table && [[ $(wg=
 show "$INTERFACE" allowed-ips) =3D~ /0(\ |$'\n'|$) ]]; then
+=09if [[ -z $TABLE || $TABLE =3D=3D auto ]] && get_fwmark table; then
 =09=09while [[ $(ip -4 rule show 2>/dev/null) =3D=3D *"lookup $table"* ]];=
 do
 =09=09=09cmd ip -4 rule delete table $table
 =09=09done
@@ -171,7 +171,7 @@ add_route() {
=20
 =09if [[ -n $TABLE && $TABLE !=3D auto ]]; then
 =09=09cmd ip $proto route add "$1" dev "$INTERFACE" table "$TABLE"
-=09elif [[ $1 =3D=3D */0 ]]; then
+=09elif [[ $WG_QUICK_ROUTING_MODE =3D=3D "improved" || $1 =3D=3D */0 ]]; t=
hen
 =09=09add_default "$1"
 =09else
 =09=09[[ -n $(ip $proto route show dev "$INTERFACE" match "$1" 2>/dev/null=
) ]] || cmd ip $proto route add "$1" dev "$INTERFACE"
@@ -209,7 +209,11 @@ remove_firewall() {
 }
=20
 HAVE_SET_FIREWALL=3D0
+# Add a route using "Improved Rule-based Routing"
 add_default() {
+=09local proto=3D-4 iptables=3Diptables pf=3Dip
+=09[[ $1 =3D=3D *:* ]] && proto=3D-6 iptables=3Dip6tables pf=3Dip6
+
 =09local table line
 =09if ! get_fwmark table; then
 =09=09table=3D51820
@@ -217,32 +221,33 @@ add_default() {
 =09=09=09((table++))
 =09=09done
 =09=09cmd wg set "$INTERFACE" fwmark $table
+
+=09=09cmd ip $proto rule add not fwmark $table table $table
+=09=09cmd ip $proto rule add table main suppress_prefixlength 0
+
+=09=09local marker=3D"-m comment --comment \"wg-quick(8) rule for $INTERFA=
CE\"" restore=3D$'*raw\n' nftable=3D"wg-quick-$INTERFACE" nftcmd=20
+=09=09printf -v nftcmd '%sadd table %s %s\n' "$nftcmd" "$pf" "$nftable"
+=09=09printf -v nftcmd '%sadd chain %s %s preraw { type filter hook prerou=
ting priority -300; }\n' "$nftcmd" "$pf" "$nftable"
+=09=09printf -v nftcmd '%sadd chain %s %s premangle { type filter hook pre=
routing priority -150; }\n' "$nftcmd" "$pf" "$nftable"
+=09=09printf -v nftcmd '%sadd chain %s %s postmangle { type filter hook po=
strouting priority -150; }\n' "$nftcmd" "$pf" "$nftable"
+=09=09while read -r line; do
+=09=09=09[[ $line =3D~ .*inet6?\ ([0-9a-f:.]+)/[0-9]+.* ]] || continue
+=09=09=09printf -v restore '%s-I PREROUTING ! -i %s -d %s -m addrtype ! --=
src-type LOCAL -j DROP %s\n' "$restore" "$INTERFACE" "${BASH_REMATCH[1]}" "=
$marker"
+=09=09=09printf -v nftcmd '%sadd rule %s %s preraw iifname !=3D "%s" %s da=
ddr %s fib saddr type !=3D local drop\n' "$nftcmd" "$pf" "$nftable" "$INTER=
FACE" "$pf" "${BASH_REMATCH[1]}"
+=09=09done < <(ip -o $proto addr show dev "$INTERFACE" 2>/dev/null)
+=09=09printf -v restore '%sCOMMIT\n*mangle\n-I POSTROUTING -m mark --mark =
%d -p udp -j CONNMARK --save-mark %s\n-I PREROUTING -p udp -j CONNMARK --re=
store-mark %s\nCOMMIT\n' "$restore" $table "$marker" "$marker"
+=09=09printf -v nftcmd '%sadd rule %s %s postmangle meta l4proto udp mark =
%d ct mark set mark \n' "$nftcmd" "$pf" "$nftable" $table
+=09=09printf -v nftcmd '%sadd rule %s %s premangle meta l4proto udp meta m=
ark set ct mark \n' "$nftcmd" "$pf" "$nftable"
+=09=09[[ $proto =3D=3D -4 ]] && cmd sysctl -q net.ipv4.conf.all.src_valid_=
mark=3D1
+=09=09if type -p nft >/dev/null; then
+=09=09=09cmd nft -f <(echo -n "$nftcmd")
+=09=09else
+=09=09=09echo -n "$restore" | cmd $iptables-restore -n
+=09=09fi
 =09fi
-=09local proto=3D-4 iptables=3Diptables pf=3Dip
-=09[[ $1 =3D=3D *:* ]] && proto=3D-6 iptables=3Dip6tables pf=3Dip6
-=09cmd ip $proto rule add not fwmark $table table $table
-=09cmd ip $proto rule add table main suppress_prefixlength 0
+
 =09cmd ip $proto route add "$1" dev "$INTERFACE" table $table
=20
-=09local marker=3D"-m comment --comment \"wg-quick(8) rule for $INTERFACE\=
"" restore=3D$'*raw\n' nftable=3D"wg-quick-$INTERFACE" nftcmd=20
-=09printf -v nftcmd '%sadd table %s %s\n' "$nftcmd" "$pf" "$nftable"
-=09printf -v nftcmd '%sadd chain %s %s preraw { type filter hook preroutin=
g priority -300; }\n' "$nftcmd" "$pf" "$nftable"
-=09printf -v nftcmd '%sadd chain %s %s premangle { type filter hook prerou=
ting priority -150; }\n' "$nftcmd" "$pf" "$nftable"
-=09printf -v nftcmd '%sadd chain %s %s postmangle { type filter hook postr=
outing priority -150; }\n' "$nftcmd" "$pf" "$nftable"
-=09while read -r line; do
-=09=09[[ $line =3D~ .*inet6?\ ([0-9a-f:.]+)/[0-9]+.* ]] || continue
-=09=09printf -v restore '%s-I PREROUTING ! -i %s -d %s -m addrtype ! --src=
-type LOCAL -j DROP %s\n' "$restore" "$INTERFACE" "${BASH_REMATCH[1]}" "$ma=
rker"
-=09=09printf -v nftcmd '%sadd rule %s %s preraw iifname !=3D "%s" %s daddr=
 %s fib saddr type !=3D local drop\n' "$nftcmd" "$pf" "$nftable" "$INTERFAC=
E" "$pf" "${BASH_REMATCH[1]}"
-=09done < <(ip -o $proto addr show dev "$INTERFACE" 2>/dev/null)
-=09printf -v restore '%sCOMMIT\n*mangle\n-I POSTROUTING -m mark --mark %d =
-p udp -j CONNMARK --save-mark %s\n-I PREROUTING -p udp -j CONNMARK --resto=
re-mark %s\nCOMMIT\n' "$restore" $table "$marker" "$marker"
-=09printf -v nftcmd '%sadd rule %s %s postmangle meta l4proto udp mark %d =
ct mark set mark \n' "$nftcmd" "$pf" "$nftable" $table
-=09printf -v nftcmd '%sadd rule %s %s premangle meta l4proto udp meta mark=
 set ct mark \n' "$nftcmd" "$pf" "$nftable"
-=09[[ $proto =3D=3D -4 ]] && cmd sysctl -q net.ipv4.conf.all.src_valid_mar=
k=3D1
-=09if type -p nft >/dev/null; then
-=09=09cmd nft -f <(echo -n "$nftcmd")
-=09else
-=09=09echo -n "$restore" | cmd $iptables-restore -n
-=09fi
 =09HAVE_SET_FIREWALL=3D1
 =09return 0
 }
--=20
2.49.0


