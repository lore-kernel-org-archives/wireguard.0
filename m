Return-Path: <SRS0=x2E1=EQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F63DC388F7
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2020 08:14:39 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51C7B20829
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2020 08:14:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=tomcsanyi-net.20150623.gappssmtp.com header.i=@tomcsanyi-net.20150623.gappssmtp.com header.b="KxK1GLPD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51C7B20829
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tomcsanyi.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 67bde011;
	Tue, 10 Nov 2020 08:10:56 +0000 (UTC)
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c72c5e70
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Nov 2020 08:10:53 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id ay21so11681198edb.2
 for <wireguard@lists.zx2c4.com>; Tue, 10 Nov 2020 00:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomcsanyi-net.20150623.gappssmtp.com; s=20150623;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=AS5Hz3gokZ0GSx9/NsiVi41fovIDbh4uVOhYw4VBMVc=;
 b=KxK1GLPDjT/nvWnsw7hc0NtxCu6Lni060vwlFg7o+ycWNl8gVTZqpTWdC3yTXFLQEb
 1wl6yMyH7pvOZLopBQji2NbBt6JGmlJk2wU8KastXzqPvXm6QwPQMWlwI6wtEnwm/ozl
 FRdRIxihhAKOMKmgMgrcz7YpHY1OSs2riDhQtLvlXC8HJIrl66reD7539UDbxj4OFcs9
 5AWhnGIypbahRwasd+QColaRsWIrdpg8GoJJbdD/aZS9JYL4IPjNJhWrDKWAfqr4oxA7
 qHJ/2yo5pm18HA69NmQjxRuLXUo+s0aYKFTROdTIGoNFwpFrxeFEcgXXkOHdjsRynPst
 VLLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=AS5Hz3gokZ0GSx9/NsiVi41fovIDbh4uVOhYw4VBMVc=;
 b=OUZBnFXELw/oEeWDH0NK8uBLB9y18aAqDpa0uS5VLHCvjN/D0PLyPfim5LbrEQJ0MI
 8SS9nzk3ML3Wv+FNYRH9K7oU/oFASGYHzZAANSmN/CDOGd+mYuaLQ/wo4/zX1/4FPL6J
 aauNJSAeb+wfvh670SkzsdZp71zlBbgE4+yj35Bx2IwqaKPOjx0tm4cQGuhyT0Db8XIq
 gXtjeCxRCkF61z721AlTw+AFUxNIZdaUs4hyYkQb+mrPSh3L5IkwXg4uPDpT2o5gP8Tw
 8mFmCbQvgxgJxfa/WlMNrENnxgpRr5A1u8xvSjBuXRZoud6rCom2ZH4uHxK2YoPRK1Kn
 uqbw==
X-Gm-Message-State: AOAM531yEMDVwXk3oKH/HB24SLdElOAzVpa7GPX8OBaEVzStTo9nUz1f
 yIV58Pe9z856F4gIZrSsjxAN9Q==
X-Google-Smtp-Source: ABdhPJzaYv0VDEFKN1BBsoKfI5zuok/7GoPypzFcyR8Rs7UjMjbXrnVQlEmoEqc1ASuVRUmyHhAtgw==
X-Received: by 2002:a50:d942:: with SMTP id u2mr19972847edj.202.1604996072293; 
 Tue, 10 Nov 2020 00:14:32 -0800 (PST)
Received: from [192.168.0.103] (85-238-77-56.pool.digikabel.hu. [85.238.77.56])
 by smtp.gmail.com with ESMTPSA id 22sm9743909ejw.27.2020.11.10.00.14.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2020 00:14:31 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: "Tomcsanyi, Domonkos" <domi@tomcsanyi.net>
