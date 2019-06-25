Return-Path: <SRS0=4DEc=U6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68EE0C0650E
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  1 Jul 2019 03:33:48 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2F9F208E4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  1 Jul 2019 03:33:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p9zqsrXu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2F9F208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5984cb14;
	Mon, 1 Jul 2019 03:33:46 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 51e237ac
 for <wireguard@lists.zx2c4.com>;
 Tue, 25 Jun 2019 16:56:11 +0000 (UTC)
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7f2a6850
 for <wireguard@lists.zx2c4.com>;
 Tue, 25 Jun 2019 16:56:11 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id f80so13086765oib.0
 for <wireguard@lists.zx2c4.com>; Tue, 25 Jun 2019 09:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=I1t/Y+9/H+fZvyxbpGXWuHP9rXGj4Uu+MF5MjlXclUc=;
 b=p9zqsrXuIGVBkcaNHz5AlQeNweOOegEj6ZW9U3IhxQMG8sxro8J72il8d3zfIlN5IR
 D8N0WOMm+3fxt+IcKX2+ZvddqCUuKiDQ95WZu4DwYFuR17ZznM8c1xA5B4ppbCKe6H+o
 +D6XIIaiNYhHvW9AbvNwq1IDYGvxKvDlQDe6by4hL6TxaRFajaefiZSzWHA4+4Az3jwN
 rn0xT11GS1InDvXeVEBO5tzeJ6ZTwRoCYqJv0MpX+WsthEe6d+XudC8aIYQHXjrlnvfP
 PKeBOn5kMM6R2HClmS2BzvuzjlzDuT8mMq5JruGLR8VghTxOdsFsFwNkR1MXYuGSOJn8
 bp/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=I1t/Y+9/H+fZvyxbpGXWuHP9rXGj4Uu+MF5MjlXclUc=;
 b=j/vBMmMV1p4duIk+aH6QEe53windIDTfotk4HwajqkwF0ySdZbgsEnyFSUHPx95Lhj
 ZRYVmoNq8j+dfaThJYfSFCD8Zm090k6NqwDJS81nu/ExFFbDgJM4/58/XwvTbe0I22Pm
 /hHxwdUkyUe22AuwWmx2NAGrlQ8lRsua98Mg6WNaPupA9yRXEPQByoh5yDEk2eZWk3l9
 uP/kKsVmMSJqJf3uIFZL8vKUryMkPFYm5ICT1w1HRkxLgTj6MAPepU7bTSGldMvRyTPQ
 aRTDCUDuVrkP2tGaCzrmq8p8hsqLh5pGkUru3eWOiN165oI59MPl10GoUHlzh0nf9UAC
 LzfA==
X-Gm-Message-State: APjAAAWfXNvksNIGio5eLYbH9iSiPqx/DBpahpB3QXDjIQzymR4miYas
 RchZllwgsi+vJ/HLjSwTH4Nooz2j1a+3NBRzAUrkq1DE
X-Google-Smtp-Source: APXvYqywpDwIDVviZwtRaYBoTuqcafSlNLq9xXnsGvQvs4fvEoy92TH9Y+ivThN9UuJUMw1fSUXFW5wAMVO+9b/aEdE=
X-Received: by 2002:aca:6046:: with SMTP id u67mr15384866oib.27.1561481769748; 
 Tue, 25 Jun 2019 09:56:09 -0700 (PDT)
MIME-Version: 1.0
From: Michael Brookes <mgsb81@gmail.com>
Date: Tue, 25 Jun 2019 17:55:58 +0100
Message-ID: <CABfcST8_qGByfP1859xknPiiz0iT5krk6d53DoWT_LmqqwcpsQ@mail.gmail.com>
Subject: multiple addresses in config and wg-quick
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Mon, 01 Jul 2019 05:33:43 +0200
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

 hello

I've got a fundamental misunderstanding of a config with multiple
Addresses specified in the Interface section, or probably just
wireguard in general, or perhaps networking completely, for example my
wg0.conf

[Interface]
PrivateKey = <key>
Address = 10.19.49.103/24
Address = 10.88.118.166/16

[Peer]
PublicKey = FgVLScjX29jwnXXbHStFpNKcFqbaiNK6LuSWFglrWCo=
AllowedIPs = 172.18.1.0/24, 10.19.49.0/24
Endpoint = endpoint1:51820
PersistentKeepalive = 10

[Peer]
PublicKey = itXrReVj+wuecrSs+VNnEEkpc7wHb8QhXQtMQUBrOj8=
AllowedIPs = 172.27.0.0/16,10.88.0.0/16
Endpoint = endpoint2:51820
PersistentKeepalive = 25

I do wg-quick up /path/to/wg0.conf and I have a wg0 interface with
both addresses assign, the only thing is when I try to ping an address
in the ranges the second peer lists, for example 172.27.3.141, the
ping is just using the first address listed in the conf, so a tcpdump
of wg0 shows something like:

10.19.49.103 -> 172.27.3.141: : ICMP echo request
 and of course no reply, endpoint2 is getting the ping but it's coming
from 10.19.49.103 so no response.

Any help gratefully received.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
