Return-Path: <SRS0=x3Nk=MT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8048DC6787D
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Oct 2018 22:44:25 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFF922087D
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Oct 2018 22:44:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fastmail.net header.i=@fastmail.net header.b="XZzxCmx8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jKeFDMjC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFF922087D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=fastmail.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b1dc7fd3;
	Sun, 7 Oct 2018 22:43:15 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 41623641
 for <wireguard@lists.zx2c4.com>; Sun, 7 Oct 2018 22:43:13 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 022a0627
 for <wireguard@lists.zx2c4.com>; Sun, 7 Oct 2018 22:43:13 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9D55420354
 for <wireguard@lists.zx2c4.com>; Sun,  7 Oct 2018 18:43:55 -0400 (EDT)
Received: from web1 ([10.202.2.211])
 by compute4.internal (MEProxy); Sun, 07 Oct 2018 18:43:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.net; h=
 message-id:from:to:mime-version:content-transfer-encoding
 :content-type:subject:in-reply-to:date:references; s=fm1; bh=3Bw
 hPIJL0g6H4FBx0tVLZ79Z4/ccT4ke9Dj8bTIb0+8=; b=XZzxCmx8kpfnyJ1jfKY
 4AoarJQ/aAkO4WM9h//AphzddijBswgwCMaXi1ylYynnTmvgdwLMljl1xFAvxaVH
 HLg7iBQvvwLWA79ri2WOQRpWT3no2wAoxTp++3JgxV2hAtXYJTCLWT8isoxpIjfU
 SnGos6Gy3CMQgopNH8Lgz1T/+gZ6QANkOHV4DyUkDn3NYjqNX7KShTQxa2yezQwx
 PkB7hvVj+EQ+VQqlpApNn4vpXd5mbpuGfRmyZa6k0BrwEofWRdIRJ2wmiGl2xiyd
 zXA+8fIVmIQp7tNZvxZ1Oc2PAyfEio5RYMVKJOLh7XemqUOrZnv4IpiVPZa3QAND
 90A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=3BwhPIJL0g6H4FBx0tVLZ79Z4/ccT4ke9Dj8bTIb0
 +8=; b=jKeFDMjCi4hD3EtVzqTrbYL1/lqKmInHVsJS6gVxzKka8akGXAuWTms3L
 nLaXxIYtFEajySsfSDw9XJGP4o3hYjlVE5gCEqLXcREZFPVGwGJHsr8kcGXxqTnw
 sVkP/EX9pPR0uayAzjhr8wMCdK7CqTyP6SCqro0M3rC+1ct8pKivuhPv23RS0YpK
 6MbyRmEsl04/C5mRj7dfZqMVm4KdNj9009EqWPp7Jl4tafySzzo+Otj3Y+YbzEN1
 f+MIhwNtNmSx2VO8/EkjduYWPUHZZBvkAz+HLzRQaZkqeQLb0hJLEyhNWxHSBbld
 oVYvSaJGOkZ86gSnKvzrZmc2Yo5ig==
X-ME-Sender: <xms:K4y6W7FIlGIA6tHNoUlNPROZCvgyZDbnNNcLG8Grcq21MXWJkP0weg>
X-ME-Proxy: <xmx:K4y6W_Ox50e_fOkooKj9uUZEOcNhKZ53pPQliyxKJBr_DyVmmEl1nA>
 <xmx:K4y6WxLaPq7Ri7hakQJzUjlk7St51pgq8iX_BSRHFiCw6qk3GFlrFQ>
 <xmx:K4y6W9LNiH49eHtHHQL2fVf_U05N9rYVNFglDxlKgfkFWKAwuxojsA>
 <xmx:K4y6Wxk3AtuduyjgH9kuhGRXJ7ySUlgTOM9gQKwI1kqsu_DXSXv_pw>
 <xmx:K4y6WxFHBh20ghkVdhllOrhFntU4mwHViNQ3f4g5tOzGzNe2_h9A0g>
 <xmx:K4y6W36hw5yh_3q0_U4vWGngHbsFVGopSYSBgApNo9c48RdmgJ4N8Q>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 4364A94369; Sun,  7 Oct 2018 18:43:55 -0400 (EDT)
Message-Id: <1538952235.1510043.1533890536.493A745F@webmail.messagingengine.com>
From: logcabin@fastmail.net
To: wireguard@lists.zx2c4.com
MIME-Version: 1.0
X-Mailer: MessagingEngine.com Webmail Interface - ajax-929b9749
Subject: Re: [ANNOUNCE] WireGuard Snapshot `0.0.20181007` Available
In-Reply-To: <CAHmME9qboTvSU1+bu8Oi-zwBp8f6UWnfaGb-NEtfsnvnJUL66w@mail.gmail.com>
Date: Sun, 07 Oct 2018 18:43:55 -0400
References: <6b314daa5d672a51@frisell.zx2c4.com>
 <8j30b7w3yIgg5rmXSRUNlDH8yquzSydWwqfdQrnRe-T7mK5e_lYfD2v5IKjgHVAcWptoOVXZ_wENwJ1i733Yn45_TjlMg7Tf_WmW7Dkeuco=@protonmail.ch>
 <CAHmME9qboTvSU1+bu8Oi-zwBp8f6UWnfaGb-NEtfsnvnJUL66w@mail.gmail.com>
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

I get this when building on armv7, but it doesn't seem to affect the build:

echo '  Building modules, stage 2.';
make -f ./scripts/Makefile.modpost
grep: ./arch/arm/Kbuild: No such file or directory


On Sun, Oct 7, 2018, at 6:37 PM, Jason A. Donenfeld wrote:
> On Sun, Oct 7, 2018 at 10:49 PM Jordan Glover
> <Golden_Miller83@protonmail.ch> wrote:
> > I got an error when doing in-tree build using WireGuard/contrib/kernel-tree/create-patch.sh
> >
> > net/wireguard/receive.c:338:10: fatal error: selftest/counter.c: No such file or directory
> >  #include "selftest/counter.c"
> >           ^~~~~~~~~~~~~~~~~~~~
> > compilation terminated.
> 
> Youch. I'm rewriting those scripts so that it picks up file name
> changes like this automatically, so it's not such a whack-a-mole
> situation.
> 
> Let me know if this fixes it:
> https://git.zx2c4.com/WireGuard/commit/?id=28366408148d0f230daebd9a61c5f7bf0c3e0390
> 
> Jason
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
