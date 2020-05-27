Return-Path: <SRS0=KoV/=7J=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 208FEC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 May 2020 19:42:30 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F88E2088E
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 May 2020 19:42:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tipkowMW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F88E2088E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a7164c16;
	Wed, 27 May 2020 19:26:46 +0000 (UTC)
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [2607:f8b0:4864:20::d34])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ccd36a55
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 May 2020 19:26:44 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id f3so27469437ioj.1
 for <wireguard@lists.zx2c4.com>; Wed, 27 May 2020 12:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ljb5VrKknKs+AlM/eMMAd0+s2kT+REk47978t0/7JyI=;
 b=tipkowMWpi4SKoXKHJ/BCGRAz8RSEcUrXRrm5TMHP/eRmLkbeFsGpXcRgvqynDVjMt
 7pl9hXzoGQ4SgIJQMnbFn/cUxYy0kDVnKRwWVJxTO1bwajK5JEE12RckbkUaeOonKklD
 faEuYrpn1f1X5kqtYb0Mh+38sOi+ZaCPIddfKBabaOoJOn8cLn0/iyVSc65MqTmvbD18
 oxSDCMmG1NCFgJWWwkyqc8F0pflunZVkZjQ6lGf/xoLedKDYNEVQHmad2ii/tVrsQInp
 5QQl0a5bR18iaacIRSVsSSO10wdw9nwdLxMUkMVxdeJZJXnif6c/SLfFHxBIbrJizqNo
 TLhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ljb5VrKknKs+AlM/eMMAd0+s2kT+REk47978t0/7JyI=;
 b=BGWFcBFr94XLgt17SjS9wbWYwcGOBMnQKiOr8icTqYs0jAOeBZH3e/Z5RjWBL6SRPJ
 0KCBVMOxfvtHkqIMksvcjgZYR1MpRMlO4SK4tzcOHfqmGNLnQ+MCutEQzizlKf+0csIK
 V8d49qE5FkunkMZeJKH1vIBbdD80zjN0qY8TZ76b7nV4PBPNKeDfcDIFz6g/THNKWZif
 LPK9SJyqOUvnjh3Q4fo02IXMwWKjuUQ2aSxeCZGQbORvaq80UYr0LFeXe+XNYUtXk17B
 1rt98oj48yRu1alkRf/jyRIXsiiw+QPJwkzU2qAWv7YPKZxN7YLUxHMagkPExKrWrFdo
 pYAQ==
X-Gm-Message-State: AOAM533II60QBoWDF+ALKsSih5ihl+5QPFA7hN9cFIdFZ36Sx0Ma3ihM
 wgglRwWpa91Rz5Km6Z3//M1gJ9Kb4law3+omGy0=
X-Google-Smtp-Source: ABdhPJyX8JpGdf5t50Uydff7FwTEnzXnEx286GawfK+8PoNpvathovVIZ7t7S7zar8kQx5MUKJpdWXj/lT2SVKq4LcU=
X-Received: by 2002:a5d:88c5:: with SMTP id i5mr22189616iol.137.1590608529071; 
 Wed, 27 May 2020 12:42:09 -0700 (PDT)
MIME-Version: 1.0
References: <CADdae-huQZkB2yZ1mD8vTt=0K8X81K3A3LYuCnKbF=GQ3x50xg@mail.gmail.com>
 <f1d8a68465306d9f3def763eb7460701896acbda.camel@gmail.com>
In-Reply-To: <f1d8a68465306d9f3def763eb7460701896acbda.camel@gmail.com>
From: nicolas prochazka <prochazka.nicolas@gmail.com>
Date: Wed, 27 May 2020 21:41:53 +0200
Message-ID: <CADdae-jU9+2EWte0n0tBBZLkBVkxQhfqM0zu0ffbf5zxwqEbHw@mail.gmail.com>
Subject: Re: Question about origin of packet relative to peer
To: Arti Zirk <arti.zirk@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Yes, I can mark the  wireguard packet  allowedips but i cannot attach
to the associated peer.In my configuration, ip from wireguard (
alllowedip) can come from different peer ( because i'm using different
mask for allowedips and multiple tunnel).
My issue is that a packet can be used by a peer and come back by an
other one ( the packet is routing by allowed-ips, not by it's peer
entry

Example :

On server side S1
Peer A (client peer)
allowedips 192.168.1.0/24

Peer B  ( an other "wireguard server"  S2  )
allowedIps 192.168.1.100/32

On client Side, allowedIp is set on s2 and if s2 down , set to s1
peer s1 =3D=3D> server S1
peer s2 =3D=3D> server S2 =3D=3D> server S1

Of course it does not work, packet routing does not work
client =3D=3D> S2 =3D=3D>  S1 (peer A)  =3D=3D>  then response route to pee=
r (B)

Regards,
Nicolas




Le mer. 27 mai 2020 =C3=A0 13:46, Arti Zirk <arti.zirk@gmail.com> a =C3=A9c=
rit :
>
> On K, 2020-05-27 at 11:01 +0200, nicolas prochazka wrote:
> > How can i know that a packet come from peer X ?
> You can check which peers allowed ips list covers the received packets
> source ip
>
> > Is is possible to mark packet not a level interface (wg0) but at peer
> > level ?
> Its probably possible to generate iptables rules from peer allowed ips
> list that marks packets with different ids
>
