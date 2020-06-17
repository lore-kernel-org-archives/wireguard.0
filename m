Return-Path: <SRS0=n59I=76=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98C4CC433E3
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jun 2020 08:33:17 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4267B21475
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jun 2020 08:33:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="fA/G5B6F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4267B21475
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3b1e2e5a;
	Wed, 17 Jun 2020 08:14:46 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 605637fd
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jun 2020 08:14:43 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id addad529
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jun 2020 08:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=4HSxEBErYi8DXrtAMrHN1acJz+0=; b=fA/G5B
 6FCL41bMDymSagnBlUIC8FHV0umsQ4UAZBcq57FCQKTdAylh0R8oq9K5dGSwLJS0
 U4IyFFeVXVbo5MrSaOja5DHju8i5SuukkPPmw9Q4DlNWI6g6JLDFlBQArflgLxFx
 ERYbQL15hiq2h5NAlShi+xDEZIxD7GNwfVWXV0uQ2/IubVZhmxEMaGkfRRhardji
 9rjoiTHeweimthmK/T6dANfye+MWnBnArJfEQX8ARgveX8BmiwEhpr4w6Fxwnns6
 F1UXYPZDabVt2uCnRwo5RjbwUCYwjzs6AUa4EN2nyCPb4LejlbDkD3tAI5Bta9Zd
 WUqr68WRyi8i4alg==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 62dc5104
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jun 2020 08:14:43 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id h3so1288211ilh.13
 for <wireguard@lists.zx2c4.com>; Wed, 17 Jun 2020 01:32:47 -0700 (PDT)
X-Gm-Message-State: AOAM530pijR1SgdlBjkxCZTB8xxRwSPM5tXdUidFBuGDrjFKiJANkmRu
 pMsALl3XqcI1ou7cmk4g9yVYkyqAxg/NpWOR0yI=
X-Google-Smtp-Source: ABdhPJyLrmcLkOUtfrl8OQv+dETZlm8fnXDRlfXhT8pCctwIV09PbVsYO6uSdkiYkPy9Z3tTBoSQjoBjRQ+SNEKxCwQ=
X-Received: by 2002:a92:2515:: with SMTP id l21mr6915134ill.64.1592382766935; 
 Wed, 17 Jun 2020 01:32:46 -0700 (PDT)
MIME-Version: 1.0
References: <1592249458.376720421@webmail.emailsrvr.com>
In-Reply-To: <1592249458.376720421@webmail.emailsrvr.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 17 Jun 2020 02:32:36 -0600
X-Gmail-Original-Message-ID: <CAHmME9oz5tt9u5S3V6JikvB3oGihXR5rcZTLvcjxNu4qnvWCOw@mail.gmail.com>
Message-ID: <CAHmME9oz5tt9u5S3V6JikvB3oGihXR5rcZTLvcjxNu4qnvWCOw@mail.gmail.com>
Subject: Re: Kernel Panic after updating Kernel
To: "dxiri@xirihosting.com" <dxiri@xirihosting.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 ElRepo <contact@elrepo.org>
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

Hi Diego,

On Wed, Jun 17, 2020 at 2:01 AM dxiri@xirihosting.com
<dxiri@xirihosting.com> wrote:
>
> Posted this on IRC but got no response, probably this will be a better place:
>
> I updated my Centos7 server yesterday and wireguard is causing a kernel panic, wanted to know if this is a known issue?
>
> Using kernel 3.10.0-1127.10.1.el7.x86_64
>
> I Tried with 2 different repos (elrepo and Copr repo for wireguard owned by jdoss) and I have the same issue.
>
> I took a screenshot of The kernel panic and uploaded at https://imgur.com/a/Ojxeor0
>
> Another interesting bit of info is that as long as I don't move traffic trough wg0 vnic, no panic happens. I can easily trigger the panic by just doing a ping to the other VPN endpoint and I am able to reproduce this every single time.
>
> # lsmod | grep -i wire
> wireguard             200896  0
> ip6_udp_tunnel         12755  1 wireguard
> udp_tunnel             14423  1 wireguard
>
> Thanks for the help!
> Diego

Huh, that's funny -- I'm unable to reproduce the bug at all.

Does running this script crash for you?
https://salsa.debian.org/debian/wireguard-linux-compat/-/raw/debian/master/debian/tests/netns-mini

If not, could you describe your setup more and maybe some repro steps for me?

Thanks,
Jason
