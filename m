Return-Path: <SRS0=F0uL=3T=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFE2CC35240
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jan 2020 20:17:40 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72DE7214DB
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jan 2020 20:17:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="UN3NbkJp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72DE7214DB
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0aa2c16d;
	Thu, 30 Jan 2020 20:17:27 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 58cdfe4c
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jan 2020 20:17:25 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1bb68749
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jan 2020 20:17:25 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2da03162
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jan 2020 20:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=td4F/e1EqVCCmUOX3MSHfiqQwsU=; b=UN3Nbk
 JpOl+VDqu2AKIepz401+ScT/FGqZlEjjKgEPxuY6+/4T/Oo6aIAX2CbC/m26nSH9
 qzpVUtJg/3aBrpYaUJv7Zo1xEouVNxOR/JSKl22Aiv30hKIwONQESCUkusNv8kS1
 GsLvCdHrNXPTIx+Cj/QQqwQsvyLlX+0ladoTkeQgpo7hy2+vEE6pZ4furTSFOuQG
 TNpid8rXKIxg1NDmEld2Ay/hYcA4Nzyqbaj/hbo0bALvc1vX+3i1rAOOYLItWZnN
 UKTUE7gLs4MXB0R+6lQrdrQKwJ5D+Bm/qzm4eaxFhXDwvcyWkrsQH78afd2xZpFl
 p5thZdWIT3KeZCIQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5a952ede
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jan 2020 20:17:25 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id v19so4897739oic.12
 for <wireguard@lists.zx2c4.com>; Thu, 30 Jan 2020 12:17:36 -0800 (PST)
X-Gm-Message-State: APjAAAWGgqXgel0BFikPu5/07tZ+A1mF19mPp4jgN/4EZ83FttnV3arN
 JVMqeMZO7FTiVkeL5mYCf1HbOtB7cEboYYf9fK8=
X-Google-Smtp-Source: APXvYqx8dQxBMLMTc7XIDyqF/4jHhnMkRGye1GLdLfkdp8BKkxkLAEwojzkpiEiLvksM/GmZHW1A3Unk1oz2j/OER/k=
X-Received: by 2002:aca:815:: with SMTP id 21mr4231619oii.52.1580415455872;
 Thu, 30 Jan 2020 12:17:35 -0800 (PST)
MIME-Version: 1.0
References: <20200130192853.3528-1-krzk@kernel.org>
In-Reply-To: <20200130192853.3528-1-krzk@kernel.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 30 Jan 2020 21:17:24 +0100
X-Gmail-Original-Message-ID: <CAHmME9rUrq5jrMx=Rsw+w2oeJDj+-R_MtcFxcO91kbOUP7363Q@mail.gmail.com>
Message-ID: <CAHmME9rUrq5jrMx=Rsw+w2oeJDj+-R_MtcFxcO91kbOUP7363Q@mail.gmail.com>
Subject: Re: [PATCH] wireguard: selftests: Cleanup
 CONFIG_ENABLE_WARN_DEPRECATED
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Netdev <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On Thu, Jan 30, 2020 at 8:29 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> CONFIG_ENABLE_WARN_DEPRECATED is gone since
> commit 771c035372a0 ("deprecate the '__deprecated' attribute warnings
> entirely and for good").

Some nice wisdom tucked away in the message of the commit you reference.

Thanks for the patch. Queued up in wireguard-linux.git:
https://git.zx2c4.com/wireguard-linux/commit/?id=e7989992d4908df74402836300b83bacb26cd349

Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
