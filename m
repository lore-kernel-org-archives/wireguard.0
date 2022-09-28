Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0D0FC32771
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 Sep 2022 19:46:40 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 25298dd3;
	Wed, 28 Sep 2022 19:43:32 +0000 (UTC)
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 9307fa27
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 Sep 2022 19:43:30 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id l14so29271886eja.7
 for <wireguard@lists.zx2c4.com>; Wed, 28 Sep 2022 12:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=pN9xLqcHNfRtNkkg1utUFd4864YV1PD7+tucWRqRZgU=;
 b=fvtBRPC21PX0txYMRfOqcweZs8CDmuwIvqD3uqAl3lx48hWMMwIPT/4UbaTFFl8c2i
 nSdpM8VttbxVRVT+/yTz0Q1W9jbWswR4VRRlog741lmwqeTQK9+OKP3lEmYi1VMUq/YF
 xd62NG++OAFE02R2o/FWrAu1Pq7ftqBHjRUZrI/8hI7XN49kULxEDqFHbAWyACt69k6m
 /6nYFtQikJSxo47w3RDRIIIGJ/Rwl4O/+7lr18C88rgGjVjfgVzvdoBjYMOAcMRG0a0G
 4U6UqMwuZD22SRlsAA2UVktvR0LrdVCsnB+ND+prNjFE3bwWLvmd4XapDcczmrJElmwL
 ZEwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=pN9xLqcHNfRtNkkg1utUFd4864YV1PD7+tucWRqRZgU=;
 b=PMtuaTd8u6I/7Pt0xSdkRwoiJVy5UgKVVxUvSevvbpUtFcy6fOjUDc+qiDNwVwxPzt
 CV9/dY3oDntDwOCMsQAr/TDh76q3eY1TwAkX77aZ3uL1qnlH5WAPsG0KnMdl9bbOTpHc
 76yRjnXh0jZWeljmVAj12OX5p8WpJNIlxIjN1bVmWSBKgrYNa0U6vTqkwqPzS6isuuTe
 i2vAv6n5/a/Z7SJTmbSY/YPJWAO5qy3n9UjiYJPIqEPLFb/xKBDdVoOl41PyBE4sfC25
 tQ25YkIz7K9k2ig7fbaBOeIgtEmGMXJDuU3nDJcmkR/I3853u+r+2TEgGI/6/DdFrnje
 88ng==
X-Gm-Message-State: ACrzQf2r89ZwJ3J7Qredb+huqilfPGEG+GFERIKgEljQOgfFFDH8V4E7
 NbD6ou8UUnilY8rdsCHy/j0Ifw9n9CeomD//yyw=
X-Google-Smtp-Source: AMsMyM4HOT+tVOEGcpcN0ntp7nedPNKjH8Z5X8eqfKNBajLijVuWXbX760xA8pMeJTraFPcyKdIKqukNJvp8Sdw68rs=
X-Received: by 2002:a17:907:980b:b0:783:6cf6:621c with SMTP id
 ji11-20020a170907980b00b007836cf6621cmr15636927ejc.716.1664394210585; Wed, 28
 Sep 2022 12:43:30 -0700 (PDT)
MIME-Version: 1.0
References: <561370843.2818033.1664357524603.ref@mail.yahoo.com>
 <561370843.2818033.1664357524603@mail.yahoo.com>
 <20220928192308.cmr7vzbgp3bby2al@bamsoftware.com>
In-Reply-To: <20220928192308.cmr7vzbgp3bby2al@bamsoftware.com>
From: Houman <houmie@gmail.com>
Date: Wed, 28 Sep 2022 20:42:54 +0100
Message-ID: <CABBZOsm+YVzZo_dL7AP0GhayLJWF-E8Jn3H=2Xh7d9sSpjsbgQ@mail.gmail.com>
Subject: Re: Wireguard does not work in Iran
To: David Fifield <david@bamsoftware.com>
Cc: Mehdi Haghgoo <powergame_coder2@yahoo.com>, 
 WireGuard Mailing List <wireguard@lists.zx2c4.com>
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

David,

Thanks for sharing this. That's an impressive list of ways to connect
with Wireguard that I wasn't even aware of.

With the exception of shadowsocks, would the other obfuscations that
you listed here such as "Iptables extension'' or "swgp-go"  also work
with the Wireguard iOS library? As I understand it, both the server
and client have to support it.

Many Thanks,
Houman


On Wed, 28 Sept 2022 at 20:26, David Fifield <david@bamsoftware.com> wrote:
>
> On Wed, Sep 28, 2022 at 09:32:04AM +0000, Mehdi Haghgoo wrote:
> > It seems that Wireguard does not work at all in Iran.
> > I used to use it with nmcli on Linux, but recently it just does not work, even with ADSL Internet (Mobile internet is mainly shut down).
> >
> > I suspect it is not because UDP is completely blocked, because I see some other VPNs are working with UDP. Could the co
> >
> > Are there any suggestions to make Wireguard work under recent harsh Internet crackdowns?
>
> Some people are reporting success with two-hop proxies, since not all
> networks in Iran are subject to the same blocking rules. The first hop
> is to another host in Iran that is less censored; the second hop crosses
> the border. I haven't seen a report of someone doing this with
> onobfuscated WireGuard specifically, but it may work. The second link in
> the list has a kcptun component, which is UDP.
>
> tutorial for multi-hop shadowsocks servers
> https://github.com/net4people/bbs/issues/126
>
> Tutorial: setting up a Tor bridge for Iran
> https://github.com/net4people/bbs/issues/127
>
> Two-layered access
> https://forum.torproject.net/t/two-layered-access/4783
>
> In terms of obfuscation for the WireGuard protocol, here are some
> references:
>
> Iptables WireGuard obfuscation extension
> https://lists.zx2c4.com/pipermail/wireguard/2022-September/007822.html
>
> swgp-go (userspace obfuscation proxy)
> https://lists.zx2c4.com/pipermail/wireguard/2022-June/007638.html
>
> WireGuard with obfuscation support
> https://lists.zx2c4.com/pipermail/wireguard/2021-September/007142.html
> https://github.com/net4people/bbs/issues/88
>
> WireGuard obfuscation using shadowsocks
> https://lists.zx2c4.com/pipermail/wireguard/2019-January/003809.html
