Return-Path: <SRS0=CDXv=5U=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29BFEC2BA1A
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  4 Apr 2020 22:45:25 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C30B1206E6
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  4 Apr 2020 22:45:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XLl4OFij"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C30B1206E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 554909f7;
	Sat, 4 Apr 2020 22:36:02 +0000 (UTC)
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id bfd86265
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Mar 2020 06:31:43 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id q5so13133723lfb.13
 for <wireguard@lists.zx2c4.com>; Sun, 29 Mar 2020 23:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=r/UEnX76U1nKLXdp0Hso40+V+rEjwP8fsgiKpGfnpX0=;
 b=XLl4OFijJzmtB2KZLZVlE9NKYTWmSJ09WdBqgtaVei9hxcRPShQENwdbT9T6qQR3Ug
 vSsf3PVNv8icfPHjYzA/onRACTtl3cZI/qxJKriOWXkbUGpDDrcEwVCl58nGhcmk3DGC
 kougOqHONXaCraglRXN+fto/3kl8po2j1Tjaw/KX9/Kwwshi+crpKIVNvB6bCMdy7Voq
 CeBj+3VR1jUFBq+ZX49MMyBhzwSfjdWD49NC3HbL/aBAGOQ6DhXc7+W0CusIN5sK4w0r
 Pr/drivd2YH7t8uMo52LL6V6NXlEvJFtLDvkdmsHy9irm0xKpnCPKsM2lwTwuRjreeaI
 KLeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=r/UEnX76U1nKLXdp0Hso40+V+rEjwP8fsgiKpGfnpX0=;
 b=BqOuqdttyIXrJTnyfgBhhH4LYm1ag3RnPTFai3y11OtrA/OeSUPIGpntWMAvSt+Bch
 ik3qP/W5bw/K34EUqrm2JFMximVny+G/DwdHsCzcEgWooaPCdqVDHO30947XqMwcnN5S
 uGqGbuNOYkBUDTvXoKDqS7Vsu/aA1qC1sSlwDxhyB14b0mCVeuUyui+s6e6DI+96omIn
 IBG6x+a8QXqCXV38bM89GLTcgZiEd4gDKFuf2yvDUwiBLb8LDjLPQ4Ks/HLLhv8HTbPu
 e4L4c0y71yu2NeNmjhHQ9wVrvoYLqjheP4oWUbJF/T7dEVyc/3uadtuixL9dPf9blj4K
 HaHw==
X-Gm-Message-State: AGi0PuY3li3Lj1e/KMQT1hWJYnLB48yalPPb4oXTL5BOqFiGn2Z5LOFx
 qq1NfVzcxiwdnjatOZpwuv6Tbkn/M0ata4/AzkYJ6pqxDP2oYekE
X-Google-Smtp-Source: APiQypKpHPE0h/b4QpzHMYW9iKVKGZ/gqL347fnKixxwpW/Dazv1Dcu+/oEMMepWCVHwHBe2j/39mZBV5nbJKYYNB5I=
X-Received: by 2002:ac2:4c29:: with SMTP id u9mr7264355lfq.149.1585550373574; 
 Sun, 29 Mar 2020 23:39:33 -0700 (PDT)
MIME-Version: 1.0
From: Phillip McMahon <phillip.mcmahon@gmail.com>
Date: Mon, 30 Mar 2020 08:38:57 +0200
Message-ID: <CABtXGiBwT8xqHUP-L818UeNEG+2RcR165Kkxc9f6sMSZKJRd2g@mail.gmail.com>
Subject: Windows Client - UI improvement
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 05 Apr 2020 00:36:00 +0200
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

Would it be possible to pin the context items from the taskbar icon
rather than having to scroll through the list of tunnels to get there?

The context items are

Manage tunnels...
Import tunnel(s) from file...
About WireGuard...
Exit

I have over 150 tunnel definitions and getting to those options is
awkward, to say the least.

Thanks in advance,

Phill

-- 
Use this contact page to send me encrypted messages and files

https://flowcrypt.com/me/phillipmcmahon

P.S. Drowning in email? Try SaneBox and take back control:
http://sanebox.com/t/old3m. I love it.
