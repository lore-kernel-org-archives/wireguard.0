Return-Path: <SRS0=x2E1=EQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 141A5C388F7
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2020 15:39:17 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 072C22068D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2020 15:39:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MHTnxqhC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 072C22068D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4442fc66;
	Tue, 10 Nov 2020 15:35:05 +0000 (UTC)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id cd67287d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Nov 2020 15:35:02 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id e27so18176085lfn.7
 for <wireguard@lists.zx2c4.com>; Tue, 10 Nov 2020 07:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8C1dIYZEJ8xiWs6uXvwXgmFmSNlC1GkzhHHvluai6NE=;
 b=MHTnxqhCJUXqdavYJd/GZ89vad89R4gsnctUHkQhPlHgYBoZNG5UnmGA9msU04fsL1
 Z3ATspe0Ib70xxLhUfqUpu6ilbx12rIBs3dyacGp/e36khudMz26J+N3p9tfCVGm63lc
 m4U6zVLB8jDN3c6KEf3LJ9lwx0QopHv9PMouztVXEAkJntfSURvcp25Bg0tEdS/Ra/NP
 2OqVU51lejM9PBd+YaIf1I/H3kyhTvAx0ktNlZXKRBZhgewkpvE9unpI9ctohULt0XRS
 E5KoVoxaHXWFTc5ZQ0+n6uDTl3Qykz4Ny0IqmdW9N5/y1RqqC46bWRAvlIhMWyi6WYPy
 CfIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8C1dIYZEJ8xiWs6uXvwXgmFmSNlC1GkzhHHvluai6NE=;
 b=McF3tGicSD2he31ZNNX5ZiKdbnVD4swJmQJtW0mh8Sm5ex4md3+EUmElqW2C9VuTb4
 7h/XWrgsrB4yYO9T8BtEZ6yInCejleQJuOF9eHekVt4a0h8qwJ1XKSIOAsDufwyiReQe
 rvzcCC7Cl68DUYnKf+7Uj6xlm8FXGp3Ivr1DiuDmOcaTPHmD6EENvmycF1Dd5hbnwaBl
 3KjESylEEo9LwhwkBQO9BCd9zUemK2MUXtFCo+qKgj+wF1SpxLVDqCWK2m26OuSpkbzw
 O3OkFejlmkBnseoTFslGgR/ca5/64MYI1zAx4ABOXsQDmmvb5RMMzqSnp/H3I/vHvZqJ
 cJGQ==
X-Gm-Message-State: AOAM533XizfqpegLmmrLcTFbpxc23OTk5TFBRDy4vEW6DKD/zIOifSD+
 OuqUpdLmb10AOOAL4cHN+u+BepJlqGnJjt9iBWI=
X-Google-Smtp-Source: ABdhPJy+oOWPxNF7vRVr4QGXFI+QYJI1ov4frGA48uuZ2qx8iGMTLAp9iWuHl35Q1TAGh4ZHmiHAJJQ31ScKcUwRLUc=
X-Received: by 2002:a19:f00b:: with SMTP id p11mr7413078lfc.585.1605022718907; 
 Tue, 10 Nov 2020 07:38:38 -0800 (PST)
MIME-Version: 1.0
References: <CADJb3qRk2nuvQdyF1+=9yf84annmJ+nyapdokFx1o-WcVfvfKQ@mail.gmail.com>
 <A64A6CAC-E8CA-41AB-8CCD-E9E379591C91@tomcsanyi.net>
 <d62f54e7-cb5f-7baf-9320-19903b7c5d51@pcfreak.de>
In-Reply-To: <d62f54e7-cb5f-7baf-9320-19903b7c5d51@pcfreak.de>
From: Yves Goergen <yves.goergen@gmail.com>
Date: Tue, 10 Nov 2020 16:38:28 +0100
Message-ID: <CADJb3qRapO=3-fuyeS6iC8EnM34TxTxpZBr1uyVhhTmfjgOmwA@mail.gmail.com>
Subject: Re: Add local DNS forwarder to Windows client
To: Der PCFreak <mailinglists@pcfreak.de>
Cc: wireguard@lists.zx2c4.com
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

I just read through the 'upstream_servers' section of the Deadwood DNS
resolver. And it doesn't seem to do what I need. I'll have to specify
a fixed DNS server for a fixed name suffix. This is not possible on
LANs where there are no suffixes, as I already described. Setting
multiple upstreams for the same '.' suffix again results in a lookup
in one of them, not both.

This is not a solution to my problem. And I still refuse to believe
that my problem is exotic. Every home LAN has this.

