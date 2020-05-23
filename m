Return-Path: <SRS0=jbYm=7F=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9154C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 23 May 2020 07:21:51 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC89220723
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 23 May 2020 07:21:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="SgHtZHA3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC89220723
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aeaccda7;
	Sat, 23 May 2020 07:06:59 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b2818e46
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 23 May 2020 07:06:56 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8e3c05de
 for <wireguard@lists.zx2c4.com>;
 Sat, 23 May 2020 07:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=4h3nYJyWtH2dyBfFawqME+F9b94=; b=SgHtZH
 A3ie1E4PBBDt9a0D1c5Fj0k/HK2AK7wR0cIFQaWoDdoEO6yJhx581xqq9sxgXZtw
 xZf1xkK/h+5PBAP9FenCfnTFgKbHzV2llEAVuYDRtBEsIzuICll273CUDLiU9yKJ
 vaf4sPqTR8fMnavlRzKEIKnQ3L83B/UT7iU+NB6X6MVFcV2P8Fh3RGMhIm883sjY
 rSc3PWenu/ViYZvF9DrfTeb3XZDE1uVEPOOvffZgEmaioESTb0c/keSZ17aw3h7F
 zksb+l3J7rxGo+KKU9oRruvcupJ5DGczoa3RQOshGeMzCC1u1OTRJR9ngpQcdJyx
 AOcmJwg0TiQXqs1w==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 191c449d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 23 May 2020 07:06:56 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id k18so14009095ion.0
 for <wireguard@lists.zx2c4.com>; Sat, 23 May 2020 00:21:46 -0700 (PDT)
X-Gm-Message-State: AOAM531x9/jbMcou+f6/BlOLUlVnOtgjgvqOunpyqLLe+4GhF4LPhxAs
 HRdh+FQ8eD4VIs02huNdm0k1dhF54tnbWaVgsUc=
X-Google-Smtp-Source: ABdhPJwcPiEH+BqrvbRp27IALvLJ6VdWGry/2p2+ojuEJ3+jGfArs0hq+SqUVMWr/UhArOAbzpdV2eMGRdZ11N4dN88=
X-Received: by 2002:a02:dc8:: with SMTP id 191mr8011467jax.95.1590218506007;
 Sat, 23 May 2020 00:21:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAHmME9oX+8HoK_wAoc5oR9rWenYz4ki8EK+NebQEV2ALZDSrdg@mail.gmail.com>
 <CAEg-Je8HRbwymZqxZJ8ZyGPk3yAG_R9bg7doeO4SdJ_h6Ni-9g@mail.gmail.com>
In-Reply-To: <CAEg-Je8HRbwymZqxZJ8ZyGPk3yAG_R9bg7doeO4SdJ_h6Ni-9g@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 23 May 2020 01:21:35 -0600
X-Gmail-Original-Message-ID: <CAHmME9oTr0NF7UUgsxcmqj_R8bQ1HyYH0tpQdtyq84zPou338Q@mail.gmail.com>
Message-ID: <CAHmME9oTr0NF7UUgsxcmqj_R8bQ1HyYH0tpQdtyq84zPou338Q@mail.gmail.com>
Subject: Re: Adding Debian, Ubuntu, OpenSUSE, RHEL, CentOS kernels to
 WireGuard CI: Seeking URLs
To: Neal Gompa <ngompa13@gmail.com>
Cc: unit193@ubuntu.com, Daniel Kahn Gillmor <dkg@fifthhorseman.net>, 
 Andy Whitcroft <apw@canonical.com>,
 Ubuntu Kernel Team <kernel-team@lists.ubuntu.com>, 
 Martin Hauke <mardnh@gmx.de>, Joe Doss <joe@solidadmin.com>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Carl George <carl@redhat.com>
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

Hi Neal,

Thanks for these very helpful instructions. In trying to implement
this, one snag I encountered was that the .src.rpm file has inside of
it the linux-{version}.tar.xz file that I actually want. Is there
anywhere on the internet that hosts these .tar.xz files directly?

Jason