Mime-Version: 1.0 (1.0)
Subject: Re: Add local DNS forwarder to Windows client
Date: Tue, 10 Nov 2020 09:14:30 +0100
Message-Id: <A64A6CAC-E8CA-41AB-8CCD-E9E379591C91@tomcsanyi.net>
References: <CADJb3qRk2nuvQdyF1+=9yf84annmJ+nyapdokFx1o-WcVfvfKQ@mail.gmail.com>
Cc: wireguard@lists.zx2c4.com
In-Reply-To: <CADJb3qRk2nuvQdyF1+=9yf84annmJ+nyapdokFx1o-WcVfvfKQ@mail.gmail.com>
To: Yves Goergen <yves.goergen@gmail.com>
X-Mailer: iPhone Mail (18A8395)
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

Hello Yves,

I am by no means a person with authority to make such a decision, but your u=
secase seems to be so specific I would not imagine it would make sense to bl=
ow up the size and complexity of the Windows wg with a local DNS forwarder.
I think it is way better if people just install a local DNS resolver/forward=
er on their own. There a ton of choices available, from simply python script=
s to large scale servers. You could easily configure any of these to disting=
uish which DNS server to ask based on the TLD portion of your local domain o=
r whatever other distinguisher you have.
Then the only thing you need to do is tell your system (either via wg or by o=
ther means) to use the local resolver and the case is solved :).
Also I am pretty sure one of the main philosophies behind wg is to be the sa=
me as much as possible on all platforms. Adding a DNS resolver would again m=
ean a lot of complications when compared to e.g. the Linux version, since mo=
st Linux distributions already feature some kind of a local resolver by defa=
ult.

Cheers,
Domi


> 09.11.2020 d=C3=A1tummal, 23:46 id=C5=91pontban Yves Goergen <yves.goergen=
@gmail.com> =C3=ADrta:
>=20
> =EF=BB=BFHello,
>=20
> I've already used WireGuard to connect to private networks and it's
> quite easy once you figure out how to set it up. (Most tutorials are
> outdated and haven't been updated, new ones haven't been written.) One
> thing that's really missing however is DNS support. All I can do now
> is connect to IP addresses. Names are not resolvable on the other
> side. If I add the "DNS" directive to my client configuration, it
> replaces the local DNS resolver and *all* lookups go to that server
> instead. This isn't working either because I'm on two local networks
> and each has its own local DNS server that can only resolve its own
> local names (and forward the rest to the internet).
>=20
> Specifying both networks' DNS servers also fails because when
> resolving a name, one of them is chosen at random (and the other one
> isn't regarded) and then you won't be able to resolve some of the
> names some of the time. This is also very frustrating. And it wouldn't
> scale to multiple active tunnels.
>=20
> The solution I've read about is to set up a local DNS forwarder that
> can be configured so that it uses multiple servers and queries each of
> them and returns only a positive response. This way it could query
> both local LAN DNS servers and for local names, only one of them would
> resolve the name. This is a bit complicated to do if you're not
> permanently connected to a VPN, or if you move from one local DHCP
> network to another (like with a laptop). And it requires additional
> software, setup and configuration, and probably intensive maintenance
> and care. All of this makes WireGuard a pretty ugly alternative to
> OpenVPN where all of this already works. Despite all the disadvantages
> of OpenVPN.
>=20
> I'm asking if it's possible to integrate such a local DNS forwarder
> into the Windows client application. I imagine it would start up
> automatically once the first tunnel is activated. And it would replace
> the local system's DNS server setting for as long as it's active (like
> the tunnel-configured DNS server already does). And it would query the
> original locally configured DNS server and all configured DNS servers
> for the active tunnels. It would then be able to resolve local names
> and tunnel-remote names without any additional work on the user end.
> The user wouldn't have to perform many complex tasks upon activating
> or deactivating a tunnel. This would make WireGuard be as simple and
> productive as I believe it was intended to be (but isn't yet).
>=20
> This probably stops working as soon as other VPN software is used in
> parallel, but the current "DNS" setting has the same limitation, it's
> better than nothing and most of the time, you only run a single VPN
> software.
>=20
> Please let me know what you think of it.
>=20
> -Yves