Am Di., 10. Nov. 2020 um 14:06 Uhr schrieb Der PCFreak
<mailinglists@pcfreak.de>:
>
> Hi,
>
> concerning local DNS forwarder.
>
> I am in an environment where I need to resolve public DNS names to local
> IPs for specific hosts and additionally public DNS for the rest.
> In Windows XP it was possible to just stop the DNS cache service and set
> 2 DNS servers and everything worked.
> Newer versions of Windows starting with Windows 7 do only connect to the
> second DNS if connecting (not querying) the first fails.
> So if your first DNS is up but has no reply for your query, Windows will
> just add that fqdn to the negative cache and no longer
> query the DNS for a specific time or until you delete the cache with
> ipconfig /flushdns.
>
> All of the above can be fixed using a local DNS forwarder.
>
> I use DeadWood on my machine for years now.
> https://maradns.samiam.org/deadwood/doc/FAQ.html
>
> I just point my DNS to 127.0.0.1 (which is the deadwood service) and
> configure Deadwood a little bit. It basically let's me
> exactly specify which hosts to resolve how and can have something
> similiar to a HOSTS entry, too.
>
> As Domi wrote I would encourage you to tryout a local DNS resolver, too.
>
> Regards
>
> Peter
>
> On 10.11.2020 09:14, Tomcsanyi, Domonkos wrote:
> > Hello Yves,
> >
> > I am by no means a person with authority to make such a decision, but y=
our usecase seems to be so specific I would not imagine it would make sense=
 to blow up the size and complexity of the Windows wg with a local DNS forw=
arder.
> > I think it is way better if people just install a local DNS resolver/fo=
rwarder on their own. There a ton of choices available, from simply python =
scripts to large scale servers. You could easily configure any of these to =
distinguish which DNS server to ask based on the TLD portion of your local =
domain or whatever other distinguisher you have.
> > Then the only thing you need to do is tell your system (either via wg o=
r by other means) to use the local resolver and the case is solved :).
> > Also I am pretty sure one of the main philosophies behind wg is to be t=
he same as much as possible on all platforms. Adding a DNS resolver would a=
gain mean a lot of complications when compared to e.g. the Linux version, s=
ince most Linux distributions already feature some kind of a local resolver=
 by default.
> >
> > Cheers,
> > Domi
> >
> >
> >> 09.11.2020 d=C3=A1tummal, 23:46 id=C5=91pontban Yves Goergen <yves.goe=
rgen@gmail.com> =C3=ADrta:
> >>
> >> =EF=BB=BFHello,
> >>
> >> I've already used WireGuard to connect to private networks and it's
> >> quite easy once you figure out how to set it up. (Most tutorials are
> >> outdated and haven't been updated, new ones haven't been written.) One
> >> thing that's really missing however is DNS support. All I can do now
> >> is connect to IP addresses. Names are not resolvable on the other
> >> side. If I add the "DNS" directive to my client configuration, it
> >> replaces the local DNS resolver and *all* lookups go to that server
> >> instead. This isn't working either because I'm on two local networks
> >> and each has its own local DNS server that can only resolve its own
> >> local names (and forward the rest to the internet).
> >>
> >> Specifying both networks' DNS servers also fails because when
> >> resolving a name, one of them is chosen at random (and the other one
> >> isn't regarded) and then you won't be able to resolve some of the
> >> names some of the time. This is also very frustrating. And it wouldn't
> >> scale to multiple active tunnels.
> >>
> >> The solution I've read about is to set up a local DNS forwarder that
> >> can be configured so that it uses multiple servers and queries each of
> >> them and returns only a positive response. This way it could query
> >> both local LAN DNS servers and for local names, only one of them would
> >> resolve the name. This is a bit complicated to do if you're not
> >> permanently connected to a VPN, or if you move from one local DHCP
> >> network to another (like with a laptop). And it requires additional
> >> software, setup and configuration, and probably intensive maintenance
> >> and care. All of this makes WireGuard a pretty ugly alternative to
> >> OpenVPN where all of this already works. Despite all the disadvantages
> >> of OpenVPN.
> >>
> >> I'm asking if it's possible to integrate such a local DNS forwarder
> >> into the Windows client application. I imagine it would start up
> >> automatically once the first tunnel is activated. And it would replace
> >> the local system's DNS server setting for as long as it's active (like
> >> the tunnel-configured DNS server already does). And it would query the
> >> original locally configured DNS server and all configured DNS servers
> >> for the active tunnels. It would then be able to resolve local names
> >> and tunnel-remote names without any additional work on the user end.
> >> The user wouldn't have to perform many complex tasks upon activating
> >> or deactivating a tunnel. This would make WireGuard be as simple and
> >> productive as I believe it was intended to be (but isn't yet).
> >>
> >> This probably stops working as soon as other VPN software is used in
> >> parallel, but the current "DNS" setting has the same limitation, it's
> >> better than nothing and most of the time, you only run a single VPN
> >> software.
> >>
> >> Please let me know what you think of it.
> >>
> >> -Yves
