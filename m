Return-Path: <SRS0=x2E1=EQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72971C388F7
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2020 22:25:25 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EB29206B2
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2020 22:25:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=tomcsanyi-net.20150623.gappssmtp.com header.i=@tomcsanyi-net.20150623.gappssmtp.com header.b="jXS8zAPy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EB29206B2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tomcsanyi.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 45cbcfa1;
	Tue, 10 Nov 2020 22:21:22 +0000 (UTC)
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2d1bd19b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Nov 2020 22:21:19 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id e18so151227edy.6
 for <wireguard@lists.zx2c4.com>; Tue, 10 Nov 2020 14:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomcsanyi-net.20150623.gappssmtp.com; s=20150623;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=e2yTBnsSIYWzU1HICm0+kULSbhQ4+2b63qD/8EL4Q/M=;
 b=jXS8zAPyOY1MdMQ/Ph35baAOuTQP0LdLviItuoXRnnxvuMcnRh6UwjzcX82e6S15Wv
 oxlWUXKeeCZpH5jIMgB1G3mK7iXrrIXZEMTz9sOOj0bbOjZE20BSJMXHnqwfmo16Hbgq
 wvPi/ue0QqCqsN59exSLu9rCMS9nc4WK2g+ERAlV1oopoGTrW7kU6s3bzCZUjKJ+QaKj
 t4VPokcE0V/rqPyxJQSduCV1ITS/3TrKMW4zWNxUyYTfr/yoOLSBvjaEoFOhmroiyjod
 Gt5sYE3MS/W5sYRJfMIzh7fZ3kT9LaMthJxPKlH6n4U/Ww4lvmQM8nKCYVSciiQgKYt0
 KaJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=e2yTBnsSIYWzU1HICm0+kULSbhQ4+2b63qD/8EL4Q/M=;
 b=kgPyU0FcTZanieQ1KuDMdsb5u1xxWZe5qYI16Bd96qXxv4n1TQpWVjjt0SqglO24jP
 2jDjyQyTdHrXmjySbZdT1XfGKwviuy29BXBrH1dkNaqky8c+hONKnPPgOHh6+wgRzniq
 CpkTkwGuSpHkCokvASSTDQ9YsUYYW+wPgjApqzTvPKjwpus4em9GIauAGpiAkIXcSMKW
 1FmD5T4ld+aQqW/JMnCDOekRHc1m9v2Ft02f6TOOMY23AmtRQwSA5lzNtxedWaIifeM4
 pBfcZ0UE+t2cJHQ271nq8fHCUEtZEK47QQPA16k/7aB2e5mcp7hUHkRaWa3qnj6gbl0r
 xGvQ==
X-Gm-Message-State: AOAM533OP+1+vw1RYfD0wjzf8yoHsTg97MsX5XuB88wGXRQKMRpW4jvd
 /49Av9uXsgPq+W+AQ3qhLicw9w==
X-Google-Smtp-Source: ABdhPJwvfnV89PAx/0+c2JlT0FDDBUhRkPp6R3ghgkiGs3f5dfFVUzXOp69CXQ2XhNg0qGNFzVrE+Q==
X-Received: by 2002:a05:6402:1214:: with SMTP id
 c20mr22799645edw.182.1605047102809; 
 Tue, 10 Nov 2020 14:25:02 -0800 (PST)
Received: from [192.168.0.103] (85-238-77-56.pool.digikabel.hu. [85.238.77.56])
 by smtp.gmail.com with ESMTPSA id cz14sm18430edb.46.2020.11.10.14.25.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2020 14:25:01 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: "Tomcsanyi, Domonkos" <domi@tomcsanyi.net>
Mime-Version: 1.0 (1.0)
Subject: Re: Add local DNS forwarder to Windows client
Date: Tue, 10 Nov 2020 23:24:59 +0100
Message-Id: <9BA0D0C9-0443-41C8-82B3-8D414ADDB672@tomcsanyi.net>
References: <CADJb3qTGhm8a=aAA8_6ZgEHHFyBZyOch_GRBkC1p4yym28fN-Q@mail.gmail.com>
Cc: wireguard@lists.zx2c4.com
In-Reply-To: <CADJb3qTGhm8a=aAA8_6ZgEHHFyBZyOch_GRBkC1p4yym28fN-Q@mail.gmail.com>
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

Thanks for your reply. Let me answer each point inline:


> It's not quite that simple. I'll have to find a DNS proxy that does
> what is required to make this scenario work. There is no
> hostname/domain pattern because all hosts on a LAN have no dot in
> them, just names alone. And nobody knows what names are valid in a
> certain network, so all have to be tried.

Sorry to be the critical guy here, but this is not really a well built netwo=
rk. It introduces unnecessary traffic by running queries everywhere and also=
 using hostnames without a tld. However, this is just a sidenote, so again a=
pologies.

> Only one of them should
> resolve for a local name. All of them might resolve for global names.
> If all are equal, that's fine. If not, we have a problem anyway.
>=20
> But which DNS servers to query depends on what VPN connections are
> active. Only the WG client knows that because it's managing the
> connections/tunnels. A separate DNS proxy would need to query the WG
> state and also know what DNS servers can be found in each tunnel. This
> would best be configured in the tunnel configuration. Anything else
> makes it complicated and error-prone.

Okay, I could understand this fully. Hence I am proposing using a DNS server=
 setting per tunnel. You could point to multiple localhost addresses differe=
nt tunnels (e.g. Tunnel1 DNS 127.0.0.1, Tunnel2 DNS 127.0.0.2) and configure=
 your forwarder accordingly.

> I really can't imagine why DNS resolution should be very specific.
> Nobody uses DNS in local networks?

