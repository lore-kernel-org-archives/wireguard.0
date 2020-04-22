Return-Path: <SRS0=JEDp=6G=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CDD6C38A30
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Apr 2020 06:27:18 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4888206CD
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Apr 2020 06:27:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="mrGOhfYj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4888206CD
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3adeeba5;
	Wed, 22 Apr 2020 06:16:26 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id eb7991cd
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Apr 2020 06:16:24 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0841ffa1
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Apr 2020 06:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=Uehlb2Q1NbpPTv2SoCRdL4Q6SF4=; b=mrGOhf
 YjGvF4KgY6slPdROQGwAgFDo3eomALbBpuAoWUoVj9lskhVm/HsInYwgO5O1/45C
 05r8q7SxHgDJflN9tjj9P7HIPHtzWuJwwcA0irErtI+XPoch8dPs0sm7B1CJ2C0p
 UTyboijkfareTS3q/Vtb2anmIDrMPtHFDtS+7NwKD2i9Eepa3Iqasrk6PGsrG6nt
 aoOnTSRGQoD01BohJy4pnFisH34owwoePOhXGv2twivpQDS/5jGQeo01zmAlb91i
 3/S9cWB1bhJyoiCTKl7iXUX8N2aNcnNCpa5+HpgJk3ZiQxY3KQFJw/Ex7/sdQ52s
 FbAWjlD0wAlFHIUQ==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a9d27154
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Apr 2020 06:16:24 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id q10so802666ile.0
 for <wireguard@lists.zx2c4.com>; Tue, 21 Apr 2020 23:27:13 -0700 (PDT)
X-Gm-Message-State: AGi0PuaPVZBBgXG4bYXHzvUxKRPM8FhM9Gnhdo4ylknq/qqk1LXW9Rhm
 H4YjvNnaV5bfdQvwDu0M7xc1lgY/zYW7dwnt7TI=
X-Google-Smtp-Source: APiQypLPVfLg8zJ7gz5Bq24SqvMynIuEsKpkMKME1EcQewetJu9/4M70wWw/ymirtysCzgj6r69TZO2UTSShOj0i2zE=
X-Received: by 2002:a92:d98c:: with SMTP id r12mr25229133iln.224.1587536833413; 
 Tue, 21 Apr 2020 23:27:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200422062513.13953-1-sultan@kerneltoast.com>
In-Reply-To: <20200422062513.13953-1-sultan@kerneltoast.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 22 Apr 2020 00:27:02 -0600
X-Gmail-Original-Message-ID: <CAHmME9p=_oBBGGCSqshbFsOeS=Hg7RBnoEZ--MPO5jiJS+P4Ew@mail.gmail.com>
Message-ID: <CAHmME9p=_oBBGGCSqshbFsOeS=Hg7RBnoEZ--MPO5jiJS+P4Ew@mail.gmail.com>
Subject: Re: [PATCH] wireguard: remove errant newline from
 wg_packet_encrypt_worker()
To: Sultan Alsawaf <sultan@kerneltoast.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Netdev <netdev@vger.kernel.org>
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

Applied to the wireguard tree and will go out with the next wireguard
update patchset I post on netdev.

Thanks,
Jason
