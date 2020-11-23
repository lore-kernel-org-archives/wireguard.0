Return-Path: <SRS0=uuIP=E5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB87FC63697
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Nov 2020 16:51:06 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECF2E20717
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Nov 2020 16:51:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="3QFwh2Is"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECF2E20717
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cd1ca644;
	Mon, 23 Nov 2020 16:45:40 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a500d595
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Nov 2020 16:45:38 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c79bbb97
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Nov 2020 16:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=pGbsBH6cFC0u3ytiQT5yJc8ibUY=; b=3QFwh2
 IsX2KGClWHQ7i63YtcNAET4EBycOj85DFnUtXjSgeQsSYaIyMQvS7bzNkbNcUChL
 kmcjB+iDkwFuNPWKK8FytytvtdIWTd5SJWp11h5f+qdmIxAy3PytCgE6Dhzy//D5
 xfIbIR5l2n/1/NT+pJcPa21X4M76A3nsn4ztGhRDPFdduej6gKw+CWONAqE9mBCO
 62c3ZHBysgV/B0FwsA0rOJvIZbbRUuutkeSMZl+hETdsYohHwKsSe2gapEZmxB0P
 KW/Y0m5QzMgOMfoH3jVkTfwkOghn5ZaIsMaLzCr1s9S5NLjhDTSWWCb3RPFtlMTz
 CP9m8gffPEC9ME6Q==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e8188502
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Nov 2020 16:46:24 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id r127so12779203yba.10
 for <wireguard@lists.zx2c4.com>; Mon, 23 Nov 2020 08:51:02 -0800 (PST)
X-Gm-Message-State: AOAM533vB61/+dkfV0M2RJPfQNXj6MYjZYseEL72wQi2VStCIRhwVgAG
 s9lQZW/mjgwddh0PgSkcLsu48eFUqS0JkFDXSgM=
X-Google-Smtp-Source: ABdhPJxY2VgUYhljwTfd71UsBHjtjhpUPOmGFm+aXfB+wLFdDda2AN0j0n7IOPsnYUFFdW4Q4wWJD8PTcfxenKo2iwY=
X-Received: by 2002:a25:5084:: with SMTP id e126mr488756ybb.239.1606150261812; 
 Mon, 23 Nov 2020 08:51:01 -0800 (PST)
MIME-Version: 1.0
References: <CACnYWReJC+Ff8G+uWLW6i=rsR1w=O-6aDFBG-yd__ZuuRh83CA@mail.gmail.com>
In-Reply-To: <CACnYWReJC+Ff8G+uWLW6i=rsR1w=O-6aDFBG-yd__ZuuRh83CA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 23 Nov 2020 17:50:51 +0100
X-Gmail-Original-Message-ID: <CAHmME9qyVb7kuj+VYAaQRqZ-i_Mptr6_2BGGoz+wf5Ke4WXUMw@mail.gmail.com>
Message-ID: <CAHmME9qyVb7kuj+VYAaQRqZ-i_Mptr6_2BGGoz+wf5Ke4WXUMw@mail.gmail.com>
Subject: Re: WSL2 and Wireguard
To: Ruben Di Battista <rubendibattista@gmail.com>
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

Hi Ruben,

On Mon, Nov 23, 2020 at 5:43 PM Ruben Di Battista
<rubendibattista@gmail.com> wrote:
>
> Hello,
>
> I'm experiencing a problem with Wireguard and WSL2. If I activate my
> tunnel and then I ping a machine on the VPN IP range from WSL2, I
> don't get any response.
>
> However, if after activating Wireguard, I ping from cmd or PowerShell,
> I successfully get the ping back and I'm able then also to ping from
> WSL2.
>
> I'm not sure if this is related to Wireguard or WSL2, In any case I
> reported the bug here: https://github.com/microsoft/WSL/issues/5810
>
> Is it a problem of my machine, a problem from WSL2 or Windows Wireguard?

That's pretty weird. I've seen a few related bugs like that, where it
seems like WSL will drop packets that don't meet some unusual stateful
criteria. I don't know if they're trying to do some kind of connection
tracking, or if the routing logic is partially broken for NdisMediumIP
devices.

I assume you're experiencing this using the latest WireGuard 0.3 [1]?

To answer your direct question, though, I think this might be a WSL
problem rather than a WireGuard problem. If that Github issue doesn't
get any attention after some time, I can try to reverse engineer the
hyper-v networking drivers to see what's going on, but as always with
that kind of thing, no guarantees on its success.

Jason

[1] https://lists.zx2c4.com/pipermail/wireguard/2020-November/006075.html
