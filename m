Return-Path: <SRS0=ZlE4=N7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73265C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  9 Sep 2021 17:45:44 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BA4360F4A
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  9 Sep 2021 17:45:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7BA4360F4A
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3bb14fc7;
	Thu, 9 Sep 2021 17:43:05 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id fadc76b1
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 9 Sep 2021 17:43:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BD8DD61101
 for <wireguard@lists.zx2c4.com>; Thu,  9 Sep 2021 17:42:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="MK9Nojuh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1631209377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BGpEf+Cx8SkBNCpsW0Y/5Yq5CUWutxpSsKZkfWJxHv4=;
 b=MK9NojuhR+0dQtBLcLMUpRC7eKMvS3iyRl/FBn/77hUE2hMuh/yyTcgz+MIBiXnYWtY52E
 SjF/C5wkMU8lGec+KdLixoNF12KVBwRCY0goH7ltkRAG9cco21lqqxNuM++bm7WTmwQvRR
 WJL/2EN9eoITrZlYHowSYgDIJ7DYiJ8=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d5ad131a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 9 Sep 2021 17:42:57 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id z5so5518605ybj.2
 for <wireguard@lists.zx2c4.com>; Thu, 09 Sep 2021 10:42:57 -0700 (PDT)
X-Gm-Message-State: AOAM531zC/DUM33FHJSwIiA498bFva7IvzApmV8iW9O1iJQxX2bz/wdx
 8DKykEeu5m8m6ZFH6Ekkrx7+O1Vxx0OZsLnCTTg=
X-Google-Smtp-Source: ABdhPJzjdQBLa0BoylAuPKbr1YPcxmDfsHXMamUMXXNgBHnavugVnzU0P56uB0eevq5HQgeRgqtnDd+TwL7pobECqVg=
X-Received: by 2002:a25:9a84:: with SMTP id s4mr5457496ybo.416.1631209376688; 
 Thu, 09 Sep 2021 10:42:56 -0700 (PDT)
MIME-Version: 1.0
References: <00042bf6-4e8c-8638-380d-6774b37f96c2@blackberry.com>
In-Reply-To: <00042bf6-4e8c-8638-380d-6774b37f96c2@blackberry.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 9 Sep 2021 19:42:45 +0200
X-Gmail-Original-Message-ID: <CAHmME9qXieNWU_Y5rz1eDM9Bh=YjBPaeQFTrsXr4PKHyh1ePRA@mail.gmail.com>
Message-ID: <CAHmME9qXieNWU_Y5rz1eDM9Bh=YjBPaeQFTrsXr4PKHyh1ePRA@mail.gmail.com>
Subject: Re: Wintun NeighborDiscoverySupported
To: Brad Spencer <bspencer@blackberry.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hi Brad,

That sure is interesting. Indeed UseNeighborUnreachabilityDetection
and SupportsNeighborDiscovery can't be set with SetIpInterfaceEntry. I
haven't (yet?) found any way for the driver itself to indicate that
these should be false, either, via OIDs or similar. This might require
some frustrating reverse engineering. I remember noticing this a long
time ago, but I deemed it "annoying but harmless". However, you now
mention:

On Thu, Sep 9, 2021 at 4:33 PM Brad Spencer <bspencer@blackberry.com> wrote:
> but the ARP table fills up with addresses.  For example:
>
> $  arp -a -N 10.0.0.100 |wc -l
> 387

If that grows indefinitely, that sounds... bad. So this might be worth
looking into again. One thing about your message, though, raised a
question in my mind, but I'm not sure whether its an artifact of your
wording or a real thing you observed:

> We have noticed that Windows seems to try to send ARP requests over
> Wintun interfaces.  In our configurations, these don't go anywhere and
> get no responses,

Indeed the ARP table fills up, as shown above, but I'm wondering how
you're observing ARP requests exactly. ARP is a layer 2 protocol, and
Wintun (and WireGuardNT) are layer 3 devices that should, in theory at
least, not have anything to do with ARP packets. So how exactly were
you "seeing" the ARP requests on the Wintun interface? Did wireshark
show it? Or did you read from the Wintun ring and actually see an ARP
frame? Or something else? Or was this just a manner of speaking and
you didn't actually observe ARP frames themselves?

Another small question:

> We _think_ that the NeighborDiscoverySupported property being Yes means
> that Windows issues ARP requests for addresses on the Wintun interface.

That seems like a good intuition. I'm wondering whether that's
something you're assuming or something you read on a Microsoft
website. I ask because this might provide a good entry point for
whatever reverse engineering I wind up doing to fix this.

Regards,
Jason
