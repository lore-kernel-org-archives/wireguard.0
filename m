Return-Path: <SRS0=Lcmb=XB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E26FAC43331
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Sep 2019 22:47:47 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C3EF20842
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Sep 2019 22:47:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="b99UIAYT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C3EF20842
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8561ad6c;
	Fri, 6 Sep 2019 22:47:45 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4237d830
 for <wireguard@lists.zx2c4.com>; Fri, 6 Sep 2019 22:47:43 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id df23448f
 for <wireguard@lists.zx2c4.com>; Fri, 6 Sep 2019 22:47:43 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 76a0e842
 for <wireguard@lists.zx2c4.com>; Fri, 6 Sep 2019 22:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=BwtfU/hAb6libMS/3epdM93kWi0=; b=b99UIA
 YThWqG/J+hW1D8EZqNs0DxqMgxv2k9n9tPg8JbQ3yObj/CeQNfPMFCAoQx9dwaqO
 Q5yYH82ekBiQOKINyxkTW0lOIMPzq0AfHXXhuitibxV7gm4qNwMcZBH+8iRCNnIt
 3IaQBKQHlXVnhnZVgFyAjyFwSOUVGEg0In13T0soXzd/6+9GsrJ9ftc7dtQqBALH
 ZA0aqO9jYzW8M4wqUGSU8ajfA0lFIfczUC4guLdZlAySGhXeDZQEBaZUPNRrWVAr
 QAxoW2tSPsh7byfHz/VANNgjInqHYJqNesDDc4KL2PIJYjyp+zZC63Fit5rIKPz0
 3SbmEW27l4td9nrg==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 734778d7
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 6 Sep 2019 22:04:19 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id b80so6326212oii.7
 for <wireguard@lists.zx2c4.com>; Fri, 06 Sep 2019 15:47:42 -0700 (PDT)
X-Gm-Message-State: APjAAAVpg92owTyv22cpV8pTWw9MqniIYS9DLrztFAW6P+1Zpbsr+GKr
 X++EVP/lMEGbLRwcbNsDlWttpnlfuD6ItuTp4lQ=
X-Google-Smtp-Source: APXvYqzTwdVQc2ZWVUN/LhHuekkrxWnHjWA238PZP1hQM+M1qK3lZ+5UIsw+2SHyzhrxDh0YEBO4LQCcTsXxnAstPes=
X-Received: by 2002:aca:f555:: with SMTP id t82mr8731906oih.66.1567810061480; 
 Fri, 06 Sep 2019 15:47:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKRnFh4XvqYzPDVjy_NOpeHY+KgsRfEuHfEjWy9N1wfY9MwTg@mail.gmail.com>
 <CAHmME9oC+rYCVqv21-nGw_vyxzY5VhTHoa0mrnbOEShcczBN-g@mail.gmail.com>
 <816bb8ff-101f-2719-4b75-1d194c519aef@astrogeo.va.it>
In-Reply-To: <816bb8ff-101f-2719-4b75-1d194c519aef@astrogeo.va.it>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 6 Sep 2019 16:47:29 -0600
X-Gmail-Original-Message-ID: <CAHmME9odNo2d+=u1z7kNuXKy2HYzOqaHt_0N9Dz49kZFp4qW_g@mail.gmail.com>
Message-ID: <CAHmME9odNo2d+=u1z7kNuXKy2HYzOqaHt_0N9Dz49kZFp4qW_g@mail.gmail.com>
Subject: Re: WireGuard fails to build on CentOS 7.1908
To: Dario Pilori <dario.pilori@astrogeo.va.it>
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

Hey Dario,

I'm not super familiar with the RHEL release varieties. Maybe you or
somebody can clarify and help define how we'll approach it?

What we've done in the past is support whatever the "latest" RHEL
kernel is. IIRC, 7.6 was released not so long ago, and we did the
compat.h work on 7.6, and then dropped support for RHEL 7.5. It sounds
to me like what you're saying now is that 7.6 has already been
replaced by 7.7? Or there's a stable 7.6 and then an "in-development"
7.7 that is rolling? If it's the latter case, do you know if that's
widely used and worthwhile for us to support?

In other words, I'm not so sure of the RHEL landscape, but if you make
a description and argument for what we should support in WireGuard's
compat layer, as long as it's somewhat reasonable, I'm happy to
oblige.

Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
