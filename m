Return-Path: <SRS0=8CbH=AM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50A7BC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  1 Jul 2020 16:28:57 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B93E920781
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  1 Jul 2020 16:28:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gk/sPw2i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B93E920781
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 60c76761;
	Wed, 1 Jul 2020 16:08:59 +0000 (UTC)
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 30957806
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 1 Jul 2020 16:08:57 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id d18so14893581edv.6
 for <wireguard@lists.zx2c4.com>; Wed, 01 Jul 2020 09:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NHY/ua7d/0aAP6JnSEnvQrLvcbc/95n4E5SSH5dP4oY=;
 b=gk/sPw2ifW9fcvord6BRBV1uai57gwxNWxzgvytkMKcxj9Bqoh9eynB98p17o5PX+A
 QeMY3XiXa3rPPeZ2xfDzII7bWAcf4xMnu457kvOcU4QEto/Q4QyTNgMp1H8LKYJiIhYT
 JVzeA4iP0SzFYsqjMDqLYAMb6C7U19r2MdTsdJirFAzk58uxo9LzN0GB80Kq5vSemBLU
 lsUtdcNY3a7ReUhAuHkdYTyCQVHJHc9WdujjJ8wU4XMQkejJ/JsFyoenGTVzCkIIPi41
 vYvHeNfJ8LfCrdFBNJ7izEAnyQBbF5VDmk1E+ltcrsRgmOb3QzDElUccEMQvwUA6xB/O
 aDqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NHY/ua7d/0aAP6JnSEnvQrLvcbc/95n4E5SSH5dP4oY=;
 b=OLCPl+pA2sjTSKgLBBv0VE9tj+S+VvgGF28UFIUndQMNksWSfZ3ESX74HIJaTsFx4k
 vAa/s97Bjq9Br3p+iWxVsW4YQExkGnjLhFFJN5wNNnSi3D6jYyiDKfe9bEi+KMyVrFl4
 /IsFiwssNbpIBfi9knOtI9agogQYyftjpKu5W6dVnbZXUXfhgUOiy8mMVbN4RsV8BV2R
 WVeKudo/RBF26hE1rcxEpkr2oRPmk4glxFDs8zXRy/uP+UmAxzodPQ72/o8pslDHSfYZ
 kPloebSPMZatRh18Ai983K5oTU+CaKrwIvShNc4QVHhlm6v1JYwaOAazOhs/emX4wlzL
 G11Q==
X-Gm-Message-State: AOAM5331pGsSsW+icQ+lMiR8BuCoZCht7puHmPhhey0KscerIYKYfGS6
 OFTjSa264I6DA9T41pq28o1WnLTQ05/RTdcKxPc=
X-Google-Smtp-Source: ABdhPJxWIgJ60DwfGmJ4FdRAb7qrnZ8zejs3cR1pgCQULhtal2J5ArjoMKo8ahbL39DNAPsfNCc5aUS5GTdlB/35890=
X-Received: by 2002:aa7:d3cd:: with SMTP id o13mr29388589edr.176.1593620931106; 
 Wed, 01 Jul 2020 09:28:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200626201330.325840-1-ndev@hwipl.net>
 <CAHmME9r7Q_+_3ePj4OzxZOkkrSdKA_THNjk6YjHxTQyNA2iaAw@mail.gmail.com>
 <CAHmME9pX30q1oWY3hpjK4u-1ApQP7RCA07BmhtRQx=dR85MS9A@mail.gmail.com>
 <CAHmME9oCHNSNAVTNtxO2Oz10iqj_D8JPmN8526FbQ8UoO0-iHw@mail.gmail.com>
 <CA+FuTSdpU_2w9iU+Rtv8pUepOcwqHYaV1jYVfB6_K157E6CSZw@mail.gmail.com>
 <CAHmME9rZieNAYeeK90HLoaoeKJEv5vE9MHfn-q5zFY8_ebNqxw@mail.gmail.com>
In-Reply-To: <CAHmME9rZieNAYeeK90HLoaoeKJEv5vE9MHfn-q5zFY8_ebNqxw@mail.gmail.com>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Wed, 1 Jul 2020 12:28:13 -0400
Message-ID: <CAF=yD-KaG=SS5ujdYyeYXh6528SawgNBHteVf1ywDhMugV64Og@mail.gmail.com>
Subject: Re: wireguard: problem sending via libpcap's packet socket
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Hans Wippel <ndev@hwipl.net>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>, 
 Netdev <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

> > header_ops looks like the best approach to me, too. The protocol field
> > needs to reflect the protocol of the *outer* packet, of course, but if
> > I read wg_allowedips_lookup_dst correctly, wireguard maintains the
> > same outer protocol as the inner protocol, no sit (6-in-4) and such.
>
> WireGuard does allow 6-in-4 and 4-in-6 actually. But parse_protocol is
> only ever called on the inner packet. The only code paths leading to
> it are af_packet-->ndo_start_xmit, and ndo_start_xmit examines
> skb->protocol of that inner packet, which means it entirely concerns
> the inner packet.

Of course, you are right. This inspects the packet before passing to
the device ndo_start_xmit, so before any encapsulation would take
place.

> And generally, for wireguard, userspace only ever
> deals with the inner packet. That inner packet then gets encrypted and
> poked at in strange ways, and then the encrypted blob of sludge gets
> put into a udp packet and sent some place. So I'm quite sure that the
> behavior just committed is right.
>
> And from writing a few libpcap examples, things seem to be working
> very well, including Hans' example.

Definitely. Thanks again.
