Return-Path: <SRS0=x2E1=EQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C692C388F7
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2020 10:48:12 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 407AA205CB
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2020 10:48:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P6F9/aJO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 407AA205CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5b7ee294;
	Tue, 10 Nov 2020 10:44:28 +0000 (UTC)
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f7f86964
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Nov 2020 10:44:25 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id l10so14131916lji.4
 for <wireguard@lists.zx2c4.com>; Tue, 10 Nov 2020 02:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=I9/4dohZ4XpNp1S2eKeazQ+oj98GQh2ficZYh6OT6Zc=;
 b=P6F9/aJObccD3cvBAh18cusVafzY0LH0WX/uQPfqQvnYWnklasJHBOUvVyLFPyegoy
 aPjYOJasuBR/ghbseWEYYPJtpAvgt9vyeMMwFgExFsTxDpXZLgUrIfVC9kCsOEu23qab
 HyIa5LzHmXGZnMZPOwIcKkUI8VJkE6tfxrPAMIevb+RSz/mnZQdCPQKFIrme800nisy5
 YWosoEP8EaS8DjyJoxW52hM13wKOjtmRohi4r+4KquusrCLdYBmJ8Kb8BNhtVjgssDc/
 6X7XFQY5Yp2fPduW1ZC1U4fiNtMRCKfjLmqdXBx9oRJV6uzKpHaM2gaWse1+tPGEkMO1
 +nIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=I9/4dohZ4XpNp1S2eKeazQ+oj98GQh2ficZYh6OT6Zc=;
 b=MyLSEOvegOWv6fz2+8S7Elmo1o89wqO/ev6tz78ATzETzZSwzhXbDxhvC4HBEfdZYZ
 usTuUYjyB3eFI444kiCpfJkxhUHLiYxOTwE5vyHPQVFagNMnRA+BrbMuWBMCWgoIuMtI
 0mEn7egwY3zxv9Puvm/z7S41DOCjFJXMYyE6HSrhx/rUCU2bOEd/iqUSbXinYXwBv+Fz
 qEKl15Yv+e1DQc4uwEpFa4e+BRD/EBzGTLmsLE90V96SZJMqHPgwTGR1JsP1qc7akbjT
 T9BDy/wmLATdwwHQYEPB2vrKwR8OXuZX2sSOSybGAFC5MO13qdTB+mwWDkkZPEMMGkpl
 vG/w==
X-Gm-Message-State: AOAM530kO90RJeuFjO87yATRqHMoaObmLQW+Si7w6cesZUccOEzrkr+U
 qOd1cCQZGmkFc7s73KEpHhoex+z6swswmyE0NwytDI/q
X-Google-Smtp-Source: ABdhPJyPVM9AFvajaT3UBFiwTjttBPvRK6IFIIhfL3db3sikq1N0VWS3Hh29EVQ6XO3SeIhrnbIyo6vcTprBhx3Cnpw=
X-Received: by 2002:a2e:9842:: with SMTP id e2mr31744ljj.373.1605005284417;
 Tue, 10 Nov 2020 02:48:04 -0800 (PST)
MIME-Version: 1.0
References: <CADJb3qRk2nuvQdyF1+=9yf84annmJ+nyapdokFx1o-WcVfvfKQ@mail.gmail.com>
 <A64A6CAC-E8CA-41AB-8CCD-E9E379591C91@tomcsanyi.net>
 <CADJb3qTGhm8a=aAA8_6ZgEHHFyBZyOch_GRBkC1p4yym28fN-Q@mail.gmail.com>
In-Reply-To: <CADJb3qTGhm8a=aAA8_6ZgEHHFyBZyOch_GRBkC1p4yym28fN-Q@mail.gmail.com>
From: Yves Goergen <yves.goergen@gmail.com>
Date: Tue, 10 Nov 2020 11:47:53 +0100
Message-ID: <CADJb3qSukdQkGYdbG3TvLccwZ4SxvWGO2VML7rsjDKaRD6FzaQ@mail.gmail.com>
Subject: Fwd: Add local DNS forwarder to Windows client
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Oops, Google Mail cannot reply to all including the mailing list? Why
can't we have a normal web forum here?


---------- Forwarded message ---------
Von: Yves Goergen <yves.goergen@gmail.com>
Date: Di., 10. Nov. 2020 um 11:45 Uhr
Subject: Re: Add local DNS forwarder to Windows client
To: Tomcsanyi, Domonkos <domi@tomcsanyi.net>


Hello Domi,

