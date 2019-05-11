Return-Path: <SRS0=sgLz=TL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69744C04A6B
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 11 May 2019 01:09:24 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B514A21841
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 11 May 2019 01:09:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AEG4jnQj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B514A21841
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 74bb4cc1;
	Sat, 11 May 2019 01:09:11 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 20f88cc3
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 May 2019 01:09:05 +0000 (UTC)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e4c569ee
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 May 2019 01:09:05 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id i3so3284083wml.4
 for <wireguard@lists.zx2c4.com>; Fri, 10 May 2019 18:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=4I1Z0VcrMBUlZYH1xVT+GUCuGNDp2v31+iwAh3Te2wU=;
 b=AEG4jnQj1VU72J2Yu7nNhqG2gkS4Artl+hZJtO9QMCTcohIM94e4FMLyM6yW4vFwE8
 FOFGieUx3d+La6+BRWc9wU9z3dBQ5/XkmsLkW5XeGbHEIFInozqr2xBP7wNdvacr4fYw
 LGz25f2mpRcL2tbf6gTa8dmMsS5BIJ8+oKpm+NC/dmE5geCqFo4lDEcTsj0FG/N5m0m+
 rVUpLaP1KStGavKosoP0YSDHT5iU6sivh/CY6Rb90KrDe30zmgO+J6kyG1arZ0MQDxFe
 X7izKrJ8wKSUMeEp5V3FIg+gR80Q3C7jLUfw313uGotWSeXLnVicVYKJ3BmQ31t+VlQ3
 abpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4I1Z0VcrMBUlZYH1xVT+GUCuGNDp2v31+iwAh3Te2wU=;
 b=kdeLI8WBRJvKk7Hg9n/m4E7wmH4oHVapbTVszfhkkrQARsVfl8zFXkpJr0Nny1X9HK
 dvpSt2nPVi9AU5+vLowi9YElBVerYhyEgTgJ0uVYHsmg/pJXvfZhcQd70dPpZk46BxXs
 X7+QL6V7pVEhh/i9wil3CUAhJ1lCqnO542cu8z56rTo0mgidwccPun02MbqmdSSOHi3b
 dxDUOHg1sIykCIFxqEBuQCSfrntVZxHfvXY2U61kBgT3mKe+lDfXhzdsQ8tIKSk8YCl2
 zdHbPCFECBi0wP2QtmoppxHPOX/jMbYbeVZJcdKoBqaf9gmTVxBz8NawvyYyxm4yQLf5
 QTWw==
X-Gm-Message-State: APjAAAVZsgS3lygAiB6SVpE3vlM2VLN9GJBJ1+5Yg2upBTVRMTiBj0Cl
 ZsaEzPOPm+9gMqv/S3y+XPI=
X-Google-Smtp-Source: APXvYqy/joe9y9YFUa6zZ/W4iHO3jn/naXBE4Zyrtcek6DVe7pywCmdoEY3fEsJxmlMHwu0BQMyBeg==
X-Received: by 2002:a1c:7fce:: with SMTP id a197mr9096342wmd.134.1557536943720; 
 Fri, 10 May 2019 18:09:03 -0700 (PDT)
Received: from sita-dell (static.133.162.46.78.clients.your-server.de.
 [78.46.162.133])
 by smtp.gmail.com with ESMTPSA id h188sm5123625wmf.48.2019.05.10.18.09.00
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 10 May 2019 18:09:02 -0700 (PDT)
Date: Sat, 11 May 2019 06:38:57 +0530
From: Sitaram Chamarty <sitaramc@gmail.com>
To: Steve Dodd <steved424@gmail.com>
Subject: Re: Fwd: bypassing wireguard using firejail
Message-ID: <20190511010857.GA15995@sita-dell>
References: <20190510115445.GA29887@sita-dell>
 <CAJ6XMjFxfm=0L2URLzn8pkZY1y4zU+mskgd7ykRKOjXSza4tSA@mail.gmail.com>
 <CAJ6XMjH23+k+hu0AighRFX4352O1r332mhd28p=+tw3n0T4+ZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJ6XMjH23+k+hu0AighRFX4352O1r332mhd28p=+tw3n0T4+ZQ@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Cc: wireguard@lists.zx2c4.com
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

On Fri, May 10, 2019 at 05:18:39PM +0100, Steve Dodd wrote:
> [sent to author only originally by mistake - I hate Gmail]
> 
> On Fri, 10 May 2019 at 12:56, Sitaram Chamarty <sitaramc@gmail.com> wrote:
> 
> > I am able to bypass the VPN by using firejail (which is a
> > sandbox program to run untrusted applications).
> >
> 
> I'm not 100% clear on your setup .. Have you got a network namespace set
> up? If not, you haven't got much security anyway, I suspect. It turns out
> it's not too hard .. you're welcome to my hacky scripts if you're
> interested.

I don't think it has anything to do with my wireguard setup.

If you meant firejail setup, it is when I use "--net" (which,
according to the manpage, "Enable[s] a new network namespace and
connect[s] it to this ethernet interface", that the bypass
happens.

> Not sure if firejail would still be able to escape a network namespace by
> default, but I'm sure it's possible to drop a capability somewhere or
> similar if it is.

The answer, as I'd kinda suspected (and indicated in my original
mail) is that root can always bypass the vpn.  For firejail
specifically there's a setting (thanks Jordan Glover) to prevent
that specific escape, which I have now set.

Some other tool, if it's running as root or is suid root, can
still bypass wireguard, regardless of how it is setup.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
