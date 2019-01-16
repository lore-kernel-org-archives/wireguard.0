Return-Path: <SRS0=1SvS=PY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,FREEMAIL_REPLYTO_END_DIGIT,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A6C2C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Jan 2019 23:49:54 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D77620675
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Jan 2019 23:49:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=protonmail.ch header.i=@protonmail.ch header.b="sKk5Dkke"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D77620675
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 166cc2b0;
	Wed, 16 Jan 2019 23:45:15 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f74f79fa
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Jan 2019 23:45:14 +0000 (UTC)
Received: from mail-40136.protonmail.ch (mail-40136.protonmail.ch
 [185.70.40.136])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c079906a
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Jan 2019 23:45:13 +0000 (UTC)
Date: Wed, 16 Jan 2019 23:49:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
 s=default; t=1547682565;
 bh=7b9D769N7f10WAkKt9mOQ6ZkLJn4FIP10zgKpjtTOMU=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=sKk5DkkeNwtmB4IcZS/tOzAcqwl5HLAzU/FQt+eWGkhYWf2lmFrU9bP6XyK5brmCa
 7bdkRaJkbufcUybe+ILNdFagh8wPlc6UoN7p/n9uaO1/QSjkCqZ4hCSJYks/azxd8O
 9TmXp9XgOde1EhRxjDg6ONR6xeCasgbE6RalAliE=
To: Sam Cater <sam@samcater.com>
From: Jordan Glover <Golden_Miller83@protonmail.ch>
Subject: Re: Cannot compile Noise.c on Kernel 5.0?
Message-ID: <dfiSsHVIrz0EYyaiMf2E1C7ZIxe86o0Fm_KYt30d5ZZl0LRxz2JZv_-z-_Mid2AcQVSNxuC73wjBEvT4JbbxNl4vpkvCd681rU6nSsf7b0U=@protonmail.ch>
In-Reply-To: <e52ae637-f85b-139d-84c6-29de2db5383e@samcater.com>
References: <e52ae637-f85b-139d-84c6-29de2db5383e@samcater.com>
Feedback-ID: QEdvdaLhFJaqnofhWA-dldGwsuoeDdDw7vz0UPs8r8sanA3bIt8zJdf4aDqYKSy4gJuZ0WvFYJtvq21y6ge_uQ==:Ext:ProtonMail
MIME-Version: 1.0
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
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

On Wednesday, January 16, 2019 5:37 PM, Sam Cater <sam@samcater.com> wrote:

> Hi Wireguard Mailing List,
>
> Probably going to be showing a lot of ignorance here!
>
> Wireguard has run fine on this system in the past, but today I tried to
> build 20181218 on self-built 5.0 kernel (which in and of itself seems
> stable and working fine). The compile fails on src/noise.o with the
> issue linked below on line 453.
>
> If I switch back to the stock 4.19 kernel provided by Fedora then
> everything compiles fine. It's also worth mentioning that the same issue
> appears to happen when I install the COPR packages for Fedora.
>
> Appreciate I'm a non-standard kernel but just in case it is a Linux 5
> incompatibility rather than "I can't build software", I thought I'd post
> here in case it was helpful.
>
> Mini paste at: https://pastebin.com/raw/W4LRT5bx

For Linux 5.0 you need to use wireguard snapshot from git:
https://git.zx2c4.com/WireGuard/log/

The error you posted was fixed by:
https://git.zx2c4.com/WireGuard/commit/?id=a56a0fee861d104b9bdb22847656fc40a9b13079

Later in build there will be another error fixed by:
https://git.zx2c4.com/WireGuard/commit/?id=eb8316abc24da2e38de65d88c519aa8dfd6227f4

Jordan
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
