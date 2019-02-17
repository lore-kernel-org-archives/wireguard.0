Return-Path: <SRS0=tjuz=QY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E9CBC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Feb 2019 01:47:35 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1927521A4A
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Feb 2019 01:47:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="x5I9/JR1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1927521A4A
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 061a5b19;
	Sun, 17 Feb 2019 01:39:20 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id adf42760
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Feb 2019 01:39:18 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1c3023d9
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Feb 2019 01:39:18 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e4216530
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Feb 2019 01:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=4B7HjmZI+PX6HYBXB9q5VyI3o8E=; b=x5I9/J
 R1Lvc9lk5WhNmkv/lwYaWoK7NgB6gNsX3lET0wgE+4X1cuv2sIuLSv7eDLhaqMEA
 gwopoloRUvCR8cWHfA06Qv9XDiFnQlwzjr0R8WrtbJNJuzPfnByjt1Z/rIdylTsT
 2vLuPSLhZfKJIVdTcPZcf8DszGVt7DPTTW+Gky5MS7hVvneWLikuGcwOWQus7lB4
 8+s+g0fDTKM+8gdK08xA5cPQKuvtMsJw5d2mrhMJEBnpyYikWLZbQLa1MpKLS5dI
 MBttGf0Nh9DHgirmapsuf6T5+RWNmSr0gJ192NaoG/uxW6cj+PPxecLol2Fscq0i
 uAVRJmT5PHxh2wOg==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 56faac99
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Feb 2019 01:30:04 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id n8so22858814otl.6
 for <wireguard@lists.zx2c4.com>; Sat, 16 Feb 2019 17:47:31 -0800 (PST)
X-Gm-Message-State: AHQUAuYpldOeMOkG2K4lUSpN7o23aShDav7mAyagBMS4MWYAL8s3oGra
 DF8y/P9/Zf6K+Ou347zeWHTxsabOvvWnqpeMFzY=
X-Google-Smtp-Source: AHgI3IZbuzFoDmV2bqfhiFF5LmA5l9cofuHG0/EY0nEc6dFdWxS3Kflr/h5LZP6d/b2CxXnBj2A8ntbNldkyQZHvseE=
X-Received: by 2002:aca:4f8c:: with SMTP id d134mr10501685oib.74.1550368051318; 
 Sat, 16 Feb 2019 17:47:31 -0800 (PST)
MIME-Version: 1.0
References: <71ef4a71-19fe-8d4e-c3a2-f704ad8e8b67@anatoli.ws>
In-Reply-To: <71ef4a71-19fe-8d4e-c3a2-f704ad8e8b67@anatoli.ws>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 17 Feb 2019 02:47:20 +0100
X-Gmail-Original-Message-ID: <CAHmME9oWg6E0PyQP0-uTC-WfN4gkYhUrd+gYTT390CnfT8ufZw@mail.gmail.com>
Message-ID: <CAHmME9oWg6E0PyQP0-uTC-WfN4gkYhUrd+gYTT390CnfT8ufZw@mail.gmail.com>
Subject: Re: BUG: unable to handle kernel NULL pointer dereference at ..
 (linux 3.13)
To: Anatoli <me@anatoli.ws>
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

Hey Anatoli,

I just tried reproducing that and wasn't able to, using:

root@ubuntu:~# uname -a
Linux ubuntu 3.13.0-165-generic #215-Ubuntu SMP Wed Jan 16 11:46:47
UTC 2019 x86_64 x86_64 x86_64 GNU/Linux

I updated the system to the latest 14.04 packages, rebooted, and then
cut and paste your directions above. Things seemed to go fine. Are you
able to reproduce in a fresh environment?

Also, could you email the crashing wireguard.ko, so that I can see
exactly which instruction corresponds with wg_socket_init+0x13c/0x3f0?

Thanks,
Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
