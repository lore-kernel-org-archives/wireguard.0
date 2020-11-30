Return-Path: <SRS0=v8Vx=FE=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F54CC64E8A
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Nov 2020 11:32:38 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54EE6206C0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Nov 2020 11:32:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="o9eorDto"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54EE6206C0
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 34c7fa2c;
	Mon, 30 Nov 2020 11:25:37 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 605de8a6
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Nov 2020 11:25:34 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 000126b4
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Nov 2020 11:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=yVY7XyfN341s1JMqaD7kp1xNPrE=; b=o9eorD
 toUnwe/NXJB+V/UjbnSulq0txv+aMRFjQSLg83ccRNBPNc+59VPEZku/WlavQLne
 N6aIiRV/6ah1tEFosLzHA2N96niTsNLMMWZx6xqCH4Cpf53NM6D+aJVajrlUlmNZ
 E1TqOe2q2Gk/ZnqqoOCrClgpjv00bCwCJzbBBzewOFg1Jr9ChxNdQ6gsN1q4xTzY
 pV96pZTm1XInt9mTy5ysjxW6CtQIbxC+KAldHQV5Lvpf66co/hDRY21Uz+kOsOv3
 KW/q6bhwWZTSKWnlYBmHKHX79Xnro+LWGgnLPTUVS8HdjmlokJFfLZYAd1oAiyAW
 t1999V9WjyLy+psQ==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 54e4dd42
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Nov 2020 11:26:20 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id r127so11037651yba.10
 for <wireguard@lists.zx2c4.com>; Mon, 30 Nov 2020 03:31:51 -0800 (PST)
X-Gm-Message-State: AOAM532ojoeg8Asx5AO24KfkaPHsc8jUYHJQpJ1wfXchOdMRIzT9yfkC
 ovHmm+zw8CIb+6/4Czl7ArNAw90UPwYIQ/SVZE4=
X-Google-Smtp-Source: ABdhPJyCEhO2Y0nxAGGtiQ2RK5hGNbhqY0xlJgHuVOGDqEX7dyqkNkU6i5poj8bhAUI1Yz8QY+LjBLOyoxpIdq7Z528=
X-Received: by 2002:a25:2054:: with SMTP id g81mr29305877ybg.178.1606735911267; 
 Mon, 30 Nov 2020 03:31:51 -0800 (PST)
MIME-Version: 1.0
References: <trinity-8b39e676-4010-4d53-9bc2-9ca84bcf3a85-1606583048495@3c-app-webde-bap18>
In-Reply-To: <trinity-8b39e676-4010-4d53-9bc2-9ca84bcf3a85-1606583048495@3c-app-webde-bap18>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 30 Nov 2020 12:31:40 +0100
X-Gmail-Original-Message-ID: <CAHmME9r1mDGsH0FYu+PcZE0Uuipqs7_eaz6Yr7XxQZRnuddDMg@mail.gmail.com>
Message-ID: <CAHmME9r1mDGsH0FYu+PcZE0Uuipqs7_eaz6Yr7XxQZRnuddDMg@mail.gmail.com>
Subject: Re: wireguard on multi user windows ?
To: Henning Ryll <henning.ryll@web.de>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hi Henning,

That's an interesting inquiry. I guess the thing to point out is that
generally speaking, the networking stack is per-system, rather than
per-user. That means that while you're using your OpenVPN profile with
your account, some process still running by somebody else in your
family could be transferring data over it! Linux has network
namespaces to assist with properly separating, and I _think_ that
possibly the UWP VPN api on Windows might support this? But I'm not
sure. It's possible to match packets using WFP with
FWPM_CONDITION_ALE_USER_ID, but I haven't yet worked out how to apply
this to routing rules (and doing a VPN in a filter driver rather than
an adapter driver isn't very appealing).

In other words, neither OpenVPN nor WireGuard actually support your
use case. OpenVPN characteristically just opens up a potential
security hole, so you think it's doing what you want, but it really
isn't.

So the short story is that for the time being, I'm not sure how to do
per-user VPN on Windows with what we've got (adapter-level redirection
using the routing table), but I also haven't looked very hard, so it's
not a total impossibility either.

Jason
