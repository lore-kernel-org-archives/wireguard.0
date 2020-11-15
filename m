Return-Path: <SRS0=FGbH=EV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0EE4C55ABD
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 15 Nov 2020 21:43:32 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B083D2242E
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 15 Nov 2020 21:43:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=tomcsanyi-net.20150623.gappssmtp.com header.i=@tomcsanyi-net.20150623.gappssmtp.com header.b="o/PjDCOT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B083D2242E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tomcsanyi.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 374e4e31;
	Sun, 15 Nov 2020 21:38:55 +0000 (UTC)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 437ee773
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Nov 2020 21:38:52 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id l1so16668836wrb.9
 for <wireguard@lists.zx2c4.com>; Sun, 15 Nov 2020 13:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomcsanyi-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=XhB0hS1mOL5Hp9zalc1CGVy6kr+KAJR1yGKdImL2O9c=;
 b=o/PjDCOTdc1ZmmEjmCB6GjvUV42c53sseUnjusb8BJNwfyA0B5rmObBYx1gMV+7Qwz
 aIEMzgRPzFYu33qmPNkk6y7w8JyrCC1SQTqkDPOVZWtkTzTpoRlHcAEzkFg/4dXmMyuZ
 KBzIYdFeAFqv6vNdqB6SPOEHPkCPpkJoufI5Hvaz8J6kBrscPPP/Mivfz3MMhvoiobKT
 y1qcOwBaRXAXjTfSf4TtSlBvv1zQGXmh6vzbDb5+sGpnTvikzF3lE7oKL2H16v4FMq5S
 pFbiljYhv6Cwvcdje0mSWQDzhwKnb5SDFc1mI1Da0q/tUzUZpR6rLefU92Mm9kLqxZJe
 miFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=XhB0hS1mOL5Hp9zalc1CGVy6kr+KAJR1yGKdImL2O9c=;
 b=NMsgaZRVxcPcjIxgohUPAT8IAUySNdtuENO9q7ZHqQdRfmwrSAj/qd09AipweVeek1
 p79ZukD0js+miBVPn8WqQyHvFEk8x2/koffNtJdK01tW4tAseER3pbXNjDBnqPMP3bIj
 wrUACzJ+ib9OWIfJUb7HaC3i4HkfWgFPSmHpcHYSOpLzLEKZoXJ9l/FSvcP0jNKYOXPu
 I66hjApoqKuZg6bAu9CogkbuwafRMM6e7kZRmgihk0h3GluE9uQVbJuoMNhYg/H/D6OZ
 IUdV+thX17txseucTL9EWsckWtNqRgyS8PqlREG4lextO/pSgejqvp6v5zYrMGuIsfun
 8GMg==
X-Gm-Message-State: AOAM533luWZC5JpI3s3BIB4MMRdOowXyFW5sum3Zqh90CL4suczpXt6r
 nOpWOB2GLyqhM3YxucxbNr/axw==
X-Google-Smtp-Source: ABdhPJwOFxGXFbD3VqOcre5pFOJWRCrcUk6+lPE6Ym9sc4S2SYD+B50/SGQKqTth0raVs1HVQXvJmw==
X-Received: by 2002:adf:e541:: with SMTP id z1mr15806413wrm.389.1605476594704; 
 Sun, 15 Nov 2020 13:43:14 -0800 (PST)
Received: from 10.10.15.3 (tomcsanyi.net. [185.82.232.18])
 by smtp.gmail.com with ESMTPSA id a15sm19913059wrn.75.2020.11.15.13.43.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 15 Nov 2020 13:43:14 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.17\))
Subject: Re: Add local DNS forwarder to Windows client
From: =?utf-8?Q?=22Tomcs=C3=A1nyi=2C_Domonkos=22?= <domi@tomcsanyi.net>
In-Reply-To: <CADJb3qTCed6GvshAmqOuVV-T9Pk7g6gs=KgHPGFSP7e9J8aMig@mail.gmail.com>
Date: Sun, 15 Nov 2020 22:43:10 +0100
Cc: Lech Perczak <lech.perczak@gmail.com>,
 wireguard@lists.zx2c4.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <70447B8A-8AF7-419A-863E-BA29DAABFE53@tomcsanyi.net>
