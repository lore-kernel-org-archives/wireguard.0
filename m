Return-Path: <SRS0=6BFc=56=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A66E7C2BA19
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 Apr 2020 08:54:07 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C19B206E9
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 Apr 2020 08:54:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=mullvad-net.20150623.gappssmtp.com header.i=@mullvad-net.20150623.gappssmtp.com header.b="FAXDRr9v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C19B206E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mullvad.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8749cce5;
	Tue, 14 Apr 2020 08:44:17 +0000 (UTC)
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [2607:f8b0:4864:20::331])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 34259747
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Apr 2020 08:44:16 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id i22so2609835otp.12
 for <wireguard@lists.zx2c4.com>; Tue, 14 Apr 2020 01:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mullvad-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=4N23fGye2HpxDIcyFiRI+oEcrZoGUeraa8AdyAiDUCQ=;
 b=FAXDRr9v/IvfF0CN+2N344/B3DaEykpTSYa91khJthVRGxM4jmyi3y3sL+voFRa1tQ
 YBzsKfJug5M9//+CHJgvOUMDK2lPmppMMHRffthIHLWCRGu+YLLuKNMI0QK00ZzcXR84
 HPzMfJUv2AFjYr5jcATU6o6Gy1Ey6E1lRpgO3aavMyuzvzOwqq3t7/dahE9CZ29lqT8z
 fuG3injw3gSGytCahfk2EHz6kiM5CKvXVJiF8gkHdGIdAChkJYK10tIBWmZV0XCa+aHz
 T1kPtN6Q+TxIxfKyIU7xFUymKuP+Wkpy3Jd3+rpcoy20Yymh5jsHfgIyMDH5idNdxleZ
 uIvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=4N23fGye2HpxDIcyFiRI+oEcrZoGUeraa8AdyAiDUCQ=;
 b=kPl9OjKv83cDsAloQgd2s0V0jawRe/RNvTG2IJkK+lFtoauayPx8hgS5SmWNZ/tvgM
 Gfl5Of7F2H0eYUCYJ4fbP50qJPgBlurH3dFk3uUewB5IhtDP9EpYoLBrcS4Bo9EPKGJm
 FjwJpXBHV9TIzUXvyC08wKCmWcH5OvjVqhdMo3OBYKiJHAPnJaKygXE0/3YKkO9FLmwI
 feyPmRVQMn1VYG9fn5aka04DnopX88hfiIVyLk7ZAKlYmcwmqE6aJBdEeIhKgnTIIhhG
 TA8ZN0+qUy78qaZ6lQ8X+kgl5AfaROYYEnAEJ6pXhpM9yLdwU5crHTLYFCJ7lzpG4Thp
 41bg==
X-Gm-Message-State: AGi0PuZipvwILk/thDnjUKV2s4G8Pj6kbIzPbtIBOzq04lwBgBJPoBJP
 UJIAXQyGw274D6eMs6465NGFWz5ELfDUqCis5vHCj9nzwr0=
X-Google-Smtp-Source: APiQypIpXelKFNUtezqEGyCOwhY2gGZ7/iPEMUxjx6d6K398WAUUPM1VP3IRJEBp7hI1pKkeVfmm00toDBJ2S1Mp/jk=
X-Received: by 2002:a4a:b981:: with SMTP id e1mr17620469oop.5.1586854443862;
 Tue, 14 Apr 2020 01:54:03 -0700 (PDT)
MIME-Version: 1.0
References: <9a3401d61035$4d6b5840$e84208c0$@pmfarmwald.com>
In-Reply-To: <9a3401d61035$4d6b5840$e84208c0$@pmfarmwald.com>
From: =?UTF-8?Q?Fredrik_Str=C3=B6mberg?= <stromberg@mullvad.net>
Date: Tue, 14 Apr 2020 10:53:52 +0200
Message-ID: <CANTUoeduOe9geMx05JxXdvPkT=FnNnYPuyxhC-XHUgOAPHyMgg@mail.gmail.com>
Subject: Re: Is there a way to use wireguard as a non-encrypted VPN?
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, Apr 14, 2020 at 10:30 AM <mike@pmfarmwald.com> wrote:
>
> I have some older routers that run OpenWRT just fine, but are a bit slow at
> Wireguard (3-5 MBytes/s for SMB transfers) and which are too slow for
> playing HD movies.
> For these routers/uses I don't care about security, I just want a VPN to
> tunnel (thru Comcast, and other ISPs that block lots of ports.)
> If there was a way to use Wiireguard with encryption disabled, I'm pretty
> sure my performance would be closer to 20-50 MB/s which would be more than
> adequate.
> Thanks.
> Mike Farmwald
>

Hi Mike,

No, WireGuard does not and will never support your use case of
disabling encryption.

If you are able to, buy a router that is powerful enough to do
WireGuard at your preferred throughput. Otherwise you would need to
use other encapsulation methods. OpenVPN with hardware AES
acceleration might work (if your routers support that). However
OpenVPN lives in userspace so it needs to do a memory copy from kernel
to userspace for each packet. I'm not sure how the performance will
work out in practice.

If you look at other methods you might want to consider the state of
its maintenance. PPTP code is likely to be very old and unmaintained
for instance. Your router might very well end up hacked.

Cheers,
Fredrik Stromberg
