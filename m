Return-Path: <SRS0=P8C1=77=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42A52C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Jun 2020 19:49:15 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D713E207DD
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Jun 2020 19:49:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="ExIeLhiu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D713E207DD
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f962b09b;
	Thu, 18 Jun 2020 19:30:58 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2efd8931
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jun 2020 19:30:55 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2e528a89
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jun 2020 19:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=jdlgHsvfOjcJHNI3jmaP1jnk7Fo=; b=ExIeLh
 iu4bVALRqYrH5tN8xtBvRXJ/oTjX3V6pRSQ/gFfkUiGwSw2rmxo1BN9F0OnJo4II
 pEhkYo/Ajb4+l1jyVJLYwD6fbQzVgIEC4/kp/sNTKVgWIlYeqIakZRB+3sQUYbWi
 A042/odoEuHpnuCo8u/lKUmfWO6lu7Ws/JmsxjGMK4vRY22u8JBJt2C4LX86JaXJ
 BEeIKIlcNSP26hJKhPKRTuI2muZrdaDy5mjItvLjbsmFsntK7H775q9bbvp4G5bj
 UrDCx3g9hemqgoc1oZoAj8tCriGa1JmGhLwyA3YkU0QRB1e7OVBx8TVgjNVQTZYJ
 3pLuu03PUOWhYO7w==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a64d921d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jun 2020 19:30:55 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id o5so8528816iow.8
 for <wireguard@lists.zx2c4.com>; Thu, 18 Jun 2020 12:49:11 -0700 (PDT)
X-Gm-Message-State: AOAM533MsMrQaShgf+H77cySt8mGu90tFCdTctKsmgAAvtrdtjxB4KUJ
 CaqkX4QUDx/+WsthXCjUwoZGDfgRIC94U8NJkfw=
X-Google-Smtp-Source: ABdhPJyM5fkELsa+0PHhOz/cIkg+Myd5vGtFC/7xfLf0qMdOpxiDUheJyypZlZ3gZlpheRg7/+VpmCpkkZoQlLZjjYg=
X-Received: by 2002:a02:c917:: with SMTP id t23mr265039jao.36.1592509750573;
 Thu, 18 Jun 2020 12:49:10 -0700 (PDT)
MIME-Version: 1.0
References: <1592249458.376720421@webmail.emailsrvr.com>
 <CAHmME9oz5tt9u5S3V6JikvB3oGihXR5rcZTLvcjxNu4qnvWCOw@mail.gmail.com>
 <1592454690.22771558@webmail.emailsrvr.com>
 <CAHmME9qyk41mAvSiEePmZDrmmsBwOVSejg8q+oXV7nb=Jo1SAQ@mail.gmail.com>
 <1e6ef75d-3657-888a-51dd-0bedf8783904@sysnux.pf>
In-Reply-To: <1e6ef75d-3657-888a-51dd-0bedf8783904@sysnux.pf>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 18 Jun 2020 13:48:59 -0600
X-Gmail-Original-Message-ID: <CAHmME9q_eTwyLJ7z4RP4nJqEz9yu+9VH3oXm0j9Zx_Br3cFWEw@mail.gmail.com>
Message-ID: <CAHmME9q_eTwyLJ7z4RP4nJqEz9yu+9VH3oXm0j9Zx_Br3cFWEw@mail.gmail.com>
Subject: Re: Kernel Panic after updating Kernel
To: Jean-Denis Girard <jd.girard@sysnux.pf>
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

On Thu, Jun 18, 2020 at 10:48 AM Jean-Denis Girard <jd.girard@sysnux.pf> wrote:
> For what it's worth, I seem to have the same problem on a CentOS-7
> virtual machine hosted on VMware with vmxnet3. It has been working fine
> since installed in 2017, but does lock up after upgrading to
> kernel-3.10.0-1127.8.2.el7.x86_64 or kernel-3.10.0-1127.10.1.el7.x86_64.
> The VM is now running fine on kernel-3.10.0-1062.18.1.el7.x86_64.

I am unable to reproduce this issue with vmxnet3. However, as I noted
earlier, your wireguard version seems old. Try updating everything at
once, and then see.