References: <CADJb3qRk2nuvQdyF1+=9yf84annmJ+nyapdokFx1o-WcVfvfKQ@mail.gmail.com>
 <A64A6CAC-E8CA-41AB-8CCD-E9E379591C91@tomcsanyi.net>
 <d62f54e7-cb5f-7baf-9320-19903b7c5d51@pcfreak.de>
 <CADJb3qRapO=3-fuyeS6iC8EnM34TxTxpZBr1uyVhhTmfjgOmwA@mail.gmail.com>
 <55dea4e3-0499-2b23-6bef-4ebd67b3d905@gmail.com>
 <CADJb3qTCed6GvshAmqOuVV-T9Pk7g6gs=KgHPGFSP7e9J8aMig@mail.gmail.com>
To: Yves Goergen <yves.goergen@gmail.com>
X-Mailer: Apple Mail (2.3445.104.17)
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

Hi Yves,

I'm still thinking you should not integrate your DNS so strong with =
Wireguard. What is the exact issue of setting the DNS parameter of each =
tunnel to localhost and running your own resolver/forwarder locally?
A quick google search shows a ton of options for such software. I really =
don't want this to feel like an advertisment, but e.g. MaraDNS (with Lua =
plugin(s) to customize things) or Technitium DNS seems to be a good =
start.
Once you have your DNS resolver set up correctly just use Wireguard to =
automatically point your machine to the local resolver if a tunnel is up =
and that's it.

Am I not seeing something obvious here?

Cheers,
Domi

> 2020. nov. 15. d=C3=A1tummal, 19:42 id=C5=91pontban Yves Goergen =
<yves.goergen@gmail.com> =C3=ADrta:
>=20
> I still cannot see how the suggested measures solve the root problem.
>=20
> I, too, think of FritzBox or Speedport or EasyBox when I think of a
> home LAN. These DSL routers are also often used in small offices. So
> for this part, small offices and private home networks use the same
> technology. Larger companies surely have more money to spend. The
> mentioned router models probably make up half of all internet users in
> Germany. Other models (like TP-Link) don't include a DNS server for
> DHCP'd local hosts and are almost unusable for home LANs. If you use a
> router of that kind you have problems before thinking of VPN.
>=20
> None of these networks offer a DNS suffix. And if they do (FritzBox),
> it's fixed to ".local". Everywhere. I tried to change it but it's not
> possible, confirmed by AVM support. Now you may want to call LANs
> managed by a FritzBox unprofessional. And to a certain point I can
> follow you. But unprofessional or not, it's the reality that a whole
> lot of people live in. Now and for the foreseeable future. I wouldn't
> want to spend extra work to set up a different custom-made router in
> all of my networks just so that the limited WireGuard capabilities
> solve my problems. Using OpenVPN is a lot easier then.
>=20
> This reality includes host names like "pc1" and "pc2" in one LAN and
> "pc3" and "pc4" in the other LAN. If I'm in one of these LANs and want
> to connect to the other, I need name resolution with both routers to
> be able to use names in the LAN I'm currently in and at the same time
> names in the LAN I'm connected to. No single existing DNS server could
> ever do that because the two routers don't know each other.
>=20
> I haven't mentioned public names yet. In this simple scenario, both
> routers could resolve internet names, but the local router is
> preferred because it's faster.
>=20
> As far as I understand things, I need this specific solution, and it's
> almost impossible to built that without tight integration with a
> WireGuard client:
>=20
> * A local DNS proxy on the tunnel client end
> * that registers itself as the new default DNS server for as long as a
> tunnel is active
> * and forwards all DNS queries to *all* of the connected tunnels' DNS
> (if specified) and also the previous system's DNS server
> * and responds with the first positive answer that comes in.
> * This proxy adapts to all active tunnels and
> * stops and unregisters when the last tunnel is closed.
>=20
> None of the suggested solutions provide these features. All of them
> assume that I have host names with a distinguishable name suffix (not
> the case, not changeable) and that I can reconfigure DNS proxy
> configuration upon activating and deactivating a tunnel (not
> practical).
>=20
> While I understand that WireGuard (the tunnel tech) is intended to be
> simple, I consider this feature necessary on a higher level for normal
> network operation. Make things as simple as possible, but no simpler!
> And in this case, it's just a client GUI that already provides several
> comfort features outside of the core tunnel scope. A DNS proxy would
> well fit in this.
>=20
> And yes, this causes more network traffic than necessary in an ideal
> world. But I'm looking for a solution in the existing world, and it's
> only DNS packets, no OS image downloads. Make it correct, and fast; in
> that order.
>=20
> -Yves

