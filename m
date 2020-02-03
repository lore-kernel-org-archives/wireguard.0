Return-Path: <SRS0=RmRV=3X=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E206C35249
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Feb 2020 18:22:28 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BA7E2082E
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Feb 2020 18:22:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="u8g2umrL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BA7E2082E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4d3d30a4;
	Mon, 3 Feb 2020 18:21:44 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 720b1741
 for <wireguard@lists.zx2c4.com>; Mon, 3 Feb 2020 18:21:42 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 67aeaa5e
 for <wireguard@lists.zx2c4.com>; Mon, 3 Feb 2020 18:21:42 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 373d1167
 for <wireguard@lists.zx2c4.com>; Mon, 3 Feb 2020 18:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=AHnnn5c7E7ODjw+FcbKupE4aiZI=; b=u8g2um
 rLxYy4mImsKCq+aKDF3ud7UkOG99HCK7GmoAXiaOC4DZWxriigd0OOgM6fe7O8FS
 IoTpcn49bBMHOwxKF0xC320VohFbWue3ZgTupZCGzK2H6wq5N2xUpgUplN2TiQlN
 d8SkM2q8jnfYnPXqrMihTrYByc5AXreqGt/1XD7DlBenzxCkyVM4tgx/o5ck/D3L
 7XKfLNbxzYCb7nldifeFRFptoIc/6rlEoithLWjjXLQt3/9stY9WrgWQjX6RsbCR
 XaOUgS4aEVv6RD+YSkNzLjUJBe2cwmkfH5iFOY7ojvI6BjqMsedjnLT6UM5Ijo+U
 W8DzSo6fgshLftng==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 16e699da
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 3 Feb 2020 18:21:40 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id d62so15642628oia.11
 for <wireguard@lists.zx2c4.com>; Mon, 03 Feb 2020 10:22:23 -0800 (PST)
X-Gm-Message-State: APjAAAV+fyF+SiNs1hY/F4qc+mODXA8aOTTblmHXA07L8OSauD0H/gPY
 DQ8Qm/ZNx3V7AwlLpwUCyWPL4zjIe3LxFv8U34g=
X-Google-Smtp-Source: APXvYqyXMkbzSjU+9vH9C6oeGFQH5PxWcSpaXOqoIYb0IwBAnyurBABIUZwo+LylIai5E8U7n5q3sn2/cRKFOGxxUdI=
X-Received: by 2002:aca:815:: with SMTP id 21mr272089oii.52.1580754142271;
 Mon, 03 Feb 2020 10:22:22 -0800 (PST)
MIME-Version: 1.0
References: <20200203171951.222257-1-edumazet@google.com>
 <CAHmME9r3bROD=jAH-598_DU_RUxQECiqC6sw=spdQvHQiiwf=g@mail.gmail.com>
 <efaa70a3-5c71-3cc0-ffe4-e8401d598992@gmail.com>
 <ba618605-ec50-085d-c854-f65290473c1c@gmail.com>
In-Reply-To: <ba618605-ec50-085d-c854-f65290473c1c@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 3 Feb 2020 19:22:10 +0100
X-Gmail-Original-Message-ID: <CAHmME9oNEjjGA6r_DE4Lcya2G-uEHemS_gKfer9wT8Ov3mN9bg@mail.gmail.com>
Message-ID: <CAHmME9oNEjjGA6r_DE4Lcya2G-uEHemS_gKfer9wT8Ov3mN9bg@mail.gmail.com>
Subject: Re: [PATCH net] wireguard: fix use-after-free in
 root_remove_peer_lists
To: Eric Dumazet <eric.dumazet@gmail.com>
Cc: netdev <netdev@vger.kernel.org>, Eric Dumazet <edumazet@google.com>,
 syzbot <syzkaller@googlegroups.com>, "David S . Miller" <davem@davemloft.net>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On Mon, Feb 3, 2020 at 7:20 PM Eric Dumazet <eric.dumazet@gmail.com> wrote:
> BTW wireguard@lists.zx2c4.com  seems to be a moderated list...
>
> You might document this.

I'm actually trying to get the spam situation sane enough that I can
unmoderate it, since moderated lists tend to be a hassle for firing
off patches.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
