Return-Path: <SRS0=oTJ6=DN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3E75C4363D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  6 Oct 2020 13:47:57 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0514220796
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  6 Oct 2020 13:47:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="NwAR9AHH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0514220796
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aff80431;
	Tue, 6 Oct 2020 13:15:25 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a78a67c4
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 6 Oct 2020 13:15:23 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2bda4e34
 for <wireguard@lists.zx2c4.com>; Tue, 6 Oct 2020 13:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :in-reply-to:references:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=Ef4Sb0225YVpNJmhL06X1UoRlno=; b=NwAR9A
 HHvmqBGInQDYpxRFv8spm8ZXYg38rGDrper/H04Ckn2OY5b5fB4o2P5RMCjRqz+T
 U2OWDLj81biSjlAbICxlpmfKTkLZAoRYgWfTn5MhGGnQwiB9G8A3B0psipTk14/X
 UF5xZ39hgpgyDgBKAQT6XsIoJgEHRZ+HD4Zraq4n8FFgihccfsZRbw6/v/2GuZ6o
 kbEbr3srS+XdOsycVkRID2Ns8JQL9gXhrVVVoOn41hrubg/dtPneoBgeZdvAW678
 E9QvG/W0hNhHpn7j2cSFSWk6QgOufZg25cbHRCm9hyNLWMN6ZHvNuz/kESlB3Ec5
 bJlEWwyBaI++WiKw==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 52341c4f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 6 Oct 2020 13:15:23 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id d20so8120992iop.10
 for <wireguard@lists.zx2c4.com>; Tue, 06 Oct 2020 06:47:53 -0700 (PDT)
X-Gm-Message-State: AOAM533G0K5oARcLQRveY7fjKo0+fabPYsvvJaaWevxSJ8IJfWzqyxFf
 pgbPO3PSHZrBitzFdHE7gSWkfrEfsSCF4MSo6kw=
X-Google-Smtp-Source: ABdhPJw/fSCj1QGbdul8ojaaSOJMb9/zU6xn+uyDS3nbuWTdepmoO2V3G8jX5E73wu43KG2uwYNNXTYqFo2oHZWj0RY=
X-Received: by 2002:a5e:d606:: with SMTP id w6mr1165958iom.67.1601992072671;
 Tue, 06 Oct 2020 06:47:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a92:159b:0:0:0:0:0 with HTTP;
 Tue, 6 Oct 2020 06:47:52 -0700 (PDT)
In-Reply-To: <79a4e995-763c-9724-02b7-81da87c0f88a@spam-free.eu>
References: <mailman.0.1601114111.20018.wireguard@lists.zx2c4.com>
 <ebc8ff04-a073-13a8-2f80-a5cf01ab8416@spam-free.eu>
 <CAHmME9qUWGbuSasA+xxoJO+ycog9+S6TPW9aPF8fFDkgaQDP3g@mail.gmail.com>
 <79a4e995-763c-9724-02b7-81da87c0f88a@spam-free.eu>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 6 Oct 2020 15:47:52 +0200
X-Gmail-Original-Message-ID: <CAHmME9pYFjNC+g85BNaaYUsVp9h5mxrGtGZwvZ-WRrSxXEHNgA@mail.gmail.com>
Message-ID: <CAHmME9pYFjNC+g85BNaaYUsVp9h5mxrGtGZwvZ-WRrSxXEHNgA@mail.gmail.com>
Subject: Re: wg-quick up (on linux) fails in case of several default routes
To: Chris <wireguard@spam-free.eu>
Cc: wireguard@lists.zx2c4.com
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

On 10/6/20, Chris <wireguard@spam-free.eu> wrote:
> Hello Jason,
>
> setup is
> two default routes with diffenrent metrics (the second being the failover in
>
> case the lower metric connection goes down).
> For good reasons wg-quick will setup an individual route to the wg server
> (for
> the possibility of changing th default route afterwards).
> However wg-quick fails:
>
> ******log follows***********
> wg-quick up wg_client
> [#] ip link add wg_client type wireguard
> [#] wg setconf wg_client /dev/fd/63
> [#] ip -4 address add 10.0.129.200/24 dev wg_client
> [#] ip link set mtu 1420 up dev wg_client
> [#] GATEW=$(ip route list 0.0.0.0/0|sed -n 's/.* via \(.*\)
> dev.*/\1/p');route
> add s1.spam-free.eu gw $GATEW
> SIOCADDRT: No such device

Where did you get your wg-quick? I would never name a variable 'GATEW'
or print out an expression like that to the console. IOW, I don't
recognize what's happening here because this doesn't seem to be code
I've shipped.


> [#] ip link delete dev wg_client
> ******log  end  ***********
>
> The point is, that GATEW is NOT a single address but rather a list of ip
> addresses and the command setting the route fails.
>
> Instead one should always run through ALL default gateways and set
> individual
> routes to the server through ALL the default gateways with the same metric
> as
> the respective default route.
> This will then also work in case the failover route is in operation.
>
> Of course, tearing down the client should delete ALL individual routes to
> the
> server.
> Hope this clarifies is a bit.
>
> Cheers,
> Chris
>
> On 06/10/2020 14:20, Jason A. Donenfeld wrote:
>> On Mon, Oct 5, 2020 at 3:51 PM Chris <wireguard@spam-free.eu> wrote:
>>> wg-quick tries to set the route to the wg server through the default
>>> gateway.
>> On Linux? It shouldn't be iterating default gateways at all, but
>> rather using suppress_prefix. Can you provide more technical
>> information about what you're seeing and maybe a patch to fix the
>> issue?
>>
>> Jason
>
