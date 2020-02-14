Return-Path: <SRS0=KrVi=4C=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0E03C2BA83
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 14 Feb 2020 09:12:07 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 232482086A
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 14 Feb 2020 09:12:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="HPQWmERf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 232482086A
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 30696c29;
	Fri, 14 Feb 2020 09:09:34 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f097120d
 for <wireguard@lists.zx2c4.com>;
 Fri, 14 Feb 2020 09:09:33 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 96a3294f
 for <wireguard@lists.zx2c4.com>;
 Fri, 14 Feb 2020 09:09:33 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 70167bd8
 for <wireguard@lists.zx2c4.com>;
 Fri, 14 Feb 2020 09:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :in-reply-to:references:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=ctm3oNlrDT04NhfoVgAtFza8J1w=; b=HPQWmE
 RfIWZgX1SOQ1kZ0Csr5YXsG0yeRD8Ea5IHbDuqf23gd6VFNI8Nr3GdNLu+/ogDuK
 xIJRH1BboxfRjaa7eUbWE7raw0poJjNClR1wWV7aVB0CpFbOKPN0yTRqn+cHgnnD
 WPD+kYUQdbQPatItqKTHHfre+IPKITZXc61hkHkkISVY+lGQIfBA3kVvT+xq4Y7x
 +s0g2bDbLost6Jp6MoBzjmZaNB7akaE/daeS5xrFYYcUE1OFLr4/E6NaXxrXDj4S
 ttk5Zd2j6kag0tnIS3Mk1plFkAhKRVWPmCmYJAEyjHQIgHWuCCJvH1P9nvaD2x4Z
 UV15vT4mKDU5TY1w==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f19495d2
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 14 Feb 2020 09:09:31 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id q81so8798891oig.0
 for <wireguard@lists.zx2c4.com>; Fri, 14 Feb 2020 01:11:36 -0800 (PST)
X-Gm-Message-State: APjAAAUOxgTk4Mfb/qcH8GtyWrawYO7QwDqfhf2E5tMbDCs9ug8UiYgM
 s7mk/SDssn4Sw+dRheVGRg6vJUvVMx7GJNU21XE=
X-Google-Smtp-Source: APXvYqxb/Gz9M1koGGg1S9zkNnmPyN6mTIW7DwTncPwuPJR2Ygt78gVltctKGNRm3wrgz2vdbkDd4Dp7wPX0+OkbtM4=
X-Received: by 2002:aca:2109:: with SMTP id 9mr1113753oiz.119.1581671495579;
 Fri, 14 Feb 2020 01:11:35 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a4a:dd10:0:0:0:0:0 with HTTP; Fri, 14 Feb 2020 01:11:34
 -0800 (PST)
In-Reply-To: <20200214063814.229451-1-edumazet@google.com>
References: <20200214063814.229451-1-edumazet@google.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 14 Feb 2020 10:11:34 +0100
X-Gmail-Original-Message-ID: <CAHmME9oMyauDtVaOSfmeVAKmCr_QBoqC1Vmh+aprtO=Z57PGxw@mail.gmail.com>
Message-ID: <CAHmME9oMyauDtVaOSfmeVAKmCr_QBoqC1Vmh+aprtO=Z57PGxw@mail.gmail.com>
Subject: Re: [PATCH net] wireguard: device: provide sane limits for mtu setting
To: Eric Dumazet <edumazet@google.com>
Cc: netdev <netdev@vger.kernel.org>, wireguard@lists.zx2c4.com,
 syzbot <syzkaller@googlegroups.com>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <eric.dumazet@gmail.com>
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

Hi Eric,

On 2/14/20, Eric Dumazet <edumazet@google.com> wrote:
> If wireguard device mtu is set to zero, a divide by zero
> crash happens in calculate_skb_padding().
>
> This patch provides dev->min_mtu and dev->max_mtu bounds.

Thanks for the patch. However, I solved this slightly differently
yesterday afternoon already:
https://git.zx2c4.com/wireguard-linux/commit/?h=stable&id=06e79ab0d545a20dec1b179fa26841eb0afb1f07
. I've got some additional testing of this to do this afternoon, and
then I'll submit it to the list.

Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
