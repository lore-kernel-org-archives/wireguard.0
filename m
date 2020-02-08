Return-Path: <SRS0=FiAf=34=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 566D3C35242
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  8 Feb 2020 21:36:22 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFBC722522
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  8 Feb 2020 21:36:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="kULudfDk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFBC722522
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 28796af9;
	Sat, 8 Feb 2020 21:34:58 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 32effb16
 for <WireGuard@lists.zx2c4.com>; Sat, 8 Feb 2020 21:34:56 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 31a46321
 for <WireGuard@lists.zx2c4.com>; Sat, 8 Feb 2020 21:34:56 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3727bf06
 for <WireGuard@lists.zx2c4.com>; Sat, 8 Feb 2020 21:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=i0YvBp5rbZZfC8T9OSffHMiBnZk=; b=kULudf
 DkKbGQVSbdSQGLbIcMP1NOTW8TikmGm6GHEThVmDLQWTlMgANIFFIaG8CBv7/ngQ
 mNNe6lJuPIXt1Xp6EEw+8lVWLEyFvL9uwjNkMSf/f8FfbExKBgZoPLvHkqAY0Il3
 r/vYb+ur244ZjMSY0L1YSLfg+OnxW9ljQ2sPguSxTRpDR1utoNTuWnwAjRNrVYyB
 JCJxhK0pNN1C6RV7VhbKEDxCMP29QvcJ0JFSK/d00NNDGJgp744B6PAwjQg9iEkK
 GiXiTBy4YvpTKwZ1A/gpd0nsBcHQGj4CL3pgjv5i1xKD0oF00tIQ0eGAxDPM1cf0
 OF5nDSeOlHVdwvFA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id cb9d7d28
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <WireGuard@lists.zx2c4.com>; Sat, 8 Feb 2020 21:34:56 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id r16so2765733otd.2
 for <WireGuard@lists.zx2c4.com>; Sat, 08 Feb 2020 13:36:18 -0800 (PST)
X-Gm-Message-State: APjAAAVXULzQQbL9LAI/E9Gibo8QyTD1GMpn/HnXVDvNwAu3YuoHkVog
 5T+ySEwPBazFbDku8wAoH93aNM58Dz8+fkschh0=
X-Google-Smtp-Source: APXvYqxQO24wr4l0OGD7p5TIyfs8Nm6iBJTeVV0SGVDgWyVdMetAInA59VwooEpk3eB96R+cYqnt9Pcvdwyli+gB79k=
X-Received: by 2002:a9d:24c8:: with SMTP id z66mr4844344ota.52.1581197777944; 
 Sat, 08 Feb 2020 13:36:17 -0800 (PST)
MIME-Version: 1.0
References: <CAMK_KHiuWijzbna+tBpZfZm9MixXXy5iEXoVh0r3oNmrqC-Ccg@mail.gmail.com>
In-Reply-To: <CAMK_KHiuWijzbna+tBpZfZm9MixXXy5iEXoVh0r3oNmrqC-Ccg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 8 Feb 2020 22:36:07 +0100
X-Gmail-Original-Message-ID: <CAHmME9ocPawJ4amTG4JjcJga1EYKZUnEMoDvNSoJYvFqJbT3=g@mail.gmail.com>
Message-ID: <CAHmME9ocPawJ4amTG4JjcJga1EYKZUnEMoDvNSoJYvFqJbT3=g@mail.gmail.com>
Subject: Re: wireguard looses internet connection intermittently.
To: kunalv.shah@gmail.com
Cc: WireGuard mailing list <WireGuard@lists.zx2c4.com>
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

GCP uses an MTU of 1460 because Google's network does weird things.
That means the MTU for WireGuard should be 1380. On the GCP box, try
adding `MTU=1380` to your config and add this line to PostUp: `
; iptables -t mangle -A POSTROUTING -p tcp --tcp-flags SYN,RST SYN -j
TCPMSS --clamp-mss-to-pmtu`
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
