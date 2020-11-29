Return-Path: <SRS0=qAD6=FD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CF62C64E7B
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 29 Nov 2020 21:02:12 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A489C20809
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 29 Nov 2020 21:02:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FjNCBWKx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A489C20809
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8e3af3b5;
	Sun, 29 Nov 2020 20:55:43 +0000 (UTC)
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [2607:f8b0:4864:20::32d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2a350665
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 29 Nov 2020 20:47:08 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id y24so9501321otk.3
 for <wireguard@lists.zx2c4.com>; Sun, 29 Nov 2020 12:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=ek3Mr9hCHPW0He1tcQhTdEtlqAhc0ofGT2VsRDOJKLI=;
 b=FjNCBWKxqqwAMBffr1MMEre8SzV6YmZlu6bGep0xmVEC2Jo90ZcCrWXGDDldETrGLr
 bqB9/8/VJZc7FsV2zDGrI3aFG6baLYyo/54mWBzamd0uGBtyjDB+0CWGd862J7sPemLb
 jSv/ZgH0DsCmQCch4/lAkO2kmxD+G1FYzSLForBpdBoxcybaADWE5rrbODMze7/YywkH
 h9BkjeOMNi+rlhjZ0sLlR/GB5FRXTgrPb4dWGYRH9BbBcLyXZs8mkmnWw7CGGkhYTgZd
 8aJIcgFBVC4yNYOn4xdGWYAX3S6thl26iVGOpQFNVN1L7v/w20Usk1hsUzPQfsvZ8lNx
 IV7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ek3Mr9hCHPW0He1tcQhTdEtlqAhc0ofGT2VsRDOJKLI=;
 b=VavcvswJ0BCusSGO4JcSFPLyt7Ln3Vy7PMxdAa/UJxoij8vhj13o89SEuzMQfgLF6F
 y4pcIBcHHHKTSLERxV7lDOaCnYBK6k0laWIHBSmLSBooYalxiWfvNZdTybRLM74r0vPU
 4D57bVm+mV663y0QyzgNb3a0V6ab9Le/sXyS25WaI0o8gTIPH6DopAAQfzuADpYjP74/
 Si3latIIlwZZjojymPkZ6xO+UDbkHy4A/3ncYn9ePXiylipUPQWzzvXpVrKF/P3BTY+V
 KPAbR43YsqfXIQjemYABvxo+T74cj9UfG/5l0IXxbRV0MRV+5+ctrTVL5l+maOsOhc1p
 1E1Q==
X-Gm-Message-State: AOAM532paxVJQhZ6oHxc+I97t128FEPDVfvtwcCMhdU40dZcAOC8FzyT
 hCtzyEi0B5hwSUu8Qwjita0XPS743GJ5XrBQohVImZTrgnL5GA==
X-Google-Smtp-Source: ABdhPJwbP2X04L2wUcW8/ecMBTRS4H7cU7esbaWNjtuFtfb8soit8zOLmXCHDUwkd6iS6zsmusbAYFTkCnrFmcrcic0=
X-Received: by 2002:a05:6830:4032:: with SMTP id
 i18mr9705857ots.345.1606683200822; 
 Sun, 29 Nov 2020 12:53:20 -0800 (PST)
MIME-Version: 1.0
From: Justin McAfee <justinamcafee@gmail.com>
Date: Sun, 29 Nov 2020 14:53:14 -0600
Message-ID: <CAFf4X80AwvFEaA5R9DYC9MxCLwh4j-fevZW1+eobTJiMT2Xfzg@mail.gmail.com>
Subject: Android Notification Panel Removed in Android 10
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 29 Nov 2020 21:55:40 +0100
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

It appears that myself and others have noticed that Android 10 has
removed the VPN status and connection details from the top-down
notifications UI.

If a VPN is active, the Key icon appears, but pulling down the
Notifications bar shows nothing.

This used to be a quick and easy way to verify WG connectivity, active
tunnel, and amount of bandwidth utilized.

This can still be accomplished but is done by long pressing the
wireguard toggle in the quick settings (or opening the wireguard
application) then selecting the active tunnel and viewing the transfer
details on the bottom.

I'm sure this will come up again, but wanted to share with you all.

Thanks for all the work Jason, et al. put into this project. Its
greatly appreciated.


- AV

"but in your hearts honor Christ the Lord as holy, always being
prepared to make a defense to anyone who asks you for a reason for the
hope that is in you; yet do it with gentleness and respect,"
1 Peter 3:15
