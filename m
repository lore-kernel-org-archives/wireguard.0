Return-Path: <SRS0=n59I=76=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97B57C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jun 2020 07:39:53 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C34A20853
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jun 2020 07:39:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="NV38qx+F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C34A20853
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c574eb4f;
	Wed, 17 Jun 2020 07:21:22 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9d2846ff
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jun 2020 07:21:19 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 771e354d
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jun 2020 07:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=/WjaiR1OLeISWE+nIJng3CxQ8f0=; b=NV38qx
 +FFOFh4tUnGj8+4K9Fds7CGLjy0s8OI+6e0/sa56wC/NWtWbo/rxbAJIcOAOm42g
 9MWA1IMVM+6BoU8hCJF0mwhXdLN20T7hXhJFB05YGUDwly+u5ec1jDQcYIU5irB5
 6NAGtIRg7oVU+xqNo2vOPmpxvBMNpvjSbAFwTwDiL2PuhdH2+8aqG28RUlGzOozZ
 Sya8CQcDU33RkR047891/A0NmSbwvwkvD1knMfb+Tc0nouydpsRQpgfk5TvUgmzZ
 ffRNmNfoSUgLnHYXQdjE7+pdE4OCqaVMT6Ms4HHkltVKYHzlbCnAjmXarJssC3SK
 tvHLIlRJgFxW9cJg==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7539836e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jun 2020 07:21:19 +0000 (UTC)
Received: by mail-il1-f178.google.com with SMTP id g3so1185646ilq.10
 for <wireguard@lists.zx2c4.com>; Wed, 17 Jun 2020 00:39:23 -0700 (PDT)
X-Gm-Message-State: AOAM53397hFsAevZShCtqWqJVZxBFXW2ye3VcQQLorl+Ldae9niuuakx
 2smn7bShxJ68D8Ffoemj8gkOX/0ce33JH/VUDVc=
X-Google-Smtp-Source: ABdhPJxt1Ymhqcspyd1UlakjMFfCUpcl0oHejxw2nZ/59skuDQefMBg+mpC6mMYAx4dzYFCz36498iAZPklmthhnI1A=
X-Received: by 2002:a05:6e02:1189:: with SMTP id
 y9mr7378850ili.38.1592379562630; 
 Wed, 17 Jun 2020 00:39:22 -0700 (PDT)
MIME-Version: 1.0
References: <CABtXGiBwT8xqHUP-L818UeNEG+2RcR165Kkxc9f6sMSZKJRd2g@mail.gmail.com>
 <CABtXGiB17ofxts38zaWOzyWEwsgYyT5MDkuaZ6XEFN+PPWZb2g@mail.gmail.com>
 <CAHmME9qAP8PjyenubAS51cnvGmfXiWo_Gg7NQNecjMd2AJ==jQ@mail.gmail.com>
 <CABtXGiAbo+MEsSQBOZzWgEpjF9HaRnmwk2K3UV-FGBbkySq-vA@mail.gmail.com>
In-Reply-To: <CABtXGiAbo+MEsSQBOZzWgEpjF9HaRnmwk2K3UV-FGBbkySq-vA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 17 Jun 2020 01:39:11 -0600
X-Gmail-Original-Message-ID: <CAHmME9qYRwi5aYGQFGJgJg8n7tD0+xqOGOEykiDB=heHzWuDPA@mail.gmail.com>
Message-ID: <CAHmME9qYRwi5aYGQFGJgJg8n7tD0+xqOGOEykiDB=heHzWuDPA@mail.gmail.com>
Subject: Re: Windows Client - UI improvement
To: Phillip McMahon <phillip.mcmahon@gmail.com>,
 Alexander Neumann <an2048@googlemail.com>
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

On Wed, Jun 17, 2020 at 12:49 AM Phillip McMahon
<phillip.mcmahon@gmail.com> wrote:
> I'm no Picasso, but take a look at the attached.
>
> Essentially pin the standard set of options to be always visible, and
> make the conf area scrollable.

Oohh ho ho, that is a really nice idea. I have no idea how to do that
with standard win32 API menu calls, but maybe there's some way. I'll
look around. I'm also CCing Alexander who is pretty savvy with that
sort of thing too.

Jason
