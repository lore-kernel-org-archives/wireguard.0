Return-Path: <SRS0=wyc1=2U=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EEB1C2D0C2
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Dec 2019 10:58:56 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8C6D206E4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Dec 2019 10:58:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="r+o0c2EM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8C6D206E4
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 91192ecc;
	Mon, 30 Dec 2019 10:58:28 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2aab9b33
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Dec 2019 10:58:26 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c39339cd
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Dec 2019 10:58:26 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2afd3ac5
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Dec 2019 10:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=TlkurwCYjvt2dT1l1ZbrZRjCsMU=; b=r+o0c2
 EMp45RBcUr6RliBCzWqAbMAoJTsoFFZXlozfa1Muexs9f0OUfq+ey0naUxQ1FfEr
 qqajSV0Hu3roBXKlXVeCQ1OqtR3PTn7vZbAnzYRQDl5l/4yhxsoXCuuwQHBZOCUB
 Qi0/qsBz64e64hKIk9LjT3xBDrtzvWDjGK8/Kh65VCVmFedEfoEFEstUOvvlURZ6
 xhDG6FlZnyqIomWi+2SShPhPwjE20Kvy3fbypujJhrGrE+Tm8T4AOeMsISagjtdI
 BEnjZzBZWOeNxnADR4a9nrvWg/7fDq1jCEGavuN9KQTxID+TbcZvPQ717PBBIBnW
 QEZ8aVnUdfSxcx0A==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c88b9c73
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Dec 2019 10:00:20 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id k14so45855544otn.4
 for <wireguard@lists.zx2c4.com>; Mon, 30 Dec 2019 02:58:26 -0800 (PST)
X-Gm-Message-State: APjAAAUxiTpriU//d5/YKkAO2oQZlyDb5HS+lzCVVeZ/9iNJrbanikWW
 0RlnrMg3rdZQwHFzvfcweP/Ja/ZYCtElh6WEyV4=
X-Google-Smtp-Source: APXvYqzHD3pfx6q9nh69syRBCOZ0YNZGHAfGXI/a2C06AVCbE1vAuIr/EEnkJEKgeF0vz/XOtoOPKxOw1/gHfmfteNY=
X-Received: by 2002:a9d:1e88:: with SMTP id n8mr75315333otn.369.1577703505596; 
 Mon, 30 Dec 2019 02:58:25 -0800 (PST)
MIME-Version: 1.0
References: <CtiLrRxfJF8VjxK15ZVRrI9eJBflmVjOBKiOTYAHVAmF7lVPMuQvg3luFb89M3FKdy2fvemWnkfXd-LRJ1MCGy0GC2TddQuX0-Wga9hBS_4=@protonmail.com>
 <A02FDAAF-B405-4735-9DD1-95A7F6CE9B3F@lonnie.abelbeck.com>
 <bWad1d4zSz8UESfEBgTLTfDZQbC9-fLXfJF2R3GoONB9PuL3WjNnYrnFQOYmt-gQa9sLLMDJJ8p6zY8XEUlXxxudvzNC5OUjuG75yjbBMIY=@protonmail.com>
 <CAHmME9q1s8Ze40Uzi9+9PM8h=iWAs7_U=Zh2+5O8GjAjQKFeag@mail.gmail.com>
 <CAHmME9q=L1kyxSu8KBVMkZx6-A77RaAeCtXeOaYQbXGDho-Ujg@mail.gmail.com>
 <b01381cb-dd21-10fe-8223-19bbcf9fcca8@web.de>
In-Reply-To: <b01381cb-dd21-10fe-8223-19bbcf9fcca8@web.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 30 Dec 2019 11:58:14 +0100
X-Gmail-Original-Message-ID: <CAHmME9pj1V5s3UzYx3BGmgD9ffuOepHM76k5OGU1f08Xr9j-oQ@mail.gmail.com>
Message-ID: <CAHmME9pj1V5s3UzYx3BGmgD9ffuOepHM76k5OGU1f08Xr9j-oQ@mail.gmail.com>
Subject: Re: remove peer endpoint
To: em12345 <em12345@web.de>
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

On Mon, Dec 30, 2019 at 11:13 AM em12345 <em12345@web.de> wrote:
>
> Hi,
>
> in my case the reason is not exactly being able to remove the endpoint,
> but rather being able to setup a peer without endpoint, so that only the
> endpoint needs to be setup later.
>
> Scenario:
> All keys for interface and peer are configured via "wg" standard config
> file, so that the interface can be brought up at boot time.
>
> But when having to use a to be resolved host name as endpoint, then the
> boot process blocks for around a minute in case no network (incl. DNS)
> is available. At least when running systemd reading
> /etc/network/interfaces. I'm not using systemd builtin wg support.
>
> There is of course the possibility to bring up the wg-* interfaces later
> altogether. But the easiest way for me was to use a local endpoint IP
> (127.0.1.1) address, and then use up/down scripts triggered on LAN/WLAN
> up/down, which then only resolve the endpoint host name and set via wg
> the resolved IP of that.
>
> This way I'm also able to use several hostnames from different DynDNS
> providers, in case one service provider is down, which wg as far as I
> know doesn't currently support.
> I.e:
>         1.) resolve first host name
>         2.) set endpoint IP on peer
>         3.) ping into tunnel to see if it is working
>         4.) if not working, then try next host name
>
>
> Thanks,
>
> Emmanuel

You've misunderstood the discussion. Nobody is discussing removing the
ability to set an endpoint after the interface has been configured.
This exists and works today and isn't going anywhere. Rather, this is
a discussion about being able to unset an endpoint.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
