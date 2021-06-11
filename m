Return-Path: <SRS0=K7sE=LF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A21B6C48BE0
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 11 Jun 2021 09:02:46 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A76BA61278
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 11 Jun 2021 09:02:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A76BA61278
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mullvad.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 81d31156;
	Fri, 11 Jun 2021 09:02:44 +0000 (UTC)
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 04e86af8
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 11 Jun 2021 09:02:42 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id f5so31254153eds.0
 for <wireguard@lists.zx2c4.com>; Fri, 11 Jun 2021 02:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mullvad-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=IaJiG/7+jCkyuKkVY1lbWAYaEVkNajoZVye8d4QZIx0=;
 b=efDtQmMePXxcWQ+SzoYcD8uil54HyJeocjaKMF05B/xqdUK8MZ4gR8H6kOcJF1f1CY
 742RfeIHUEIvksgB2+a9mP1vi2WXcXsCSnQW4p1fRuMEWmigwDToL35R6HaLCxPXIv/i
 56g8TkjjVsVlLUsJ0088/yVhsN0sH56TG6BSSDlKBSTOKSP3mw1VbuvYThRMNjb6rlWG
 7QwkD8HMlpQ6i1yDt+oKeSxI1FgDJHO5iQpEAKiYLm3Sk4RYmbeh9xAUE+voopX/HQHG
 YG9Zbm8/WI/RJ7OIOfwzwNh4VIVQhOrs3Bxz87UOJxz6Ihlo90FPwIWEN1iY1G9gvaXn
 f4Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=IaJiG/7+jCkyuKkVY1lbWAYaEVkNajoZVye8d4QZIx0=;
 b=uhnWuH9yQUl/3FFXq1w+If16HEUEPIDf5hBokb50sCE1fKSVXNDQZfnfhomVJjWBtf
 AA/GPtzBtd3Th+bhIj6Kn0xV4UM8ftyONRy5iY4CPqxlq1ckCDf/9CV2R9XmdfC9Zf2j
 uKjB908AVVoIWMRH+BGbrEiT0zPOzbJGnl2gzfzN+CkzhWeOJkARgWwYxQYRGCyJz+H4
 3XErvnxVL/tKM+8ExohLWk2i/wqYSKt3wWYUe9QrT0pNFDxcUFK7NT1UEHYpksR/PLEZ
 WEpGxIwOfaZI3u93E2IdUMJYX6DbIQoqR0lu9PZdYqsk5rJrnG4+x5nNHAnr9a8hHHne
 Z9Lw==
X-Gm-Message-State: AOAM530xdms0kct6Gydo2FZ0BAVSJP3JX6YFSsKKyw5ovf9bjuCJ4hZ9
 CXXqGR4WQ7vuWVcJIq8mccKf4A==
X-Google-Smtp-Source: ABdhPJxXRSIqtecdjn0SE1LPfJjQGuWXpTjU8E4N02PvIN09OwFnnIbppb/DKUpIE9OMsNmvQzejLQ==
X-Received: by 2002:aa7:db93:: with SMTP id u19mr2619772edt.227.1623402162523; 
 Fri, 11 Jun 2021 02:02:42 -0700 (PDT)
Received: from smtpclient.apple (87.119.154.76.ipv4.telemach.net.
 [87.119.154.76])
 by smtp.gmail.com with ESMTPSA id b5sm527710ejd.53.2021.06.11.02.02.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 11 Jun 2021 02:02:42 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: WireGuard is broken on iOS 15 beta
From: Andrej Mihajlov <and@mullvad.net>
In-Reply-To: <CAHmME9qXs=ct-RNm0eGwu7mTdM+mCoNiYcJOOe5te=9n1ScC5g@mail.gmail.com>
Date: Fri, 11 Jun 2021 11:02:40 +0200
Cc: David Crawshaw <crawshaw@tailscale.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <8A754E6A-6D25-427E-AF60-4AF9A61DF1B7@mullvad.net>
References: <760B19F6-17E7-4276-B2E2-DFE07AB19323@mullvad.net>
 <CAHmME9pKnJouF-Vf20y+1w_TUs1vj1bpOggd+dgm8epfN+8-MA@mail.gmail.com>
 <CAHmME9rqAH9a28apwB9Rg1k9Lg1gmBWv3KK_8ZmAdb6H9hBaKQ@mail.gmail.com>
 <CANdratux27RGAbVg1QBEKEnff8jb3pdezZ-Ad0=bqYfOw6iUeA@mail.gmail.com>
 <E201364E-C433-4A43-968E-F336D5944986@mullvad.net>
 <CAHmME9rs3g9ar7Fh-BduNFiD4GipuHbQNALOcstVBd-q3OmHdw@mail.gmail.com>
 <3BD85DF3-A8B2-45BF-A78C-D03524A226DC@mullvad.net>
 <CAHmME9qXs=ct-RNm0eGwu7mTdM+mCoNiYcJOOe5te=9n1ScC5g@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
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

My approach worked too. However it relies on the private interfaces of =
NetworkExtension framework, which we=E2=80=99d probably want to avoid.

In short it can be expressed in one line as:

let fd =3D =
packetFlow.perform(Selector("interface")).toOpaque().advanced(by: =
0x128).assumingMemoryBound(to: Int32.self).pointee

But I bet that walking over fds is much safer.

Cheers,
Andrej

> On 11 Jun 2021, at 10:50, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>=20
> Can I infer from that that your technique didn't work? Some
> confirmation one way or another there would be useful, so I know
> whether to dedicate some RE time next week to it or not. If I can
> avoid the fd iteration, I'd prefer that.
>=20
> Jason

