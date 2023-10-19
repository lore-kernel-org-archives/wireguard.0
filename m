Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B21ECC072A2
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 19 Nov 2023 13:45:21 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7f9cd77c;
	Sun, 19 Nov 2023 13:34:42 +0000 (UTC)
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d28a9db0
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 19 Oct 2023 07:44:14 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2b95d5ee18dso110990391fa.1
 for <wireguard@lists.zx2c4.com>; Thu, 19 Oct 2023 00:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=um-edu-mt.20230601.gappssmtp.com; s=20230601; t=1697701453; x=1698306253;
 darn=lists.zx2c4.com; 
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=o6mOy2qDglDLe36TMMUyyCe1fTzaPE9BF+4sXxflUuw=;
 b=OoC8Z5ZIHTXwPqZZTRzMnmzknda35MUTzg1wkDu6P9/bBclRQra7ndGWZKgZuAgZNI
 fLVEL2+2Qvij+hK0WkVUbpvvT1ScTlIYo4rWycLRM+g2HX9zhk/s6bP3b2PZgbm+AWHF
 v6n/9B3Fg1OVCnNFDFYiEoiVMzdlaQ4cxn0W8+Hgjl2sO0oqKRAqhOC+/7vbins1D5OW
 0XS+oA5PlBMeuG6DLetWgYZNf99MbgQ7L17zo1fCrW4aVWFrGDff+0R7FxkhX+YIXBOh
 vveHcefCVfARoiJrD6oU35GlZoelJ9Yk2YAYt/NG1X6ex6/tlgRKE8UT6nLKN7GKZMPu
 gzqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697701453; x=1698306253;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o6mOy2qDglDLe36TMMUyyCe1fTzaPE9BF+4sXxflUuw=;
 b=JK6WkpHieFa3Nux67UPgVykLFWRCIgsofMkoIJLv/4T16Mc9TmSQVgK0jDdb8j/s2Z
 eB5D7Cw4ppx5TNrOr1Qr9IrIC2uFDlIdf1/4v/MZx3Xu5gukoXLS9XjWcRmfp23CJAAj
 fJ5O7j7ME97QCR7IhCIH6Uz0dBjJcU3ogbf9woglw5wHJMG7vFRPWAuDRuqswXNJSVQU
 w/2OI64lM3uPQBa1tzfhG6e0iH+S8TOMvikpEZwpS2sY+xnmoEuaAXgHaTAO8sFzCm17
 GSsSpXezluEhVMjeYnbs27CZjJZZEz00IkJptJgw9j2f8jcBBZ47+L62q9063wunlCoU
 qA2g==
X-Gm-Message-State: AOJu0YxBBKiV/ax8Yy8JwWSM+a5EO6g7F61GCgOkflYnSc8wN2SJ9fp+
 Hmh49TQmtM+Or5eK3VNOyvAr/KGLDO7JVyXmNim0UN74ebxB6xoD3xCnbg==
X-Google-Smtp-Source: AGHT+IFI3GdwfRUHDI/ExIwhqtYIw0lbwXz8nRop46owAnE/iANJ27v8yQmD7WLkFjWMwbQfgMLijqfxt3F5DtZvZ4Q=
X-Received: by 2002:a2e:a781:0:b0:2c5:239f:1866 with SMTP id
 c1-20020a2ea781000000b002c5239f1866mr980695ljf.29.1697701452532; Thu, 19 Oct
 2023 00:44:12 -0700 (PDT)
MIME-Version: 1.0
From: Dave Mifsud <dave.mifsud@um.edu.mt>
Date: Thu, 19 Oct 2023 09:43:46 +0200
Message-ID: <CALv0RtmmZyMUGeBjuU+hvDven23Ad6XYWqfL--h+m-sHt-+ZPg@mail.gmail.com>
Subject: Wireguard Windows keeps using lower priority interface (wifi) when a
 higher priority interface (wired) becomes available
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 19 Nov 2023 13:34:33 +0000
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

We are implementing Wireguard as a VPN solution for our network on
Windows 10/11 clients. One issue we have encountered is that Wireguard
VPN traffic keeps transiting the wifi interface, even when wired
becomes available.

We have tested the same Windows device without Wireguard, and when the
wired connection becomes available, traffic switches to the wired
connection.

Unfortunately users do not realise this, and at times are located in
an area where wifi connectivity is not optimal.

Has anyone come across this issue? Can anything be done, apart from
creating a trigger in windows such that whenever a wired connection
becomes available Wireguard is restarted? We would like to avoid this,
as the solution seems too drastic.

Dave
