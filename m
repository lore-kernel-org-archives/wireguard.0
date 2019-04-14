Return-Path: <SRS0=/lAp=SQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03BD8C10F13
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 14 Apr 2019 08:54:58 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CC2F206B6
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 14 Apr 2019 08:54:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="QSsFwd1y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CC2F206B6
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7329d580;
	Sun, 14 Apr 2019 08:54:55 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c175751c
 for <wireguard@lists.zx2c4.com>;
 Sun, 14 Apr 2019 08:54:53 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ef119fd3
 for <wireguard@lists.zx2c4.com>;
 Sun, 14 Apr 2019 08:54:53 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d9e615a1
 for <wireguard@lists.zx2c4.com>;
 Sun, 14 Apr 2019 08:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=R6+UnRqmAOXwvSXaKAolK0QALrQ=; b=QSsFwd
 1y1phUyslT98Ua1Hmfj7P2slDFBIoW1A40rhwhIdVKx8wIwPwPCSZeTpJ8t5RavV
 sIX1cYdS60oGQy73rbQivqFYesS4A8/gEwoHQwK8xMTYED7VwnFzf2F1LcfqG1w/
 naRHFfPib4D2EF1CCx7aT9/88RImT/fIXAOwgosh9tpEzJnJ5iJqp4OMiF8wUJp0
 +phOo5ZC5c2+OJ822ow1+aA3TFq7x5Ii5RwdBCKh1ZG9gZSVQy3KHcc9d+y6305Y
 6oUhLKzIwIKVaZvyaECH1eA2TNRIlX9Rl5TNvfuuKp4ZLwiVGq258LIU3l6IOtR6
 75yem1kKRccas4Ww==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e8eec0cf
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 14 Apr 2019 08:30:12 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id k21so11988051otf.1
 for <wireguard@lists.zx2c4.com>; Sun, 14 Apr 2019 01:54:52 -0700 (PDT)
X-Gm-Message-State: APjAAAUlbUm1Ht+35joSj63ok/wMztJJmkOiGjh6sjJ82r8tRAjmQTM4
 213ZaSYGQSNkid1/522vMSiPlJbwt4MEIutQ850=
X-Google-Smtp-Source: APXvYqxkg71i/91CWq/u0ZvG4sl0LjlCAgQrwR+vDQWO/oIqZZHhBE7gpJzZgiBW1xGzH4pNEXg042/8YqAAJMjivW0=
X-Received: by 2002:a05:6830:1481:: with SMTP id
 s1mr43242170otq.321.1555232091791; 
 Sun, 14 Apr 2019 01:54:51 -0700 (PDT)
MIME-Version: 1.0
References: <068214E5-B780-4A6C-AE79-BD772177EBCB@gmx.net>
 <CAHmME9ojqhKDRGkEqmaP-bCXPjgpjwRKKvQL1Z9Gu+bx018jyQ@mail.gmail.com>
 <A989EC48-2676-4C2A-8F1E-D9782F8D3B18@gmx.net>
In-Reply-To: <A989EC48-2676-4C2A-8F1E-D9782F8D3B18@gmx.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 14 Apr 2019 10:54:40 +0200
X-Gmail-Original-Message-ID: <CAHmME9oax4=RVQhKaJtaJbAXSq42DFw+QT8fxA2onoymq8ziUw@mail.gmail.com>
Message-ID: <CAHmME9oax4=RVQhKaJtaJbAXSq42DFw+QT8fxA2onoymq8ziUw@mail.gmail.com>
Subject: Re: compile error on WireGuard Kernel/ROM Integration
To: Robert Walli <rwalli@gmx.net>
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

Looks like some terrible vendor made random backports that aren't a
part of kernel.org's sock.h:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/include/net/sock.h?h=linux-3.10.y

Apply this to your kernel, and things _might_ work without exploding:
https://xn--4db.cc/AGC0Ssj6/diff
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
