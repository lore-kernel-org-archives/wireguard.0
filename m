Return-Path: <SRS0=o99y=2A=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,FREEMAIL_REPLYTO_END_DIGIT,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95D07C43603
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Dec 2019 16:53:12 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E68532073D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Dec 2019 16:53:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=protonmail.ch header.i=@protonmail.ch header.b="BDwh6UCt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E68532073D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 48db9c6a;
	Tue, 10 Dec 2019 16:52:44 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8c4cb7c0
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Dec 2019 16:52:42 +0000 (UTC)
Received: from mail-40140.protonmail.ch (mail-40140.protonmail.ch
 [185.70.40.140])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 545fe20f
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Dec 2019 16:52:42 +0000 (UTC)
Date: Tue, 10 Dec 2019 16:52:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
 s=default; t=1575996760;
 bh=qhaMhaPlcYlvfFBNp9eAYYE0FaYXiVooOmtmMhShA7Q=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=BDwh6UCtLx65bL9MQXGRLhxReqCV3QUCSCWZw5YxuoEB4UW4o8Eam9z7FfYKKY7jk
 ruBWR7mS7D2Z3OM66/93sJpGxVFUlIa5ll9EYZXPeNojFS0QyqA7EHQ5hGmKUlIO3J
 h85LKQojLEmPgdSy3a7j58ueECznGW3IPrYygvpw=
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
From: Jordan Glover <Golden_Miller83@protonmail.ch>
Subject: Re: [PATCH] wg-quick: linux: add support for nft and prefer it
Message-ID: <FX30kbIJvHNSsmPxMSA_XdlAOLSee8p5eHMDcDAkDH8KKhihrybE2EtZJIjtU9ojh-JJT9g4Cj5xlT85E5uETb9JsBJmficyjfDvblrRaJg=@protonmail.ch>
In-Reply-To: <20191210154850.577745-1-Jason@zx2c4.com>
References: <20191210154850.577745-1-Jason@zx2c4.com>
Feedback-ID: QEdvdaLhFJaqnofhWA-dldGwsuoeDdDw7vz0UPs8r8sanA3bIt8zJdf4aDqYKSy4gJuZ0WvFYJtvq21y6ge_uQ==:Ext:ProtonMail
MIME-Version: 1.0
Cc: "jwollrath@web.de" <jwollrath@web.de>,
 "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: Jordan Glover <Golden_Miller83@protonmail.ch>
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

On Tuesday, December 10, 2019 3:48 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> If nft(8) is installed, use it. These rules should be identical to the
> iptables-restore(8) ones, with the advantage that cleanup is easy
> because we use custom table names.
>

I wonder if nft should be used only if iptables isn't installed instead.
Nowadays iptables has nft backend which I believe is default and will
translate iptables rules to nft automatically. On my system iptables rules
from wg-quck are already shown in "nft list ruleset".

I'm not sure if this work in reverse - are nft rules automatically translated
to iptables and shown in iptables-save? If not then using iptables of available
seems more versatile for the job.

Jordan
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
