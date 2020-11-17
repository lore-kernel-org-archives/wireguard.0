Return-Path: <SRS0=xb9C=EX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D3B7C2D0E4
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Nov 2020 08:36:04 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32C4324671
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Nov 2020 08:36:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="ZAGMil2h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32C4324671
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 10eb805b;
	Tue, 17 Nov 2020 08:31:10 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 538c05b4
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Nov 2020 08:31:08 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6e3232a5
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Nov 2020 08:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=Hr+jI+KVdqgUSqaJucRaw9uwCVA=; b=ZAGMil
 2h6me0N7K8kyNY4QsrK8PyskCMWyz9/JNkfEywmRPm2FPJumdSZdhMUWiS7+rAhK
 Lf9kiMA4h/IN7aF+k5H1loaXIr4qOzlRV9lfv6JZIYnKhDaGyBHKW6R8gF9ChgRe
 Vm+9S2rfvh/+/VC4GecX8VNItLHAF4CKT3EyesP/UgT26Us4wp2hhswk1IzIw6Ap
 02a+1gT0CIlz15iy4VTiydfYh8WAxb/eA4wbKlzqH4UTPZuhsyC8QjkAckdW0OF4
 LqBy0oobxCWUkYnFLWLg7GyAHS1YdUF5f88okOEmPC7YXb5CrtQJXJti3DAsOK9s
 cJCi2qRlx5f9ZrAg==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 45a55725
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Nov 2020 08:31:53 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id v92so18221698ybi.4
 for <wireguard@lists.zx2c4.com>; Tue, 17 Nov 2020 00:35:42 -0800 (PST)
X-Gm-Message-State: AOAM530pvnUIdN8f6w+2hhAenJ0Jaludb0snPlU14UlgOKkK4LByDpCG
 XFprbtF4g/VkXISWe32niGIo294r+0BySCvyzJg=
X-Google-Smtp-Source: ABdhPJxltpJ7lh/BAV2z4t5JKlLag1wKxZinZcAn5MaBtMCCdqxT5sWm5uXwl/7xTG7nwungx+QhIoCScN+KUkPRPIw=
X-Received: by 2002:a25:6f83:: with SMTP id
 k125mr26083401ybc.123.1605602142005; 
 Tue, 17 Nov 2020 00:35:42 -0800 (PST)
MIME-Version: 1.0
References: <20201117021839.4146-1-a@unstable.cc>
 <CAMj1kXFxk31wtD3H8V0KbMd82UL_babEWpVTSkfqPpNjSqPNLA@mail.gmail.com>
In-Reply-To: <CAMj1kXFxk31wtD3H8V0KbMd82UL_babEWpVTSkfqPpNjSqPNLA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 17 Nov 2020 09:35:31 +0100
X-Gmail-Original-Message-ID: <CAHmME9p8XNfz1ZdELVFXC4=QY-S6VzJfyf4oREgTM96WJUKeTQ@mail.gmail.com>
Message-ID: <CAHmME9p8XNfz1ZdELVFXC4=QY-S6VzJfyf4oREgTM96WJUKeTQ@mail.gmail.com>
Subject: Re: [PATCH cryptodev] crypto: lib/chacha20poly1305 - allow users to
 specify 96bit nonce
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Antonio Quartulli <a@unstable.cc>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>, 
 "open list:BPF JIT for MIPS (32-BIT AND 64-BIT)" <netdev@vger.kernel.org>,
 keyrings@vger.kernel.org, 
 linux-security-module <linux-security-module@vger.kernel.org>, 
 Antonio Quartulli <antonio@openvpn.net>,
 Herbert Xu <herbert@gondor.apana.org.au>, 
 David Howells <dhowells@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>
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

On Tue, Nov 17, 2020 at 9:32 AM Ard Biesheuvel <ardb@kernel.org> wrote:
> If you are going back to the drawing board with in-kernel acceleration
> for OpenVPN

As far as I can tell, they're mostly after compatibility with their
existing userspace stuff. Otherwise, if they were going back to the
drawing board, they could just make openvpn userspace set up xfrm or
wg tunnels to achieve basically the same design. And actually, the
xfrm approach kind of makes a lot of sense for what they're doing; it
was designed for that type of split-daemon tunneling design.
