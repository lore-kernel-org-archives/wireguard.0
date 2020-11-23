Return-Path: <SRS0=uuIP=E5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BBF0C2D0E4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Nov 2020 14:44:44 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B23F12075A
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Nov 2020 14:44:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ag7LAB7P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B23F12075A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a7b78abd;
	Mon, 23 Nov 2020 14:38:52 +0000 (UTC)
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [2607:f8b0:4864:20::52e])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 300b68f3
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Nov 2020 14:38:50 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id 34so14436962pgp.10
 for <wireguard@lists.zx2c4.com>; Mon, 23 Nov 2020 06:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=VTBea6WI0Om7Mx4us9QAnAIIFOAUO6CWzcEk6S20FuY=;
 b=Ag7LAB7Py+W6zSI7VXhdLBjaMHelGLKoCXc+ffY+gqp1h5/6JvV41vUGi90FoCiy1C
 3vHnI6gXGdHfP7OZg6tUVeAANKFbq6UftaSMjpIP+zIipP5OvGMQXf4rUUtyRqDvgI8x
 I+XqqAR62Aba6c/LB2CVnQhC8ho765y/ZrX3RGsbXvFB9Voime1vQA0zgCi0oZINZ0et
 wA6hT8gXPs/Qp0/DQq5X4YaYnN34wW+909O4DJs0qYIV2QNKlx5nOI6xI1ZpkPBu3xx4
 vlBSE8LdrJ9TWDdDI0pp5qkd43XRAg00Hvp1k/uPkK6Pl0kCZnNaut7qUYuJs4978c62
 3ECA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VTBea6WI0Om7Mx4us9QAnAIIFOAUO6CWzcEk6S20FuY=;
 b=PPKPi9ZZmaEmZPKjanLDKKxOfWYd5DX44h9ihUw7YdZZLAcwaErJ+QDUU6cFUWanki
 oTdeaqCnLiuwG0Zmcy1weUrTyubbF7RfNQjh30KFY0953ktl4ZpMZNWa2xKKexvtMTMa
 UOpXxS8JHWriMu11xOoMRYvdjM21UiYA6xn8ZVFpRbNf9PoCCfPjcqvQNX0dBzUWiDdf
 6BSZJMyE5ykoB87bMEo9+c5Vgmdy/9K673KJLPB/LBQqGToynq49nWLt/ZaHDMXvm/LA
 6PJfhlRzJYQS/NgiqH4615byp2Et3qf1pYUPr3R9FJ08TE17clXFVkBG6NOa9yvfcYBq
 PWhg==
X-Gm-Message-State: AOAM532up7NdVdruggdToHtUwYznoV4f0Lq2AJ4SF7pBxqEBXaxCjk5C
 5Xc0pvHKJ6MWWea7PdnaNif9ZC5Z5W4=
X-Google-Smtp-Source: ABdhPJyNZW/rlZvq1B8JAEoZoq9/5aqc1Ofz1PlSbb4i2bLE7Xn+CjPPl0FWZaSIk+FQhzVEvI9edw==
X-Received: by 2002:a62:2ac2:0:b029:18c:25ff:d68 with SMTP id
 q185-20020a622ac20000b029018c25ff0d68mr26068020pfq.64.1606142653617; 
 Mon, 23 Nov 2020 06:44:13 -0800 (PST)
Received: from mua.localhost (99-7-172-215.lightspeed.snmtca.sbcglobal.net.
 [99.7.172.215])
 by smtp.gmail.com with ESMTPSA id c19sm12323319pfp.1.2020.11.23.06.44.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2020 06:44:13 -0800 (PST)
Subject: Re: Using wg-quick without having it set routes
From: PGNet Dev <pgnet.dev@gmail.com>
To: nikolai@lusan.id.au, wireguard@lists.zx2c4.com
References: <6492535965d6a99ee429384b762b29b8631e2ec5.camel@lusan.id.au>
Message-ID: <5304d1a7-315c-5a98-71af-aeacf15aa293@gmail.com>
Date: Mon, 23 Nov 2020 06:44:12 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <6492535965d6a99ee429384b762b29b8631e2ec5.camel@lusan.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 11/21/20 4:59 AM, Nikolai Lusan wrote:
> Hi,
> 
> I have recently started using wireguard as a VPN between my home
> network[s] and my external servers. In addition to this I have been
> deploying it on other machines I would like to have connected to my
> network via VPN (mostly friends who I want to have access to my
> internal network, and me to their machines for remote admin/trouble
> shoothing).
> 
> I am running Debian and had set things up using
> /etc/network/interfaces.d/ files. I was wanting move to use wg-quick
> with systemd - trying to bring up newly created interfaces on the main
> server/termination point using wg-quick leads to wg trying to create
> routes for all IP ranges in "AllowedIPs". I would like to be able to
> _not_ have this happen, is it possible? Or should I just stick with the
> interfaces.d file method and "auto wg[0-N]"?
> 


You can disable auto-route generation with

	Table = off


e.g.,

	Disable (auto) routing for Wireguard
	 https://shibumi.dev/posts/disable-routing-for-wireguard/

Of course, any required routing is then your responsibility ...
