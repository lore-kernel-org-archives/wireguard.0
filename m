Return-Path: <SRS0=tKTr=RX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EFB1C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Mar 2019 22:20:32 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F3AA2175B
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Mar 2019 22:20:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=airmail.cc header.i=@airmail.cc header.b="BTgWEzDM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F3AA2175B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=airmail.cc
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1d227f77;
	Wed, 20 Mar 2019 22:20:09 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4c4b46de
 for <wireguard@lists.zx2c4.com>; Sun, 3 Mar 2019 07:46:12 +0000 (UTC)
Received: from cock.li (mx1.cock.li [185.10.68.5])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 97e3daca
 for <wireguard@lists.zx2c4.com>; Sun, 3 Mar 2019 07:46:12 +0000 (UTC)
Message-ID: <196a105a94a39c3a2e23338880d647f5825dd97a.camel@airmail.cc>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=airmail.cc; s=mail;
 t=1551599773; bh=CbSCUzL/D1L4h3TKXD7LyZD/ih4IdMkenv+PWQaZEFs=;
 h=Subject:From:To:Date:From;
 b=BTgWEzDMgTdzcWnioWYffAwvkxzp/4mFpuiyAUOTCQjiU/Vgc+aY2tk4dkaddpcuz
 nYRvclnIvpL0ZQchC2xd7qHqeluiLpChCXG50ftiGNs+qHybk96MR8v8Jddu7XF6dS
 QObI/jnHlDmf/XlN89Fkn/QpwBd6xm0CSC8rXe9nN8tOyTqypb5gGGBFhU24e47wh0
 kjqiuprFCqtQAteEKjrRHKHvlnOnB5nnVhpRwSP/X+iCv2idV79dfpTPDnXftNtcWG
 430H4P86TZKZ3whcauNoavVmDp3f6v5GwPxrmTNtq9StlWKpAnaAKQqn0KTXLnxDwR
 CK4YRFfvJzoNQ==
Subject: Wireguard fails to start when adding IPv6 to AllowedIP
From: XRP <xrp@airmail.cc>
To: wireguard@lists.zx2c4.com
Date: Sun, 03 Mar 2019 08:56:12 +0100
User-Agent: Evolution 3.30.5 
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 20 Mar 2019 23:20:06 +0100
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Wireguard fails to start when adding an IPv6 to AllowedIP.

Example Config:
[Interface]
PrivateKey = 0OpsgK/Wl7VJC2I49UiGL91wBlbqN+XP0R+bSH+VL2w=
MTU = 1200
Address = 10.0.0.5/24,fdb8:a70c:b109:9935::1/64

[Peer]
PublicKey = hk7hdCE2vKFu895RiCYhQTK6V9+zhnI+KI46VVSx1DA=
AllowedIPs = 10.0.0.1/24,fdb8:a70c:b109:9935::/64
Endpoint = 127.0.0.1:50300


Here's what happens when I try to start the config with wg-quick:

# wg-quick up wg1
[#] ip link add wg1 type wireguard
[#] wg setconf wg1 /dev/fd/63
[#] ip address add 10.0.0.5/24 dev wg1
[#] ip address add fdb8:a70c:b109:9935::1/64 dev wg1
[#] ip link set mtu 1200 up dev wg1
[#] ip route add fdb8:a70c:b109:9935::/64 dev wg1
RTNETLINK answers: No such device
[#] ip link delete dev wg1

I could reproduce this behaviour under ArchLinux and OpenSuse.

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
