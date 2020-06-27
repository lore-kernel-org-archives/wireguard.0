Return-Path: <SRS0=xwVK=AI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33A60C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 27 Jun 2020 05:58:54 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7536E207FC
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 27 Jun 2020 05:58:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="SI2qzBFv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7536E207FC
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f1f54435;
	Sat, 27 Jun 2020 05:39:14 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 07a8dd84
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 27 Jun 2020 05:39:12 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bbcb3bbe
 for <wireguard@lists.zx2c4.com>;
 Sat, 27 Jun 2020 05:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=lSKJWVXiquJUkLW3FiyUsruDEc8=; b=SI2qzB
 Fv/+EhVcImVvvNThQZrEO2SeeA+2RpT0fzjtXgFI7LgsqG2HjBxseccYCHWdnxes
 GU1c1YBBxW8UeifVJL4ACDw3yPFvX4zXmYtSGKaCUOOZcRUXOr+3e/c+F2wSVefL
 QQ6GI8E1o3whmeu2RXKYvtRNDbKutKYGSedYK/q/G5pmz3WpZB3r3jjFPELORQBS
 RRGJ+jS0bP/1/X9TkYPfdkHnS6sBnXSZsxV+kxlsSj2WDNg7rLnOWj7pNlbVkmbd
 /wKcEXfdnJ4xDxpwvuFtnI0fWvSEOhmB3JzXvUd8dyuCvU9Bepn4gb6QEWmBvwf+
 7FX01VUMes5emyFQ==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id fd22d55b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 27 Jun 2020 05:39:12 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id c75so10287694ila.8
 for <wireguard@lists.zx2c4.com>; Fri, 26 Jun 2020 22:58:33 -0700 (PDT)
X-Gm-Message-State: AOAM533I7rvqPeHzNVvPd1v7QGvYssBzAMMjuQPfiiCWeuBXRwUwYDH0
 mUFzrbKSMq+ROFzlpKhqsJKL7TPmoL7tktAv+eU=
X-Google-Smtp-Source: ABdhPJz5RAymW776qmwtCYvV3KB1wNCci5/wvnu0+PUl9NP2duAtlCW+BTM8ZzBu38g+crotInXbn2a9L1SHcFR8mhk=
X-Received: by 2002:a92:d24a:: with SMTP id v10mr6773457ilg.224.1593237512930; 
 Fri, 26 Jun 2020 22:58:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200626201330.325840-1-ndev@hwipl.net>
 <CAHmME9r7Q_+_3ePj4OzxZOkkrSdKA_THNjk6YjHxTQyNA2iaAw@mail.gmail.com>
 <CAHmME9pX30q1oWY3hpjK4u-1ApQP7RCA07BmhtRQx=dR85MS9A@mail.gmail.com>
In-Reply-To: <CAHmME9pX30q1oWY3hpjK4u-1ApQP7RCA07BmhtRQx=dR85MS9A@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 26 Jun 2020 23:58:21 -0600
X-Gmail-Original-Message-ID: <CAHmME9oCHNSNAVTNtxO2Oz10iqj_D8JPmN8526FbQ8UoO0-iHw@mail.gmail.com>
Message-ID: <CAHmME9oCHNSNAVTNtxO2Oz10iqj_D8JPmN8526FbQ8UoO0-iHw@mail.gmail.com>
Subject: Re: wireguard: problem sending via libpcap's packet socket
To: Hans Wippel <ndev@hwipl.net>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
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

Hi again Hans,

A few remarks: although gre implements header_ops, it looks like
various parts of the networking stack change behavior based on it. I'm
still analyzing that to understand the extent of the effects.
Something like <https://git.zx2c4.com/wireguard-linux/commit/?id=40c24fd379edc1668087111506ed3d0928052fe0>
would work, but I'm not thrilled by it. Further research is needed.

However, one thing I noticed is that other layer 3 tunnels don't seem
to be a fan of libpcap. For example, try injecting a packet into an
ipip interface. You'll hit exactly the same snag for skb->protocol==0.
So, if I do go the route of the first option -- adding a header_ops --
maybe I'll be inclined to make a shared l3_header_ops struct that can
be shared between things, and fix up all of these at once.

Alternatively, it might turn out to be that, because this is broken
for other layer 3 devices, it's meant to be broken here. But I hope
that won't be the conclusion.

Jason
