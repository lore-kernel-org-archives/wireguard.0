Return-Path: <SRS0=3mYp=A4=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59A1BC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 17 Jul 2020 09:36:23 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A664720717
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 17 Jul 2020 09:36:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=web.de header.i=@web.de header.b="sdMca/qE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A664720717
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c7fc1cf0;
	Fri, 17 Jul 2020 09:14:22 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d4bfa005
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Jul 2020 09:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1594978576;
 bh=8P+fZzBQ810h3NKVFhvYvvd01LCnfEW4hKCsytddE94=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=sdMca/qEzSzjiTSqZYL53/7b97nE2hvUj9zPmmzHKwHi9h0wk2+Snlm8XjaXixEEm
 MpKh6cEYKBrmp4ESex3//Qhxp0+YAjCt3/UQ1e34vz2Hs1IeRAcUnTnRvQD181wy58
 X+eYmHEFALmCcDCbauyHawz2lEXKcPvcurHjP2yw=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from schienar.cern.ch ([128.141.85.92]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MeDQj-1kX5BX0NHD-00awQp; Fri, 17
 Jul 2020 11:36:16 +0200
From: Julian Wollrath <jwollrath@web.de>
To: wireguard@lists.zx2c4.com
Cc: Julian Wollrath <jwollrath@web.de>
Subject: [PATCH] wg-quick: Only create one table with nftables
Date: Fri, 17 Jul 2020 11:35:28 +0200
Message-Id: <20200717093528.64891-1-jwollrath@web.de>
X-Mailer: git-send-email 2.28.0.rc0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:wOSYWPGY079ua7HBV/wg6qejV1GgTs3GcSaAdTL7z8fepbCgwpb
 kBvqGq3T4F06dIiQX6FMOkYG/VemxMbkMo876NJ+CFe0x91hBVtUQqHlwhj5P564fib65kp
 e5lxZWj0qxGbEAVaXcuAnoAUplkPjT+HwDh4L/vqPjxoWEqtyWuzw3meEcd2DL7tQ4yA+Fk
 DbLzs58DxF2Hxg8s2Gl8Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ss+AUDwpDpo=:q5O8TyxEK4IUODTAFcppES
 SUGhmM5z81tG/wq5WYIUdA5sDmiL+vfLSy7bvVnb9iLU16FgqqqoprfEo++fIKl9/D6hTT3Wm
 KBC3/zcm6ZdqCcIElvH9OJA/AAguHCDyrm31HqMDmMfqluR7kPQUKWMmYSEq/PdmT1ybBgnAr
 FIBuu6sFVeI/hW5lYceROiryi0zWKIFHR3sucJSqGz41M3A+VIDf19L0qH3vZktel7Ms/Nj0g
 yW3uzFApcoAS+RbVTgVIjV/M5WpC7yWLY0K/V6hG5enCeR+ScKBsFHYpVdCTtrECrd+4Sbt2H
 xP9YB++UAS8ZgSyp9q6k6WNrqDpxA3Ca57N5zP8sZXbQnKW7GeqvLvRZOL/Xp37wJjYlfFwJ2
 8JSnebEY7OaxmxHp/aw5dcybldQuSSYiTUwlUDFGQ0Plm3wjG0vnBkVsTVa4b/oTYhVOeYsBx
 el4UseJIYLkLlkejx6hZQe5v1OMbhlsjWf2HzusxrpiPq/Oy/LZ6gu93BqplJV4UDXNq5RGyq
 SYsakOoFHh5Hxt4oGxXP1NaQHQ0ynV1enY4X4FVjP6Wd9xCYQpfzNFmRxVwDb7TEXYm5iXJ2b
 7xOiCbuqiZct6vXtHKW6jklnhzsuD/1G72V4aKq9b+JH19pkSppVgYLnONdsjztQFAzPJpenO
 A3D2QIT+BQ6tGbmH5VWsPcAMurWfP9J7bKZvoTsDXYXQR9TzpsdT+53orkXWX0bYTzeGj4r90
 T4GghvHLZK9/D3Ar/MSbRIz8rRQhB5FQmk4iug8jz/WE1gkp2ll8WVSOY8KACAC8CPIWCjKAA
 yEqUPk3Xd1Nemiv9Cqwb8G9bP6oxE+fVbnmDgbM7Zptom0bzeTa2brjnnx/UkiVTrv9JXwhXH
 hZ1kNRkpuXDAZjHF+dxLuTqprg926nE7+tnyXr+WRjJG4omjxjZ5e1PmRMiu4MRNnKsfMjz5k
 /ek086QeDgIdGP1tcxi5CJlJmjbOyWtvoZRJf8WoyQAcK8ZQc6SV6ijqUCgGZMxDvkFTBjex5
 +SW5FfG3VkuMVAqOSpBesRwrh+QP6ZU/YrQkUCUTdG/dQ0vGXZBZcaGkbYmEouC/YotzFC/Kh
 AqDw5Ytq+dpNwm3WtZ6f1ID0hZF3A3SzhP+aBh2NWoRSD/4D6mkUzJg1ioFQ8nMoraC5oi31x
 HGfk9l/RnTKMSOoxb2jJXf213eQL5W6paGrZPCWkYS9J9TRw8eUGOP71UhIC0fckpHowCgDAl
 3JH6hJkf5aBFecgrG
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

Currently, for every address one table is created when using nftables.
This is not neccessary, so split out the common table rules in one
single table and add the per address rules to it subsequently.

Signed-off-by: Julian Wollrath <jwollrath@web.de>
=2D--
 src/wg-quick/linux.bash | 33 ++++++++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/src/wg-quick/linux.bash b/src/wg-quick/linux.bash
index e4d4c4f..f5bed66 100755
=2D-- a/src/wg-quick/linux.bash
+++ b/src/wg-quick/linux.bash
@@ -209,6 +209,26 @@ remove_firewall() {
 }

 HAVE_SET_FIREWALL=3D0
+HAS_NFT_SKELETON=3D0
+add_nft_skeleton() {
+	[[ HAS_NFT_SKELETON -eq 0 ]] || return 0
+
+	local table
+	if ! get_fwmark table; then
+		table=3D51820
+	fi
+
+	local nftable=3D"wg-quick-$INTERFACE" nftcmd pf=3Dinet
+	printf -v nftcmd '%sadd table inet %s\n' "$nftcmd" "$nftable"
+	printf -v nftcmd '%sadd chain inet %s preraw { type filter hook prerouti=
ng priority -300; }\n' "$nftcmd" "$nftable"
+	printf -v nftcmd '%sadd chain inet %s premangle { type filter hook prero=
uting priority -150; }\n' "$nftcmd" "$nftable"
+	printf -v nftcmd '%sadd chain inet %s postmangle { type filter hook post=
routing priority -150; }\n' "$nftcmd" "$nftable"
+	printf -v nftcmd '%sadd rule inet %s postmangle meta l4proto udp mark %d=
 ct mark set mark \n' "$nftcmd" "$nftable" $table
