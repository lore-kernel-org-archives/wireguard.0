Return-Path: <SRS0=o99y=2A=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE6DFC43603
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Dec 2019 22:09:30 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DE142053B
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Dec 2019 22:09:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="3ZhYWhwk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DE142053B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 44147bd2;
	Tue, 10 Dec 2019 22:09:29 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 09a95237
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Dec 2019 22:09:27 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6576f8fd
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Dec 2019 22:09:26 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a4490c11
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Dec 2019 21:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=oy7ooIWGwfsFNqS5HsULwiNB2jg=; b=3ZhYWh
 wkUZcYamlj+UD2lmaqiFM+kNh1KBcL5tBDmrB44NdDzkrjbGj+JZ3gyYYqrz4Z9o
 nietPgySd802DvJSMT6KS408a5XSBqQtZnK9dCwax8GJV8WLM08kFTvyhzeUvs0g
 JgZeET/QyMfmLqddfQDaFzFWs5m4Rz8qgjzYxAhnV/Os0gMuzUvz6JYEYM8j9yS+
 4i8SZrFrGBR8rf3W6RthiRz5kDEZjwg5d6q0iFDzVMx0b3glpuUdUwhKpZbr1f+e
 AJIFpwxtbdXNAY1W7Xkr2CBBYf6ROlwpJO4xS9gJqmHcRGHd5ZaMhqy8gjGY1T9v
 Go0eJTjNPpal+sUA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 10d48286
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Dec 2019 21:13:51 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id v10so11321729oiv.12
 for <wireguard@lists.zx2c4.com>; Tue, 10 Dec 2019 14:09:25 -0800 (PST)
X-Gm-Message-State: APjAAAUuxgv/gXExcRBmZx4b2Ofm+loZBn0LJIjW6/fdnIi5Phjwrbap
 pQlHtFJUDnsu+SSGj5n8g0BFhg3dsplMBFt8Awo=
X-Google-Smtp-Source: APXvYqwW/4l0FENOhjNpYNf7GUGlb52CMRbe0RxqwbLs07YQb5H1UdzVjsZpKTq/htlpgRQ3CJZE73kEbRlrMYi94Wk=
X-Received: by 2002:aca:815:: with SMTP id 21mr264580oii.52.1576015765196;
 Tue, 10 Dec 2019 14:09:25 -0800 (PST)
MIME-Version: 1.0
References: <20191210154850.577745-1-Jason@zx2c4.com>
 <FX30kbIJvHNSsmPxMSA_XdlAOLSee8p5eHMDcDAkDH8KKhihrybE2EtZJIjtU9ojh-JJT9g4Cj5xlT85E5uETb9JsBJmficyjfDvblrRaJg=@protonmail.ch>
 <CAHmME9pdqq23OXNPHLT-YyXCKTVTKJNyfz9D+Q0jADAN=BDhnA@mail.gmail.com>
 <20191210221215.56c2f30d@natsu>
 <a8f51c8e-d0e8-aaa6-024f-70b65007559f@gmail.com>
In-Reply-To: <a8f51c8e-d0e8-aaa6-024f-70b65007559f@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 10 Dec 2019 23:09:14 +0100
X-Gmail-Original-Message-ID: <CAHmME9pSsTogYKMObNuy20FCRE8tNrjT9OVefn1GqqmG1B7q6w@mail.gmail.com>
Message-ID: <CAHmME9pSsTogYKMObNuy20FCRE8tNrjT9OVefn1GqqmG1B7q6w@mail.gmail.com>
Subject: Re: [PATCH] wg-quick: linux: add support for nft and prefer it
To: Vasili Pupkin <diggest@gmail.com>
Cc: "jwollrath@web.de" <jwollrath@web.de>,
 "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
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

On Tue, Dec 10, 2019 at 11:03 PM Vasili Pupkin <diggest@gmail.com> wrote:
> As far as I know both of them are maintained in the same repository and
> both use the same userspace library to interact with the kernel and down
> there all the rules are translated into BPF code which in turn is
> compiled into machine code by kernel BPF JIT compiler.

"bpfilter" is a WIP, but that's not today how iptables or nftables
work, at all. I'm not sure your statement about userspace is entirely
correct either.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
