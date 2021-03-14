Return-Path: <SRS0=wF/V=IM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4662C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 14 Mar 2021 19:16:57 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9A9164E12
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 14 Mar 2021 19:16:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9A9164E12
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c6989838;
	Sun, 14 Mar 2021 19:16:55 +0000 (UTC)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id fd404c7b
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 14 Mar 2021 19:16:54 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id n16so53570946lfb.4
 for <wireguard@lists.zx2c4.com>; Sun, 14 Mar 2021 12:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=P0Z2mauBvoHuoEu7E/aae0H6chFUjKnRRKvk8qkbxbE=;
 b=ukalBJC7ilywKYc6uU6jIkIviV2LkQc6YkLp3f0R9sGfiDuZ4MPq8nO8PpDQa6Fbss
 lldOWuhIxgDBW63NfNuYQ70t+00G4mmFwgEzz6zL4mNQLn25KcfmocIAAS1oUDqH8dMA
 xYzyvOFVGYBxY3GpPy9701OVGIdXzkY5XyC6JvXhwUkFRXsjAR3anihbvBR1QbmvJ/ip
 AyvzIJiMq8ERQUSnHRK6pfYL/beDGbDd1LXkarvfh8HoE2oaJjL5AEhDrpFRuEIxs9mE
 +++VTRgT4HoT3v2kuFuvxykOAzDQxb9dWUD3wqQ7mug8TXv7iFgRq2WckLw6YMJPlTPQ
 EEDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=P0Z2mauBvoHuoEu7E/aae0H6chFUjKnRRKvk8qkbxbE=;
 b=hjYa1mB7Ureb9If1UEVeLPspF4PKDxGbxcWkL0MT3lwIQdvXy8xaf0v/ai/Cw8a8c4
 fBQtlGMyQqfV6pEIatz4ZYptNcQvV5oe6MP8f3z0rTXfNV0ULPaV/l20BLATBwedqyro
 UUcwNywBcb44nDxMEtzek1spT4wo48yhKxOAaQapVX929rOaPAQvOAXIN4nGitv9jKia
 N1I3XLSftuLrx9X//vUAAOZhehCTXfxugQD++eAs27iDOpNC4InnmFfgc407B4QtOs6q
 L4qVw02T3RERYMa1oz/hePwR7/mHYmFuVXU5K0PysX1tR8Bot9WGF21tAtqlevHjWjfB
 hQ8g==
X-Gm-Message-State: AOAM5323Q0QoypliFROrHVECrX6bkK9FKvcJteYeGo6UdmJ8dFOLz05m
 g/83pS8cNH57aoRDbhopgxxukOUGHTqOKZu0xaheU8x8rRk=
X-Google-Smtp-Source: ABdhPJy95CBwa/V1v2lwJVN/gwHV1IC/YiS8ocR1f3JM3q5fPU0ZFfhAh0M3sQYQaEu3NR0KENklW18VhbZ1eS0G348=
X-Received: by 2002:ac2:5a11:: with SMTP id q17mr5972884lfn.354.1615749413443; 
 Sun, 14 Mar 2021 12:16:53 -0700 (PDT)
MIME-Version: 1.0
References: <8036163fba8a8c7cdea2af0fcac4eb07@kapsi.fi>
 <4cb69d55-c577-10d4-2692-f6ebaaba5f1d@kapsi.fi>
In-Reply-To: <4cb69d55-c577-10d4-2692-f6ebaaba5f1d@kapsi.fi>
From: Phillip McMahon <phillip.mcmahon@gmail.com>
Date: Sun, 14 Mar 2021 20:16:21 +0100
Message-ID: <CABtXGiCgmkgZzRejukLDS-RUUR8wxj17JcjDFR+8YatQ_TK4Fg@mail.gmail.com>
Subject: Re: Wireguard on EdgeRouter and using specified VRF and/or routing
 table
To: =?UTF-8?Q?Skyler_M=C3=A4ntysaari?= <samip537@kapsi.fi>
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

I think to get a better response you should post this on the
edgerouter support forums. Mainly as the implementation on edgeOS has
its own nuances, it also sounds like you need some specific routing
advice.

Good luck!

On Sun, 14 Mar 2021 at 20:06, Skyler M=C3=A4ntysaari <samip537@kapsi.fi> wr=
ote:
>
> Hi,
>
> Could somone help me with this? Last I sent this, I got no replies.
>
> On 27/01/2021 9.45, Skyler M=C3=A4ntysaari wrote:
> > Hi there,
> >
> > I have a use case where I'm running Bird (BGP daemon) on a EdgeRouter,
> > and then having PTP links via Wireguard for the BGP sessions but I
> > need some help on how to set the wireguard interface to use specified
> > routing table and/or vrf?
> >
> > I want it to use kernel routing table 1 aswell as specific VRF, and I
> > have set the "route-allowed-ips" to false, as I don't want it to
> > generate it's own routing table.
> >
> > For reference: Kernel version is 4.9.79.
> >
> > Best regards,
> > Skyler M=C3=A4ntysaari



--=20
Use this contact page to send me encrypted messages and files

https://flowcrypt.com/me/phillipmcmahon

P.S. Drowning in email? Try SaneBox and take back control:
http://sanebox.com/t/old3m. I love it.
