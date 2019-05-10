Return-Path: <SRS0=opgr=TK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EFEEC04A6B
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 10 May 2019 14:40:16 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36D9B21479
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 10 May 2019 14:40:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QpH/fxT8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36D9B21479
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 71f64d1c;
	Fri, 10 May 2019 14:39:59 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a2e30c4c
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 May 2019 14:39:54 +0000 (UTC)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 81bd9c58
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 May 2019 14:39:53 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id 198so7868078wme.3
 for <wireguard@lists.zx2c4.com>; Fri, 10 May 2019 07:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ng4wE8VoHmqczrAaDA66bf/V+RGzgVLa9E9yFKaG6yc=;
 b=QpH/fxT8teCzXQosXl7J1GCHgsiKWzajOJhy9EGTfDULan1FItVlogRmX/odsjT3HI
 DdB7CwCTheXWz/fua2qG+R5vnMEJ2J2nIHUS4ERJrgXSaiLYxgkVqypp9f2bnvZ5ks5X
 IJkh+ESFcCB3CtN49Fdb5bYyYXlKMNY/gCYVMv8+mUhu9Po0iijmkXP+fs6wuNDCXaD/
 /maTL8WgMcrj3NrvKMjV7oZA7DB7NTDu7+ZIIdbaWJAKxio9DD1tg3dMVQl+XOr+CKXz
 ylpeEiLOC9fBLp/j+LIDeRG2o4z1PdvWROOlg2NgbJ+Ea4FIC9860pgEcp4s4IZxOaBL
 mo0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ng4wE8VoHmqczrAaDA66bf/V+RGzgVLa9E9yFKaG6yc=;
 b=U80x5uerCzUr5s5zE7N9Fpw3qFapPelH0NQDLyv6QvHijvY5fU2xJ/LxxEG8H/CV2t
 U4iIOAyrFPxQxnl900JU25PT4B3145wV4XxgjxuX/v5ofZUPPAbohdG3kHOSzwgR8fO1
 NMlaVAUUypvTyBoyuQq8X7xt94zoUNLXOWSBn2Dz1jFslb5VaMT1GUoEp4C75o545FcF
 snHMuQA/RBSelkFtgvMizlF0XuAmogWvCDaLzwP+I649QZ0jbv1eqg+NgQftCFwy/Y8W
 rWIjxxq/ADNolsxvj6PLlHLyQV6gfSf4xb8q0INR6Yu4ERFrWWQcAaAtxSsMX+hVtGjq
 wm+g==
X-Gm-Message-State: APjAAAWKHaAHFrL49ZuIMNFC3igy1kVfaR5JC0ZyZyck9QqqRW10GMe5
 hd86ZbDGsfF+ZlNbAtkry+XooHusr0c=
X-Google-Smtp-Source: APXvYqzjL86sZ+ZpZ0qOm+gyNjU4TsNb3iz3DQJn0QHGYTvLPP0MDBQliFbdD1Nz9ZgZMqVrN9Q6nQ==
X-Received: by 2002:a1c:14:: with SMTP id 20mr7761334wma.66.1557499191327;
 Fri, 10 May 2019 07:39:51 -0700 (PDT)
Received: from sita-dell (static.133.162.46.78.clients.your-server.de.
 [78.46.162.133])
 by smtp.gmail.com with ESMTPSA id 130sm7953471wmd.15.2019.05.10.07.39.48
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 10 May 2019 07:39:50 -0700 (PDT)
Date: Fri, 10 May 2019 20:09:46 +0530
From: Sitaram Chamarty <sitaramc@gmail.com>
To: Jordan Glover <Golden_Miller83@protonmail.ch>
Subject: Re: bypassing wireguard using firejail
Message-ID: <20190510143946.GA14042@sita-dell>
References: <20190510115445.GA29887@sita-dell>
 <e8xbxVAEDF-AAUjQOklv4K5j-1bQo1VS-JS07WCoG_RyC4crpfDxeEOfg_VH6EQQvKAd0W-1ACbi6XXFR80vA6Lkw1Zin-lTQSVDCnIp4OA=@protonmail.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e8xbxVAEDF-AAUjQOklv4K5j-1bQo1VS-JS07WCoG_RyC4crpfDxeEOfg_VH6EQQvKAd0W-1ACbi6XXFR80vA6Lkw1Zin-lTQSVDCnIp4OA=@protonmail.ch>
User-Agent: Mutt/1.11.4 (2019-03-13)
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
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

On Fri, May 10, 2019 at 02:06:04PM +0000, Jordan Glover wrote:
> On Friday, May 10, 2019 11:54 AM, Sitaram Chamarty <sitaramc@gmail.com> wrote:
> 
> > I am able to bypass the VPN by using firejail (which is a
> > sandbox program to run untrusted applications).
> >
> > Below, the IP addresses and domain names are fake but that
> > should not matter:
> >
> > # wg
> > interface: wg0
> > public key: ....
> > private key: (hidden)
> > listening port: 59457
> > fwmark: 0xca6c
> >
> > peer: ....
> > endpoint: 11.22.33.44:51820
> > allowed ips: 0.0.0.0/0
> > latest handshake: 41 seconds ago
> > transfer: 35.42 MiB received, 2.74 MiB sent
> >
> > $ curl zx2c4.com/ip
> > 11.22.33.44 <--- my wg VPN end point IP
> > static.44.33.22.11.elided.tld
> > curl/7.64.0
> >
> > $ firejail --net=wlp2s0 --dns=8.8.8.8 curl zx2c4.com/ip
> > 55.66.77.88 <--- my actual external IP
> > elided.hostname.myisp.in
> > curl/7.64.0
> >
> > My questions:
> >
> > 1.  I know firejail is suid root, but still... is there any way
> >     to prevent this from happening, or at least make it less
> >     trivial?
> >
> >     I'm OK with a "this is the way it is, if your untrusted app
> >     is running as root you're already toast" response; just want
> >     to make sure I'm not missing a bet here.
> >
> > 2.  I guess I don't know as much about Linux networking as I
> >     thought I knew, especially about policy routing, so I am
> >     feeling a bit lost here.
> >
> >     I would prefer not to have to learn lots of things about
> >     policy routing and so on, so I wonder if there is a simple,
> >     (wireguard-specific, if possible) explanation of how linux
> >     policy routing and iptables work behind the scenes to direct
> >     packets when wireguard is in play?
> >
> >     regards
> >     sitaram
> >
> >
> 
> This is known firejail feature[1]. If you want to prevent yourself
> from this footgun you may add "restricted-network yes" in
> /etc/firejail/firejail.config

Thanks.

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
