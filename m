Return-Path: <SRS0=kUA2=O2=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D1BAC43387
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 Dec 2018 08:00:02 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25639217F4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 Dec 2018 08:00:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=diyism.com header.i=@diyism.com header.b="Re6jSkAi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25639217F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=diyism.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id baf88c35;
	Mon, 17 Dec 2018 07:59:27 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 242a337f
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Dec 2018 07:59:24 +0000 (UTC)
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com
 [IPv6:2607:f8b0:4864:20::a30])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 33121450
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Dec 2018 07:59:24 +0000 (UTC)
Received: by mail-vk1-xa30.google.com with SMTP id d201so2643480vka.0
 for <wireguard@lists.zx2c4.com>; Sun, 16 Dec 2018 23:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=diyism.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ESS1f08gcJ6jLzK0r0SYhbJERttA5zx6aVmJBn4cI2A=;
 b=Re6jSkAik3mR6pwNbfXTPcKgDuMy3Xi5VpP+bL1h+ShdrUjvYvB+nUaZa/bxxhLA42
 0uyunZkmQU+L5wHHYjUXQCP6g7ONLBo3xqCLWyK5OZzf9gJd4vmgtLTbSGar+TU1ExOf
 487eYG30TQF4GtkyTqDwMdt/wihHpSo2aL0S4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ESS1f08gcJ6jLzK0r0SYhbJERttA5zx6aVmJBn4cI2A=;
 b=GINkx9SrGuauYwYFyz+5gO774pLJnCwc9rRern78oqm5lfIqzqacfuO+ECxsD/ff9h
 tWH5AftBhdx4eXGjrW/MPDDwF6wRkZ2o4Q1Gb1koy/zIuh/sSheLyrsYVyOd/IHj80gq
 8vHRy6E4VWPgL3QHB2ZSm9vvvs2AkDWWcLoFS7N95WbE4mw5+NYUPPDmfu7DYkLCgqLC
 oiXxo1yd+mhrp1pAvyEO7p6cxh3INtMcbM2+MU2LC1LP6Mp+V3SMZihwbPF9gMdtynHM
 +SMuJKLEWcoRdVC+G7/eXjKo2PRzLxlUSDMFnNiTGhTXiOISALRhidDoMcfRIQy40FGg
 qx6w==
X-Gm-Message-State: AA+aEWZ509LLY2cd15eRTz9Uo7kVgDZmvP++Z9GC5W6Sb3A2RGZgUgAA
 8jo0+czylVFZ3byPVCtdB/bL49kdkwGA80jtRsxXSo/0XdiOFGKP
X-Google-Smtp-Source: AFSGD/U6lWbASvkU2t/lI7SA3qk7Z2W1P+ZOYsuwZAZIvSSrBd7To0auuMzMV6K15idEvfQTVsCcwh4nPI5PiVBzrd0=
X-Received: by 2002:a1f:2c45:: with SMTP id s66mr5334646vks.56.1545033582045; 
 Sun, 16 Dec 2018 23:59:42 -0800 (PST)
MIME-Version: 1.0
References: <CAKVinOVZ1nVJh8LvqGme5C27+R=AFBOxPKS22ckO7TEHsbc4-A@mail.gmail.com>
 <20181217074423.GA18720@arch01.localdomain>
In-Reply-To: <20181217074423.GA18720@arch01.localdomain>
From: "KeXianbin(http://diyism.com)" <kexianbin@diyism.com>
Date: Mon, 17 Dec 2018 16:00:03 +0800
Message-ID: <CAKVinOUWGcECFVE23CTN77tQF1oJD59USSNKryAs6CnNY_zi+w@mail.gmail.com>
Subject: Re: [Question or Feature Request] Any wg1.conf option to limit peer
 IP as 1-to-1?
To: weiti@weiti.org
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

>>>> Is there a reason for the /24 routing?
For example,
i want to enable the peers 10.1.0.3 and 10.1.0.4  to connect
10.1.0.1(my machine),
but i want to refuse 10.1.0.3 to pretend to be 10.1.0.4 while the real
10.1.0.4 is offline occasionally

On Mon, Dec 17, 2018 at 3:50 PM Tim Weippert <weiti@weiti.org> wrote:
>
> Hi,
>
> On Mon, Dec 17, 2018 at 09:42:17AM +0800, KeXianbin(http://diyism.com) wrote:
> > For example, my wg1.conf now:
> >
> > [Interface]
> > PrivateKey = uMoD1TRi+tRkEVF/B5VrXQwHMN3xC1eLVXNbLkkkkkk=
> > Address = 10.1.0.1/32
> > ListenPort = 21404
> > MTU=1300
> > PostUp = ip route add 10.1.0.0/24 dev wg1
> > PostDown = ip route del 10.1.0.0/24
>
> Why you add a routing to a /24 if you only want 1:1 links?
> I think with this entry the routing decision isn't made by
> wireguards "AllowedIPs" statement, it is accomplished by normal
> routing lookups and get send through the tunnel.
>
> Is there a reason for the /24 routing?
>
> > [Peer]
> > PublicKey = Zd5jssxd4zj/4d6ZpOtClyD/8V2eGR7jpHM3jpppppp=
> > EndPoint = 162.243.2.2:21403
> > AllowedIPs = 10.1.0.3/32
>
> This should normally do what you expected, but i think as stated above
> the /24 routing is "disabling" the correct behaviour.
>
> regards,
> tim
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
