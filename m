Return-Path: <SRS0=5l8i=AL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC39BC433E1
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 30 Jun 2020 04:00:35 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88DAD206BE
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 30 Jun 2020 04:00:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AST/x2uF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88DAD206BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6843936d;
	Tue, 30 Jun 2020 03:40:36 +0000 (UTC)
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [2607:f8b0:4864:20::12c])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b7b71aa3
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 30 Jun 2020 03:37:15 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id w9so16437562ilk.13
 for <wireguard@lists.zx2c4.com>; Mon, 29 Jun 2020 20:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yAZduYcEKm4wiOoLB6wnk1hlMRtoPsLgtKlyIvlMUUk=;
 b=AST/x2uFdAOxU5odRsKWn9WpNVke4VbhSNvdISsxJZV/NpV7Lw4iiX0GXfsPiDW0W4
 tUrRjKiSa62sEqDUPqKDwLjTEfwaJIzROaY0JTZ45PFyGziN68HkqYHlZgAWUgmUdiPP
 HEwGMXZa8wYgmU3U9+2SswTLl2PyLa0FQlbDjmV8uhbQpGuo/BqKXIfX1spkVz3HteSf
 aRC6y9fpGFIc8J0vnAIUviWUySCHN8LvMWS2m2k9nuQwY4VMIf3in26ljVIjLireNsJu
 WIj0yyMXzaTLwD3OTnQ4fy40w42oSfRHblfTUWboKc/MMq6uDuGzjrQ141U67NzeFkvi
 oK9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yAZduYcEKm4wiOoLB6wnk1hlMRtoPsLgtKlyIvlMUUk=;
 b=D+kXQl8h5gjsbnJCFn7eu0llUrjdJdVl46Q+iz2gEJ1Lqm9tafnNDVJFKSPXpYj7Yw
 Bj0vT3n1cfKFlK2nitX0sRbjYF6llXrMp7eMRWAE19aRgbekYndEHvgAQ1msjIuA9A3p
 RTEPOVa/pJYb/ww7pYK8wXVl2+mo80XKA/huKpQ5EZj7k22k6hCNYUIqRpqaY4oze049
 vFkZB2i+Ts2m33ndRnCSR8aQDlDVTNRt/iLPfHsQwzlNciiqr42ycCvyAeQK/tDBIHqM
 8d3k5kSbL5Swpa8trsjrLqDMf40g+w/lCTviFLnUEZ0ZuaURsbuW0NnN/4Hm/BiHBv0c
 +E5A==
X-Gm-Message-State: AOAM533pE96zAc8L+jQbU8g/+0pfswk2TJNxKvwqfIBDn8yikXs9h2zN
 HVAaBPzPO/gdnQo3Gd63BWUwyGe0ll8C7ONKVXM=
X-Google-Smtp-Source: ABdhPJxliD+RX+5z+ADoRBWAEQRMTYQaVyBjwuy4bcMqOCiNJvHeTGmICJj9i962YuR7HghZ2ecs16GvVbRu0qa8CbI=
X-Received: by 2002:a92:bb0b:: with SMTP id w11mr777875ili.238.1593489419280; 
 Mon, 29 Jun 2020 20:56:59 -0700 (PDT)
MIME-Version: 1.0
References: <00000000000084cbe605a93bcf78@google.com>
In-Reply-To: <00000000000084cbe605a93bcf78@google.com>
From: Cong Wang <xiyou.wangcong@gmail.com>
Date: Mon, 29 Jun 2020 20:56:48 -0700
Message-ID: <CAM_iQpVpaBQ5Hg9YAGRtcOWKDhyNOpZ6jfsDRbDhg-Da1xxUkw@mail.gmail.com>
Subject: Re: KASAN: vmalloc-out-of-bounds Read in netdev_name_node_lookup_rcu
To: syzbot <syzbot+1860d20cb6a6f52be167@syzkaller.appspotmail.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, David Miller <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
 Linux Kernel Network Developers <netdev@vger.kernel.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 30 Jun 2020 05:40:31 +0200
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

#syz fix: genetlink: get rid of family->attrbuf
