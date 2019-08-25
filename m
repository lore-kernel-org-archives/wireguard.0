Return-Path: <SRS0=QHSY=WV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E290C3A5A1
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:54:44 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A257D2070B
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:54:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="XRo3Cyz+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A257D2070B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 54cfb1eb;
	Sun, 25 Aug 2019 15:52:09 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a7ab4400
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 15:52:07 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b89edbd6
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 15:45:56 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 768c15a4
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 15:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=JtNj/5rcUQvVaR54bKIOiX3zASI=; b=XRo3Cy
 z+iyb+x3hdTjiQVk2jiRVOAfH+bCAoI/SyYzhgh5Z4rW1gCBrlhqu25zg1F6PuRT
 vDBzyE+stTr6YtSEfRHS4A7VXelmbRHOX6mhG8SH4+yDumxFd1lFSD/GNbUmTpN4
 BBrsL2UgqjgPJ2Xgjx7Z3z5zREp/P/l+LSPPT/v8BU+g9hzuPgKnmqPWhJx9ShZC
 6RoqkcYPJc6UMuq5N57qwxtsD0R0gYVB27S+STm/Sk+GZX5jhfr/cB2g5lXRXJPD
 cNtdPFrlMOi98haOMHd04nVPbK1yxbmT/ZtYXoyGbjAe88+cu/g516v7wDxdPbfl
 sKzzsnkzcnVqGLnQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d7cc60fb
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 15:04:08 +0000 (UTC)
Received: by mail-ua1-f52.google.com with SMTP id m23so4905345uaq.11
 for <wireguard@lists.zx2c4.com>; Sun, 25 Aug 2019 08:45:56 -0700 (PDT)
X-Gm-Message-State: APjAAAUH8fJT6EBVYn/V0SnDKxIYr2W5txjN7fiIzYp+kFQmjUsNubRt
 aDqZNxxhOLFl2K2hO7EdRwzZPPbqaZowP+K9Fjo=
X-Google-Smtp-Source: APXvYqyCfUULXPO3k6KQhhqyQuz+NhGXCjVWlys0OSO7IPFYvl3EzyAbrpA/FNYfQawOy/mNCQk9FjFLQIAo/NI8rMA=
X-Received: by 2002:ab0:7252:: with SMTP id d18mr2825587uap.62.1566747955772; 
 Sun, 25 Aug 2019 08:45:55 -0700 (PDT)
MIME-Version: 1.0
References: <b660d135-4450-66d3-0254-a893f46ba9f7@spam-fetish.org>
In-Reply-To: <b660d135-4450-66d3-0254-a893f46ba9f7@spam-fetish.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 25 Aug 2019 09:45:44 -0600
X-Gmail-Original-Message-ID: <CAHmME9qPAOLxz3CyHxq9tubzgzvksGS5iz55yL=eB2wFa23fXg@mail.gmail.com>
Message-ID: <CAHmME9qPAOLxz3CyHxq9tubzgzvksGS5iz55yL=eB2wFa23fXg@mail.gmail.com>
Subject: Re: [ANNOUNCE] OPNsense 19.7 supports WireGuard
To: "Muenz, Michael" <m.muenz@spam-fetish.org>
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

Congratulations on the release. That's great news.

Would you like me to add some blurb to https://www.wireguard.com/install/ on it?
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
