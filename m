Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D69C5AE5C
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 19 Nov 2023 13:45:24 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 42ba1f7f;
	Sun, 19 Nov 2023 13:34:46 +0000 (UTC)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [2607:f8b0:4864:20::62e])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e2c63ac3
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 9 Nov 2023 11:57:54 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1cc29f39e7aso6148645ad.0
 for <wireguard@lists.zx2c4.com>; Thu, 09 Nov 2023 03:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qrator.net; s=google; t=1699531072; x=1700135872; darn=lists.zx2c4.com;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3XFWe9xVZ8PCMgeIg5bL5SaEMbww+NRhiqicoBtb7Eg=;
 b=iEbZIlJ5bWGOoKlJDMLwWGJmFS42grsZaaxxq9egSBvpDsL0gayxCGi+bbxwbQAL6t
 wcr/5+uLEpGyphjVfz57uNIiq6ZZRB4ayOr+m/KjOWpDY87JD4tbrk34v5XMC6/6sJX4
 3vG0AkebO3w8Id9NjQBz9dervRo/fzSCfh+vc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699531072; x=1700135872;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3XFWe9xVZ8PCMgeIg5bL5SaEMbww+NRhiqicoBtb7Eg=;
 b=Awuip6dQOg7+xuDsb6oR0LwTWgsd89002fnmxOEDF3WdqPqIcno0T+Cnek3F+4+Wat
 i9QQJxJgeh7LN0u/yGYrKVva/cbf6HMalS+rM7io1mx/esNi/97kwEqccVzPHyx6Om95
 /toz4rMH7bT2mzIoVZkOZ4VBgzoiphvnUSU938qHBiVNq+FOtMX1UiKzz/iMT7meY8nA
 Fgdx9l5dfA3/d6veBAT9l6d+WB50qTZBxCV8fDfu8T3EPJQm0GyFJF/z0yeddLOvZt91
 8vZTyUsrXFWIfPOIzHFNZfRTCr9gktNGD2obHvQYV39spISfqUYJl2LOJH7Avp14yxXt
 Wu0w==
X-Gm-Message-State: AOJu0YyW7MBM22FiOsGhvlvJAJh2/ehtCaiz73kmWvSwWDGSXpb9+0Az
 AtSIsAZnW02u6bQY6tqfk7CJQRp9WuWs3qlTVROSbQ==
X-Google-Smtp-Source: AGHT+IGaXD3+ToiWk9ts7b5FoN09XNd8EA7ylzHjddKxgUu/Uv7LYGlUAIKpYHlEMkCGmqnqjToUdQRTnkoqEZ9+GgY=
X-Received: by 2002:a17:90b:33c9:b0:281:8e9:7b86 with SMTP id
 lk9-20020a17090b33c900b0028108e97b86mr1378781pjb.23.1699531072692; Thu, 09
 Nov 2023 03:57:52 -0800 (PST)
MIME-Version: 1.0
References: <20230819140218.5algu2nfmfostngh@House.clients.dxld.at>
 <4b-64e11f80-13-5e880900@8744214>
 <20230819212357.lkshcpslkgbeaq4e@House.clients.dxld.at>
 <CAJU8_nVR_ohTetKzHoxFH=dYccQg9HdniqV+JKk4LoJGorx0ZA@mail.gmail.com>
 <20230828160705.a5uxv5l2zknna7yj@House.clients.dxld.at>
 <87v8czqd3w.wl-jch@irif.fr>
 <20230828221312.fw5pvnt4x7p2c52k@House.clients.dxld.at>
 <804a0c0a-78df-7f4c-1d0d-213e8bdb4120@nic.cz>
In-Reply-To: <804a0c0a-78df-7f4c-1d0d-213e8bdb4120@nic.cz>
From: Alexander Zubkov <green@qrator.net>
Date: Thu, 9 Nov 2023 12:57:26 +0100
Message-ID: <CABr+u0YVm+rCDybpaJQdXW4GuRbOnRgELG33pWPAgOSrwc-YbA@mail.gmail.com>
Subject: Re: [Babel-users] [RFC] Replace WireGuard AllowedIPs with IP route
 attribute
To: Maria Matejka <maria.matejka@nic.cz>
Cc: =?UTF-8?Q?Daniel_Gr=C3=B6ber?= <dxld@darkboxed.org>, 
 Juliusz Chroboczek <jch@irif.fr>, Kyle Rose <krose@krose.org>,
 bird-users@network.cz, 
 babel-users@alioth-lists.debian.net, wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sun, 19 Nov 2023 13:34:33 +0000
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

Hello all,

I heard recently about the lightweight tunnel infrastructure in Linux
kernel (ip route ... encap ...). And I think this might be helpful in
the context of this thread. Linux kernel allows already to add
encapsulation parameters to the route entry in its table. So you do
not need to create tunnel devices for that. And wireguard
encapsulation and destination might be added there too. But as I
understood the technology, it works only in one way (for outgoing
packets) and the decapsulation should be processed separately, for
example in case of VXLAN and MPLS they have their own tables.

Regards,
Alexander Zubkov
Qrator Labs


On Mon, Sep 11, 2023 at 5:46=E2=80=AFPM Maria Matejka via Bird-users
<bird-users@network.cz> wrote:
>
> Hello!
>
> On 8/29/23 00:13, Daniel Gr=C3=B6ber wrote:
>
> On Mon, Aug 28, 2023 at 07:40:51PM +0200, Juliusz Chroboczek wrote:
>
> I've read the whole discussion, and I'm still not clear what advantages
> the proposed route attribute has over having one interface per peer.  Is
> it because interfaces are expensive in the Linux kernel?  Or is there som=
e
> other reason why it is better to run all WG tunnels over a single interfa=
ce?
>
> Off the top of my head UDP port exhaustion is a scalability concern here,
>
> For enterprise setups, this very easily _can_ get a scalability concern f=
airly easily.
>
> One wg-device per-peer means we need one UDP port per-peer and since
> currently binding to a specific IP is also not supported by wg (I have a
> patch pending for this though) there's no good way to work around this.
>
> There is a theoretical frankenstein approach, running a virtual machine (=
maybe netns is enough) for each of the public IP address, and connect them =
by veth. You do not want to do this, but theoretically, it should work.
>
> Frankly having tons of interfaces is just an operational PITA in all sort=
s
> of ways. Apart from the port exhaustion having more than one wg device al=
so
> means I have to _allocate_ a new port for each node in my managment syste=
m
> somehow instead of just using a static port for the entire network. This
> gets dicy fast as I want to move in the direction of dynamic peering as i=
n
> tinc.
>
> Even with my 6 machines running in weird locations, it's a mess.
>
> All of that could be solved, but I would also like to get my wg+babel VPN
> setup deployed more widely at some point and all that friction isn't goin=
g
> to help with that so I'd rather have this supported properly.
>
> All in all, I would also like to see this setup deployed worldwide. If we=
 could somehow help on the BIRD side, please let us know.
>
> Thank you for bringing this up.
>
> --
> Maria Matejka (she/her) | BIRD Team Leader | CZ.NIC, z.s.p.o.
