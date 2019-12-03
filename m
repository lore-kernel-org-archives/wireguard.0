Return-Path: <SRS0=1Eb4=Z6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BA1FC3F68F
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Dec 2019 10:41:26 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E45B4206D6
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Dec 2019 10:41:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=web.de header.i=@web.de header.b="EaCIYLWS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E45B4206D6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6535291a;
	Sun, 8 Dec 2019 10:41:08 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 014604a6
 for <wireguard@lists.zx2c4.com>; Tue, 3 Dec 2019 15:51:33 +0000 (UTC)
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7211f05c
 for <wireguard@lists.zx2c4.com>; Tue, 3 Dec 2019 15:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1575388291;
 bh=v3xuwZ9mCgDZbPQAE1/UlTXNbNlkz7Fk8OAKMgA110w=;
 h=X-UI-Sender-Class:Date:From:To:Subject;
 b=EaCIYLWS85lsswBGXZS3MKcAg54KNP+bDCdnBtsXQKbQLUC6blw+6QXJZZlnWHkPX
 uOCNOX1/JvU2L12IM5k7ssBirJ9TKQYGhZaPTbUmn//NpBULSFLeNkOEDkpKW0ZQzn
 qUvFnbfXKqxFuSfNnvul2AN3KOApp4JXT0Knu0Og=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from schienar ([128.141.85.19]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MNcMo-1iiFGz2Hn8-007DMk for
 <wireguard@lists.zx2c4.com>; Tue, 03 Dec 2019 16:51:31 +0100
Date: Tue, 3 Dec 2019 16:51:30 +0100
From: Julian Wollrath <jwollrath@web.de>
To: wireguard@lists.zx2c4.com
Subject: wg-quick nft instead of iptables
Message-ID: <20191203165130.52f438ba@schienar>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/vpD0/vQbUiqDrYiMjG.OSUE"
X-Provags-ID: V03:K1:78qADS7SeQqztZf/a1Gx4p9IYCcVW1TPWk0sGs+h9Naogjn82iI
 bkY+upeYZNMx4Uq//jtd+dpxTlTTkQi+dsqVApmlCI42LhDjhRXmASBdyek1aAiUIE8W5hI
 MPPZkdCwqTQt5H0wee7I7TOXb25LLSa5d10k4/O2FABisvIuKsNiGLI6CHAyfJOMcEO/XvS
 6yFJoIUBSborqmX8KeCTw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/cTTmUf7r4E=:RGk4nLzVQjYCAUHuTRFYSD
 9H9xBh4jXNFdrID9GOQ9N+PGUBKR/MW4sb/ZULtO42pwdPIBIwv0c6Ve8++FLwvKNK03pa/KV
 QNxSdRLcNuxbnFZoaM7TQxdU98QrxQmsCErFhXAAflX+4dxbLgk8aD1ev+JcRmSMb4Jb3oMEQ
 1A9cml0by3NqZJDnxJeureU33pkVDmzr758XugU4ux32X3FRhLTlxuODCn7c/yPOi81AVTRaJ
 3JHnNIApXKDepYVUsFkch3aAF74MQnM9IxvNk8XcLjkkYXSXXs4VtwHDcn3/ss5d6cbRO9vw+
 tjidGcNlEznXRB5M3U8Yngkrscn+uEP6FKw4ZAfE21woUwQNIEl60Ft3DZYJiCaASbPm8wzin
 C9+bIT+MuUj0mmngV0tct8w/wezqKJw9ORNOs7nKMUWXnOfIJx1YEypIXFSEDO/g8RCecRTgE
 LawLfWxvekfqYjXyEBc8ewVxXe3pY1v/TBEUVkpFbtmN1vPRuqFi0rKC2dnuVEugzU3/VGkOl
 7ve774r9mrvfLBzXfM4gaL2x4QgvIkvsxUXL2ELQmZe0h6Mjw/f+WxzPJpUraBVOE3+iHORe2
 FOq2JuUCAVTkD2ANcvUnmerIgyaxlxG1om2veNF8hVDBYh3qvyuuIcstdB5GhRmH9JvHPuEDl
 VQ+DPrA0DGD7uFRu37IQW7ljZ5j3J23e1XayZPS0m3imijRiw7+KUJsjCUkXa7bLBZ4S9A2Lc
 MuhRAV0LDu2GLjFkSPd+asLkcYl4hIGh2eN896UI3JRHR+9ILnp96tgKpBwdf02xdsaxT6StR
 KYLYbIQKq2xgnOY5fzS61RWn0bIINDw2sr0jZef+ZaqMR6AME9RY0N9L1GHSEAGl5Q5L1+yyD
 atLymhoMZYJ3i89AC2QMmNYXa1Mo322ubnHItL8avEm+JNxlc27mhaYHFlKA1u60NwM+M3kLP
 PGEZVEzARslra7y1qXI9in4hsU+NWOq14kpNJirXcG4StK7hanQJPOZ/3gjq5bwGlFiAzCEQ5
 Em4u4Hppieb7nnoSLojYQz+hmp7BCv84kI/F5MKd4tB1tMxFLpB2q8SKM6zXcrRWIy19GURKQ
 zNF70ATESsbW1e7fjCOs5NRrA4UVWaq64cCSryp04kQvLAF1+JX7+7ui1CBeYBk4wH5LT8Qu1
 X8QGMrLKWviM0IURCL/Fuhz8vJOLHGMyBJRuRjf1hRJcBvKLSq36qhFVFHbJUwy2D7Ior8AnB
 2ien3cwE+4tlApsR/l+i2qPJJFqWzQHyCM7O2xw==
X-Mailman-Approved-At: Sun, 08 Dec 2019 11:41:06 +0100
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
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--MP_/vpD0/vQbUiqDrYiMjG.OSUE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi,

with the newest snapshot wg-quick unfortunately requires iptables while
I only have nftables installed. The attached diff handles the rules
with nftables instead, maybe somebody finds it useful. The small caveat
is, that the rule deletion might not work for everyone.


Cheers,
Julian

=2D-
 ()  ascii ribbon campaign - against html e-mail
 /\                        - against proprietary attachments

--MP_/vpD0/vQbUiqDrYiMjG.OSUE
Content-Type: text/x-patch
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename=wg-quick-nftables.diff

diff --git a/src/tools/wg-quick/linux.bash b/src/tools/wg-quick/linux.bash
index 4fecabb..719e668 100755
=2D-- a/src/tools/wg-quick/linux.bash
+++ b/src/tools/wg-quick/linux.bash
@@ -190,8 +190,11 @@ remove_iptables() {
 			[[ $line =3D=3D "-A"* ]] && found=3D1
 			printf -v restore '%s\n%s' "$restore" "${line/#-A/-D}"
 		done < <($iptables-save)
-		[[ $found -ne 1 ]] || echo "$restore" | cmd $iptables-restore -nw
+		#[[ $found -ne 1 ]] || echo "$restore" | cmd $iptables-restore -nw
 	done
+	nft delete rule inet raw prerouting handle $(nft list ruleset -a | grep =
'iifname' | grep 'wg0' | sed 's/.*handle //')
+	nft delete rule inet mangle prerouting handle $(nft list ruleset -a | gr=
ep 'meta l4proto' | grep 'meta mark set ct' | sed 's/.*handle //')
+	nft delete rule inet mangle postrouting handle $(nft list ruleset -a | g=
rep 'meta l4proto' | grep 'meta mark 0x' | sed 's/.*handle //')
 }

 HAVE_SET_IPTABLES=3D0
@@ -214,10 +217,13 @@ add_default() {
 	for i in "${ADDRESSES[@]}"; do
 		[[ ( $proto =3D=3D -4 && $i !=3D *:* ) || ( $proto =3D=3D -6 && $i =3D=
=3D *:* ) ]] || continue
 		printf -v restore '%s\n-I PREROUTING ! -i %s -d %s -m addrtype ! --src-=
type LOCAL -j DROP %s\n' "$restore" "$INTERFACE" "${i%/*}" "$marker"
+		nft add rule "inet raw prerouting iifname !=3D ${INTERFACE} ip daddr ${=
i%/*} fib saddr type !=3D local counter drop"
 	done
 	printf -v restore '%s\nCOMMIT\n*mangle\n-I POSTROUTING -m mark --mark %d=
 -p udp -j CONNMARK --save-mark %s\n-I PREROUTING -p udp -j CONNMARK --res=
tore-mark %s\nCOMMIT\n' "$restore" $table "$marker" "$marker"
 	[[ $proto =3D=3D -4 ]] && cmd sysctl -q net.ipv4.conf.all.src_valid_mark=
=3D1
-	echo "$restore" | cmd $iptables-restore -nw
+	nft add rule "inet mangle postrouting meta l4proto udp mark ${table} cou=
nter ct mark set mark"
+	nft add rule "inet mangle prerouting meta l4proto udp counter meta mark =
set ct mark"
+	#echo "$restore" | cmd $iptables-restore -nw
 	HAVE_SET_IPTABLES=3D1
 	return 0
 }

--MP_/vpD0/vQbUiqDrYiMjG.OSUE
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--MP_/vpD0/vQbUiqDrYiMjG.OSUE--
