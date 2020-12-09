Return-Path: <SRS0=qhJm=FN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DC5DC4361B
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  9 Dec 2020 03:19:01 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A55B2071C
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  9 Dec 2020 03:19:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A55B2071C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=signal11.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e05d2ffb;
	Wed, 9 Dec 2020 03:11:33 +0000 (UTC)
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [2607:f8b0:4864:20::d32])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4b8bb36f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 9 Dec 2020 03:11:31 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id n14so146811iom.10
 for <wireguard@lists.zx2c4.com>; Tue, 08 Dec 2020 19:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=signal11-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=t9+ChstUTf02E2uWyUTK4atwyPPib5FOyvV3uv1ClZg=;
 b=Sy90H+lcJ5RUc5+NgxRn7OP2Y889hxWjF2tdGcse84X66neg3fsy/hjGsFzecjH9xV
 ZSel063Fd9dN6skI3bW7WXs6UfJU7MhPEIcGUCE4HcqCVaIblbp83k2HpFJBDt4HJ6E1
 TdhiKUn1swrE3e7imbhi0SYgFPZ6Ex6GETLJowrlhhodJGLkSc4UCEYJ6GOUI8FLTMcZ
 j2wFj3wOPKnSFFgn7vJAZxaWMYVtmTViBwWFS/CDu5G5sPrYW+zRsEwumhgfRwQxpsCx
 +xGLOwxwfKAn4HCvOjkY2Pu+nUwJPyJPwgf3lQvREN9Hgg3J+PPBZszreSemXYikBl+S
 5grQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=t9+ChstUTf02E2uWyUTK4atwyPPib5FOyvV3uv1ClZg=;
 b=e9RIuDJv6E3au/ioEW56RYJrobonYQzRRJdaDXp5XsMuU5NNCzS6tmXBtintevL1KH
 MJGY1cxdfXmAeIuRZpcpX92FdZ4I3S0HaJbJ9PxmGBZICMbad3HxX4nwfRr6JCjfEcVP
 kpNNwH3QsHvFkxsRC0ywQ+FT8nking7A02GdZaCQT18OnpZWPyPoMzcklFnzjZCW3H8l
 AuAPQpqf7R9wwzt1RsaJDVGX9YCv0tUd/DAKCneTjCVgwAibsFqJ6EIyrx5k6S+3oOPA
 t7CjVBLwCrfHrzioGsV/CPBNiSIebwSQdQDpi0bNSc8QUZpbsivRCwB+D672VyLpsmpv
 qslg==
X-Gm-Message-State: AOAM531Wv92L34jpwGf5qdDnykDEG9SdMr8W9hLgluFur3DgOSIW4ERC
 xMnDif7VxyH6zYnactpU9UUUsh3E5+GCOGe489KsmO69mzWwCg==
X-Google-Smtp-Source: ABdhPJzMf9xnK+itGiJ2r0Eu5ClvDP9//0VSfsNcxHb8wJYcCArItnmVViQXM2HGwCUteTizqHK0F9ll14NsHgGQ5UU=
X-Received: by 2002:a05:6638:d4e:: with SMTP id
 d14mr518968jak.26.1607483936061; 
 Tue, 08 Dec 2020 19:18:56 -0800 (PST)
MIME-Version: 1.0
From: Adam Weiss <adam@signal11.com>
Date: Tue, 8 Dec 2020 22:18:45 -0500
Message-ID: <CAFVoEQSmozd-6h7isSX04h8L3ZiRjv_xBmAiYVHNwyU3uoDz5w@mail.gmail.com>
Subject: Key Management / Rotation and Monitoring
To: wireguard@lists.zx2c4.com
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

Hi All,

I've been following some recent threads regarding real life
deployments of WireGuard and it got me thinking about key management,
rotation and monitoring.  Due to the seamless support for roaming
built into WireGuard these concerns are greater than typical setups as
a stolen key can be used seamlessly alongside its legitimate user.

In the interest of understanding best practices for secure deployment
of WireGuard and possibly identifying use cases for another project
that could aim to solve these issues, I'm curious:

1) What are people doing to get keys onto their endpoints?

2) What are people doing to rotate those keys regularly?

3) What sorts of monitoring have people constructed to try and detect
multiple users of the same key (I'm not sure how possible this is
today with the current WG releases, it's been a while since I've
looked closely at the project so please forgive me if this question is
nonsensical at this time).

Looking forward to any responses.

--adam
