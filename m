Return-Path: <SRS0=kp4R=KN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EAA3C433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 May 2021 15:03:46 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78E796100C
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 May 2021 15:03:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78E796100C
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5ba7acb5;
	Tue, 18 May 2021 15:01:33 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 58819b82
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 May 2021 15:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1621350086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MWvsV+O9YxIikGS70BXpbUBZO8ajp6yGmf34r+AftG8=;
 b=jsuCiPauWG2uDTvFeiabfT0KI4OcDrm0cgHZFBG/ineGMdLuYeYloSgnj1Yh+JSEHZzyf+
 gwzQgYad3pkZyrM+k8NIg17XaoZB/B+OHBOQ52jWLWqehSRRcI+wor2DhXXOS7C5wT9hn4
 CrwSXpmtv7EgyfMlgPaxOe3ZNgK0cwA=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 84113f4c
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 May 2021 15:01:26 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id n83so2817460ybg.0
 for <wireguard@lists.zx2c4.com>; Tue, 18 May 2021 08:01:26 -0700 (PDT)
X-Gm-Message-State: AOAM531H8zAFk/VltIvQAHZxNfdauBkZ98w4374uIuDiqB89rGl953Nn
 tjEIbK1N6i88ISa2IEl95ckawYYq3G57wWfYk0w=
X-Google-Smtp-Source: ABdhPJw0lx84+RDhxc3XYMNpTx3zuNQ1EUEfkIp2oAYWAW6BCZfIgqEKWbOtv7TLYVyqPd7sTXFY7Ed6hi1OU4KPmw8=
X-Received: by 2002:a25:f206:: with SMTP id i6mr6574881ybe.123.1621350085765; 
 Tue, 18 May 2021 08:01:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAOYRf2F9q-yWwUjoSe01pO1TaeGcF5vGqt8unmowoRJ3iCTP6w@mail.gmail.com>
In-Reply-To: <CAOYRf2F9q-yWwUjoSe01pO1TaeGcF5vGqt8unmowoRJ3iCTP6w@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 18 May 2021 17:01:14 +0200
X-Gmail-Original-Message-ID: <CAHmME9pe2SwhDKposPkyaPSzncS_Dr0Kh2N==mt7f=Ay4zmP9A@mail.gmail.com>
Message-ID: <CAHmME9pe2SwhDKposPkyaPSzncS_Dr0Kh2N==mt7f=Ay4zmP9A@mail.gmail.com>
Subject: Re: Bug report: Policy routed packets are dropped by wireguard
To: Michael Wu <michael.apply@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>, 
 Ubuntu Kernel Team <kernel-team@lists.ubuntu.com>,
 Andy Whitcroft <apw@canonical.com>
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

Hi,

On Mon, May 17, 2021 at 5:22 PM Michael Wu <michael.apply@gmail.com> wrote:
> I'd like to confirm that the following problem seemed to be a bug, and
> not configuration error:
> https://lists.zx2c4.com/pipermail/wireguard/2019-September/004545.html
> (Content dupated at the end of this email for easier reference)
>
> On system 1 (kernel 4.15), everything worked as expected. However, on
> system 2 (kernel 5.4), the issue described above is observed.
>
> Regards,
> Michael
>
>
> [System 1]:
> Ubuntu 18.04.5 LTS
> 4.15.0-128-generic #131-Ubuntu SMP Wed Dec 9 06:57:35 UTC 2020 x86_64
> x86_64 x86_64 GNU/Linux
>
> [System 2]:
> Ubuntu 20.04.2 LTS
> 5.4.0-73-generic #82-Ubuntu SMP Wed Apr 14 17:39:42 UTC 2021 x86_64
> x86_64 x86_64 GNU/Linux
>
> [Policy routed packets are dropped by wireguard]
> Original mail: https://lists.zx2c4.com/pipermail/wireguard/2019-September/004545.html
>
> Hello!
>
> I'm looking for technical advice.
> Currently I'm trying to pass marked sessions through wireguard VPN network.
>
> Marking is done by cgroups classid matching:
> > iptables -A OUTPUT -m cgroup --cgroup 3735928559 -j MARK --set-xmark 0x1c3/0xffffffff
>
> The only route in the `vpn` table is default routing through wg0:
> > ip route add default dev wg0 table vpn
>
> Routing rule is pretty simple:
> > ip rule add fwmark 451 table vpn
>
> Now I pass some packets on the interface:
> > cgexec -g net_cls:vpn ping 10.0.1.1
>
> I see packets reaching interface but dropped in the driver:
> > tcpdump -i wg0 host 10.0.1.1
> > ...
> > 6 packets dropped by interface
>
> Value in 4th column (TX drop) is increasing in the `/proc/net/dev` for wg0.
>
> If I add route to default routing table and do ping without assigning
> cgroup to the process then all is perfectly fine.
> > ip route add 10.0.1.0/24 dev wg0
>
> > ping 10.0.1.1
> > PING 10.0.1.1 (10.0.1.1) 56(84) bytes of data.
> > 64 bytes from 10.0.1.1: icmp_seq=1 ttl=64 time=46.1 ms
>
> Is it some kind of a bug of misconfiguration?

I think I might have fixed this upstream in October:

https://git.zx2c4.com/wireguard-linux/commit/?id=46d6c5ae953cc0be38efd0e469284df7c4328cf8

I suspect that this patch needs to be in your kernel in order for the
bug to go away.

I added a "warn-only" test to the compat layer here:

https://git.zx2c4.com/wireguard-linux-compat/commit/?id=99e954f4871d9a760451c5ada99dfaae5df256e5

These are tested on all the Ubuntu kernels. Looking at those here and
ctrl+f-ing for the warning message on
https://www.wireguard.com/build-status/#data-wireguard-linux-compat we
can see which ones are still unpatched:

- 5.4.0-74.83-ubuntu-focal: good
- 5.4.0-74.83~18.04.1-ubuntu-bionic-hwe-5.4: good
- 5.3.0-74.70-ubuntu-bionic-hwe: BAD
- 4.15.0-144.148-ubuntu-bionic: good

So it looks like, of the most recent Canonical kernels, only their 5.3
is missing the patch, but their 4.15 and 5.4 trees are working fine.

So I'd assume the problem is that the 5.4 kernel you're running is old
and needs an update? Or perhaps you've unearthed a different problem?
But please make sure you're running 5.4.0-74.83 first, and then let me
know.

Thanks,
Jason
