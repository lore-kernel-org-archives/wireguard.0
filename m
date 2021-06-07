Return-Path: <SRS0=3dEh=LB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3396DC47094
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  7 Jun 2021 12:52:28 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EE6B611C0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  7 Jun 2021 12:52:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EE6B611C0
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9cb4ba7a;
	Mon, 7 Jun 2021 12:52:25 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5462a256
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 7 Jun 2021 12:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1623070338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p+cDFGAIoxUbbxYFATevPYXsPOxzoLoEaP0fDixxkj8=;
 b=R3hhd8pJfP7pt+lPDqqKl5QMPq5SicMrWA8UjRbjUyHO0SuQVhbjciT3JXMS8lsKCxIb+I
 t1i7zD6qWJY++0Fm1avO0XyY1ExG/RFEwIte77YRH6rtU5iNEOHqdv0QEG+vAvVPXawqGv
 P6FSO2SO22GEU1i/JYe7hX/i/F1o3gc=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3668f3a2
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 7 Jun 2021 12:52:18 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id m9so18296989ybo.5
 for <wireguard@lists.zx2c4.com>; Mon, 07 Jun 2021 05:52:18 -0700 (PDT)
X-Gm-Message-State: AOAM530780MA2n3wSn11bE/YBjruiIuUN9Q3nwDsyex/mItZm+8KWT9O
 csgzBs74zCwu2nekGhQHePyt+NjZnvNq9Z7vMY0=
X-Google-Smtp-Source: ABdhPJy46PJrWW/B1w3e9YKqQCwkj2BcXz736QURJ9K0490EYiF/9qnf3SfKEjFl6B81GaRdFK1TxkvWZWaAvY4O/o4=
X-Received: by 2002:a25:389:: with SMTP id 131mr24192574ybd.306.1623070334028; 
 Mon, 07 Jun 2021 05:52:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7110:474d:b029:ce:da65:f582 with HTTP; Mon, 7 Jun 2021
 05:52:13 -0700 (PDT)
In-Reply-To: <CADTMz0Jo+oOhhK60ug=agXyWL3SRA1oOyXJh49bor5-EG2ibqg@mail.gmail.com>
References: <CADTMz0+OmW5n1JSD6pLA-_2=aRHeuhYLdQ6BCwjHg07vrPc+vA@mail.gmail.com>
 <CAHmME9poc+xPG_WfX1vYTSc9JPrSkMpWGR=rTGspOVsKyYfCpA@mail.gmail.com>
 <CADTMz0KSq7Kj6SzTptTt=Uy5EEGkCRhbZXzZfPeeJ6Vu8134uQ@mail.gmail.com>
 <CAHmME9qK7xwQgcxvj4PquxUxk0jh_cejsrGMtnn70o1FDof2ig@mail.gmail.com>
 <CADTMz0Jo+oOhhK60ug=agXyWL3SRA1oOyXJh49bor5-EG2ibqg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 7 Jun 2021 14:52:13 +0200
X-Gmail-Original-Message-ID: <CAHmME9o6RhPmojbA4nTRA4GqFXVstEsmmfUj8SqmaJSvGsmmWQ@mail.gmail.com>
Message-ID: <CAHmME9o6RhPmojbA4nTRA4GqFXVstEsmmfUj8SqmaJSvGsmmWQ@mail.gmail.com>
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

On 6/7/21, Christian McDonald <rcmcdonald91@gmail.com> wrote:
> One byproduct of this exercise was some code that I whipped
> up that can at least detect a clamped vs unclamped key. This might
> prove useful for informing a user of what is going on and thus
> eliminating this class of erroneous bug report entirely.

I'd recommend *not* introducing users to weird ideas like clamping or
key transformation. While learning new concepts and bit masking in PHP
is undoubtedly fun, those concerns shouldn't be user-facing. There's
nothing wrong or dangerous about unclamped scalars passed to a proper
25519 implementation, because the implementation will clamp on input.
Throwing an "X-vs-unX" distinction to users will just result in
pointless fear mongering nonsense. Instead just communicate the
identity of an interface by its public key, rather than its private
key. If you're not willing to hide or mask private keys (which you
really should), then at least deemphasize them?
