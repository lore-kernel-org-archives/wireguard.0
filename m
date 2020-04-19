Return-Path: <SRS0=yJRU=6U=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48D33C28CBC
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  6 May 2020 10:48:25 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABE53206B8
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  6 May 2020 10:48:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D7UrBvLC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABE53206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f447d47b;
	Wed, 6 May 2020 10:35:17 +0000 (UTC)
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [2607:f8b0:4864:20::d33])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a7c0d9b0
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 19 Apr 2020 15:21:20 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id z2so3652683iol.11
 for <wireguard@lists.zx2c4.com>; Sun, 19 Apr 2020 08:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=0x5JHSFwJbqv/oxWGErWZG0omArAKavN+mxtzTRZpTg=;
 b=D7UrBvLCbj6AXSW3DQeEhZwGbCp2YBP190amxqycKZRLCnDWRwbKpkfUcweeRvcgbJ
 lk8avVuIIU82c4h+uNWxLJKz/gR0DgfsXM87KNt6HM1Z1BEZA9zbiWrkzb0WPF5XHIT5
 1Hglk9yTJZgHcWhMvrK72CEwXefc8O8JX9VS+1GkmcSiP+cmzMG46D4O9eODV5vpIkYr
 18U8nUUfdpZaud7vgni8kavEm+XS1CJizocOmN1MAVemrbzM8awOzdWJLRr+/0WiZOD2
 Jye5taaU53+375XU9mgQOENkMAs3Uj2TOefUpmSJRnDEccVAKjGG8XMGlwbUCiddxVja
 d7aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=0x5JHSFwJbqv/oxWGErWZG0omArAKavN+mxtzTRZpTg=;
 b=p8gCp292YZj8fJZxbwd+fWcr3IpeGPFgsyeCeF+JyZWb60HvTUaY2YflJuLZTxBDlp
 ldkrbLs1yZkIuSwkVfKz0jIpeRhrPUeOEtE8aGw0/l3ZxwcL8ioZHjeIVV0cwI8jrZft
 mXx/SyJVRVA2U/WitEADlfqPHIGreeBUtumukfDzh7JiVAJe9VLVf/djiIez5G9vQp0p
 yX8aYeLncEcVJfsz98EsMyjIgLpAXuwd398BsDTDAl26C3eoJRPx+/WqOWatEwSTHr5v
 WnIV9Qw3C5gVaDV47WSZt32p1nJNnWblPSvfgIrj0vMfL89Ov90rYDYWsjnDKDNMr+wc
 +5ew==
X-Gm-Message-State: AGi0PuYxlKsiBedTMG3KzfrbOPpqrVw6JFgwCps6sxQajqo5ZCuYTOIh
 CkoY6R+AWqeRRQfxeRlxsVRSBnw9WCgEG3catO4a6w==
X-Google-Smtp-Source: APiQypIRFLKBZPJN5VmpTz2lMWsweFSFCExscEloDIULpZOcxq5qYWkzqKvKbYNMAFpczzNOIEZT4aOGmJpqyowsvgU=
X-Received: by 2002:a02:7b05:: with SMTP id q5mr12139280jac.105.1587310308818; 
 Sun, 19 Apr 2020 08:31:48 -0700 (PDT)
MIME-Version: 1.0
From: Dark Shadow <shadowofdarkness@gmail.com>
Date: Sun, 19 Apr 2020 09:31:38 -0600
Message-ID: <CAMXzSMozuS_dSpODmp3LzAmoetr9jKXUZpbQthx5P9YXk-xGAw@mail.gmail.com>
Subject: Android client fails to auto start connection if using a DDNS address
 as endpoint
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 06 May 2020 12:35:17 +0200
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

I set up Wireguard and had it working fine when manually starting the
connection.
After that I wanted to have it be always on so that it would auto
connect when turning the phone on but I found that it would say it was
connected but no data would transfer.
Manually turning it off and on again would fix the connection

If I change the server address to a IP address everything works
correctly and the connection just works after turning on the phone.

I assume this is a bug that can hopefully be fixed as I would prefer
to use the dyndns address in the settings.
