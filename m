Return-Path: <SRS0=HOwu=BI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9002C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 29 Jul 2020 18:27:36 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6097A20809
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 29 Jul 2020 18:27:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EhSfkYQT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6097A20809
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 24be7752;
	Wed, 29 Jul 2020 18:03:43 +0000 (UTC)
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [2607:f8b0:4864:20::d31])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5af2f02f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jul 2020 18:03:41 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id k23so25527589iom.10
 for <wireguard@lists.zx2c4.com>; Wed, 29 Jul 2020 11:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=wXqTPuHyT39MP1gfzyLeQBE2O/HyK0Ji5ZS4ZKHkSCA=;
 b=EhSfkYQTdCu/L2/ZLOKV+PTa8nbAoX8mVwLwjJmqFwE0nenqMecZcsXd/f02oMmdc4
 tetZJgX66ZM+nydN38wSYWVQoyr1LyOIS85fp2ebkAf+m6yPRIpkMxItgLk+tuqLbnW2
 Hq2+URg1Vq3FONog23f/rNMJBraJgLzMGE5TvjLGT2HPpkf2McLyv+cpZswsMZzLyRDV
 sJQJ18K1W17o64oa7IqTaYt/5QghJSd+sS/bi8HLB71plBetousyjL/pUxKLsnuIJOJs
 a8GLWyQqUSqnItQZh/XkJ87futTEBr8pkZZ9jSa7I15o1ctwGYndw98IL6BjQWjDanY8
 9/oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc:content-transfer-encoding;
 bh=wXqTPuHyT39MP1gfzyLeQBE2O/HyK0Ji5ZS4ZKHkSCA=;
 b=Za5hPayH09NKYaFKzD9dKqu8n6ipdtuNvVmEhpi5zvFlFxlLfK5kLFodgnAPX9t2UD
 w9icSnJry6MiPUqu1ic7BjY52swTtMenIJvLtHRJCjNwxAtPiovRh5x56aL8fYKXHItA
 6u+yJLqRFiuQY7yW4FeZpy0Jh5iv27xrnVrRqk+suO4u6vHjHd2kO0n1cgjJt6BxkgXd
 RZrCst+YRkAyMCkCfLXD71wm1mJ/hw8xuz10YNpPTpGHM2WYdH4LMP1+PLOiTRQpC+ow
 bXfhPq1Dwj86p9uUZ3LikiFubRu0ayq4UUwa9TEHfdt6ALB/PLw//WIWqw/xlciPsHJf
 rBZg==
X-Gm-Message-State: AOAM530g4FYoq1WnOmQ31wty0A7ZSSXgZQpkwQfskZK4KghmWmpC2uMT
 maMPhS4sKRN5zHkcY+mr44d++7qwPxWJF9Jz9Nw=
X-Google-Smtp-Source: ABdhPJz+blI7zvD8QtllHi0vOMBbbUrDoxnNpmDIsEMdF+GTiA1J80K2Ho8feR+2elF+b5vnpCGmoqTWgpyivh9vM+8=
X-Received: by 2002:a5d:8552:: with SMTP id b18mr35177562ios.28.1596047236727; 
 Wed, 29 Jul 2020 11:27:16 -0700 (PDT)
MIME-Version: 1.0
References: <cd5b0b55-fe63-e4ec-7ee3-b68fc9e95e31@gwdg.de>
In-Reply-To: <cd5b0b55-fe63-e4ec-7ee3-b68fc9e95e31@gwdg.de>
From: Jeffrey Walton <noloader@gmail.com>
Date: Wed, 29 Jul 2020 14:27:05 -0400
Message-ID: <CAH8yC8=V_69QctjdZMpjgkA=ze7KzW8k+HP4xYN_zz3-xDW6OA@mail.gmail.com>
Subject: Re: Hardware Security Token
To: Marjan Olesch <marjan.olesch@gwdg.de>
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
Reply-To: noloader@gmail.com
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Wed, Jul 29, 2020 at 5:18 AM Marjan Olesch <marjan.olesch@gwdg.de> wrote=
:
>
> I'm a student in computer science and currently writing my master
> thesis. It's about an STM32F103 based security token, that is
> specifically designed for the WireGuard authentication. For now, it has
> more like a proof-of-concept character, and I'm aware of the possible
> security flaws, which also have been discussed here before
> (https://lists.zx2c4.com/pipermail/wireguard/2016-July/000243.html).
>
>
> Nevertheless I want to briefly present my team's concept, as well as our
> progress.
>
> The Noise IK pattern shows clearly, that it is not enough to just
> outsource DH(SiPriv, SrPub) to the token, since this part would be
> static, as long as the private static key or the peer=E2=80=99s public ke=
y does
> not change. Considering chapter 5.4 in the wireguard paper (initiation
> scenario), at least the operation (Ci, k) :=3D Kdf2( Ci, DH(SiPriv, SrPub=
)
> ) needs to be ported to the token, since it is the Ci that is based on
> ephemeral keys. Furthermore, the k, resulting from the KDF2 is a secret,
> that is needed to create the AEAD. This means, that the k is kept on the
> device, while the AEAD is also calculated on the token. Because the AEAD
> calculation requires a timestamp, the device needs to run an RTC.
> Considering all this, an attacker that intercepts the communication
> between token and computer cannot replay the handshake with the
> information transceived, since he is not able to alter neither the time
> stamp, nor the k.
>
> Unfortunately, the STM32F103 can - from our findings - only run the
> time, not the date, while powered off (with backup battery connected).
> So for now the date has to be delivered once a day in our
> implementation. The delivery can be protected by a password and/or a
> hardware button for better security. The most important algorithms
> Blakse2s, curve25519 and chacha20-poly1305 run on the STM32 and we were
> able to reconstruct the operations needed, in order to source out the
> particular parts from the handshake initiation. The communication to the
> (virtual COM) device runs via USB and a really simple rpc protocol. We
> used wireguard-rs for the development and everything stated above works
> at the moment.
>
> I don=E2=80=99t want to bother you with too much information. Please let =
me
> know, if you have thoughts about this idea and/or the implementation. I
> would be pleased to present you everything in more detail.
>
> Code can be found on https://gitlab.gwdg.de/uenigma

One comment on the date/time problem...

Getting the current date/time has been a problem as long as I can
remember. Early mobile phones without SIM cards would not fetch time
from the carrier, so just about anything X.509-related could fail
depending on the phone's default time (which was usually something
like January 1, 2000).

I believe Google has a secure time server/protocol for this problem,
but it is only a partial fix. I don't recall the name of the protocol
or the server.

The IETF has some recommendations at https://tools.ietf.org/html/rfc8633.

I believe one of the fixes in the IoT age is a gossip protocol. If a
dozen devices around you agree on a time, then the time is likely
correct. You don't need to contact a network time server when the
community agrees on the time. You can contact a secure time server for
higher assurances, but the gossip'd time should be OK to get you to
that point.

Jeff
