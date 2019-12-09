Return-Path: <SRS0=uCSF=Z7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FFADC43603
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Dec 2019 14:32:46 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFD972077B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Dec 2019 14:32:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="TVCnctmf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFD972077B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id def20bca;
	Mon, 9 Dec 2019 14:32:44 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ddf8fd7b
 for <wireguard@lists.zx2c4.com>; Mon, 9 Dec 2019 14:32:42 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a9591fed
 for <wireguard@lists.zx2c4.com>; Mon, 9 Dec 2019 14:32:42 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1b0dae04
 for <wireguard@lists.zx2c4.com>; Mon, 9 Dec 2019 13:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=vX0nnDULtLdYjdjK7BmnxYPgaAA=; b=TVCnct
 mfx7APBvtbdEuYDQTdG99oHAD6rRozyNqNLvH2rIXpujGWAsij9YlnWdJHdQnX+Z
 1mWWRZ+U870/IHUFIoFCXgaiFrFj5TKt+uuyBIAfkyt5qi9LlqV/AHM9rMLZrPcO
 wNH2NrTiZGV4mMjoWhWB6I496aLiyLbH3nzAAMDIqbo/MzjqrNV187qic1Di5xj+
 8j15G97O2pdM7hHqgZd7avm+CsprhioVcfqNa8UCcG33a3DJIGrOeivCzVZtfbTb
 iIswrtPXIRjg75vYx21bBjL5pLHbeWClu0v/+VbkOuEd5laXX74X55NcKkVGldda
 5yeJrOzEomZ5PF+g==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 52b30aef
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 9 Dec 2019 13:37:17 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id p8so12302954oth.10
 for <wireguard@lists.zx2c4.com>; Mon, 09 Dec 2019 06:32:42 -0800 (PST)
X-Gm-Message-State: APjAAAXho/I4x6zuA3K8wooMGUgVThNCnHnNn2zweqR+YtKFLB0ESb61
 Z6GJOvN5XbEYMuexLp3WAkFrY8gxPLzcPYB/kZo=
X-Google-Smtp-Source: APXvYqw95I6gLGQa+Q5V7bk7pQYps9Ctgauqdiy0SGwpbfs0x5J336g0uM8yI4E5vbVaFI95MajfgBrg5CVJ131lw4I=
X-Received: by 2002:a05:6830:1141:: with SMTP id
 x1mr22022047otq.120.1575901961701; 
 Mon, 09 Dec 2019 06:32:41 -0800 (PST)
MIME-Version: 1.0
References: <c75aaac4-52bf-4759-aa0b-b67266af4361@www.fastmail.com>
In-Reply-To: <c75aaac4-52bf-4759-aa0b-b67266af4361@www.fastmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 9 Dec 2019 15:32:30 +0100
X-Gmail-Original-Message-ID: <CAHmME9pOWy894qgyWk5ymww4OrvbReqGdShUytgkbD9g+ayQzQ@mail.gmail.com>
Message-ID: <CAHmME9pOWy894qgyWk5ymww4OrvbReqGdShUytgkbD9g+ayQzQ@mail.gmail.com>
Subject: Re: Is this a concern
To: David Kricker <logcabin@fastmail.net>
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

https://lwn.net/Articles/806613/

We've handled this, and we've also already discussed it on this mailing list.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
