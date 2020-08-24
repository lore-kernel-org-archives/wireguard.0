Return-Path: <SRS0=mjoF=CC=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42D65C433E1
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 24 Aug 2020 14:37:42 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A76C92071E
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 24 Aug 2020 14:37:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PEtfe46c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A76C92071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aed98fec;
	Mon, 24 Aug 2020 14:10:42 +0000 (UTC)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id eefaf557
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 24 Aug 2020 14:10:40 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id 145so1742534lfi.8
 for <wireguard@lists.zx2c4.com>; Mon, 24 Aug 2020 07:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:date:in-reply-to:references:user-agent
 :mime-version:content-transfer-encoding;
 bh=88UgJnBacaYpQSLnNLII0+AXq4DcbCTDMycaXD5PFjk=;
 b=PEtfe46cWSs3oXlhYGIcmSVaN0nSb58YkD5QETOf8foH9BUDcjAvKldPnidtQFt05n
 lAszRFMfMLovtXmBNYb5cXfz85Kn3DsJUMFSFPB/LIngv0AkibkigqGngQi1Er5+Yxmb
 R63n0UOu3Jrh9vg+Nol6LMk51COZCIXMNrGXcYbp1RTw5KLS6OwIXb+o6SCHTUQGUvoE
 3r/lwtbqyGC6mGpjr5+/ji9uYZKeRTyTH3IMxX+kCEZOxp4CkMjpk0Cc3Z41ae3Dcg3v
 4qc+c+mXxY1TeXFmC50Ws2MfowP5ISkVKbZL+Dq4WBtWBX+a+U/WpQTuP4Lc9h3Fhrnc
 3u5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=88UgJnBacaYpQSLnNLII0+AXq4DcbCTDMycaXD5PFjk=;
 b=Ml4hwVwwZr/Kdb1ri3/wgjM/mx2G8wkhbc6tKqBEj3LrLuKR/5Rm1jbEAntNR9+HGJ
 7cNTdPmebSIqH5Og+uEmwHyWuQSU95y8dT8j5wzJlxr9LFCjcC4bg5OqNnUyBnpIogeQ
 YSqQ2/Rf3j+LCWeXm6Cjnz4+CWZyTg/Fd6XEAKslbp3gUwoY5thVTnVq5sb/ME0woMSF
 zIwY1aMgJCKQlJmRGCzQz2YtEML/arZi3O6UjyXwLBonn7Rlc1y3+FofiDjFmy15LWB4
 ZEV5SeX703xX2YGsmu+Cq1XmGjQBc4Lbw1gAK/LJ5uMqjy8pebTa54agNWR0LkNKfnH8
 1TDQ==
X-Gm-Message-State: AOAM533BCT9TbRtvX6Hb+NFnsQhJ2rl6rkQvImbEtnWK3XZWVf04Kz9D
 jRSNLhq+P48Ww5LZRKIT88g7WtGuZzw=
X-Google-Smtp-Source: ABdhPJwRX1geQ3OCk7VfxSisNMk+/MN0dTeP5y13bGSH0uQvsk5xh1KCCBXbWGUPlyb+DN1xiPaANw==
X-Received: by 2002:a19:cc0f:: with SMTP id c15mr2703393lfg.195.1598279854703; 
 Mon, 24 Aug 2020 07:37:34 -0700 (PDT)
Received: from PC-681 (134-103-235-80.sta.estpak.ee. [80.235.103.134])
 by smtp.gmail.com with ESMTPSA id a2sm2232063ljj.40.2020.08.24.07.37.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 07:37:33 -0700 (PDT)
Message-ID: <f90145e75a24e0370e41856b65037342b62f6dcd.camel@gmail.com>
Subject: Re: Python Wrapper for wireguard-tools
From: Arti Zirk <arti.zirk@gmail.com>
To: Andrew Roth <andrew@andrewjroth.com>, wireguard@lists.zx2c4.com
Date: Mon, 24 Aug 2020 17:37:33 +0300
In-Reply-To: <CAF-5xiCzvHFLtLFpw5FNOR5w7=bEBNjDtVgedRjGNzBigk4cZw@mail.gmail.com>
References: <CAF-5xiCzvHFLtLFpw5FNOR5w7=bEBNjDtVgedRjGNzBigk4cZw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 
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

On R, 2020-08-21 at 10:04 -0400, Andrew Roth wrote:
> I did see wgnlpy [2], but don't think it is a fit since it relies on
> Netlink (Linux kernel interface), so it's not cross-platform
Some time ago I played around with netlink and using it to configure
WireGuard interfaces[1]. But it looks like the library, pyroute2, now
includes WireGuard support[2]. Cool thing about pyroute2 is that it is
a pure python library without binary extentions.

[1]: https://gist.github.com/artizirk/3a8efeee33fce34baf6047aed7205a2e
[2]: https://docs.pyroute2.org/wireguard.html