We are, certainly. However we use it the way it was designed, with TLDs like=
 .local or similar making it less like your setup which just feels like a bl=
own up NetBIOS.

> Do you access all your LAN machines
> by their IP address? If not, why would you want to do it over a VPN?
> This is basically what you're suggesting.

I must mention that besides regular DNS there are a ton of ways to deal with=
 this both on Linux and Windows. Examples include adding hosts with static I=
Ps to your hosts file, or if you just want to SSH to them using a custom SSH=
 client config with Host/Alias settings could do the job as well. Naturally t=
hese are inferior to a well set up DNS server, however they are robust and d=
oing their job fine in many scenarios.

> Imagine you have tunnels to two separate local networks active. How
> would you set things up, on Windows or Linux, to resolve local host
> names from both remote LANs as well as the internet in your default
> browser? Internet names should prefer the local DNS resolver, not go
> through any potentially slow VPN.

Here is my proposal: if you have those tunnels running simultenously you mus=
t specify two upstream servers in your local DNS forwarder as well as defini=
ng a regular Internet DNS, e.g. 8.8.8.8 or whatever. Then you need to specif=
y that if the domain to be looked up contains a dot then query the Internet D=
NS, otherwise query both local upstreams.
In case you have only one active tunnel at a time it becomes easier in a way=
 that you could dynamically switch between two configs in sync with changing=
 tunnels as described above.
=46rom the top of my head I cannot name a suitable software for this, but it=
 should be possible to configure this in most resolvers I think.
Me personally as a Python developer would naturally create a quick script in=
 case nothing off the shelf works, since it is not a very complex problem im=
ho.

Cheers,
Domi

>=20
> -Yves
>=20
>> Am Di., 10. Nov. 2020 um 09:14 Uhr schrieb Tomcsanyi, Domonkos
>> <domi@tomcsanyi.net>:
>>=20
>> Hello Yves,
>>=20
>> I am by no means a person with authority to make such a decision, but you=
r usecase seems to be so specific I would not imagine it would make sense to=
 blow up the size and complexity of the Windows wg with a local DNS forwarde=
r.
>> I think it is way better if people just install a local DNS resolver/forw=
arder on their own. There a ton of choices available, from simply python scr=
ipts to large scale servers. You could easily configure any of these to dist=
inguish which DNS server to ask based on the TLD portion of your local domai=
n or whatever other distinguisher you have.
>> Then the only thing you need to do is tell your system (either via wg or b=
y other means) to use the local resolver and the case is solved :).
>> Also I am pretty sure one of the main philosophies behind wg is to be the=
 same as much as possible on all platforms. Adding a DNS resolver would agai=
n mean a lot of complications when compared to e.g. the Linux version, since=
 most Linux distributions already feature some kind of a local resolver by d=
efault.
>>=20
>> Cheers,
>> Domi
>>=20
>>=20
>>> 09.11.2020 d=C3=A1tummal, 23:46 id=C5=91pontban Yves Goergen <yves.goerg=
en@gmail.com> =C3=ADrta:
>>>=20
>>> =EF=BB=BFHello,
>>>=20
>>> I've already used WireGuard to connect to private networks and it's
>>> quite easy once you figure out how to set it up. (Most tutorials are
>>> outdated and haven't been updated, new ones haven't been written.) One
>>> thing that's really missing however is DNS support. All I can do now
>>> is connect to IP addresses. Names are not resolvable on the other
>>> side. If I add the "DNS" directive to my client configuration, it
>>> replaces the local DNS resolver and *all* lookups go to that server
>>> instead. This isn't working either because I'm on two local networks
>>> and each has its own local DNS server that can only resolve its own
>>> local names (and forward the rest to the internet).
>>>=20
>>> Specifying both networks' DNS servers also fails because when
>>> resolving a name, one of them is chosen at random (and the other one
>>> isn't regarded) and then you won't be able to resolve some of the
>>> names some of the time. This is also very frustrating. And it wouldn't
>>> scale to multiple active tunnels.
>>>=20
>>> The solution I've read about is to set up a local DNS forwarder that
>>> can be configured so that it uses multiple servers and queries each of
>>> them and returns only a positive response. This way it could query
>>> both local LAN DNS servers and for local names, only one of them would
>>> resolve the name. This is a bit complicated to do if you're not
>>> permanently connected to a VPN, or if you move from one local DHCP
>>> network to another (like with a laptop). And it requires additional
>>> software, setup and configuration, and probably intensive maintenance
>>> and care. All of this makes WireGuard a pretty ugly alternative to
>>> OpenVPN where all of this already works. Despite all the disadvantages
>>> of OpenVPN.
>>>=20
>>> I'm asking if it's possible to integrate such a local DNS forwarder
>>> into the Windows client application. I imagine it would start up
>>> automatically once the first tunnel is activated. And it would replace
>>> the local system's DNS server setting for as long as it's active (like
>>> the tunnel-configured DNS server already does). And it would query the
>>> original locally configured DNS server and all configured DNS servers
>>> for the active tunnels. It would then be able to resolve local names
>>> and tunnel-remote names without any additional work on the user end.
>>> The user wouldn't have to perform many complex tasks upon activating
>>> or deactivating a tunnel. This would make WireGuard be as simple and
>>> productive as I believe it was intended to be (but isn't yet).
>>>=20
>>> This probably stops working as soon as other VPN software is used in
>>> parallel, but the current "DNS" setting has the same limitation, it's
>>> better than nothing and most of the time, you only run a single VPN
>>> software.
>>>=20
>>> Please let me know what you think of it.
>>>=20
>>> -Yves
