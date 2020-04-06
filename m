Return-Path: <SRS0=i4ZG=5W=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39D0FC2BA18
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 Apr 2020 08:29:10 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83A1620672
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 Apr 2020 08:29:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TZClTUfS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83A1620672
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9c1ffd33;
	Mon, 6 Apr 2020 08:19:54 +0000 (UTC)
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id aca822e5
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 6 Apr 2020 08:19:52 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id h6so6564436lfc.0
 for <wireguard@lists.zx2c4.com>; Mon, 06 Apr 2020 01:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:date:in-reply-to:references:user-agent
 :mime-version:content-transfer-encoding;
 bh=v3MO2Ro79pSNbq+MfR+WA7ukFTX3BW4QSVpgPJ5R7s4=;
 b=TZClTUfSmK0YHtRO6ju/Bdh1uTBWfy7Qixr5w/3VIF/oYKwxRhoASR92qQl+qdoX+l
 47oE7Dz9BibG/qKUXrJsBSqHJRVCZLg7MfDecPLWvXKz7YgJjtS9OWwHpK8f16bhfLQ+
 ad4aTpRim+KwDBjjYmJDqh/WlFZvk+Ro2CnO731nerQuL6HGZZ6zQGXeg3T4Ikig0fFp
 fF0BmmDU+u3m18WrECr7KYm/JdMeBSQrOydJo9FMJz+/Fp25ZVdBJAy4UICuQx1bMLvK
 4oo1x3yMFzOlHwOtudyoqcYpJGhNa9JZ+kXE/2n2a6YmN4aJDMutfhvfem3mGqSXIrX3
 Q6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=v3MO2Ro79pSNbq+MfR+WA7ukFTX3BW4QSVpgPJ5R7s4=;
 b=HWf3JZjlkR2DwQLHdWcEsMLufEWPz5X8bPaU6eHuyDmwE6WQkfifdMr4/4f/Ub4fja
 7XsLToA7IfR+liefhaRgmj4/S6qZAH5kgVw18VlhOg9KRtrLABRXnCMv2/HeY7brR/VT
 +nkEALIi5RpRyNbAdSjwqEWfC4oVSzgq1Cu64aPfm/B71P8/ved5HEqozsEfwQ/MtNT8
 +LhcVePFLzbYk2wLosb8EHnwg3vujh+WW0e2odIIJGDZ9SD4jAwcxJA47Ef/jIDiLniZ
 8pwqsysFstmE92iGNM7W/sRuj03PTHSgn43IfRhFcOYmn+nr/7VHAqkjD6uC7rBDbM1o
 MiYg==
X-Gm-Message-State: AGi0Puah0aLYK4x8/hj5kw6PHYhhM6sWpwZWN8+FTBF6EI/7/2zZTki5
 wlKh8V9Z0y32zSw1cP6OORc=
X-Google-Smtp-Source: APiQypJ6IEkbz83RuQzKj6khEXMIaZ5IIxBtiKoGQlQS3j52GoFmesrc4vGAfvbQ26Q9Lqz3b14W9A==
X-Received: by 2002:a05:6512:478:: with SMTP id
 x24mr534941lfd.193.1586161714865; 
 Mon, 06 Apr 2020 01:28:34 -0700 (PDT)
Received: from mammut (abd4-af2d-8174-6d87-3480-8326-07d0-2001.dyn.estpak.ee.
 [2001:7d0:8326:3480:6d87:8174:af2d:abd4])
 by smtp.gmail.com with ESMTPSA id c13sm9391292ljj.37.2020.04.06.01.28.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 01:28:33 -0700 (PDT)
Message-ID: <c41fb7b6ba61a41804ef50a7c92857367c51a36e.camel@gmail.com>
Subject: Re: Thoughts on wg-dynamic
From: Arti Zirk <arti.zirk@gmail.com>
To: Reid Rankin <reidrankin@gmail.com>, wireguard@lists.zx2c4.com
Date: Mon, 06 Apr 2020 11:28:33 +0300
In-Reply-To: <CAMaqUZ2i+LFg8wreOr=H1gB5ocw9+N5uacsZukcjEx6xNrbdkQ@mail.gmail.com>
References: <CAMaqUZ2i+LFg8wreOr=H1gB5ocw9+N5uacsZukcjEx6xNrbdkQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On P, 2020-04-05 at 19:43 -0400, Reid Rankin wrote:
> However, I've taken it one step further, by using
> cryptographically-generated addresses; each peer automatically gets
> fe80:(truncated hash of pubkey)/128 stuck in its allowed IP list.
> (I'm considering harmonizing this address generation algorithm with
> RFC3972 in the future.) This means that initiating the protocol
> requires no configuration other than the public key of the peer you'd
> like to contact.

While back there was a tool posted to this mailing list[0] that
generated WireGuard IP aadresses from the public key called wg-ip[1].

It would simplify things if that or some other link-local IP genration
algorithm would get integrated into wg-quick toolset.

I have also written a Python version of wg-ip generation algorithm that
might me slightly easier to read[2].

[0] https://lists.zx2c4.com/pipermail/wireguard/2018-April/002593.html
[1] https://github.com/chmduquesne/wg-ip
[2] https://gist.github.com/artizirk/c91e4f8c237dec07e3ad1b286f1855a7

