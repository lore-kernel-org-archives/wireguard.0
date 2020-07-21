Return-Path: <SRS0=mwgs=BA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB9E4C433E2
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 21 Jul 2020 13:30:22 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55942206E9
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 21 Jul 2020 13:30:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=acpr.dev header.i=@acpr.dev header.b="M+FpDv5C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55942206E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=acpr.dev
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5470dd01;
	Tue, 21 Jul 2020 13:07:23 +0000 (UTC)
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com
 [2607:f8b0:4864:20::a30])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 482f5a7c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Jul 2020 13:07:20 +0000 (UTC)
Received: by mail-vk1-xa30.google.com with SMTP id m21so4527991vkp.1
 for <wireguard@lists.zx2c4.com>; Tue, 21 Jul 2020 06:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acpr.dev; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JwmoYRH9Nn2N8IMyeR92UgYdPiymPmQ0Jrc83lb2mtg=;
 b=M+FpDv5CXlC6Y1C8Os+eaCSdcd2jsNskf5w9j0h+5WBvkhDL8qdQ/cocKdfJoHBogf
 d+Rlkw5/PC05R3SUBK4uomGtJFQDT0GLgfXO/fXj7pXx35AKPrPAk4SlkpRAU1RE6Rfi
 dgG0fJze2SxG6gHFW0pMwK+m0C7RMIObPdTAWa/MQLoioy7eo8WYHMHUXmMe6lHRgkr6
 XrVHYew41b+epF/377T+sSyjua+vLXwyngtKPA+/lx+DiQusA7EyLTh57XU+zUGP7eME
 eHcsLrwzrFH42Oqp6L8nxt3+LSagW6Uek6JlXrV23JbocY3ciONE/t862zipaeLTHh6h
 Y5gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JwmoYRH9Nn2N8IMyeR92UgYdPiymPmQ0Jrc83lb2mtg=;
 b=cHpiOVHnhydkBppWSjLeHY/oz2VxghUuVhDFDz6L/UApJ1+AdSOpifyPcB53dNehkg
 cySuzJMtDA2pzemzmVxEnU8Kr5kHlrSZhICCJbLZa0E1FMVeqlRhkgQ1F/bUmcxClEt5
 RWRulQ1a01uRu7UzoRJumN3LtDlQLMhJWLMnl9BYTy1Pe5YN8O5ojLGiiyfZXHGt5R2m
 HqwAtAOyF4OScA6gB8ZLJg8UmTdMYaHuqgHhUAU9e3gL8yFLN38KQPCL1yqhtYU4+n0J
 iCVpu7JbWpbPiJlsy6mJeIl45ic0ysP5YQgxx++tbyyVLV3Il+svU+2HGopVx7KBrev/
 SlHQ==
X-Gm-Message-State: AOAM5318tx6I/TUnR/X4gOdxnItzebE7qiWTHHv7vAumV//Ycuaz6mJR
 FAWIpX4lFROsnRQvAVKHbv3KVftSC7PsmOG7nkLVX+BPo4Q=
X-Google-Smtp-Source: ABdhPJywl8vHqUmxMXJQ9iSUUA51N7n27bpSPDcN7jy0nriJYxh3g6DyXG98X0iYHKJfv81CGtHp0//nMzsviVnwNY8=
X-Received: by 2002:ac5:c74b:: with SMTP id b11mr19846543vkn.73.1595338192190; 
 Tue, 21 Jul 2020 06:29:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAN00TTomuZoagZF2McBkDW1ZimSouN-jnDLm+Hq7OKeH-sF9zg@mail.gmail.com>
 <165a92238115e99b03740768d843a20f@cagir.me>
In-Reply-To: <165a92238115e99b03740768d843a20f@cagir.me>
From: Adam Cooper <adam@acpr.dev>
Date: Tue, 21 Jul 2020 14:29:41 +0100
Message-ID: <CAN00TTpNmGNuZcHc4aSRHaG26BmqbsdVLL4hYuArk+9RX3oVSQ@mail.gmail.com>
Subject: Re: MacOS IPv6 not functioning without custom static route
To: =?UTF-8?B?SGFzYW4gQmVya2F5IMOHYcSfxLFy?= <berkay@cagir.me>
Cc: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Mmm. It looks like unticking "Exclude Private IPs" and entering
"0.0.0.0/0, ::/1, 8000::/1" gives me a functional setup. Trouble is I
don't want to route the private IPs and ticking the box (whilst
retaining '::/1, 8000::/1') allows no traffic at all. There's
something odd about the way the client is configuring routes but I've
not got the expertise to figure it out :(

On Tue, 21 Jul 2020 at 14:12, Hasan Berkay =C3=87a=C4=9F=C4=B1r <berkay@cag=
ir.me> wrote:
>
> On 15/07/2020 14:14, Adam Cooper wrote:
> > ...
> > Probably worth mentioning that I tried to replace ::/0 with ::/1,
> > 8000::/1 but that just results in completely broken connectivity in
> > IPv6 and IPv4 - which may be another issue in and of itself.
>
> Did you try only having "::/1, 8000::/1" in the AllowedIPs option? I had
> a default route creation issue myself where I'm only trying to tunnel
> IPv6 through; and having this actually solved it.
>
> $ netstat -nr
> Routing tables
> Internet:
> ...
> Internet6:
> Destination                             Gateway
> Flags         Netif Expire
> ::/1                                    link#14
> UCS           utun2
> default                                 fe80::%utun0
> UGcI          utun0
> default                                 fe80::%utun1
> UGcI          utun1
> default                                 fe80::%utun3
> UGcI          utun3
> default                                 [ public IPv6 ]
> UGcI          utun2
>
> If just "::/1, 8000::/1" solves the IPv6 issue, I guess you can give it
> a try with "0.0.0.0/0, ::/1, 8000::/1" to see if both routes are created
> properly?
>
> Best,
> Berkay
