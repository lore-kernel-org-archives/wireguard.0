Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA78C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 12 Jan 2022 15:29:15 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 168a0145;
	Wed, 12 Jan 2022 15:29:14 +0000 (UTC)
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [2607:f8b0:4864:20::1030])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 427cd461
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 12 Jan 2022 15:29:11 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id o3so5630385pjs.1
 for <wireguard@lists.zx2c4.com>; Wed, 12 Jan 2022 07:29:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=cMam/lJ2t4SKn4dDRAs8XC/nv4lgeGX8oqUPvl8zLh8=;
 b=PhIqn/UwjNMbRn6m3ndmWMcIchoSw59oJqVnA6JOlEffx3wEIBGU192GWiRk+txE4F
 RDQTdMsLR3opfL9DY2lnbkrEvfH6rvLkbu9kkaakUcy2IGUEiRufz0x8j2kSrc4sxn+h
 M+VNKO0vyhrDJAVTEC53Gq0MktJPbxTvvgJVSCs0PgbgHlnF6/nStYll7aTFytVTt902
 X6BQP6xZrKOEOly38iWf/MSjQ7UqzsSiGZr+Pmxvt/g88/HAMpuJiRUmstlnqU5+9dst
 rTklPbbUsjp0JBPS4l/nk7nx0DebAHx5aLFU4LjNv26JYOPltPWLxygfqBFQMk1MeVt/
 Rhaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=cMam/lJ2t4SKn4dDRAs8XC/nv4lgeGX8oqUPvl8zLh8=;
 b=iTQGMT9lf+viP8H4HZdrbn8UIpfAxAJ7lzfgVUS2irOU3vrXBuuPYzWz96az3tRJCl
 nQdmz1M1Y1M8T7NbS+jciT4lCytF88cRNd1/DoTiCS9qJwY0Xt8DxtrZQvCgHl9xtjMb
 hW1jDGHUiBQeoz485GmBUkFsOa3KIVR8xUTDBtH2EV+/AMErT2fiZ+i/phKPOivAM6f4
 CjgR06emVSdvXP5z+6QhlxdghCk41yCTvkeDXLf9YsS632Eo+cg/nHz1kKe+L9JudWaF
 4aGRclWgzXVB6khmJo4XOFtAwSiptNM3GJtHym656YEaqdRP9nn2m2mjZW/gF1C37m9E
 ZJHQ==
X-Gm-Message-State: AOAM5314VNte7AMuFwi/Bf6tKR7/Cannb2eE4U+wGhVtQlVi3Vbvnjyd
 iu1v4ceJ7OS50zMR/HJf+kaOxEBORFiq7UcgeLlHSFn2oS044g==
X-Google-Smtp-Source: ABdhPJzNLnmDc/Wos5x3n8rdMVMe5y4k2GjB+UjM4PftX98Tdn7H2kuoy6Coqd1B+shJK9FEjveiubK1PVJwu0Coe5A=
X-Received: by 2002:a17:903:22ce:b0:14a:4623:60eb with SMTP id
 y14-20020a17090322ce00b0014a462360ebmr154643plg.81.1642001349511; Wed, 12 Jan
 2022 07:29:09 -0800 (PST)
MIME-Version: 1.0
From: Houman <houmie@gmail.com>
Date: Wed, 12 Jan 2022 15:28:33 +0000
Message-ID: <CABBZOsm1hzRqQ65izwk23S4rQrVCYBkwL73yi3LT5BdvNVbeeg@mail.gmail.com>
Subject: Enable BitCode on libwg-go.a (Wireguard iOS project)
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hello,

Currently libwg-go.a doesn't support bitcode in the Xcode project. It
crashes with the following message:

libwg-go.a does not contain bitcode. You must rebuild it with bitcode
enabled (Xcode setting ENABLE_BITCODE), obtain an updated library from
the vendor, or disable bitcode for this target. for architecture arm64

Disabling Bitcode for the whole project is very bad for dSYMs and
Crashlytics reporting, though.

Is there any chance to enable Bitcode for Wireguard, please?  If there
is anything I could do to help, please let me know.

Many Thanks,
Houman
