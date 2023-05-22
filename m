Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD12C77B73
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 22 May 2023 10:13:46 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f3431093;
	Mon, 22 May 2023 10:13:44 +0000 (UTC)
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [2607:f8b0:4864:20::232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c06b982e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 22 May 2023 06:48:42 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id
 5614622812f47-3980f2df1e7so422886b6e.1
 for <wireguard@lists.zx2c4.com>; Sun, 21 May 2023 23:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684738121; x=1687330121;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=XtLcoy7c9NLVxFc94uxJBjXWMm25fZHBB3ZszEzbCL8=;
 b=aHEd2q5JtarfLLRQXgsdewO19N+eNBtJjYMTrTxmygJe2vvtLdkRalE0hUbsU4epIM
 o1Urey80lq5qUn+FseWLpKjyqgyrw6i8QmmYwst19/w/dVv+P1zQG4jQt8f9mLb/uyxd
 VGKvAFDgHpLNODAeRPwAlTh9RJYQxhD4Hho5cFpn+YHC/l86AvUxM3OeYvflVrlcdgOc
 Sg9cJ40qI/IfKSARHFXH8Yl2zkam2/sYsvT5l6QxZdR26r02rOteGNiFVgm1ZUg5/RfI
 88OExPCi1ROmdz4fBoOZ0goVeXQYmlqyyu6SfBVwZUrmyyUsp9dQVy87N4tzQKhfAti+
 XeLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684738121; x=1687330121;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XtLcoy7c9NLVxFc94uxJBjXWMm25fZHBB3ZszEzbCL8=;
 b=BXZmH+9ZEmTvpCO2hPSwl5nbdVFE+jq0zIKKKnMAKakkOPHkRhlBMOX1gvX4FCJSy5
 fCdXG8BRurcZKydnKEWEvRabESG8UzqFCJRPfZxuNigEYtpa4QgddRsPA9wfiJ5vNimD
 LcYKQiVuYNFkA5p27YvXgY4GQpxLUty+eYR6HXkYf5R8IEUmpO1PCq/1oc5BkyaE7xuA
 T7yuwosyUKpHwzA9f6L6WpCtqU8jIsq5UX8FIcWzEnq6xW98LK+6e+KBpcebGg6Y6YzJ
 xf7VnvHbezVqwMSI2ShuXV40UT/gBFOKlajtclQ1Oh9CNJ1WMaYrfdfh+Yj7YycfUNWk
 q46w==
X-Gm-Message-State: AC+VfDxlay0IIH3ht7GxoUy65I899zgmfbDPrcP3M0ByCKx/CTF+YPpp
 vsFJ5hOzRdpm23s7qleImq6byp0Th29JJUrigBfdtBFh61nuaKnS
X-Google-Smtp-Source: ACHHUZ58IdUaRMAJ4zBf6fEl7XUgG3KueojrL3iMk9JYLZlRSC8YmDUlRkbga62hBeeSBt6/ZZQ0NofpZPxHsc5feZ8=
X-Received: by 2002:a54:408e:0:b0:398:110f:dcc6 with SMTP id
 i14-20020a54408e000000b00398110fdcc6mr803927oii.44.1684738121038; Sun, 21 May
 2023 23:48:41 -0700 (PDT)
MIME-Version: 1.0
From: Nathaniel Filardo <nwfilardo@gmail.com>
Date: Mon, 22 May 2023 07:48:04 +0100
Message-ID: <CAKsvP2ZcqUvFD5g6vMxZrv7Z5+YAmoGBAh7zf8iZPPRE6LNEDg@mail.gmail.com>
Subject: IPv6-only flag set on v6 sockets prevents the use of v4-mapped
 addresses
To: wireguard@lists.zx2c4.com
Cc: Nathaniel Filardo <nwfilardo@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 22 May 2023 10:13:42 +0000
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

Hello wireguard@,

I recently found out that in-Linux wireguard has, since its inception,
set its v6 sockets to v6-only
(https://github.com/torvalds/linux/blob/e7096c131e5161fa3b8e52a650d7719d2857adfd/drivers/net/wireguard/socket.c#L381)
and it keys only off the address family  to decide which socket to use
(https://github.com/torvalds/linux/blob/e7096c131e5161fa3b8e52a650d7719d2857adfd/drivers/net/wireguard/socket.c#L188).
This means that v4-mapped v6 addresses (::ffff:a.b.c.d) can be
registered as peer endpoints, but the kernel very silently won't try
to reach out.  Is that deliberate for some reason that eludes me?  If
it is, could the userspace tooling be educated about v4-mapped
addresses and translate them accordingly before handing them up to the
kernel; if it isn't, could we drop the v6-only flag on the kernel
socket?

Thanks for any input,
--nwf;
