Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00FBECAAA1
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 19 Sep 2022 18:56:55 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id b71ec8e0;
	Mon, 19 Sep 2022 18:55:56 +0000 (UTC)
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 3e35952d
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Sep 2022 18:55:54 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id l14so831699eja.7
 for <wireguard@lists.zx2c4.com>; Mon, 19 Sep 2022 11:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date;
 bh=iTfT4HYu7B36yKASZVY6qmvxxT/pyNR1DKibSrTtgX4=;
 b=H7meMBsdJiziBwWM6yQlmrGPrRUZNYoN2Sj/gy7BI2HDh9xBA2fQ4kJMWDzWFk3GIZ
 iT3VRVUg2cZiy/recz9Rtv8Jb5dDT1aG198O5eb1KtEDgMJMNlqyQVEDEJ8uGXRdCmHv
 vvKln/KUPCh6Rq2LTpj88z/AKmWQXPCTJmWs0tcAxM1oQWN7OGjyqE2XnR+Wl86DVhox
 BngYclH6OjCQCGxrMR+mSuQ3RFRsbLL/exXJeOGgpRoe1G1+QL4FufBZn+a7tRVmz5yI
 k7CIP0IeuEXIRN7YqpU+mfXmN8/7TOGNnHXA06UtJuZ50NEVx917z7t1canqO4r71gSd
 mLEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date;
 bh=iTfT4HYu7B36yKASZVY6qmvxxT/pyNR1DKibSrTtgX4=;
 b=Np5rcr8Rk5i/PSvDiAJOOYoht+Z7MVa3kbAxIviPkiuEnp7qj4sKW4ZgXNRSf3MFxY
 rcomBuVpF5Mqu5o1hO8+xoMRuDtuPBaN30WesnV5grtK311EhrY0fVKCs04v2tET7xtX
 vutU6Q+YLJLb5CIwploCah9qc3IfHzhbqBlfY7VYufdkxlPnp2DgNoOOJ/bm7hV3AA3g
 tzvZ1szeFNjA8WLEswtZpCU2XX+b8dwc7h+PBg2efjAOwVBuuoSKs7xJeBv1Zx8a9TsI
 YnYLS6Os47AG4eHCz2KBiA3qfFS8a1ZBrLE9QKlkhrblAPj0W8horyLS/flLR0qm/5fh
 fFiQ==
X-Gm-Message-State: ACrzQf38KPbLtQWgg9Mi2nk5fm7SYNmcdRKpJ8jRz577KauWHaEGbmaH
 qFSUnj1lCZhMFa7vJCnLgEskGanZP4odolGzuNCeFLqXtBM=
X-Google-Smtp-Source: AMsMyM4mZoTOMe6y6snzo28/g2y4S83AlckZCmoLc3NUSh583edHQ+VesN/lW36JHQv7f7GBvTw4FQpdsYUfZ4NhBM0=
X-Received: by 2002:a17:907:2d89:b0:77f:cc16:f3fe with SMTP id
 gt9-20020a1709072d8900b0077fcc16f3femr13448131ejc.610.1663613753629; Mon, 19
 Sep 2022 11:55:53 -0700 (PDT)
MIME-Version: 1.0
References: <CADjMg7XtPWoozpBikNGP=EDCYvH=dr3Uo60emPXGvUv0MbJvVQ@mail.gmail.com>
In-Reply-To: <CADjMg7XtPWoozpBikNGP=EDCYvH=dr3Uo60emPXGvUv0MbJvVQ@mail.gmail.com>
From: Devanath S <s.devanath@gmail.com>
Date: Mon, 19 Sep 2022 11:55:42 -0700
Message-ID: <CADjMg7VnQ4Zq=fA7nNJNH+b_5DcZdJpZ1-FfKC1caFB49rkBFw@mail.gmail.com>
Subject: Re: wireguard-go on MACos
To: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>
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

Hi Shulhan,

Yes, we already do that. In split tunnel mode, we cannot make all
traffic to reach the wireguard server (only a subset of the traffic is
routed through the tunnel).

SO the feature is specific domain name requests will be directed to
dns proxy running on wireguard device => proxy forwards to wireguard
service (where the dns server resides) through the tunnel. For the
rest of the domain names, they are resolved using the primary DNS
server on the desktop.
This works as expected when we run the DNS proxy on localhost. But
want it to listen on wireguard device ipaddress instead. This fails on
MACos. Hope it makes sense. Thanx in advance.


Regards,
Dev
------

> Hi Dev,

> On Mon, 19 Sep 2022 10:47:29 -0700
> Devanath S <s.devan...@gmail.com> wrote:

> Hi All,
>
> We are using wireguard-go on MACOS/LINUX and a dns-proxy is listening
> on wireguard device. dns-proxy is receiving dns requests from the
> desktop (destined to wireguarddeviceip:53) on linuxos. But the same
> does not work on MACos.
>
> I have tried to create tun/ap using go-library (water) and was able to
> receive the requests, but the same fails when using a wireguard device
> created using wireguard-go. Also ping to wireguard device ip from the
> desktop fails miserably.
>

I assume you want to make all peers request to the same DNS server, yes?

In that case, instead of installing dns-proxy on each user, setup a
central DNS server and let the WireGuard handle the rest.

For example, in my experience, I setup rescached [1] (or any DNS
caches/forwarder) on the "server" peer at 10.8.0.1 and set the DNS
option on each "client" peer to that address

  [Interface]
  ...
  DNS = 10.8.0.1

With this mode, client does not need to install or setup anything except
the WireGuard application.

On Mon, Sep 19, 2022 at 10:47 AM Devanath S <s.devanath@gmail.com> wrote:
>
> Hi All,
>
> We are using wireguard-go on MACOS/LINUX and a dns-proxy is listening
> on wireguard device. dns-proxy is receiving dns requests from the
> desktop (destined to wireguarddeviceip:53) on linuxos. But the same
> does not work on MACos.
>
> I have tried to create tun/ap using go-library (water) and was able to
> receive the requests, but the same fails when using a wireguard device
> created using wireguard-go. Also ping to wireguard device ip from the
> desktop fails miserably.
>
> I am kind of blocked, Appreciate any help regarding this.
>
> Regards,
> Dev
