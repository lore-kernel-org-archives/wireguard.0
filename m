Return-Path: <SRS0=q2lx=MG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,T_DKIM_INVALID,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D052BECE561
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 24 Sep 2018 14:10:47 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E619020C0A
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 24 Sep 2018 14:10:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="cXGZatSm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E619020C0A
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 21bf3788;
	Mon, 24 Sep 2018 14:08:00 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e4b23d06
 for <wireguard@lists.zx2c4.com>;
 Mon, 24 Sep 2018 14:07:58 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d5c52723
 for <wireguard@lists.zx2c4.com>;
 Mon, 24 Sep 2018 14:07:58 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e6986bb5
 for <wireguard@lists.zx2c4.com>;
 Mon, 24 Sep 2018 13:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :from:date:message-id:subject:to:content-type; s=mail; bh=dDIkd7
 ajxrU5TTHqLHgUErwxorI=; b=cXGZatSmX+lVwJejuk2jNEVwLc+5YtcvTgMpLl
 wm5ciZBhYnwQaka4UPHLxDEm/hsE0yt7UMDzAIZTq9GjgIKkzQcV0qMe/p60iZfS
 1+0Qoz9kZf/sEnIG3iGn1CeY7zHsqQHX6Nk0yJtVi1XT8RjH5w+pONfJta4+9gZt
 9KD/ctR11W6T5I1X14lHYPhV6f85IzgCFLJiDYfv0XVYYIXHEWtDSNe44xYllduq
 09ZAB19m2PniEby9zMr8DiZENSXagEnisetxzvXHjbM4YTxecut/L9U+fVvRi+Yc
 h0nxG2bvJOojqgwTU1UyURRXTGTLu+c32rFR8Wu6QYXaqUVQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 17326ef2
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 24 Sep 2018 13:52:09 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id e18-v6so19965727oti.8
 for <wireguard@lists.zx2c4.com>; Mon, 24 Sep 2018 07:10:27 -0700 (PDT)
X-Gm-Message-State: ABuFfohCcf8nXal/xTAdEl5lVGNGbQu8V9qd7DWfFh6quTDG/Oa6HUqM
 4CqLY5gG9kN5fr0zzBJzTSStJBPz9mWMBwSuNng=
X-Google-Smtp-Source: ACcGV60sBa0/BaVwLX4aNga3HwUXdMhuwCcYkhbSOiCkESp0zWW4IPNQHUE9cewDXs21hEhRaeW+kMoIkSak61KcnNQ=
X-Received: by 2002:a9d:4a8f:: with SMTP id
 i15-v6mr7183916otf.138.1537798226037; 
 Mon, 24 Sep 2018 07:10:26 -0700 (PDT)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 24 Sep 2018 16:10:14 +0200
X-Gmail-Original-Message-ID: <CAHmME9p6e6FvXJr3qZmW=0uE9tX+G0p4ACAUaWrBpsnDfb7AfQ@mail.gmail.com>
Message-ID: <CAHmME9p6e6FvXJr3qZmW=0uE9tX+G0p4ACAUaWrBpsnDfb7AfQ@mail.gmail.com>
Subject: Mailing list archives now on lore.kernel.org
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hi folks,

We now have a mirror of the mailing list archives on kernel.org:

https://lore.kernel.org/wireguard/

The primary archives remain in their usual place:

https://lists.zx2c4.com/pipermail/wireguard/

Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
