Return-Path: <SRS0=2ld3=7D=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 380D0C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 May 2020 01:57:12 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C948320709
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 May 2020 01:57:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="H6XxvhC8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C948320709
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2b03841c;
	Thu, 21 May 2020 01:42:26 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id fbb0b913
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 May 2020 01:42:24 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dc64c82e
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 May 2020 01:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=tgBouawNlLL/DDbplYKtgfePl4I=; b=H6Xxvh
 C8o9238TQCwr/cPKvSWoE1TUAD09wJ86/qak7qMSfDdyLLLCXSMWWtFS2rjEsIFb
 xhxLebZXc5g4Cs+90nrZVge4Qwq/A13Edmkl5VJW1eBdPNa4SdXEUdfPgPYPSf9+
 kIBoLEvLJ0nWqKtYeb7Ofgquwx0zVKXNoDt8PirAD42Ff/0+SzSZhzhroWK8OzH2
 nihNrgepqGMueh5Kd7OiSJDqHm5iPDI263TD81bzHOxyb8RmUPAlxK3b+4pVuBu0
 QoQXcQtnpNlifvBGO3DeJVsIBLjsGzSIVCHBAlEAn4J2t4iokdm6p19fNPTGVMBg
 kBIMtVPkhzuUO5Dg==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 89469cad
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 May 2020 01:42:24 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id c20so5457835ilk.6
 for <wireguard@lists.zx2c4.com>; Wed, 20 May 2020 18:56:57 -0700 (PDT)
X-Gm-Message-State: AOAM530hMh76B6kbdqK4s7XV8bMDX/G2qLdzb29t78Iwjnq1d+XdhFxw
 kqGQucEyHECUex3oT55omSrsL4ykgWteUSZJLP0=
X-Google-Smtp-Source: ABdhPJx66h1Km7jTqUaXD0JcBOzH9GJvciaYcDGa1yprlTnRkGiDD5EF4aO8ngcC/UPIogm1UmLJO9sZmmxcl8luD8w=
X-Received: by 2002:a05:6e02:130e:: with SMTP id
 g14mr6798336ilr.38.1590026217016; 
 Wed, 20 May 2020 18:56:57 -0700 (PDT)
MIME-Version: 1.0
References: <e0484514-9c09-cc78-022c-54d0e59145cd@gmail.com>
 <f38d592b-3ea8-91ff-99d4-63ed4f2ba1e0@dd-wrt.com>
In-Reply-To: <f38d592b-3ea8-91ff-99d4-63ed4f2ba1e0@dd-wrt.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 20 May 2020 19:56:46 -0600
X-Gmail-Original-Message-ID: <CAHmME9qF0foYTjn8U42FD_dPiH_wWVRFzp6yS2bqZgqux1B6xQ@mail.gmail.com>
Message-ID: <CAHmME9qF0foYTjn8U42FD_dPiH_wWVRFzp6yS2bqZgqux1B6xQ@mail.gmail.com>
Subject: Re: Wireguard is broken by recent ubuntu 18.04 kernel update
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>, unit193@ubuntu.com
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

On Wed, May 20, 2020 at 7:54 PM Sebastian Gottschall
<s.gottschall@dd-wrt.com> wrote:
>
> current kernel update today broke wireguard-compat compile due a api
> backport change. i'm sure it will be fixed soon by jason

It already is fixed. It's just a matter of the Ubuntu maintainer
bumping the PPA.