+	printf -v nftcmd '%sadd rule inet %s premangle meta l4proto udp meta mar=
k set ct mark \n' "$nftcmd" "$nftable"
+	cmd nft -f <(echo -n "$nftcmd")
+	HAS_NFT_SKELETON=3D1
+}
+
 add_default() {
 	local table line
 	if ! get_fwmark table; then
@@ -225,18 +245,12 @@ add_default() {
 	cmd ip $proto rule add table main suppress_prefixlength 0

 	local marker=3D"-m comment --comment \"wg-quick(8) rule for $INTERFACE\"=
" restore=3D$'*raw\n' nftable=3D"wg-quick-$INTERFACE" nftcmd
-	printf -v nftcmd '%sadd table %s %s\n' "$nftcmd" "$pf" "$nftable"
-	printf -v nftcmd '%sadd chain %s %s preraw { type filter hook prerouting=
 priority -300; }\n' "$nftcmd" "$pf" "$nftable"
-	printf -v nftcmd '%sadd chain %s %s premangle { type filter hook prerout=
ing priority -150; }\n' "$nftcmd" "$pf" "$nftable"
-	printf -v nftcmd '%sadd chain %s %s postmangle { type filter hook postro=
uting priority -150; }\n' "$nftcmd" "$pf" "$nftable"
 	while read -r line; do
 		[[ $line =3D~ .*inet6?\ ([0-9a-f:.]+)/[0-9]+.* ]] || continue
 		printf -v restore '%s-I PREROUTING ! -i %s -d %s -m addrtype ! --src-ty=
pe LOCAL -j DROP %s\n' "$restore" "$INTERFACE" "${BASH_REMATCH[1]}" "$mark=
er"
-		printf -v nftcmd '%sadd rule %s %s preraw iifname !=3D "%s" %s daddr %s=
 fib saddr type !=3D local drop\n' "$nftcmd" "$pf" "$nftable" "$INTERFACE"=
 "$pf" "${BASH_REMATCH[1]}"
+		printf -v nftcmd '%sadd rule inet %s preraw iifname !=3D "%s" %s daddr =
%s fib saddr type !=3D local drop\n' "$nftcmd" "$nftable" "$INTERFACE" "$p=
f" "${BASH_REMATCH[1]}"
 	done < <(ip -o $proto addr show dev "$INTERFACE" 2>/dev/null)
 	printf -v restore '%sCOMMIT\n*mangle\n-I POSTROUTING -m mark --mark %d -=
p udp -j CONNMARK --save-mark %s\n-I PREROUTING -p udp -j CONNMARK --resto=
re-mark %s\nCOMMIT\n' "$restore" $table "$marker" "$marker"
-	printf -v nftcmd '%sadd rule %s %s postmangle meta l4proto udp mark %d c=
t mark set mark \n' "$nftcmd" "$pf" "$nftable" $table
-	printf -v nftcmd '%sadd rule %s %s premangle meta l4proto udp meta mark =
set ct mark \n' "$nftcmd" "$pf" "$nftable"
 	[[ $proto =3D=3D -4 ]] && cmd sysctl -q net.ipv4.conf.all.src_valid_mark=
=3D1
 	if type -p nft >/dev/null; then
 		cmd nft -f <(echo -n "$nftcmd")
@@ -336,6 +350,11 @@ cmd_up() {
 	set_mtu_up
 	set_dns
 	for i in $(while read -r _ i; do for i in $i; do [[ $i =3D~ ^[0-9a-z:.]+=
/[0-9]+$ ]] && echo "$i"; done; done < <(wg show "$INTERFACE" allowed-ips)=
 | sort -nr -k 2 -t /); do
+		if type -p nft >/dev/null; then
+			if [[ $TABLE -eq auto && $i =3D=3D */0 ]]; then
+				add_nft_skeleton
+			fi
+		fi
 		add_route "$i"
 	done
 	execute_hooks "${POST_UP[@]}"
=2D-
2.28.0.rc0

