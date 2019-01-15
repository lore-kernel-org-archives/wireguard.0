Return-Path: <SRS0=I9o6=PX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE5BC43387
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 15 Jan 2019 14:27:23 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DC1120651
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 15 Jan 2019 14:27:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mullvad-net.20150623.gappssmtp.com header.i=@mullvad-net.20150623.gappssmtp.com header.b="ssP4t9aF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DC1120651
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mullvad.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8ed2c647;
	Tue, 15 Jan 2019 14:23:17 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 74b973f9
 for <wireguard@lists.zx2c4.com>;
 Tue, 15 Jan 2019 14:23:15 +0000 (UTC)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 709c0e48
 for <wireguard@lists.zx2c4.com>;
 Tue, 15 Jan 2019 14:23:15 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id y139so3446766wmc.5
 for <wireguard@lists.zx2c4.com>; Tue, 15 Jan 2019 06:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mullvad-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GuVt4Hh0lM43AgKTuRlEUsbkLSEE0njvo2EeYCd1qdY=;
 b=ssP4t9aFVavK7+aQ+JuBccVO4vsm0F4AQJXyZ9EyaZYhx1tjG/8/7YfzmTeAO5fe16
 1NELFlpDKH94URdRHlQIwEkPmsSwoirspajDOuFYGS2b29c7JpjJ6AX4VTt/WhkEnoMg
 Ayn4ej/a6Ua6J8Tl2LkpHTFTu4/VCi32tVoNUw3NJz8LZLhUfHDKyHswjvd/4giUdVcE
 fDRhQ/yjNdt2F9V8Gj7l6EzkGxIDkarJ/06LW+FZK9tQfbe1JrqIB65Duek5r/02gYlp
 ZAE2xIrCpexD/pshfAVLRT/+YoNpchvIBx9uX0glI5UXOAUAQj+2/1tW/zcoe5OMZpqa
 o+JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GuVt4Hh0lM43AgKTuRlEUsbkLSEE0njvo2EeYCd1qdY=;
 b=iHvuCq3X466RQ8zzqs+6Dhz+Cog+FlTsyKPKbIHaRT2VBM6AoHsG+yfc3Ggp6SDk6F
 bHPFwvV3/c9dEVsM2epI1nJeRwrvKLShnjgMWnqgk1LZPJ99F6oCl9shmJk6kYKHHSTU
 5EAhgNAj/ZnJpl2DjDy6yvYPLmo1NYNvqa+M/fOj3r5J6Qqj7mpNBBLs6J1EaCWuxmda
 HyxuXqOjSNoeaIJt5x01/uJTloiPuRNuP+/csOyYcWgg5SWcMpdva1NO1qkSkxwZruTU
 ymreKb5cN1w6sf+AIhgN1KLge1GNc0ITDEnUZuVYV1Tsf+RpXic+NIiDd/CcMi8mH8TG
 5pHA==
X-Gm-Message-State: AJcUukfluqhdKS5CzM6mP/GlvZnbaHX7xDzxXhOmZL6cXttx2wK9g6ae
 ozPJBCZQCI0HHCgQ34gTKrcE4gEZhWcaHwT7pOi6rg==
X-Google-Smtp-Source: ALg8bN4q0X2BIOUbTaruq1WdSN1e0SIiwBvuR7dBehQP8BoGLdMiIAt2IplsT10HhYGJK1xHM3o5XzVOBzerV+AbZ8U=
X-Received: by 2002:a1c:8f95:: with SMTP id r143mr3420750wmd.65.1547562436625; 
 Tue, 15 Jan 2019 06:27:16 -0800 (PST)
MIME-Version: 1.0
References: <CANTUoec=rCy0fcW1ukUfYQLsj73sJ3CAPFMu+sgHxZMxF=__NA@mail.gmail.com>
 <CAOAVeL0Hv343JWU1m06p-WaspsNFpB6Tnw6EdYr=LdMVQLM0AQ@mail.gmail.com>
 <CANTUoecyXtor1+craGG0dacSvnCewT55Fcwqwfho9f0SvH=iqg@mail.gmail.com>
 <CAOAVeL32OBbhyzrJ-z6nLYMUUJsOFOSVNpbo4wdQN3zV=6yndw@mail.gmail.com>
In-Reply-To: <CAOAVeL32OBbhyzrJ-z6nLYMUUJsOFOSVNpbo4wdQN3zV=6yndw@mail.gmail.com>
From: =?UTF-8?Q?Fredrik_Str=C3=B6mberg?= <stromberg@mullvad.net>
Date: Tue, 15 Jan 2019 15:27:02 +0100
Message-ID: <CANTUoedLSxrRoDBbiCOYn-xoXT-nAyw-ccfq6kJWThJ9QnmAXA@mail.gmail.com>
Subject: Re: WireGuard deployment considerations for improved privacy
To: Henning Reich <henningreich@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Tue, Jan 15, 2019 at 1:05 PM Henning Reich <henningreich@gmail.com> wrote:
>
> Thank for your reply too,
>
> I "use" this list and conversation to get a bit more information about crypto at all (it looks like I need that :-)
>
I see. When I wanted to learn more about network security protocols I
read the RFC for TLS from start to finish a few times. Every time I
didn't understand a word or concept I looked it up on Wikipedia, often
reading the entire article on that concept. In your case maybe read
the WireGuard paper a few times and reference Wikipedia. That's a good
start.

> I try to explain how I understood the problem, and anybdoy can tell me, where I have make a mistake :-)
> From https://www.wireguard.com/protocol/#key-exchange-and-data-packets
> the initiation message and the response use
> initiator.ephemeral_private = DH_GENERATE() and
> responder.ephemeral_private = DH_GENERATE()
>
Correct. Although to be exact DH-Generate returns a keypair (private, public).

> This means (I think), that for every new connection, a new DH-Key is generated. For me (not a programmer) it looks like all other private informations in the messages a encrypted/hashed with values derived from this DH-Key.

Almost. It uses Diffie-Hellman with the ephemeral private key as one component.

In the first message, msg.static is encrypted using a key derived from
DH of the Initiator's ephemeral private key, and the Responder's
static public key (which is already known to Initiator). The first
message also includes the field msg.ephemeral which contains the
Initiator's ephemeral public key, transmitted in the clear.

When the message is received by the Responder, she is able to decrypt
msg.static and learn the Initiator's static public key. You might ask
how that is possible when she doesn't have the Initiator's ephemeral
private key. The reason is that she can derive the correct encryption
key using the Initiator's ephemeral public key, previously transmitted
in the clear, and her (the Responder) static private key.

ECDH ( Initiator's ephemeral private key, Responder's static pubkey )
=
ECDH ( Initiator's ephemeral public key, Responder's static private key )

> Because both site knows the other static key, I would look in the "XX" Row, and there is your quoted destination proberty not exisintg.
>
WireGuard uses Noise_IK, not Noise_XX.

> It's probably possible that I ignore some cryptographic basics or misunderstood same facts. So I hope somebody takes the time and give me some more hints. Thanks
>
No worries. We're all learning something. If you want to learn more
about cryptographic protocols just put in the time. And when you don't
understand something, or suspect that you are wrong, read the whole
thing again. That's what I did :)

Cheers,
Fredrik
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
