Return-Path: <SRS0=zozX=E2=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF250C63777
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 20 Nov 2020 12:52:31 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F25722240
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 20 Nov 2020 12:52:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="mp+ZsFVN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F25722240
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 445358ae;
	Fri, 20 Nov 2020 12:47:28 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 31ebdbda
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Nov 2020 12:47:26 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 35db397d
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Nov 2020 12:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=76TSHcKoeZzIdw9tZh1+xb36m50=; b=mp+ZsF
 VNZlW1ZhUQWcsC/NVk6/pVVzB7N7WzSrfSs5l5oeg/LjJmvpeVpBwxWDzD4GpuPH
 9MWb5mKDEJ5p05PkE1JRChp2zOkrguLvm/cWq235EJ4YTOg8mKV8/TWBL1s+iCLY
 r1Vw/6f98RmBc4O0CFBQoB4S+Urcn6axmzgEIdSZMSR8xH1p8OH5adM4g4r+jryp
 4HeajYgphHHsxyIGgECx7G4BKpRoBvtgDnURXFnn0ikAvA1+ZDH4gUDBNA9HjV3v
 RDRMMt/A20jZdjOxXqGVM3ynFtkVc0Pxof27yiZUAtQ5HQM0w/eGXILA8ErWxe/0
 XeQIV46WOIsSc8Xw==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 46601edb
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Nov 2020 12:48:12 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id o71so8484147ybc.2
 for <wireguard@lists.zx2c4.com>; Fri, 20 Nov 2020 04:52:26 -0800 (PST)
X-Gm-Message-State: AOAM532MOAFmeseh6zUU/HlY3bO01K6gwy+PxJxR4GA5bb5ePEaTqZwE
 jFjbK9ZkiS9kidjFA0D6PjRVOLc5SU1I0W0JSm4=
X-Google-Smtp-Source: ABdhPJzBxMM1myOMggb7sneX7GwImNZT9VwcPWCJOFsozAgAUOhe6yslK17swxdpK2UGQDTwGRDj/odI9AwHxM+A6os=
X-Received: by 2002:a25:4943:: with SMTP id w64mr18100313yba.178.1605876745715; 
 Fri, 20 Nov 2020 04:52:25 -0800 (PST)
MIME-Version: 1.0
References: <3415567b-5441-f3b1-7a38-f0bae3a14cfc@werehub.org>
 <CAHmME9p6FoUsFou0LkeUZt4Ba1K4ycuA6f8X4c6Kt8-jzkAH7A@mail.gmail.com>
 <665e0a8610984d938ab013ec2aac8517@su.se>
 <CAHmME9rRY-+kdWLnJGsGvZJHDDAChuv2fDSDWOV9_w6=if6tmA@mail.gmail.com>
 <6c0c1208b52848bea8b1d0f1ac0dfa3a@su.se>
In-Reply-To: <6c0c1208b52848bea8b1d0f1ac0dfa3a@su.se>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 20 Nov 2020 13:52:14 +0100
X-Gmail-Original-Message-ID: <CAHmME9o7K3DsKS1p3uKV0K9_btRHtMJWAGQD1ZT0=YXiF0Zysw@mail.gmail.com>
Message-ID: <CAHmME9o7K3DsKS1p3uKV0K9_btRHtMJWAGQD1ZT0=YXiF0Zysw@mail.gmail.com>
Subject: Re: Using WireGuard on Windows as non-admin - proper solution?
To: Patrik Holmqvist <patrik.holmqvist@su.se>
Cc: "vh217@werehub.org" <vh217@werehub.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hi Patrik,

Why not provision the config for the users when you're provisioning
the rest of the machine for their ownership?

Jason
