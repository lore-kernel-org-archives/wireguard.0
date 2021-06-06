Return-Path: <SRS0=ObIi=LA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F794C47096
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  6 Jun 2021 16:21:43 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68D87611BE
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  6 Jun 2021 16:21:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68D87611BE
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 54dc6016;
	Sun, 6 Jun 2021 16:21:40 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7040e40a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 6 Jun 2021 16:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1622996495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ndCsQXvSLexSo0nrjv9p2lDPyjyl9ya1bToDWza2XZ0=;
 b=UhW0SWa2MC+IdeId11V6YnsCuxrRmeuXjVdJHyBbSU4naD3dFzhx8In7c4z9bRneqsVSG4
 R1+IF2awhvWS9rNjpGQJA8n5KTSphbySwHMHBcSYGI3BQDFbLiNS6AZ1ba/iuFhhWl7g5A
 EH4on7Qqd05i1VCVkx9GtiSx/L+s7mI=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0233a2fc
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 6 Jun 2021 16:21:35 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id i6so6654910ybm.1
 for <wireguard@lists.zx2c4.com>; Sun, 06 Jun 2021 09:21:35 -0700 (PDT)
X-Gm-Message-State: AOAM532OZbXXjNhdZuKEkzJjfJZZ1aWl5f25soEeZyGPGZxSSu8feyO1
 ij56HcvrX8rgmqu981pEcJ4l9MXa7P7l0+obElI=
X-Google-Smtp-Source: ABdhPJzScHjHqfWWbXjy6YJA5IRApW+LusUFS0N0pqJ1vW0+J8mMlNdlRBJuW0LxB4cBlUXctFkMsCCF0WabAKDsbcg=
X-Received: by 2002:a25:b8d:: with SMTP id 135mr17817629ybl.49.1622996494912; 
 Sun, 06 Jun 2021 09:21:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7110:474d:b029:ce:da65:f582 with HTTP; Sun, 6 Jun 2021
 09:21:34 -0700 (PDT)
In-Reply-To: <CADTMz0KSq7Kj6SzTptTt=Uy5EEGkCRhbZXzZfPeeJ6Vu8134uQ@mail.gmail.com>
References: <CADTMz0+OmW5n1JSD6pLA-_2=aRHeuhYLdQ6BCwjHg07vrPc+vA@mail.gmail.com>
 <CAHmME9poc+xPG_WfX1vYTSc9JPrSkMpWGR=rTGspOVsKyYfCpA@mail.gmail.com>
 <CADTMz0KSq7Kj6SzTptTt=Uy5EEGkCRhbZXzZfPeeJ6Vu8134uQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 6 Jun 2021 18:21:34 +0200
X-Gmail-Original-Message-ID: <CAHmME9qK7xwQgcxvj4PquxUxk0jh_cejsrGMtnn70o1FDof2ig@mail.gmail.com>
Message-ID: <CAHmME9qK7xwQgcxvj4PquxUxk0jh_cejsrGMtnn70o1FDof2ig@mail.gmail.com>
Subject: Re: Certain private keys being mangled by wg on FreeBSD
To: Christian McDonald <rcmcdonald91@gmail.com>
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

On 6/6/21, Christian McDonald <rcmcdonald91@gmail.com> wrote:
> Would it not be better for wg to just fail outright instead of
> transforming a poorly generated key entered by a user, regardless of
> where the key came from? Especially if that problematic key passes the
> regex validation that was provided in another thread in this email
> list?

No, it would not be better. There is nothing wrong with using those
keys. They're not "poorly generated" or "problematic" or dangerous in
the least. This is only a concern with your UI.

The kernel is doing the correct thing -- clamping keys -- and
displaying an unambiguous identifier to the user: the key that it will
actually be using.

I suspect the best thing to do for your UI would be to hide private
(and preshared) keys, and only show public keys, unless explicitly
exported into a config file. This not only reduces potential confusion
with this issue, but mitigates another potential footgun down the
line. It's also what wg(8)'s show command does by default (while
showconf will export all).
