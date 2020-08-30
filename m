Return-Path: <SRS0=dNI2=CI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC00EC433E6
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 30 Aug 2020 10:35:12 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B64C207BB
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 30 Aug 2020 10:35:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bukn-net.20150623.gappssmtp.com header.i=@bukn-net.20150623.gappssmtp.com header.b="fi2Jcjis"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B64C207BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bukn.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 102d3635;
	Sun, 30 Aug 2020 10:07:02 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9095b148
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 30 Aug 2020 10:06:59 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id a65so2836856wme.5
 for <wireguard@lists.zx2c4.com>; Sun, 30 Aug 2020 03:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bukn-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=Bp4vgz8NRhy2vxzSf/aPP//oOXt0QAfVCuXXfIucjbo=;
 b=fi2Jcjis/N4jmvWsUKhBmY0bulBBOE+RYkCVm4/n4/Br7ePHuVCKP97ISXubMDJ2vV
 Dmyo++w1uCr5KqUxNDoW65PwAAnpp1sx/pelt7fXmNZwGzquTzGxABLxnEuYhTeDf5ij
 A19zrCRoQueFxY08WCP8eBpj+0liHRz/csrfNll3hX+W5wrEEyORzqf82Sq5ApjJCsfL
 Bs2wpgechruyQzIl6QMtEvAy9qtOAqqvFhAEPjpNLcZvz9cO7FBjbcr4sQ6IGYtcasDq
 tTdPEDdIpatN5TqKIXFS0qlZwiUoIN2u9s1ouXeBJXxEGlsxza6q7AWcMihBxJhkOHff
 vRCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
 :message-id:mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=Bp4vgz8NRhy2vxzSf/aPP//oOXt0QAfVCuXXfIucjbo=;
 b=FnpheBHLF9PFAXZTtvn+L+VDQa6vPkt9z+k3VwFaR38hlBR7Be9BfyK/r7GR/wtU14
 KtjXzUTIK2L9Axh6RbWb5KCl/hAMszxjjEU0armRG2aDkgt9YeBvDbE8RsXI2JN42zfX
 ZI/CvqDS4aiV68mO49pAV2IcKTcOjdP/O1OyDuurXdRIxomtSmatWA9vZ7LJQiUNdj3J
 E94mA51ggeuwt7KQ/O5sKXrvbyLqZJjpPCZ/hXLjbckFKSUBSqL0NSNx0kavjgthl5QX
 TwOdwKJMDiTu+w8uTSypRJDhfBZnSRhFDuy+Mr/4hGDfNQKlVdUVfVaV3x70xh1tmxMx
 lABQ==
X-Gm-Message-State: AOAM531SfF43JW9Bk1960wFGDOalPeIlc2VNGAVMDsxYMoK/fIVbTjv0
 BJajG50b/sv1EVijV1vNk9r+zKhJcUKVuPS6
X-Google-Smtp-Source: ABdhPJzyDZiarbLVMJ7qSzV2H3hfrGTjejEmwFVEpiUVzRMNEuirY2DoY1WpWZoAEj/+zYO2JGl67Q==
X-Received: by 2002:a7b:c35a:: with SMTP id l26mr6641392wmj.42.1598783680212; 
 Sun, 30 Aug 2020 03:34:40 -0700 (PDT)
Received: from XPS13 ([2a02:8011:8003:20:a181:63e5:bafc:6a04])
 by smtp.gmail.com with ESMTPSA id h6sm7049072wrv.40.2020.08.30.03.34.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 30 Aug 2020 03:34:39 -0700 (PDT)
