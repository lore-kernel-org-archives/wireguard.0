Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAEAAEF06E3
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Feb 2026 18:50:58 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1c9b6e40;
	Sun, 8 Feb 2026 17:19:25 +0000 (UTC)
Received: from mail-43166.protonmail.ch (mail-43166.protonmail.ch
 [185.70.43.166])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 57c2195f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Jan 2026 10:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail; t=1769511550; x=1769770750;
 bh=OQqc2WnkdaRqz0QpuT2cU97h3B0BCJ1yo5q8OfwTkZo=;
 h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=nqnkzIx72Hvaos+vJOv4T0Xp4wy0WRyz56+IyjXw0FufSbUFrpnP0IuaORd19jRJB
 GaenKeaSu+oBUWN/WdruEjJt2wu3Dww9BzPbN0T3qwPEVZFViUPxPCSPCOz9PXXRtk
 qrP3HjYFlQODwHs9r6Csj2mmOg88HyijMTpsSn1LpGMoHJy4JCN01pNDnJEqT5o3JW
 Q+/ebZ9qAHFMdxDINDwf/cj61+e4a0QuN2Hx2Neqhm0htck+xe8aPVFH9kAC3qG8O4
 jtrFKBg/81za3mMKYL1PYHDpgL2wP6R/bZX3HVMa8+XPGnFp8vHGr5NNHUrNvxQq1g
 m4Tb98np7q6oA==
Date: Tue, 27 Jan 2026 10:59:00 +0000
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
From: ndmalc <ndmalc@proton.me>
Subject: [PATCH] wireguard-tools/wg-quick for linux,
 avoid modifying net.ipv4.conf.all.src_valid_mark system parameter
 when its value is already set to 1
Message-ID: <mLw905RIKYUDmGlhcXnA3rHthtd4dX1INnV9YTRvpeu52Fb497VVyMpw8JXl3o_7jKdadiwBRCSnbPmdZJQfncbsOu0EAooF0YdER3I1SDQ=@proton.me>
Feedback-ID: 178168291:user:proton
X-Pm-Message-ID: b56db59902c5268ffee6e886cc95f6842c99ffc5
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sun, 08 Feb 2026 17:19:21 +0000
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

This patch proposes to modify the wg-quick script for linux to avoid forcin=
g the setting of the system parameter net.ipv4.conf.all.src_valid_mark when=
 its value is already valid.
This is to avoid edge cases where the use of wireguard is possible but edit=
ion of system parameters is not allowed. Such case can be found when runnin=
g a wireguard client with AllowedIPs=3D0.0.0.0/0 inside a container.
In such case, wq-quick up is aborted in the middle of the setup process eve=
n if src_valid_mark system parameter is properly set.

I propose a simple patch as below by adding a check. During the setup phase=
, this will no longer display any messages related to src_valid_mark when t=
he parameter is used but nothing is modified. For more verbosity or whateve=
r else, I leave any adaptation of the patch at the discretion of the mainta=
iners.

Signed-off-by: ndmalc <ndmalc@proton.me>
---
 src/wg-quick/linux.bash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/wg-quick/linux.bash b/src/wg-quick/linux.bash
index 34fa5f9..8c22d6e 100755
--- a/src/wg-quick/linux.bash
+++ b/src/wg-quick/linux.bash
@@ -238,7 +238,7 @@ add_default() {
 =09printf -v restore '%sCOMMIT\n*mangle\n-I POSTROUTING -m mark --mark %d =
-p udp -j CONNMARK --save-mark %s\n-I PREROUTING -p udp -j CONNMARK --resto=
re-mark %s\nCOMMIT\n' "$restore" $table "$marker" "$marker"
 =09printf -v nftcmd '%sadd rule %s %s postmangle meta l4proto udp mark %d =
ct mark set mark \n' "$nftcmd" "$pf" "$nftable" $table
 =09printf -v nftcmd '%sadd rule %s %s premangle meta l4proto udp meta mark=
 set ct mark \n' "$nftcmd" "$pf" "$nftable"
-=09[[ $proto =3D=3D -4 ]] && cmd sysctl -q net.ipv4.conf.all.src_valid_mar=
k=3D1
+=09[[ $proto =3D=3D -4 ]] && [[ $(sysctl -n net.ipv4.conf.all.src_valid_ma=
rk) -ne 1 ]] && cmd sysctl -q net.ipv4.conf.all.src_valid_mark=3D1
 =09if type -p nft >/dev/null; then
 =09=09cmd nft -f <(echo -n "$nftcmd")
 =09else
--=20
2.52.0


