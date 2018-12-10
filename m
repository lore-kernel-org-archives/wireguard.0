Return-Path: <SRS0=tdjr=OT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6138FC07E85
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 10 Dec 2018 01:15:27 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB0D620855
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 10 Dec 2018 01:15:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="e8G2X5iO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB0D620855
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6e21c3e1;
	Mon, 10 Dec 2018 01:06:49 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 401abecf
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Dec 2018 01:06:47 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5d813252
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Dec 2018 01:06:46 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 83874ceb
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Dec 2018 01:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=Vjczq/z0Vp2a3+B1B/oLD2ib4/8=; b=e8G2X5
 iOj/iwJNIVmu6mT5wR2tYB2U9zRS+pa6Boa4RZpfwdFTDtDEIaKMJJgSgMaZqE22
 6jyIdu8gzeJyGU7H6zXoZylHKlCWXb8pJTxUbCtxSetXK23QZ/BoFfvPeh6vWuJ6
 yROZ3g1jJatrjnYIGpmXmThtZP7eubR2efUx5tpH0oKedYUJnHylG0TvZjS0Chtu
 6Ae3Ptou55/4LE6bOIWjUlbjZoKenupPR0hvvm35DWLLLwFm3zA+PquqZiXdm5wT
 53VbG/HcSiEN030LY9qQotqI42HLcCAUehV+jzZl/j9Cd/wALn4ilzLha6jD8vJX
 MmL+4CKNYyj/6ODA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9e7a7aa4
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Dec 2018 01:06:46 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id m6so7684864oig.11
 for <wireguard@lists.zx2c4.com>; Sun, 09 Dec 2018 17:15:23 -0800 (PST)
X-Gm-Message-State: AA+aEWbWgAVBWRK0RpuPHvGb6WgmS9BSU9i5vTZC/ZrABbyCShn/l/CS
 AmoAKUcfIp1UV5uo7y5+N8F3uJ8OqcLsGALb17U=
X-Google-Smtp-Source: AFSGD/XgtzgAvD6F9BnS28CoXLhd9h+43I7bB8RNwwGsnhiQRCx0qGhF7L2uwCQN0+hVDjZAnyrrcthhEyM321XImIs=
X-Received: by 2002:aca:f288:: with SMTP id q130mr6049744oih.228.1544404522572; 
 Sun, 09 Dec 2018 17:15:22 -0800 (PST)
MIME-Version: 1.0
References: <c430b4be-fc84-40c3-c9d2-5d5833d8ae89@attglobal.net>
 <6a703cdc-13e4-4881-7bb5-072b0f576a3e@xand.uk>
In-Reply-To: <6a703cdc-13e4-4881-7bb5-072b0f576a3e@xand.uk>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 10 Dec 2018 02:15:11 +0100
X-Gmail-Original-Message-ID: <CAHmME9qw52LXqgJj=yanmyB6Yzm1Q_cYbe50ZYLNT0b5dzbu+g@mail.gmail.com>
Message-ID: <CAHmME9qw52LXqgJj=yanmyB6Yzm1Q_cYbe50ZYLNT0b5dzbu+g@mail.gmail.com>
Subject: Re: Should wg-quick with SaveConfig accumulate IPv6 link-local
 addresses
To: xand@xand.uk
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

This is mostly just a CentOS issue. On older kernels, we don't
successfully disable LLv6:
https://git.zx2c4.com/WireGuard/tree/src/compat/compat.h#n583

There's probably a way to backport that tweak to before 3.17, but I
haven't spent time on it. Feel free to send a patch, and if it's clean
and fits entirely into compat.h, I'll gladly apply it.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