It's not quite that simple. I'll have to find a DNS proxy that does
what is required to make this scenario work. There is no
hostname/domain pattern because all hosts on a LAN have no dot in
them, just names alone. And nobody knows what names are valid in a
certain network, so all have to be tried. Only one of them should
resolve for a local name. All of them might resolve for global names.
If all are equal, that's fine. If not, we have a problem anyway.

But which DNS servers to query depends on what VPN connections are
active. Only the WG client knows that because it's managing the
connections/tunnels. A separate DNS proxy would need to query the WG
state and also know what DNS servers can be found in each tunnel. This
would best be configured in the tunnel configuration. Anything else
makes it complicated and error-prone.

I really can't imagine why DNS resolution should be very specific.
Nobody uses DNS in local networks? Do you access all your LAN machines
by their IP address? If not, why would you want to do it over a VPN?
This is basically what you're suggesting.

Imagine you have tunnels to two separate local networks active. How
would you set things up, on Windows or Linux, to resolve local host
names from both remote LANs as well as the internet in your default
browser? Internet names should prefer the local DNS resolver, not go
through any potentially slow VPN.

-Yves

Am Di., 10. Nov. 2020 um 09:14 Uhr schrieb Tomcsanyi, Domonkos
<domi@tomcsanyi.net>:
>
> Hello Yves,
>
> I am by no means a person with authority to make such a decision, but you=
r usecase seems to be so specific I would not imagine it would make sense t=
o blow up the size and complexity of the Windows wg with a local DNS forwar=
der.
> I think it is way better if people just install a local DNS resolver/forw=
arder on their own. There a ton of choices available, from simply python sc=
ripts to large scale servers. You could easily configure any of these to di=
stinguish which DNS server to ask based on the TLD portion of your local do=
main or whatever other distinguisher you have.
> Then the only thing you need to do is tell your system (either via wg or =
by other means) to use the local resolver and the case is solved :).
> Also I am pretty sure one of the main philosophies behind wg is to be the=
 same as much as possible on all platforms. Adding a DNS resolver would aga=
in mean a lot of complications when compared to e.g. the Linux version, sin=
ce most Linux distributions already feature some kind of a local resolver b=
y default.
>
> Cheers,
> Domi
>
>
> > 09.11.2020 d=C3=A1tummal, 23:46 id=C5=91pontban Yves Goergen <yves.goer=
gen@gmail.com> =C3=ADrta:
> >
> > =EF=BB=BFHello,
> >
> > I've already used WireGuard to connect to private networks and it's
> > quite easy once you figure out how to set it up. (Most tutorials are
> > outdated and haven't been updated, new ones haven't been written.) One
> > thing that's really missing however is DNS support. All I can do now
> > is connect to IP addresses. Names are not resolvable on the other
> > side. If I add the "DNS" directive to my client configuration, it
> > replaces the local DNS resolver and *all* lookups go to that server
> > instead. This isn't working either because I'm on two local networks
> > and each has its own local DNS server that can only resolve its own
> > local names (and forward the rest to the internet).
> >
> > Specifying both networks' DNS servers also fails because when
> > resolving a name, one of them is chosen at random (and the other one
> > isn't regarded) and then you won't be able to resolve some of the
> > names some of the time. This is also very frustrating. And it wouldn't
> > scale to multiple active tunnels.
> >
> > The solution I've read about is to set up a local DNS forwarder that
> > can be configured so that it uses multiple servers and queries each of
> > them and returns only a positive response. This way it could query
> > both local LAN DNS servers and for local names, only one of them would
> > resolve the name. This is a bit complicated to do if you're not
> > permanently connected to a VPN, or if you move from one local DHCP
> > network to another (like with a laptop). And it requires additional
> > software, setup and configuration, and probably intensive maintenance
> > and care. All of this makes WireGuard a pretty ugly alternative to
> > OpenVPN where all of this already works. Despite all the disadvantages
> > of OpenVPN.
> >
> > I'm asking if it's possible to integrate such a local DNS forwarder
> > into the Windows client application. I imagine it would start up
> > automatically once the first tunnel is activated. And it would replace
> > the local system's DNS server setting for as long as it's active (like
> > the tunnel-configured DNS server already does). And it would query the
> > original locally configured DNS server and all configured DNS servers
> > for the active tunnels. It would then be able to resolve local names
> > and tunnel-remote names without any additional work on the user end.
> > The user wouldn't have to perform many complex tasks upon activating
> > or deactivating a tunnel. This would make WireGuard be as simple and
> > productive as I believe it was intended to be (but isn't yet).
> >
> > This probably stops working as soon as other VPN software is used in
> > parallel, but the current "DNS" setting has the same limitation, it's
> > better than nothing and most of the time, you only run a single VPN
> > software.
> >
> > Please let me know what you think of it.
> >
> > -Yves
