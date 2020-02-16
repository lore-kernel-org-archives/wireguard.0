Return-Path: <SRS0=0UwN=4E=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86252C2BA83
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 16 Feb 2020 09:59:11 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C160B2086A
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 16 Feb 2020 09:59:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sgregoratto.me header.i=@sgregoratto.me header.b="ZvCGLNld";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Nv1r4rg/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C160B2086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=sgregoratto.me
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dc323b2b;
	Sun, 16 Feb 2020 09:56:48 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b4d51ff9
 for <wireguard@lists.zx2c4.com>;
 Sun, 16 Feb 2020 04:07:50 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5497fce7
 for <wireguard@lists.zx2c4.com>;
 Sun, 16 Feb 2020 04:07:50 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 436F821402;
 Sat, 15 Feb 2020 23:09:54 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Sat, 15 Feb 2020 23:09:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sgregoratto.me;
 h=content-transfer-encoding:content-type:in-reply-to:date:cc
 :subject:from:to:message-id; s=fm2; bh=2QgKwI+PEQ3fLfUI+Jh1MMCRL
 8XltBD+t4tEo0prTWw=; b=ZvCGLNldNxzlI/HiALuwooHlGAF+sUc9/iVQcgL1K
 nTcEMIsF59RNhiIjTuKaArs7olaYSWIfNzLT0aO+GiyDU9vI+3yEt1mUHum2gn3X
 XDfLl7n3EiIv3bayil81zh3xvKBP+JJapOpyoHIkiMeHh0n8fJBPHtOFSXc/uwyO
 T0VLacnzBwA1NptDTQqcJKnSaOdzS9MsjKVJRtakwXPZ3elg7M9jZnCogsdq9iOS
 xdZ5/ChEqYkcWBjL3g0HftiPEKLqzXZfHyZhhSGN5J6sS2BHhDVwoAY9hvcVig7v
 +vUjav0TRSCgevXg9kKZXHk1bsnvHHyJyxH2IBbcqqjpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=2QgKwI
 +PEQ3fLfUI+Jh1MMCRL8XltBD+t4tEo0prTWw=; b=Nv1r4rg/9f4LpBOFtpVYG9
 qD3Bl2Z+zt8dRwQs1OqDc0D/pZ3KvuOCP88jHyRQ4ddjPUHPsBA0AzOCgAsiLEsI
 trG5xmnJemqiuJnfGyUaklb57SFN5EbfQnsSt3zhOOtnmavp4he7EABRs+AKe5hy
 iNwAVhDldVzC+DgdH4m+Me6ddrkqY7cxxlkbD6Dg1XX0tlEFMuWPdRRKkfG+8VaL
 VKvZkw6UIl73afTtC0RVIp/WOTMA6SoZ35pM6qasrfDQVnKrNqaH7+UaOXYfURL+
 xb8dknmeruxJtF8y0/Rxcyv3vWQwpGmNDFt+5IOhmIgANiGohVGyBefzxgeBnAlw
 ==
X-ME-Sender: <xms:kcBIXsQ38HDc7VcKafzWf57ojc_kaCWlUyK2RnjAcmkDm1GGPfHS1A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjeefgdeilecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefgtggjfffuhffvkfesthhqredttddtjeenucfhrhhomhepfdfuthgvphhhvghn
 ucfirhgvghhorhgrthhtohdfuceophgvrhhsohhnrghlsehsghhrvghgohhrrghtthhord
 hmvgeqnecukfhppeehkedrudejledrgeegrddujedvnecuvehluhhsthgvrhfuihiivgep
 tdenucfrrghrrghmpehmrghilhhfrhhomhepphgvrhhsohhnrghlsehsghhrvghgohhrrg
 htthhordhmvg
X-ME-Proxy: <xmx:kcBIXuVpjStlsGvfatMr8Nullt3rU2mYnSr3nlUP36LNnDZJeEkbfQ>
 <xmx:kcBIXm9UVg5rioFLOyaNM6Q4DwRpPX7iQ0FRx7iaRnMN6axGQCPQLQ>
 <xmx:kcBIXm0-rQX3Nv4iia6j_TgYe-8TNtO6cPxBgz4iuqGpYYtjq2fFxQ>
 <xmx:ksBIXpSAP7TeqP46WxKdprk5zc0Z2HZmZ5fc53OoJMEw4_RHpzLpyw>
Received: from localhost (172.44.179.58.sta.dodo.net.au [58.179.44.172])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5CD683060BD1;
 Sat, 15 Feb 2020 23:09:52 -0500 (EST)
In-Reply-To: <CAHmME9pF8QvnOLzRkF0YeATj_AmXALc-eNtyjnrz3yQUvrxV0w@mail.gmail.com>
Date: Sun, 16 Feb 2020 14:35:42 +1100
Subject: Re: [PATCH v2] Rewrite wg-quick.8 in mdoc
From: "Stephen Gregoratto" <personal@sgregoratto.me>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, "Stephen Gregoratto"
 <dev@sgregoratto.me>
Message-Id: <C0N9UZABRUMK.2ZUAKCTU1HH2M@dextop.sgregoratto.me>
X-Mailman-Approved-At: Sun, 16 Feb 2020 10:56:47 +0100
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>, discuss@mandoc.bsd.lv
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi Jason,

On Sat Feb 15, 2020 at 8:53 PM, Jason A. Donenfeld wrote:
> Thanks for doing this. I appreciate it. I can manually diff the text
> to the old one if you insist, but I'd really prefer to see either a
> list of what text you changed or having the type setting and the text
> change done in separate commits.

The changes made are very minor:

The config_file and interface arguments were made lowercase, and all
mention of them in the rest of the manual has been changed as well.

The interface additions were changed from a bulleted list to a
definition list, where the additions were the definitions.

I removed the boldening in the examples along with the sentance:
  
  "Bold lines below are for options that extend wg(8)."

The justification was that since the [interface] additions were
properly marked up in the example explainations, having the lines be
enboldened was redundant. You can see the difference better when viewing
them as PDF's through groff side-by-side. If you'd like I can revert
this.

As mentioned by Ingo, more manual references were added to the SEE ALSO
section, with them being sorted in section-name order. I also moved the
link to the project page into this section, and dropped the "World Wide
Web" bit.

Finally, the AUTHORS section was reworded slightly:

 original:  "wg-quick was written by..."
 new:       "The wg-quick program was written by..."

This is a convention for system programs.


As for Anthony's work, this seems to be a case of "convergent
evolution," since our work is very similar ;). I think if I combine the
best parts of both, along with Ingo's comments, I could prepare a final
patch for wg-quick. I'm not sure if everyone that helped needs to sign
off on the patch, but I'll make sure they're mentioned.

For the next patch, would you like to see the list above in the commit
message?
-- 
Stephen Gregoratto
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
