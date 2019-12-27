Return-Path: <SRS0=Ew3a=2R=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85617C2D0C6
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 27 Dec 2019 10:53:48 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB53520828
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 27 Dec 2019 10:53:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="VU6eghu0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB53520828
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 09c27356;
	Fri, 27 Dec 2019 10:53:20 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f5fb2223
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Dec 2019 10:53:18 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9884fbb5
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Dec 2019 10:53:18 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d8c5ea88
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Dec 2019 09:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=DtGLGr/Me3lfLw8lwqVtTtGRvOk=; b=VU6egh
 u0klj/nOuaaDEiqw1w6mdcJsbzSfu39Bcw83fxCABiEmZ7XvgExGqbwQagfivLYY
 lrslCFxjcjxpEzxqlEDJRP6TJiYfe1lpjB/KWpyt+9JhvW3N6qxXlRpL9jKSiDVq
 YvN0qW7fx3/+FMAQn9HM/WP3zVuVJgMhThcjp39ZWpMpdjLoRS+AV1uyD+xNHPjB
 HYCP/QHryU5Bs9ehp+ts6Z84rahAtLW4I9JLePI8QrakAoUrUQHE4k+RSpNp7LB1
 4SjSGyQXHmjxrSdmaGsxKicH4lvend1azbq/x0GRABSmHly/S14ZQTlFWarG+rxV
 13HjY1BKERjDRmuQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 528457fd
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Dec 2019 09:55:34 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id a15so35940120otf.1
 for <wireguard@lists.zx2c4.com>; Fri, 27 Dec 2019 02:53:16 -0800 (PST)
X-Gm-Message-State: APjAAAXuQQuuMkYt7u721NSkfciecBOzq3Z9ZRJ6RjccytuTjh74gjjZ
 1OF7TxIwkGfZ13FH0TTIjUyPdlvikrrB2VRGBjg=
X-Google-Smtp-Source: APXvYqzfiCAGKl9QGJhSk9yU/DYtemO2q7HPON3jGGMrR6Pr2rBacUY6ND3JGxTIDuMr61gLilqW+bV+MKGvdZdCJdg=
X-Received: by 2002:a9d:4f18:: with SMTP id d24mr51984538otl.179.1577443996375; 
 Fri, 27 Dec 2019 02:53:16 -0800 (PST)
MIME-Version: 1.0
References: <20191227033525.24478-1-thundza@gmail.com>
In-Reply-To: <20191227033525.24478-1-thundza@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 27 Dec 2019 11:53:05 +0100
X-Gmail-Original-Message-ID: <CAHmME9pHsi0jpQ3H_Xxk=_8jRY41B1L85=ZgKTeL+Z64L-KbOw@mail.gmail.com>
Message-ID: <CAHmME9pHsi0jpQ3H_Xxk=_8jRY41B1L85=ZgKTeL+Z64L-KbOw@mail.gmail.com>
Subject: Re: [PATCH wireguard-tools] man: add documentation about removing
 explicit listen-port
To: Devin Smith <thundza@gmail.com>
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

Patch applied: https://git.zx2c4.com/wireguard-tools/commit/?id=318253d932a43f8213f3521b299cf76f9db27286

Thanks for the first-ever contribution to the new wireguard-tools repo.

Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
