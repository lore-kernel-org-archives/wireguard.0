Return-Path: <SRS0=ZSUP=4L=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70B56C35670
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 23 Feb 2020 10:31:16 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D30F0214DB
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 23 Feb 2020 10:31:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sgregoratto.me header.i=@sgregoratto.me header.b="d945kHNo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dnoSIhGZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D30F0214DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=sgregoratto.me
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fa2a35c6;
	Sun, 23 Feb 2020 10:27:45 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a8329f7c
 for <wireguard@lists.zx2c4.com>;
 Sun, 16 Feb 2020 10:30:37 +0000 (UTC)
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5477a4a4
 for <wireguard@lists.zx2c4.com>;
 Sun, 16 Feb 2020 10:30:37 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 695FE510;
 Sun, 16 Feb 2020 05:32:57 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Sun, 16 Feb 2020 05:32:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sgregoratto.me;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=wzTNzTwmxDAs/mqysg6PrmcH8S3
 d2vktwAn049PcOUQ=; b=d945kHNo1i2vuqn6qyp8WmDuc1Hd/UyKNPgM2sZ6oaO
 cSRDuOT+NvxE4p/4bY3YDYXLw76j0FC+JcoN67i5ECHDaMed9C5/nOD7aiGgSO7m
 tto+DNfVV0rdjhKLjKWb7JhfouN6YA8CdJ1NeB/6ZoHSif6qA8NS0Pq/LdupOOuZ
 gDysLmkWEYarpDMdGI8auCMcMqx6M+5VDH4ZHAFwSOp2a09Wg2CUMNb396NCMRNd
 auJM8ZAwYbioaRKE8/69V/VVCcm4xmVI5OjQrJJWcdUf97jpV0v0pzJUGvFCu8Lx
 rSePkASm64cuY21XWDLi/OVzFUrgvpV1+gsD+K8UBBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=wzTNzT
 wmxDAs/mqysg6PrmcH8S3d2vktwAn049PcOUQ=; b=dnoSIhGZxGNK/RRJQ7ZZD1
 ++KvliN4T7/pFRLdERflkZCnKyyns7Ode8nkyE7Ei3rCNWi/I4d0PWHkMRW5Gunq
 WemAHJh4UbN5oLOk7Oo52mqK5Z1bMIB8vpEwKfT/OF2IG0dUNiCtfGzFkrEJisew
 XJSnxxFOQouqhxijxA+V3hTOWvrl1+reO384/h0uUpTaPGg6Hc1hcyFN0m2uQtY+
 pkHz0SuhVISwI7Dc9nzBNmcG+TE3EFYnmDGYRg7Hx4FlKVYBFWD4g6PAdfYz/A7+
 ryaGe+KbVAJYc7/TF5W2hhPF2u7Cb3UiPHcQcE5qNB/PHtouQor7HS4ZI3IOENvg
 ==
X-ME-Sender: <xms:WBpJXm6yXxbMiRh1fjDTd4d5pwzXTj-PkeswUBzLppssK4XOSNQp3g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjeeggddujecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesthdtredttddtjeenucfhrhhomhepufhtvghphhgv
 nhcuifhrvghgohhrrghtthhouceouggvvhesshhgrhgvghhorhgrthhtohdrmhgvqeenuc
 fkphepheekrddujeelrdeggedrudejvdenucevlhhushhtvghrufhiiigvpedtnecurfgr
 rhgrmhepmhgrihhlfhhrohhmpeguvghvsehsghhrvghgohhrrghtthhordhmvg
X-ME-Proxy: <xmx:WBpJXrXevmEeWcGgcEbcRwChtn75ua9_pJxRigUpE2WRMxIUAQB_cQ>
 <xmx:WBpJXkKXKK9AHblU2XKDTAGFpFThayVNQuDTFiNCH0rPJ-PhoO0oiw>
 <xmx:WBpJXgTipxGEuKEcuoYFg1PyLcayQ--fvbUks-djXgD3e6-Q4Ut3jw>
 <xmx:WRpJXiDcQ0JLUPZR3mDy5nrCr0XulNENorVs5gqAq80tbJn4xbAJgw>
Received: from localhost (172.44.179.58.sta.dodo.net.au [58.179.44.172])
 by mail.messagingengine.com (Postfix) with ESMTPA id F26A2328005E;
 Sun, 16 Feb 2020 05:32:55 -0500 (EST)
Date: Sun, 16 Feb 2020 21:32:52 +1100
From: Stephen Gregoratto <dev@sgregoratto.me>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH v2] Rewrite wg-quick.8 in mdoc
Message-ID: <20200216103252.ewt4agdpmvgpndid@BlackBox>
Mail-Followup-To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Stephen Gregoratto <dev@sgregoratto.me>, discuss@mandoc.bsd.lv,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <20200213044921.8115-1-dev@sgregoratto.me>
 <20200215004556.11766-1-dev@sgregoratto.me>
 <CAHmME9pF8QvnOLzRkF0YeATj_AmXALc-eNtyjnrz3yQUvrxV0w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHmME9pF8QvnOLzRkF0YeATj_AmXALc-eNtyjnrz3yQUvrxV0w@mail.gmail.com>
X-Mailman-Approved-At: Sun, 23 Feb 2020 11:27:41 +0100
Cc: Stephen Gregoratto <dev@sgregoratto.me>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>, discuss@mandoc.bsd.lv
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
properly marked up in the example explanations, having the lines be
emboldened was redundant. You can see the difference better when viewing
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