From: "Aaron Bolton" <aaron@bukn.net>
To: "'Eric Light'" <eric@ericlight.com>
Cc: <wireguard@lists.zx2c4.com>
References: <f4484f4c-d744-48ad-b78f-c6005936d60e@www.fastmail.com>
 <CA+oXxS0r9iMFC32SHweKEiersLVxNQrxopQs+EEsomwGyNGZgw@mail.gmail.com>
 <f6af6006-10fa-40bf-a7b2-bd01b323e85d@www.fastmail.com>
 <001b01d67eb3$a7d0e7e0$f772b7a0$@bukn.net>
 <1a76542e-9c69-4b3b-a006-89d53bd9282c@www.fastmail.com>
In-Reply-To: <1a76542e-9c69-4b3b-a006-89d53bd9282c@www.fastmail.com>
Subject: RE: AllowedIPs
Date: Sun, 30 Aug 2020 11:34:38 +0100
Message-ID: <002e01d67eb9$2a1950c0$7e4bf240$@bukn.net>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJ7vW28p4j4q45lsb61vzRo9yZBugIX7ScfAYzPNVIAwI17VgGvD4ayp9VUipA=
Content-Language: en-gb
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

Perfect :) thanks I didn't realise it was just a bash file=20

-----Original Message-----
From: Eric Light <eric@ericlight.com>=20
Sent: 30 August 2020 11:04
To: Aaron Bolton <aaron@bukn.net>
Cc: wireguard@lists.zx2c4.com
Subject: Re: AllowedIPs

Probably worth having a poke around the source code for wg-quick; it's =
just bash, and it can really show you what's happening far better than I =
can! :)=20

If you have a look at the "up" and "down" commands in there, you should =
learn everything you need to know.=20

E

--------------------------------------------
Q: Why is this email five sentences or less?
A: http://five.sentenc.es

On Sun, 30 Aug 2020, at 21:55, Aaron Bolton wrote:
> What would be best way to bring up and down the wireguard interface=20
> without using wg-quick
>=20
> -----Original Message-----
> From: Eric Light <eric@ericlight.com>
> Sent: 30 August 2020 10:01
> To: Aaron Bolton <aaron@bukn.net>
> Cc: wireguard@lists.zx2c4.com
> Subject: Re: AllowedIPs
>=20
> Ah yep, I haven't done that before, but Quagga has made many=20
> appearance on this list... And you're right, that's pretty much the=20
> time when folks stop working with wg-quick!  :-D
>=20
> Good luck!
>=20
> E
>=20
> --------------------------------------------
> Q: Why is this email five sentences or less?
> A: http://five.sentenc.es
>=20
> On Sun, 30 Aug 2020, at 20:56, Aaron Bolton wrote:
> > Yes, this does thanks
> >=20
> > I plan on using Quagga for BGP over WireGuard tunnels so I guess I=20
> > need to avoid wg-quick if that makes changes to the routing table=20
> > and firewall as I want to manage those my self
> >=20
> > > On 30 Aug 2020, at 00:16, Eric Light <eric@ericlight.com> wrote:
> > >
> > > =EF=BB=BFI believe it's both, in a way.
> > >
> > > As far as wg is concerned, the AllowedIPs is effectively an ACL. =20
> > > Any traffic hitting your wireguard interface from an IP not within =

> > > the AllowedIPs will either be dropped on decryption, or won't even =

> > > be decrypted.  (It's one of these, but I can't remember which)
> > >
> > > On top of that, wg-quick interprets the AllowedIPs string and does =
other things, such as adding appropriate network routing (the second =
part of your guess), as well as modifying any client firewall rules to =
permit the traffic.
> > >
> > > Hope this helps  :)
> > >
> > > E
> > >
> > > --------------------------------------------
> > > Q: Why is this email five sentences or less?
> > > A: http://five.sentenc.es
> > >
> > >> On Sun, 30 Aug 2020, at 04:07, Aaron Bolton wrote:
> > >> I=E2=80=99m trying to understand AllowedIPs better is it =
effectively a=20
> > >> ACL that day what is allowed down the tunnel or is it mechanism=20
> > >> to configure what addresses get routed down the tunnel?
> > >>
> > >> Thanks in advance
> > >>
> >
>=20
>

