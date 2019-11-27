Return-Path: <SRS0=OnWR=ZT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B229C432C0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 10:23:41 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E52A020678
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 10:23:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="l5fVCM+l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E52A020678
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4272341a;
	Wed, 27 Nov 2019 10:23:13 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7aa70384
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Nov 2019 10:23:11 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 83ea703d
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Nov 2019 10:23:11 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fb7af3b2
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Nov 2019 09:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=KKLApgh3OkaAqSi9cA+CnAmMOq4=; b=l5fVCM
 +laOYRb/44S05c3OIsJ/pYysuWAMU6bpwbW6WfsGmNc9cj9fD7RYScNaqS/8howO
 G6Qq+ddorc51IkGTNbUfLKWTSTw5ajV4IG3cQwNKgkPsGsNUEQtLmnRHRgqcJWfz
 dt5Fz2SR9vu3/+P4QhSKv8bCXknfO+y+Cv4QivmfAQc+qoFeahHa0/Zcfqk9DUtY
 GTlNeDyZMJjf3nJh8DpmCpgDIH87a2PbzxFUOzTZrTQqW8GEC9zyd2CwI0CIbrk+
 36Fs/sYhtOl6VSbjW8hpBTW0kcCK7mReyp958NtmIQwWjru2ieAgV1Z/c2a0IQzs
 hIhgV/mtHmCh0jeA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 95513c76
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Nov 2019 09:29:21 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id r24so18634110otk.12
 for <wireguard@lists.zx2c4.com>; Wed, 27 Nov 2019 02:23:11 -0800 (PST)
X-Gm-Message-State: APjAAAUbx+lSogWFp3a7KusQBS5FXGcyTzGWbUkWz97DAOU/NBpoh1g3
 +ZcD0ONoG0lOaQB/h+GNmrjtzfudAWh6z/jdLGY=
X-Google-Smtp-Source: APXvYqxb232AJnpjyeDRL3+ZDZHe1qSmloBbyysN2Oq4sNpkc5/VvRMUGvDYJEOdqoEVH4Vc67IxrAuF5Uy7hgbZoa4=
X-Received: by 2002:a9d:66d:: with SMTP id 100mr2979461otn.179.1574850190795; 
 Wed, 27 Nov 2019 02:23:10 -0800 (PST)
MIME-Version: 1.0
References: <20191117135928.3349-1-root@localdomain.pl>
 <20191117135928.3349-2-root@localdomain.pl>
In-Reply-To: <20191117135928.3349-2-root@localdomain.pl>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 27 Nov 2019 11:22:59 +0100
X-Gmail-Original-Message-ID: <CAHmME9od2vBXmb0B2r9BztWeZAw=foK10xfTKfoYT3jnt_LNtA@mail.gmail.com>
Message-ID: <CAHmME9od2vBXmb0B2r9BztWeZAw=foK10xfTKfoYT3jnt_LNtA@mail.gmail.com>
Subject: Re: [PATCH] Don't delete peers if not needed on `setconf`
To: Grzegorz Nosek <root@localdomain.pl>
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

Interesting implementation strategy. There's a pure-userspace version
of that too, here:

https://git.zx2c4.com/WireGuard/commit/?h=jd/syncconf
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
