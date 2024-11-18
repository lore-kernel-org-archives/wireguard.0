Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 237B1D591A5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 16:46:30 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 82a1c314;
	Mon, 18 Nov 2024 16:16:07 +0000 (UTC)
Received: from netperfect.fr (smailer.netperfect.fr [172.252.236.42])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 37efebbb
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 18 Nov 2024 14:31:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smailer.netperfect.fr 4XsVS534g5z9vYVh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=netpower.fr;
 s=netpower; t=1731940293;
 bh=8Y0TlJ3PH17/L9ZkR1/wratTvEo5FLOGlbDkQ5xSJ5A=;
 h=From:To:Date:Subject:References:In-Reply-To:From;
 b=E9zwzzsEal7PfVT/QjZlZPnpk5AX9fPUwtDgIvNd5FdMGIf2LmDPFY2rg5Cd6FhOY
 KqwakVe8hy3xDvLleO8O5QMn+XN8vkw8xOBDTaVs0Ymr3deaLnud3q6mIBSOZ0YabG
 e32oDjNpKFnX1X22pjS6gXEVULODZdivODlbgSUgVmT1Gs2/uIjVbAxSyXcqIsrmls
 4GzRgL5f7F/m2Zlv28o8yphWx7gG8HIQTuA31TCQTYGBGXCXZlXlT6nS8VrWGeKHx5
 MyRBbppKbOBeZ8dLO/eBVn7p+esKxh68vrBPYybHtrxi21gqJyjVLD0iQF2dw+uwO4
 pAt/rIH6IoYgg==
X-NetPerfect-MailScanner-eFa-Watermark: 1732545092.04724@W525JBhdQZ11FnrSpKbqaQ
X-NetPerfect-MailScanner-eFa-From: ozy@netpower.fr
X-NetPerfect-MailScanner-eFa: Found to be clean
X-NetPerfect-MailScanner-eFa-ID: 4XsVS13XCXz9vX7v
X-NetPerfect-MailScanner-eFa-Information: Please contact infra@netperfect.fr
 for more information
Received: from mail.netperfect.fr ([192.168.151.8] [192.168.151.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (no client certificate requested)
 by smailer.netperfect.fr (MailScanner Milter) with SMTP id 4XsVS13XCXz9vX7v;
 Mon, 18 Nov 2024 15:31:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smailer.netperfect.fr 4XsVS13XCXz9vX7v
Received: from mail.netperfect.fr (localhost [IPv6:::1])
 by mail.netperfect.fr (Postfix) with ESMTP id 402974C5B
 for <wireguard@lists.zx2c4.com>; Mon, 18 Nov 2024 15:31:29 +0100 (CET)
MIME-Version: 1.0
From: "Orsiris de Jong" <ozy@netpower.fr>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Importance: Normal
Sensitivity: Normal
Date: Mon, 18 Nov 2024 15:31:29 +0100
Subject: potentially disallowing IP fragmentation on wg packets,
 and handling routing loops better
Thread-Topic: potentially disallowing IP fragmentation on wg packets,
 and handling routing loops better
Thread-Index: Ads5xR1jN8qfhxkKT8SziuOK0b1gnAAAWdEg
Message-ID: <gxES.qpwiCd--9Ea4jEK0fRojrQ@y7P1ZRPgaUeyk99MkovP3QlYzDuiYKNEuDTG5ICG8Ts.xz>
References: <gxES.4zxnvP9N2kSJa1NGITwbXw@t8xeHZrp0E6un9AocFqL84lJhFB_QEtHqmTZgcSOnX0.xz>
In-Reply-To: <gxES.4zxnvP9N2kSJa1NGITwbXw@t8xeHZrp0E6un9AocFqL84lJhFB_QEtHqmTZgcSOnX0.xz>
Content-Language: fr-fr
X-MS-Exchange-Organization-SCL: -1
Content-ID: <2e72724ffceae94786e619bc607e2079@netpower.fr>
X-Mailer: gromox-emsmdb 2.35.0.g5b29178
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset="utf-8"
X-Mailman-Approved-At: Mon, 18 Nov 2024 16:16:06 +0000
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

Hello,

Sorry to =C2=AB=C2=A0unburry=C2=A0=C2=BB this thread, but I=E2=80=99d lov=
e to know what has been decided for Wireguard regarding UDP fragmentation=
=2E
I use to play with a setup to bridge two physical ethernet ports through =
internet in order to create a LAN2LAN tunnel, that roughly looks like the=
 following=C2=A0:

(SITE1 SWITCH)----ETH1----BRIDGE1----GRETAP1----WIREGUARD1----WAN1----(in=
ternet)----WAN2----WIREGUARD2---GRETAP2---BRIDGE2---ETH2----(SITE2 SWITCH=
)

Setting the wireguard MTU on both sides to 9200 and setting MSS clamping,=
 I was able to let this chain act almost as a transparent ethernet cable,=
 where packets from ETH1 to ETH2 could be up to 9000 bytes MTU, even if t=
he WAN MTU were 1500 bytes or less.
Although I know many reasons why this is not ideal, and applications shou=
ld compute pMTU in order to properly speak to each other, I have some ind=
ustrial appliances that cannot be upgraded, that require a MTU 9000 link =
between both sites.

When I made this setup on RHEL 8, everything worked okay, even if the ban=
dwith was low due to fragmentation.
But setting up the same in RHEL 9, I cannot transfer packets of sizes mor=
e than 1360 (which is 1500 minus wireguard and gretap headers).

I guess that somewhere between both releases, something has been changed =
in the way Wireguard allows or does honor do not fragment packets.
I=E2=80=99ve searched alot, and only found this thread that discusses a s=
imilar setup from Roman.

Could anyone give me some insight what was decided for the Wireguard frag=
mentation, and perhaps a tip to make this setup work again=C2=A0?

Best regards,
Orsiris de Jong from NetInvent.




