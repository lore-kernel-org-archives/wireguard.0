Return-Path: <SRS0=byLw=NS=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F1D0C432BE
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 27 Aug 2021 14:12:04 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFEB460F45
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 27 Aug 2021 14:12:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AFEB460F45
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 93737100;
	Fri, 27 Aug 2021 14:02:09 +0000 (UTC)
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [2607:f8b0:4864:20::12b])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 12dccb51
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Aug 2021 13:14:27 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id x5so3232602ill.3
 for <wireguard@lists.zx2c4.com>; Thu, 26 Aug 2021 06:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=7P3Ga5UZJ7bDkoptN9FCTPN70TYg7Sb7M5v2ePSWALA=;
 b=bjqc5lkEDQUq+L2I/xt33tla9VNyraLtZ7u2nCTTg/RPl+LUBU/h6NHXZYW4Smq8UQ
 FYjKFo8cgFnsTozaszjQqrPv2wbgyY9BT0o/U3RYfMYlc2gN7MKTQKxzsgQ2FAuabepX
 h+bb7FuwtoVJUdncEOSaOQlb4EfHYdwGRcgVKQFjcKs6mR8VMke7yEwLJ0OE0LvSG6Tq
 Nwxx7FHdixCTRi+QPpAKAIaOJgo1Z98StzwIrVSOoqcE3WIO498Gx8hkqRW0g/dd6K3d
 qs+fOOlT410XgIh5kUGnEprsI3PeRRovkNLMuvXoQ1QyC699gFHiOEcREaWvuiLze842
 zeaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=7P3Ga5UZJ7bDkoptN9FCTPN70TYg7Sb7M5v2ePSWALA=;
 b=fXtEKe59/pDZA0+xhoydnl8MMhk5RShrmG62CtvUPiaLPYO908Lghf0h2wsolTCcRG
 v7+HcX8KTfqiuLe9QBuUIiTOz+LMUATtIoAY2J1KuU6XqMD3kpZz3O8/DxMSNG0hj9v8
 2heAoesZ4yt8VUxhtXAAuzFHL7HU9pc64tQGElR7NxxXVcbp8YxV7nbBLMwkHXekoWXu
 p+SB+WH7vop4kzP7d4P6DRk/VV9b5M3lgz8H9mnfuB9hrC+IA2lL4sQUwwhjiHDOEXtl
 O+hgSVJ4Zg9g3alGw5PwAHbQ/gfLZSe/Dp7RhFbeqfls/gR4njJ9DyifJUHqDE+MX58y
 r6UA==
X-Gm-Message-State: AOAM530TuQYNuPB34m4IheG5HZG2JJvAJb+vSyVV8is1cdvEdoy1q+y+
 qSuzxHlNn0jQyoT1ko+7RJSMhOmFvRRYAOrfP9V1gyh8ugg=
X-Google-Smtp-Source: ABdhPJzCMUX3gwXEWuiIeNLFac1FI/IPBHY1in4B5Ok4dNDRXDX6EHHKfOwpAC5pwHeN3Hhi4VOetcvtOuqnvzHE9rw=
X-Received: by 2002:a92:c081:: with SMTP id h1mr2450219ile.193.1629983665634; 
 Thu, 26 Aug 2021 06:14:25 -0700 (PDT)
MIME-Version: 1.0
From: Gopakumar Choorakkot Edakkunni <gopakumar.c.e@gmail.com>
Date: Thu, 26 Aug 2021 09:14:13 -0400
Message-ID: <CABK1yFAx0mLhx1jj=WmAfLewvzea6n4hwhabY4RNG137smBiFA@mail.gmail.com>
Subject: wintun0.13 memmod load fails in windows10 (wintun 0.12 loads fine)
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 27 Aug 2021 14:01:58 +0000
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

In memmod_windows.go, the program exits when calling
syscall.Syscall(module.entry, 3, module.codeBase,
uintptr(DLL_PROCESS_ATTACH), 0)

module.entry =3D 0x18000a660
module.codebase =3D 0x180000000

I I just swap out wintun 0.13 with wintun0.12, the load / syscall
works just fine, just for reference the entry and codebase for wintun
0.12 are below

module.entry =3D 0x18000b64c
module.codebase =3D 0x180000000

My windows system details are below

Edition Windows 10 Pro
Version 20H2
Installed on =E2=80=8E4/=E2=80=8E3/=E2=80=8E2021
OS build 19042.1165

Any suggestions to debug further ?

Rgds,
Gopa.
