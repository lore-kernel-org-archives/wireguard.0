Return-Path: <SRS0=yuiU=P2=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4196BC43387
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 18 Jan 2019 08:20:17 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 469882087E
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 18 Jan 2019 08:20:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mullvad-net.20150623.gappssmtp.com header.i=@mullvad-net.20150623.gappssmtp.com header.b="owkvwgNs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 469882087E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mullvad.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1e97ca8a;
	Fri, 18 Jan 2019 08:15:34 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9a551239
 for <wireguard@lists.zx2c4.com>;
 Fri, 18 Jan 2019 08:15:32 +0000 (UTC)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5e23e4fd
 for <wireguard@lists.zx2c4.com>;
 Fri, 18 Jan 2019 08:15:32 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id f188so3570317wmf.5
 for <wireguard@lists.zx2c4.com>; Fri, 18 Jan 2019 00:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mullvad-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=cjErFhbFNo82CnPMsg727OZpkQrZCwxLfu0OtAdXmZ4=;
 b=owkvwgNsIz1g/71qhmdUokYzRgWAy4XxsxN69vok+VFv7Izu9wODSMsubgdZ/QvsLM
 Z3qSe1kDJT4BcR/F3pt+Gt3NmDntvmpP0I0lrMEaq3ET/jv8vJZlQDYl6eCDmmu/8P2T
 8lDdVXDUVl6EutQEwSSDMA5a54REtryyxIcIm++gNNqmLN19D/Pg91ed8nRXSRxS8dX4
 JoVc4I46kE/pewH4RDUHJ8HgaXmrCZCBDj2+5LV8maUAjF4ZQ/gGtPXi89w3L/Fvk0tY
 MlrM2wp4wzV0ReStL9xtemOFg6vck6Srq3a6GLTkqReY5F6/iVbg5XwCMjjiBOkMq+M3
 IWrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=cjErFhbFNo82CnPMsg727OZpkQrZCwxLfu0OtAdXmZ4=;
 b=ae+HK1AnnbSzw5xsCJx0o2B7zBkVaIPQ3GtPZ3rHUiu8cdo3aUbh069vsg6BZJ3bf4
 ghNf3rEzrTPcRARft6+sp6E0JMMinBHVoaH02hwifkVv50vi6rvLvVCV4Fap/BnES6oF
 QtgJti5RQPY/iauZddwVSD71azIBmOQT8qw/Ed/Ll9OpovFxBMoJ/Mq03a5kN78MxCzD
 HcExaVkxAErHKQMpTFAD0jJelse97rh/GAuHBMb4h35Y0zQqMt1RlktJ/V3zxlMheXD4
 jewKqiKzjJ/5sP2L5qf4KQReAUMU8pkg8Pm0DINO//RRQwNi0e7e6xEr/UOfHdSQN1Vj
 Fiwg==
X-Gm-Message-State: AJcUukekiwXSfDtggRdrxxm4hnUv6mHukXsPiRiXkgh8yr/kbprrFJ5i
 VykVqAmQPGyk6+lUCtLB6sixULmm6QIy1AczBq5QB/gEOdyb4A==
X-Google-Smtp-Source: ALg8bN6DnjdKiCuSZ6UUgDTtmeAEXchasTGpi6lD+S8nrjuBm8A9mF/JSkI6Y2XTHlhL5gMWnhomcT8SV4F006aokQI=
X-Received: by 2002:a1c:bd86:: with SMTP id n128mr14694381wmf.22.1547799594836; 
 Fri, 18 Jan 2019 00:19:54 -0800 (PST)
MIME-Version: 1.0
References: <CANTUoec=rCy0fcW1ukUfYQLsj73sJ3CAPFMu+sgHxZMxF=__NA@mail.gmail.com>
 <CAOAVeL0Hv343JWU1m06p-WaspsNFpB6Tnw6EdYr=LdMVQLM0AQ@mail.gmail.com>
 <CANTUoecyXtor1+craGG0dacSvnCewT55Fcwqwfho9f0SvH=iqg@mail.gmail.com>
 <CAOAVeL32OBbhyzrJ-z6nLYMUUJsOFOSVNpbo4wdQN3zV=6yndw@mail.gmail.com>
 <CANTUoedLSxrRoDBbiCOYn-xoXT-nAyw-ccfq6kJWThJ9QnmAXA@mail.gmail.com>
 <470369034.543038.1547656460486@mail.yahoo.com>
In-Reply-To: <470369034.543038.1547656460486@mail.yahoo.com>
From: =?UTF-8?Q?Fredrik_Str=C3=B6mberg?= <stromberg@mullvad.net>
Date: Fri, 18 Jan 2019 09:19:42 +0100
Message-ID: <CANTUoedKsjKTU8a+R82ay4XsU9vcfZy2dyTHogbAPfL+brnNHQ@mail.gmail.com>
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

On Wed, Jan 16, 2019 at 5:34 PM Jose Marinez <jedi_papi@yahoo.com> wrote:
> I appreciate this proposition as well as your summary for the current state of Wireguard for this particular case. I agree with you wholeheartedly that before the mass adoption of Wireguard happens these use cases should be addressed properly. I'd love to hear what Jason has to say about this and what he proposes.
>
I agree. Let's see what Jason says.

> I too have been thinking about all the edge cases for Wireguard. My approach has been to look at it from a penetration test perspective. Reality is that Wireguard doesn't live in isolation. As a system - hardware, OS and all it's settings + Wireguard - connected to the Internet and a user(s) presents many hostile dynamics.
>
> Ultimately, whatever solution emerges needs to supplement the goals and features of Wireguard, otherwise it deafts the purpose.
>
> Would it make sense to create a small group to tackle this and other use cases - scaling, simplicity, etc? On my end, I'm not a cryptologist, but I can write software that would test the security of any system. I'm sure other members of this list have a ton of skills and experience to bring to this.
>
> Here's a list of things I'd like to see and would be willing to participate/create if they don't exist yet:
>
> 1. A honeypot server with public logs for a small team to gather and record real-time traffic as an authorized user of the server - root.
> 2. A test suite that goes through all the domain specific scenarios from the results of #1 and provides a verification at the end once completed.
> 3. Provide feedback from all this back to Jason for enhancements, etc. in upstream Wireguard.
>
Honestly I'm very focused on the two issues I brought up. Those are
the most important things we don't see a clear solution to yet.

Well, we'd also like userspace to be notified of new handshakes, and
be able to reply to the kernel module whether it's a known pubkey or
not. Or something. That's a different discussion though.

Cheers,
Fredrik
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
