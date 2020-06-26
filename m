Return-Path: <SRS0=k8rb=AH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 913A2C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 26 Jun 2020 20:42:22 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF66C204EC
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 26 Jun 2020 20:42:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="iWpjf9Tk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF66C204EC
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0038b21a;
	Fri, 26 Jun 2020 20:22:50 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id bfa88418
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 26 Jun 2020 20:22:47 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b2ebb103
 for <wireguard@lists.zx2c4.com>;
 Fri, 26 Jun 2020 20:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=wxnOOml3JHYM1DKXMM9+1x9WEFA=; b=iWpjf9
 TknlxFriv78ZtJahRqfcLhwZY2QuNDCEwEImqUAh9j09ewOt5+dDNDTxUM6WajWa
 vgLqyxX6hCOF6p7NWQp4+K/breUiUXDhmpPJkx0kpm2X99vc4GFfJbKMDxG+W/07
 aHrnZHwEKdTrHaWf5ZBOfQYMs3DHffhH4NvUgBZgUmQ0xIyGXcijW5894I8gFMcV
 EG2ti8g2e4w7+w7VYCqD7/XhPvLYYY8ad6TO0LpMZer3bHhCJaUsYXqZ3UxvIr8z
 T1jScQKcYfW2lo7eDtIy9rhhqnLG8vI0e4nHUjvFqPtEh+jpPWOaAK8wDLxJGfYr
 +SbbKmb20jD4BblA==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 214fb83a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 26 Jun 2020 20:22:47 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id a12so11211656ion.13
 for <wireguard@lists.zx2c4.com>; Fri, 26 Jun 2020 13:42:05 -0700 (PDT)
X-Gm-Message-State: AOAM533P/lrMQC3kjBy3B3pDPcXwLffGz6UdlPI1zPP7aB+I9U48sZNA
 ooswxsSyxFdph94kuvjbY78XbhxN9isZ9gClgbk=
X-Google-Smtp-Source: ABdhPJzOQJm5CwSuzBLlIm7f2d/B2iDB26DRcTjAb550CK8zXdO5Pb4X6luBlSkuCvbDziy1bEFl1uuzreDeeCe4vU4=
X-Received: by 2002:a5e:9703:: with SMTP id w3mr5259914ioj.29.1593204125504;
 Fri, 26 Jun 2020 13:42:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200626201330.325840-1-ndev@hwipl.net>
In-Reply-To: <20200626201330.325840-1-ndev@hwipl.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 26 Jun 2020 14:41:54 -0600
X-Gmail-Original-Message-ID: <CAHmME9r7Q_+_3ePj4OzxZOkkrSdKA_THNjk6YjHxTQyNA2iaAw@mail.gmail.com>
Message-ID: <CAHmME9r7Q_+_3ePj4OzxZOkkrSdKA_THNjk6YjHxTQyNA2iaAw@mail.gmail.com>
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

Hi Hans,

On Fri, Jun 26, 2020 at 2:14 PM Hans Wippel <ndev@hwipl.net> wrote:
> while toying around with sending packets with libpcap, I noticed that it
> did not work with a wireguard interface in contrast to my regular
> ethernet interface.

Thanks for letting me know. I'll try to repro and will look if this is
common behavior for all virtual drivers, or simply a bug in WireGuard
that I need to address.

If it is the latter, your patch below isn't quite correct; we'll
probably address this instead by simply setting skb->protocol in xmit
by peaking at the header, if skb->protocol is zero, and then keeping
the rest of the logic the same elsewhere.

Jason
