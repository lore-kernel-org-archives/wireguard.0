Return-Path: <SRS0=38ps=PI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9034FC43387
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 31 Dec 2018 00:59:22 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1E902081B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 31 Dec 2018 00:59:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="1n8mJQM2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1E902081B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c15f8dd5;
	Mon, 31 Dec 2018 00:57:05 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 783851e4
 for <wireguard@lists.zx2c4.com>;
 Mon, 31 Dec 2018 00:57:03 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 15d9d10e
 for <wireguard@lists.zx2c4.com>;
 Mon, 31 Dec 2018 00:57:03 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 72870b8d
 for <wireguard@lists.zx2c4.com>;
 Mon, 31 Dec 2018 00:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :from:date:message-id:subject:to:cc:content-type; s=mail; bh=lqV
 pFaSwpBjwxjcAcg+xyZXQmCU=; b=1n8mJQM2YbsEujaPVqNKdaVjUaLc7OP73Pj
 r39PAgCDBXkCkKoqy6DRAN8DYamox1CjCGML5pEPgwXBMq7HIPvKmRb6PgLY/4X5
 xmexmSziBbnBJaucL4BcF0+WiWAXJtqJ+is2+DAl2xmSxmxOC/aZsMcDT6RalgQu
 snIiQ6VZAOsv+Pov9ey0/cxQdc7mWZpLjgW8I3w0cL4p6oWZlgo1oyLSq8E47zTT
 8KAEWh5BUpr0jU1nkFD93mipoL9CdEAegBIDxwaKeOBjq1+5yuRfmS+HrLmMikCG
 T1UDe4dOQE15jGwgq7kpjiAf5ICEz3tKyVcPqSZABFHxN336ogw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f4274f68
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 31 Dec 2018 00:47:46 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id s5so22611032oth.7
 for <wireguard@lists.zx2c4.com>; Sun, 30 Dec 2018 16:59:04 -0800 (PST)
X-Gm-Message-State: AJcUukd91tRcUG16wvoEOOQHZjy0/F+D2gfRAchRZwgMr+3VNdXEnSkg
 RHct4eJvLl0tbmncranrG8y3tirpiAaYXui+5oo=
X-Google-Smtp-Source: ALg8bN7nJ/ISST/3zl9Vxgngk/8y9yMdqNAwzgDe8vUw9PjkfMIxiTfzTucT0Uuhb6fWPIDKXP3ut7/aO9BVwWJRqLs=
X-Received: by 2002:a9d:4e5:: with SMTP id 92mr25674180otm.199.1546217943502; 
 Sun, 30 Dec 2018 16:59:03 -0800 (PST)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 31 Dec 2018 01:58:52 +0100
X-Gmail-Original-Message-ID: <CAHmME9pvcrTnbzSvAS3Q1CbPRdZMctuyBmuCyxX0wa_k+A-0tw@mail.gmail.com>
Message-ID: <CAHmME9pvcrTnbzSvAS3Q1CbPRdZMctuyBmuCyxX0wa_k+A-0tw@mail.gmail.com>
Subject: binary module for arch?
To: Christian Hesse <mail@eworm.de>
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

Hey Christian,

I noticed there are now two distro-built packages for wireguard for
arch -- wireguard-lts and wireguard-arch. These seem probably more
convenient for most people than the dkms one. What would you recommend
in terms of updating wireguard.com/install/ ? And do you plan on
depreciating the dkms one at some point, or do you think it will
remain useful for certain users?

Regards,
Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
