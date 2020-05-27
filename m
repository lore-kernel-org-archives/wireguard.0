Return-Path: <SRS0=KoV/=7J=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 358FDC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 May 2020 22:12:01 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C8FE2065F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 May 2020 22:12:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C8FE2065F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kerr.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 05d02445;
	Wed, 27 May 2020 21:56:32 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 72f9209d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 May 2020 21:56:30 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id h9so10436987qtj.7
 for <wireguard@lists.zx2c4.com>; Wed, 27 May 2020 15:11:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=F3MaH1eMn6UThU9xxlpd1dSbR4jxGxxAkUf2B2UkPfc=;
 b=ILdmYcwQ0hAHuoT1LCRvAuNR9kESURnfDgiedOuNIR0EeXsWGnvMtabe/+ofQsg/6b
 PmQfboJmLS/laEaPqKrU7bBcAUTkjYoFirkvMMZmyMAQd/mRZRvMe2C/H0mr0FuLLvao
 G11CdJ4hOA67ZQhd9wJ3kAqrh+svQSu+Mwck2xqvMb0DrB68X5aa8mpM1SdHjuESUJWC
 x7CXnerPvpUHpblnlHCYhlMESONl5NnfQWN5RYtkCs41NXzk/zCfdQsPfqO5PsuoytRp
 WY+c9UmzyLvdFUAKV3+sCiW+2ucisgEnzCz5lLrQjBc8OuxUxEXHDA5TewkMKr2qVFqU
 oidw==
X-Gm-Message-State: AOAM530SwEUftCNHTtROA7AG5VqBOgqxkCh8BDrp4CLGta/7Aqf4kHn0
 71e7nIMSO27CyELl/9Eeimney2VIuUV1pNUHhRbM+GhPD4tWZg==
X-Google-Smtp-Source: ABdhPJwHHoaxOcuI7GSNf+ae4lx8SPkZ1AKZ2cywTyrv+TEdQlVgedoWDtACmytO/NwUFHFUpclUqfFQL/0w1MmQdhA=
X-Received: by 2002:ac8:5648:: with SMTP id 8mr85442qtt.280.1590617515612;
 Wed, 27 May 2020 15:11:55 -0700 (PDT)
MIME-Version: 1.0
References: <CADdae-huQZkB2yZ1mD8vTt=0K8X81K3A3LYuCnKbF=GQ3x50xg@mail.gmail.com>
 <f1d8a68465306d9f3def763eb7460701896acbda.camel@gmail.com>
 <CADdae-jU9+2EWte0n0tBBZLkBVkxQhfqM0zu0ffbf5zxwqEbHw@mail.gmail.com>
 <CAJJxGdGqNc3hASvSmQ9VA_cYOS-fcH+nEooLE5eY2z4P=ubCeQ@mail.gmail.com>
 <CAJJxGdGjKm9Qq-wqUwuVYQyHWc2qSzu=tcUY6VbFhnsvKp3AjA@mail.gmail.com>
In-Reply-To: <CAJJxGdGjKm9Qq-wqUwuVYQyHWc2qSzu=tcUY6VbFhnsvKp3AjA@mail.gmail.com>
From: David Kerr <david@kerr.net>
Date: Wed, 27 May 2020 18:11:44 -0400
Message-ID: <CAJJxGdFngRABnzY7Gqsh8WKHJw8uqbubqqgZOX2cYiF9hiMu2g@mail.gmail.com>
Subject: Fwd: Question about origin of packet relative to peer
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

I think what you are trying to do is make sure that server S1 replies
to packet from peer s2 via server S2 and not direct.  But that the
default route table on S1 is going to try and send it directly because
it is valid for peer s2 to connect directly to S1, thus the connection
is failing.  The only way I can think to make this work is to have
server S2 connect to server S1 over a different interface.  So have
e.g. wg0 setup for peers to connect and wg1 for servers to connect.
So S1 has both a wg0 and a wg1.  S2 connects in by wg1, all peers
connect through wg0.

Then you can use firewall marks, connmark, saving and restoring in the
mangle table, combined with ip rules to lookup specific (none default)
routing tables such that all traffic that is received from wg1 is
replied to through wg1 rather than going out wherever the default
route would be.  Not for the faint of heart.

DAK.


On Wed, May 27, 2020 at 3:42 PM nicolas prochazka
<prochazka.nicolas@gmail.com> wrote:
>
> Yes, I can mark the  wireguard packet  allowedips but i cannot attach
> to the associated peer.In my configuration, ip from wireguard (
> alllowedip) can come from different peer ( because i'm using different
> mask for allowedips and multiple tunnel).
> My issue is that a packet can be used by a peer and come back by an
> other one ( the packet is routing by allowed-ips, not by it's peer
> entry
>
> Example :
>
> On server side S1
> Peer A (client peer)
> allowedips 192.168.1.0/24
>
> Peer B  ( an other "wireguard server"  S2  )
> allowedIps 192.168.1.100/32
>
> On client Side, allowedIp is set on s2 and if s2 down , set to s1
> peer s1 =3D=3D> server S1
> peer s2 =3D=3D> server S2 =3D=3D> server S1
>
> Of course it does not work, packet routing does not work
> client =3D=3D> S2 =3D=3D>  S1 (peer A)  =3D=3D>  then response route to p=
eer (B)
>
> Regards,
> Nicolas
>
>
>
>
> Le mer. 27 mai 2020 =C3=A0 13:46, Arti Zirk <arti.zirk@gmail.com> a =C3=
=A9crit :
> >
> > On K, 2020-05-27 at 11:01 +0200, nicolas prochazka wrote:
> > > How can i know that a packet come from peer X ?
> > You can check which peers allowed ips list covers the received packets
> > source ip
> >
> > > Is is possible to mark packet not a level interface (wg0) but at peer
> > > level ?
> > Its probably possible to generate iptables rules from peer allowed ips
> > list that marks packets with different ids
> >
