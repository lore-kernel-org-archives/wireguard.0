Return-Path: <SRS0=9XF/=H3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AB0AC433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 25 Feb 2021 15:44:30 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 176B264F19
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 25 Feb 2021 15:44:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 176B264F19
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c6e1eb6c;
	Thu, 25 Feb 2021 15:43:00 +0000 (UTC)
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [2607:f8b0:4864:20::12c])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0be51822
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 25 Feb 2021 06:32:15 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id d5so4000569iln.6
 for <wireguard@lists.zx2c4.com>; Wed, 24 Feb 2021 22:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=+FqNdIxBR1XdmzahTvgqZ9WEyg3iDDIJERddYtVqwRI=;
 b=cHib8wrH2kYdHQkMz1hwM1r1SWd+dVJDBhCIYUi/IUbvrrBjZMZHGVrD9IGf3yN9p2
 tbB7Aeb+ScqqFrBNOH/3NExhM8iw0ukDPLHtJcG2mrxlcSwaNoYH3YWEjVwOb0LpFTKZ
 CJxOvzLfXzwF03suuZmEy6DWr0WEUZEkjMmVzThXXx0oH4EgR6YVwlmApQCxEnFDEOS6
 3Nj8ketyLtwbBoJdIS9tWhycQB90fl8rftp+DjK5oyx0IzRF8pWcxWC4LRXbQ20e7CCA
 wVFaFmjSE+ITjsKoy31EnEtQFEjvOISlyp+4+wgT2O2ReuczIoie0zEFZYGhb4TiFNLb
 AjvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=+FqNdIxBR1XdmzahTvgqZ9WEyg3iDDIJERddYtVqwRI=;
 b=MHCTpr3ae/9ywtsLA7AICmAfYQvdZj+uY8i3+Tlo8EImcjcgLYNYBA3QQk8VkWlrls
 4WixkEm9mJVJuBrD2SPzRzrrdPmUDUAhTiFXKf+ADJvyYmFM4XF2pjCoWF24TzWPstX/
 XQg6g3FjFpOHthr7okVlcCdC3ZVC6UyxtDjh+4XE0JT36Q9yQalY7GfbFxeGRhCaknoR
 dQ5QxT3bu5WjOuSD0U1Nacdg2HcRmHqUmJp0wEuN6fg6Ws2eYbMkEc7vLa3EVQl5gb2Y
 ifYbu9xiz0YRWlwGTLsJzRfRp7NsqVH5t05/qtTZyXUxDw11ct2gMUs5HPV3rtptSwI9
 bchg==
X-Gm-Message-State: AOAM531PSJB19jC8twieKk40KgYTf3UozxusrSNzsIwYXLbxxRB1NdVY
 oMnuUeRKdxEGzMM6po7CMRH0z2E4wdt7kO1d4EMQEy62H8ja4Q==
X-Google-Smtp-Source: ABdhPJy+9i3UYpuVigelq9dAz9UdXf3dIIbcgESCOu3FNzdj5D8AVU8k3ihwBiL/kk1KhVRaGEVmEoZqsw70bxv3oVo=
X-Received: by 2002:a05:6e02:881:: with SMTP id
 z1mr1284528ils.288.1614234734144; 
 Wed, 24 Feb 2021 22:32:14 -0800 (PST)
MIME-Version: 1.0
From: Devanath S <s.devanath@gmail.com>
Date: Wed, 24 Feb 2021 22:30:47 -0800
Message-ID: <CADjMg7Vp+p7n_JLMfFU4GwtNu_X3ARFJOuhxLasonuD-fvB5Hg@mail.gmail.com>
Subject: wireguard-go on windows
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 25 Feb 2021 15:42:59 +0000
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

I am trying to run wireguard-go on windows for debugging purpose only
and seem to get the below error.

Login user is local admin on the box and it is run as administrator. Plz advice.

c:\Go\wire-win\wireguard-go>.\wireguard.exe wg0
Warning: this is a test program for Windows, mainly used for debugging
this Go package. For a real WireGuard for Windows client, the repo you
want is <https://git.zx2c4.com/wireguard-windows/>, which includes
this code as a module.
INFO: (wg0) 2021/02/24 22:09:55 Starting wireguard-go version 0.0.20201118
DEBUG: (wg0) 2021/02/24 22:09:55 Debug log enabled
2021/02/24 22:09:55 [Wintun] CreateAdapter: Creating adapter
DEBUG: (wg0) 2021/02/24 22:09:56 UDP bind has been updated
INFO: (wg0) 2021/02/24 22:09:56 Device started
ERROR: (wg0) 2021/02/24 22:09:56 Failed to listen on uapi socket: open
\\.\pipe\ProtectedPrefix\Administrators\WireGuard\wg0: This security
ID may not be assigned as the owner of this object.


Regards,
srini
