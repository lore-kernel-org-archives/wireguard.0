Return-Path: <SRS0=gQ6O=UF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAE45C28EB2
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Jun 2019 10:14:02 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2819220866
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Jun 2019 10:14:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="JxfblKAO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2819220866
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4a55a0c2;
	Thu, 6 Jun 2019 10:14:01 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a930ebc8
 for <wireguard@lists.zx2c4.com>; Thu, 6 Jun 2019 10:13:59 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e6d7dcd4
 for <wireguard@lists.zx2c4.com>; Thu, 6 Jun 2019 10:13:59 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9d7931c8
 for <wireguard@lists.zx2c4.com>; Thu, 6 Jun 2019 09:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=aKIRd3Ek52H8HUbp820argc4okw=; b=JxfblK
 AOYGCQ7qnwHZ5pRQ6fp+LhLYaWJ7AvUVrN37/MQqA1iHb4aRsLS7uDl0oN2bXTHZ
 r48jcBIOk7p0YDkGA99NJNaLbFcfpj1mEDAQ8Akb3JSsJvIzxR+4SkrJy6YCxQTS
 TertO35Gsjc3Txy3OcCdhiHywYAAWRRxcAOh31Jzirlg5Eru/fqtqF5DUZtAPnVE
 G0UrCsgRjxJAzfFvjkal7fPqcncGVUxFBc/ErQC+KE2gas7H4UbJ1yaTlKJwQJeb
 9/th8HoYvRtVlmYFCnwsW3iLhTECnjhs5FA+R6Q4nY10Gi4eEwAXisngAWaqStSV
 6JOIV4wabOLlCLKw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 46d1cc92
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 6 Jun 2019 09:42:31 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id v186so1163001oie.5
 for <wireguard@lists.zx2c4.com>; Thu, 06 Jun 2019 03:13:59 -0700 (PDT)
X-Gm-Message-State: APjAAAV7deccF9XujqAXEkK9/vzpXIYf3Drtd5+W2s0y6I6ntYyWgn3L
 EzX8zB/NPRRk3vHTmGxevOrbdFRCYAjiWm6C0cg=
X-Google-Smtp-Source: APXvYqzmOwKdLUxSkHoREtNR9MG6rpDPNTH4bESxsd/Fva0Hm1j+MBZKtAmEtlXgqy7brOGjUPGfUm8MqBXbNea62iY=
X-Received: by 2002:aca:ccd2:: with SMTP id c201mr7551051oig.119.1559816038659; 
 Thu, 06 Jun 2019 03:13:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAEx8eyTU2-auBDfyy+-1_-byUYheoxFKLaXsN9t+_CTXrGBzsQ@mail.gmail.com>
 <CAEx8eySO6DE-VeLsn3BYz=Kj-_kfU_WHqSmOTTpG367j51qCdg@mail.gmail.com>
In-Reply-To: <CAEx8eySO6DE-VeLsn3BYz=Kj-_kfU_WHqSmOTTpG367j51qCdg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 6 Jun 2019 12:13:47 +0200
X-Gmail-Original-Message-ID: <CAHmME9rLfPE74av0JDOwmc8P2bwxo5y3gN6EKvK_HQWoBnQqnA@mail.gmail.com>
Message-ID: <CAHmME9rLfPE74av0JDOwmc8P2bwxo5y3gN6EKvK_HQWoBnQqnA@mail.gmail.com>
Subject: Re: Minimal WinTUN Program Access Denied Opening Tun
To: "Christopher O'Connell" <jwriteclub@gmail.com>
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

Hey Chris,

Glad to hear you're playing with Wintun. Indeed we're keeping it
locked down to SYSTEM for the time being. As we gain a better
understanding of the attack surface, maybe we'll reduce that to
built-in administrators. But you can pretty easily impersonate SYSTEM
if you have enough admin privs. Here's some code I wrote to do it from
Go: https://github.com/WireGuard/wgctrl-go/issues/36#issuecomment-491912143
Just replace the "DialPipe" invocation with "os.Open(path/to/wintun)".
Or if you want to do it from C, here's something similar:
https://git.zx2c4.com/WireGuard/tree/src/tools/wincompat/ipc.c

Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
