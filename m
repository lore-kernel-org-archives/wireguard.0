Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D95EE4996
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Aug 2023 19:45:04 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d92cadc5;
	Mon, 21 Aug 2023 19:42:47 +0000 (UTC)
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [2607:f8b0:4864:20::1031])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6b3242b1
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 Aug 2023 19:42:45 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-26f3975ddd4so1258716a91.1
 for <wireguard@lists.zx2c4.com>; Mon, 21 Aug 2023 12:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sidebranch-com.20221208.gappssmtp.com; s=20221208; t=1692646963; x=1693251763;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=NQifJQzeScTn3Dtk1KqbyV/TDfM6r0pxndHCKsh+Udk=;
 b=uZA5hPJUitXsosfXUPSMtoKYlc+cg5qFxCFVbE0eApDGg9K9Qll5y83feT/8fy6Nhs
 jPrBrVmZUxNOgwlGIrpw6yU8+sL4xMiP8vnqHFINhtPZllyaYfbKQMZZgSKsILT1lDLm
 dcGO1hcjsqCDwPawbOdhTYR9hZRCHO2x/koJ6QZn27oNMMqhBSxreDNM7yXcljEOCK6v
 FzKd6lzQVgAKYyWgVfMwDkqdXbh8ZksPy/G1VJCWzWEGzPgyV77GoGU5gZLzqKehe0PL
 CijvCJp9hZZArZgA98O67IzpUseC35FyjfvIGVjS0yRM0ckuYDk7zsgqz+Qlg0RwDoUz
 ddGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692646963; x=1693251763;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NQifJQzeScTn3Dtk1KqbyV/TDfM6r0pxndHCKsh+Udk=;
 b=K4KNA2tIvP+mgga8OXQGDhAP7IZggCNGrKfHzsC9G1RRIZWd0+2WCaajKfCx1jRdM3
 gHiPJHDTMgGq9rvblPSHbviJCBL835h2UFAmgDsxE2eG1WN+BBlDoMV6hDUrpV2qIV2s
 0ouFrF8RLjVrR2lhj26mBuC7tYIVkWzyG9FFwB7ndMDENrnKZ5kklnENBQ7pft3SroCi
 ExQNbBCx4yxXtGl6ACGMCIfxpsjcOYXGqksX4tX6An5B+b7p4DxOkg4jdebQVRsfDlyt
 /G8HL2+8VBaYSjla4uzaYc/70gPYsFmJCAYiuXrir3M1BDo0zm+wbXW8bk4/sRnhiX6Y
 FSkg==
X-Gm-Message-State: AOJu0Yz0/5Aryg/BPFfc5eOEqPB0rDbyp5OVrtwralMKhBcDRgKtVKli
 J0PqIPT6f/YDSifEQecPyg2ZcgrRBJYRTYy5yzj3Sndt1gRhJ5e1l0Y=
X-Google-Smtp-Source: AGHT+IGVINzJOsdQHuGX6+QUP++naXJ2TPcfMToTOBenEMqegMlan0ciUamkFR3LhK8JF2UzHlh/14Jv38bh+bJVJGA=
X-Received: by 2002:a17:90a:eb09:b0:262:f06d:c0fc with SMTP id
 j9-20020a17090aeb0900b00262f06dc0fcmr6736951pjz.7.1692646962987; Mon, 21 Aug
 2023 12:42:42 -0700 (PDT)
MIME-Version: 1.0
From: Leon Woestenberg <leon@sidebranch.com>
Date: Mon, 21 Aug 2023 21:42:31 +0200
Message-ID: <CAMjhiJg+5=BHtqem+_Bjy5Dq=6u5Fhr630ZAUstKS40eu1oKxg@mail.gmail.com>
Subject: WireGuard FPGA RTL open-source implementation
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

Hello all,

Our FPGA (RTL)  implementation of WireGuard* is now released as open
source, here:

https://github.com/brightai-nl/BlackwireOverview

The implementation reaches 100 Gbit/s on AMD (formerly Xilinx) Alveo
U50 per direction and is currently limited to 1K sessions.

This is a true *inline* accelerator where one end of the FPGA
(Ethernet) is encrypted and the other is plaintext (Ethernet or PCIe
depending on FPGA board). The full protocol is implemented on the
FPGA. The data path with symmetric crypto is implemented in RTL (using
SpinalHDL).

The session management is currently mostly implemented in software on
a RISC-V SoC, but we already had the x25519 crypto accelerated, as
well as some handshake primitives, and are moving this more and more
into RTL.

*It is not finished, but we think we started with all the hard parts
(i.e. non-trivial ports) and have 25% left to do before we can call
this WireGuard.

Our current release is targeted at developers, not end-users. We
decided not to release any integration code yet, as we cannot support
an in-rush of "issues" where people cannot get this to run on their
favorite FPGA board. We hope the project gets some sponsorship from
FPGA (board) vendors to support their platforms.

I would like to thank contributors to SpinalHDL and Corundum,
especially Charles Papon and Alex Forencich as they have been our
(indirect) main contributors of the project by providing an excellent
FPGA HDL/RTL development language resp. an excellent Ethernet/PCIe
FPGA NIC, as a starting point for our development.

Regards,

Leon Woestenberg
leon@sidebranch.com
