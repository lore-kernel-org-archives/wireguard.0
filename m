Return-Path: <SRS0=I9o6=PX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D6E4C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 15 Jan 2019 10:56:58 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6045F20656
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 15 Jan 2019 10:56:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mullvad-net.20150623.gappssmtp.com header.i=@mullvad-net.20150623.gappssmtp.com header.b="N/lbD8oz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6045F20656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mullvad.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5c69318f;
	Tue, 15 Jan 2019 10:52:53 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 503ae9a8
 for <wireguard@lists.zx2c4.com>;
 Tue, 15 Jan 2019 10:52:51 +0000 (UTC)
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 67de781d
 for <wireguard@lists.zx2c4.com>;
 Tue, 15 Jan 2019 10:52:51 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id v13so2420612wrw.5
 for <wireguard@lists.zx2c4.com>; Tue, 15 Jan 2019 02:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mullvad-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=JDt4ZwtYZIazKOhLqbJ0DMsuorAO4uBcyObzDhQZXgU=;
 b=N/lbD8ozlJm2fH5awHDntDBB+3IQ050jFkOR6uZtzOoGt/qoB5+pEx1/HWYMuA0Fpi
 7Jxw5ezalLCcS4laIjydgfMxqe/Ym3Ffh4kHOPjKT60kdAd3E7xkHMviiI6u8Ol63aqs
 Iqn7b27e3zDqEBJ8QQ31IoqcABtfJb7zLW959dyV6g0z6fIo8QvXkOIu3BagIl0Zpgcq
 RCingwuuF+q2S9V3ID8eY20sxPtB2F+nzTfCJQ9nhk8CVTNHjW1gHv23y1tXHQovMf38
 wTU3iEY3BIL0wlRaSqocbsjebhCHnMPWooO45GOEgGEHm98xsqirYP+G/Etxt+x3NkOq
 2hmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=JDt4ZwtYZIazKOhLqbJ0DMsuorAO4uBcyObzDhQZXgU=;
 b=Xv2y4luMx4ROFsyr5HIsBIoBEcHrvOOKIAQGLn4eiDQqpw9aPbsYaLT/0OzRy5otw+
 jhF4NwwPJV6QBW1fODcSX87bQtbe8UbnH7B1Bvh1NJzlw/w+kLlRb9avXtjUCEktsPSW
 uhrX1NHPsmuTBvfQRXrQiynKTuz0wMwQIbm3Ihkuj2hwSLzOThHIDIqHKghvt2/eDvZ0
 LWrP1Nkik69K3sD2CGgiVYxUzu03lMtZijEnl0DRcu299tP9qGh3Sf6TW4NqNq32+u8Y
 rZDBEuEqPPpfx5hflpyw8xKCNGRYWWJ4Hk1kCe0Pmw7lKnr06KSsMkB7zwOG4Ef8swAB
 1hXA==
X-Gm-Message-State: AJcUukcRB41KwLEx9aGqp0gAfPDTU7GmTCg7ItBjOddbie3gnpyDm1WB
 V2FVG21YjMBQ9BgprIKgnZlbIXa3nfVHqAJIVO1bCXmFOPQBpQ==
X-Google-Smtp-Source: ALg8bN5TAHNFVGQ+Q23KCMNDitTm2uQAbia2RCn1WtFiKkmuDa+X20NsmPfSLH3/EwS2y8MR9D05BmzMz8YdRqPAdFk=
X-Received: by 2002:a5d:5607:: with SMTP id l7mr2601647wrv.25.1547549811123;
 Tue, 15 Jan 2019 02:56:51 -0800 (PST)
MIME-Version: 1.0
References: <CANTUoec=rCy0fcW1ukUfYQLsj73sJ3CAPFMu+sgHxZMxF=__NA@mail.gmail.com>
 <CAOAVeL0Hv343JWU1m06p-WaspsNFpB6Tnw6EdYr=LdMVQLM0AQ@mail.gmail.com>
In-Reply-To: <CAOAVeL0Hv343JWU1m06p-WaspsNFpB6Tnw6EdYr=LdMVQLM0AQ@mail.gmail.com>
From: =?UTF-8?Q?Fredrik_Str=C3=B6mberg?= <stromberg@mullvad.net>
Date: Tue, 15 Jan 2019 11:56:38 +0100
Message-ID: <CANTUoecyXtor1+craGG0dacSvnCewT55Fcwqwfho9f0SvH=iqg@mail.gmail.com>
Subject: Re: WireGuard deployment considerations for improved privacy
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On Mon, Jan 14, 2019 at 1:05 PM Henning Reich <henningreich@gmail.com> wrote:
>
> 3. The attacker uses the VPN server static private key to decrypt the
> recorded handshakes, revealing client static pubkeys.
>
> I think, this is not possible.
> WG use DH for Key-Exchange as other VPNs do (like OpenVPN). Only with recorded traffic, you have no information about the used private DH-Keys --> You still can't decrypt the handshake
> See https://www.wireguard.com/protocol/#key-exchange-and-data-packets
>

First of all, thank you for being the first to reply.

It is true that WireGuard uses ECDH for key exchange, but it does so
in a way that doesn't offer identity hiding forward secrecy.

The page you linked says "WireGuard uses the Noise_IK handshake from
Noise". You can read more about that handshake on this site:
http://www.noiseprotocol.org/noise.html

On the page above under the section "7.7. Payload security properties"
you can read the following for Noise_IK:
"""
Encryption to a known recipient, forward secrecy for sender compromise
only, vulnerable to replay. This payload is encrypted based only on
DHs involving the recipient's static key pair. If the recipient's
static private key is compromised, even at a later date, this payload
can be decrypted. This message can also be replayed, since there's no
ephemeral contribution from the recipient.
"""

If you want to dig into this yourself have a look at the WireGuard
paper. Read section 5.4.2 and read through how msg.static is
calculated.

As an aside, I think it's entirely reasonable at the moment to use
Noise_IK. Identity hiding forward secrecy would require another
round-trip, assuming no experimental crypto. It would increase latency
on setup, decrease DoS protection, and, most importantly in my
opinion, increase the complexity of the protocol state machine. I view
WireGuard as a very secure and trustworthy building block on which to
build. It just so happens that the use case I'm most interested in
introduces some deployment concerns.

Cheers,
Fredrik
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
