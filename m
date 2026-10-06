Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DEB8CA5FED
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  6 Oct 2026 11:28:36 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 4f2d2532;
	Tue, 6 Oct 2026 11:28:34 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id a80b4d68
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 6 Oct 2026 11:28:32 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 436566022C
 for <wireguard@lists.zx2c4.com>; Tue,  6 Oct 2026 11:28:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFD521F000FF
 for <wireguard@lists.zx2c4.com>; Tue,  6 Oct 2026 11:28:30 +0000 (UTC)
Authentication-Results: smtp.kernel.org; dkim=pass (1024-bit key,
 unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256
 header.s=20210105 header.b=h7Yd/tf7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1791286109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Brcs0EfooLkjrOOA+tgj6ecuo3jQpdHIJaVJjOh9nTI=;
 b=h7Yd/tf7gJco2zK43Mybrggaj8Cohf10pskNBoGJ1/R3x5iOMvRjrN3Lhp4VKIa+tEj40C
 qDeO2Fo5F6Jhvhv6Ln5NFt8HbLKTSiKDCh3co2BtemEzvq02rFn+Ekg9X5qMhiwOxnDggQ
 tarWtquf1uSE+zkMZ6qfSuFr5xJ4CSg=
Received: by mail.zx2c4.com (OpenSMTPD) with ESMTPSA id 86ead21c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 6 Oct 2026 11:28:29 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-6afb0d2a586so1037036a12.1
 for <wireguard@lists.zx2c4.com>; Tue, 06 Oct 2026 04:28:28 -0700 (PDT)
X-Gm-Message-State: AFq9FYJvK6Fsz8ijUA7/TrlfYb3IQr7AEpqg2aO4NKuVXTrNde6YrE7X
 UZmhh7/XtDIRW8x5PhzeVIo3wnF8sS2mQ72FhVCzsEMZrB8aKxLoWtTxgDrKZR9jx3RCy7LR3UZ
 tTTGbisJpfWaARTTNWHDpcJf2uyqRhaU=
X-Received: by 2002:a17:907:c081:b0:c2d:c7c9:906b with SMTP id
 a640c23a62f3a-c316a05069emr145091866b.28.1791286107807; Tue, 06 Oct 2026
 04:28:27 -0700 (PDT)
MIME-Version: 1.0
References: <188dc861-f452-4830-9b47-e51c15faf41d@philomathiclife.com>
In-Reply-To: <188dc861-f452-4830-9b47-e51c15faf41d@philomathiclife.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 6 Oct 2026 13:28:15 +0200
X-Gmail-Original-Message-ID: <CAHmME9pKeQK46EKALjX7NgH3Qc_HTWw6aZi_crRe7Tf6WDHR4w@mail.gmail.com>
X-Gm-Features: AclHuK_NTeIxxUj9jxiFEHip97ojiGbxPIobPPd6XtywKfxPcDb9rAf8h3RZFY4
Message-ID: <CAHmME9pKeQK46EKALjX7NgH3Qc_HTWw6aZi_crRe7Tf6WDHR4w@mail.gmail.com>
Subject: Re: OpenBSD collaboration/peer-review request
To: Zack Newman <zack@philomathiclife.com>
Cc: wireguard@lists.zx2c4.com
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

Hi Zack,

Of course I'd be happy to work on this. Do you (or someone else) want
to jump on a video call and we can share screens and you can show me
the stuff you think I should be looking at?

Jason
