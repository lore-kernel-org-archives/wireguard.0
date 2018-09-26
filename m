Return-Path: <SRS0=izkY=MI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FORGED_YAHOO_RCVD,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A143C43382
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 26 Sep 2018 07:15:28 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B997D206B5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 26 Sep 2018 07:15:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="mtb62HX/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B997D206B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=yahoo.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 410c33b3;
	Wed, 26 Sep 2018 07:12:28 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 72852a81
 for <wireguard@lists.zx2c4.com>;
 Wed, 26 Sep 2018 07:12:25 +0000 (UTC)
Received: from sonic306-19.consmr.mail.ir2.yahoo.com
 (sonic306-19.consmr.mail.ir2.yahoo.com [77.238.176.205])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dd2d709d
 for <wireguard@lists.zx2c4.com>;
 Wed, 26 Sep 2018 07:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1537946105; bh=Q66aO3LRjsGx8LEu2PjzhFp0R+ToyebQHWxsNV+RcCc=;
 h=From:To:Cc:Subject:Date:From:Subject;
 b=mtb62HX/YCg+LOz3RrnHZWUthsF3Dc5tZX/VU/nhm+3ZM5raYzh3/11/sRALPmcX160sQP5rxfC7oy8E8nc6ipFW6f+Vn3NuMc/addmpLcPe3WmE+SZCZjb8mDfiaOrkYLYnU1Q91VlfAQJHj3gHeY1L+q0PE+8u0MN8Sbxiu1DL1h7Fj31DbJH9DCUe0z3KhemwNbc2LFTIklBXfbn4ncLWl5hUK3fnU0f0i2ZHG3ZwV/tYTCr5cI/nzo173wKFdPjssqBjKoIZNGildYqxb7ltpp3cAFbtt6XRuq5aaJiQLM6bMtCzOJsmcojoOh2l0OuzeYv6gIeU8DijkHelIw==
X-YMail-OSG: 1KM6pgYVM1lufRKu3fcEN2WlmnGd_7jcI0pCfBiuur1Id_6M9NB1MndJSIR9yxw
 59hh4Gf68X0Jf8LXGxX2_hNQsoviuhOrmP7qPj9etF2p8EitUOr1Plan5Typ1u4xXwV6Eh.yvhxF
 Ayh03lYpXpIvZ1_vdHXRIQjK9FLXBAKCxalWNgScwWctaVcQjaY4WWdxOF7SaynfhFBziiU77tar
 H7uBA6FnGMWnHuBS5NtxyGUHLfcvtFJwV2x_uXGquOVA8HGYYuwVWMPxxhqzcgNMLA3KVknt4ktk
 HWuTEU7EioDfORLQZMqOoRCFhrhZcERL8G_kdkR2nh5YzmQYF2zmtKxyKOImYMjMvVRv25riwo4n
 CKwN0LrIAsF_UmSDdz3F4vxEnahlxmBduAenwGEOnuGnEFDCxTC5Zo..mQk5OeCtIn1lwtbxIV7E
 QC4vpD0Plh..kMtYmSVOxmdFmiz7qavdyU.KlBLX6PIMBMXeQAZZlYn.Nd7V7kUEwh3m9YGrqhsf
 t1574BMH2xzBvMn92Rr3UE4Pc871EGKEWSFdM3JpmFBCgu9b0NkTrnpabYH70TmKnLojYeW2dseK
 R46hqMbspC12siVGM14Xu8IiXRykX54PamsGU0_KCmAIqwLkUS.dXnH_95Wmwz55av2O9iqtDscy
 ftTB1WgQmBZvuYWTklJ.iT_fOe9a_7vq9ve4aAenGMiaPg8zN45oAtTGDCf6O2Y7uQVFERTAYJrx
 Gopv3aPPkBf9hdiVqRfwmVsbtk8op33ub1Ap2KFK8GtVFzO4oiNNglhQp30hNwogthZOpuEpCaFz
 8YT7CG872duKnt87vMhf.vJ5fC7utYTi7SafLlcjBAIScirPwBqARxR2B59jEGeCYaZkjicTGaB_
 PmtoaMrygWIt_Fm9JLjaxPtrdXOSaNx_yS_XzJlvWdJOqEaIhbkneFMUyie7G.T7.yl1yDwH01fF
 tmsP5hJgBbca5Cb2VwfOpgwfqbgLrE.1IYLchpMkRj3axeqePlExhc21.wrcp1BHBRvHCHEyvZmI
 ERg--
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic306.consmr.mail.ir2.yahoo.com with HTTP; Wed, 26 Sep 2018 07:15:05 +0000
Received: from 185.137.67.60 (EHLO scorpbook.localnet) ([185.137.67.60])
 by smtp410.mail.ir2.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID
 7d93d3fd95a32d5da4a22d93fceb3c6e; 
 Wed, 26 Sep 2018 07:15:02 +0000 (UTC)
From: Saeid Akbari <saeidscorp@yahoo.com>
To: StarBrilliant <coder@poorlab.com>
Subject: Re: [feature request] To support "Wireguard over raw TCP"
Date: Wed, 26 Sep 2018 10:44:52 +0330
Message-ID: <7403657.7uoC655CCu@scorpbook>
MIME-Version: 1.0
Cc: wireguard@lists.zx2c4.com
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

Hi,

> 2) Wireguard currently does not support binding to localhost. This is
> required for any third-party plugins upon Wireguard to work. We might
> need to consider binding to localhost an important feature to go in
> the near future.

FYI,
I just recently used WireGuard with udp2raw-tunnel successfully. Both 
localhost endpoint on the client side, and localhost endpoint on the server-
side worked like a charm. Although I understand you can't "bind" the udp 
socket to 127.0.0.1 to restrict its outside usage, but it works on 0.0.0.0 
regardless.


_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
