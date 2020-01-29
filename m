Return-Path: <SRS0=qOIe=3S=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8411EC33CB2
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 29 Jan 2020 12:16:02 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D693020716
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 29 Jan 2020 12:16:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="tDU0csZ7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D693020716
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 502ca4d1;
	Wed, 29 Jan 2020 12:15:31 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5f087342
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jan 2020 12:15:30 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 52f1cff5
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jan 2020 12:15:30 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1c5dee11
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jan 2020 12:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :from:date:message-id:subject:to:content-type; s=mail; bh=bHEDAC
 llkomB/iUjyWoesygVpj8=; b=tDU0csZ7/+Q8X+BqhpGDOWRM/LU9VawEj5CMAi
 0PXYjh01kQ90u4h53BC6ThihbYwc5e/2srX8uIVUxEZC1uCp4Xy0YDdteDbD9Kwn
 fsYNY9IszTlCKWF15lN2N5ARLG9ZNgLqN63xkAdvLW5+5NFmZDTlbvubhTNlFRcY
 1FGVxb2rn0T6hGP0obgd3s8jRwc191f7yEwFnOR/18Y2xbmX6QhfB4pJTskcYA3x
 JH+TZdBxnS4YMxrXbACE7x53T85QhXpsHpnhRYwonO5oSPsG9mDkLDfJMSRUILoq
 g2rhOgoJUa1ifTRwPXJov5Ll2HWyowXtRRc24WVHP3lUDO/g==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 736a62a1
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jan 2020 12:15:30 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id g64so15278169otb.13
 for <wireguard@lists.zx2c4.com>; Wed, 29 Jan 2020 04:15:31 -0800 (PST)
X-Gm-Message-State: APjAAAXPQPIZmJwBHw5bqISUq3h7ALEgifVOls1NTGK77H+DiewRdvgw
 iWoHuOJ+UUVCTDvKWpVD5A3HBdVTBbEE46Z2w58=
X-Google-Smtp-Source: APXvYqxJypQ1UgGrE8bjJimKMKeAtsELhQjFOTmf0/hm0fKoKjpfT8uV1Ak1niOk5q9jBXlP0X+2ln2EJz4pVUrEQkk=
X-Received: by 2002:a9d:811:: with SMTP id 17mr20808826oty.369.1580300130876; 
 Wed, 29 Jan 2020 04:15:30 -0800 (PST)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 29 Jan 2020 13:15:20 +0100
X-Gmail-Original-Message-ID: <CAHmME9rProfVf4VGHGX9no3KTa08nL_oYkK8Nv+eknk4ewVMAw@mail.gmail.com>
Message-ID: <CAHmME9rProfVf4VGHGX9no3KTa08nL_oYkK8Nv+eknk4ewVMAw@mail.gmail.com>
Subject: wireguard ci hooked up to quite a few kernel trees
To: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 LKML <linux-kernel@vger.kernel.org>, Netdev <netdev@vger.kernel.org>, 
 Linux Next Mailing List <linux-next@vger.kernel.org>
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

Hi all,

With the merging of wireguard, I've hooked the project's CI up to
quite a few trees. We now have:

- net-next
- net
- linux-next
- linux (Linus' tree)
- wireguard-linux (my tree)
- wireguard-linux-compat (backports to kernels 3.10 - 5.5)

When the various pushes and pulls click a few more cranks through the
machinery, I'll probably add crypto and cryptodev, and eventually
Greg's stable trees. If anybody has suggestions on other relevant
trees that might help catch bugs as early as possible, I'm all ears.

Right now builds are kicked off for every single commit made to each
one of these trees, on x86_64, i686, aarch64, aarch64_be, arm, armeb,
mips64, mips64el, mips, mipsel, powerpc64le, powerpc, and m68k. For
each of these, a fresh kernel and miniature userland containing the
test suite is built from source, and then booted in qemu.

Even though the CI at the moment is focused on the wireguard test
suite, it has a habit of finding lots of bugs and regressions in other
weird places. For example, linux-next is failing at the moment on a
few archs.

I run this locally every day all day while developing kernel things
too. It's one command to test a full kernel for whatever thing I'm
working on, and this winds up saving a lot of time in development and
lets me debug things with printk in the dumbest ways possible while
still being productive and efficient.

You can view the current build status here:
https://www.wireguard.com/build-status/

This sort of CI is another take on the kernel CI problem; I know a few
organizations are doing similar things. I'd be happy to eventually
expand this into something more general, should there be sufficient
interest -- probably initially on networking stuff -- or it might turn
out that this simply inspires something else that is more general and
robust, which is fine too. Either way, here's my contribution to the
modicum of kernel CI things happening.

Regards,
Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
