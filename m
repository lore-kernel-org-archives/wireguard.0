Return-Path: <SRS0=wsGv=TQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 877FCC04AAF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 16 May 2019 19:50:02 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDD9A2082E
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 16 May 2019 19:50:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mRGrMTkq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DDD9A2082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a8d59fb0;
	Thu, 16 May 2019 19:49:44 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 86cca865
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 May 2019 19:49:42 +0000 (UTC)
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 91bf194f
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 May 2019 19:49:42 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id t187so2044124pgb.13
 for <wireguard@lists.zx2c4.com>; Thu, 16 May 2019 12:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:subject:message-id:mime-version:content-disposition
 :user-agent; bh=FfwgNc7pVQxla4cwPgCrsqy8fQAcgIqEbDE9m8QYV6s=;
 b=mRGrMTkqDeCrrkpImw1kdFA9vV5c/eu8U/4kUKSwEzrVBW/cyQxnVI9dY2nLpXRyMx
 cLg91PdAkqywlKT38VS5fb8t8OsHk9G8YLBAwv95xSrG5NYV6X6OP4EJmO0NmSni2Yq5
 BjGlH+YX0z6g1w+wSCHfPD59eV/K9lpRuMb472/9EeRjLroeZSEkPGbM07JjLp05dtDq
 loHYCnoVOjXM2PZA78YbEt/yauhTHPihxHGtEHJSMhsVooSoe9pDFAN327PRnq0+rGVi
 9yQ1UoJ8S125vZl0N0cshpeEaBFDD44IsvhlyE1LKhWeds5r6uJW2V8RuNcIvYelZmeI
 PPFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=FfwgNc7pVQxla4cwPgCrsqy8fQAcgIqEbDE9m8QYV6s=;
 b=Fi81eFpJzdPWtZTR48reMi/7jYlRyD2CQe4SlvRdPOdxYnZj4616vfqa7PivGHB6Bl
 qEe/X8N5H1K1ltBn9Q0SaP0LYfXfWGjoC51bFXkeoh1RAahOB+HlC74pb12hoxBp5zrT
 sRWRNA6KDhZI2SGn9GMdWzm7YAbItMfI2Fo1vNj7LloB4itx+aVRQZwm2BoToVwS1ky2
 kLxnopfgjjBz6HWxbeDWypySEnK8TP3xHXtjYURiUJo1ES0k0g0HbhewxVmnGjiEaEiV
 s8Berzm7Uts9qzXHl6MZ55PgyQY3Qmehi41OzN7k90zloZRT3Z/XBmZ9QGQ50nKi6du2
 NpLg==
X-Gm-Message-State: APjAAAXRn1Tdf+aNX/NL52R6jdrWJeWj1jYrOh74O+BTGC4KeC1rnxiy
 gghm+poxXQDuJefWSUX2P/znU/41
X-Google-Smtp-Source: APXvYqwafZvbz0G9T3ZzA993e1RS7EVbdidzco6BMyXZOZkPY2MQn9Me+KuSxubDykIJFXOiJtTYkA==
X-Received: by 2002:a63:d0e:: with SMTP id c14mr52790338pgl.345.1558036180274; 
 Thu, 16 May 2019 12:49:40 -0700 (PDT)
Received: from localhost (wsip-24-120-201-130.lv.lv.cox.net. [24.120.201.130])
 by smtp.gmail.com with ESMTPSA id
 y17sm7190556pfn.79.2019.05.16.12.49.39
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 16 May 2019 12:49:39 -0700 (PDT)
From: Jungle Boogie <jungleboogie0@gmail.com>
X-Google-Original-From: Jungle Boogie <sean@puffer.in.lylie.net>
Date: Thu, 16 May 2019 12:49:38 -0700
To: wireguard@lists.zx2c4.com
Subject: Wireguard in OpenBSD ports!
Message-ID: <20190516194938.GA70710@puffer.in.lylie.net>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi All,

Jasper, an OpenBSD committer, has ported WireGuard userland daemon and tools into
OpenBSD's ports/packages!

You may read the article here:
https://blog.jasper.la/wireguard-on-openbsd.html

It seems to have been a good couple weeks for the WireGuard community - prealpha
announcement of WireGuard available on Windows; wgctrl now apart of WireGuard,
and now OpenBSD port/package available.

Thanks all!
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
