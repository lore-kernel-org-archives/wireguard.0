Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA7DF45A0D
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 10 Apr 2026 21:42:26 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id a896d30a;
	Fri, 10 Apr 2026 21:42:25 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 24794904
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Apr 2026 21:42:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 75712407ED
 for <wireguard@lists.zx2c4.com>; Fri, 10 Apr 2026 21:42:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F16CBC19421
 for <wireguard@lists.zx2c4.com>; Fri, 10 Apr 2026 21:42:17 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="AghkiJmp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1775857336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wo+0k9IYtdoG73JknU8AUgTqcVk0mkLXKt8zu0pR4l8=;
 b=AghkiJmplHPw+g7kozej53ZqDSsW193kdtbLhL884LNoGUu1HoYj3qnYsdibkRNjvDefPn
 uU0tgFScrEjG8KmQVlSPTWO4+vFbJ+N0ieGedFVb1TdX5jJs6SDlddoWBVW5YlF//Ldv7c
 PjzeQlwLZtTKOEc/krWnrNNEYpAv4/0=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4398da42
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Apr 2026 21:42:16 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 46e09a7af769-7d9b21d1461so2403655a34.1
 for <wireguard@lists.zx2c4.com>; Fri, 10 Apr 2026 14:42:16 -0700 (PDT)
X-Gm-Message-State: AOJu0YzYI6JUeVCqbAkJnlHSSV+iDI4ALiMB8APhvaD/cJ5fqkOG+sfm
 hc0pnh+ZPiWc5SRAvaJiYR5jn2hMQhgZpthR9XYU8/UgCLCQE6YnWEfLEPKUma3QnXq2bd21yMS
 x6DDp5/XR7zE2PRyrvCXYXDEG2t+coNE=
X-Received: by 2002:a9d:7b4b:0:b0:7db:a297:9e62 with SMTP id
 46e09a7af769-7dc17632cfbmr3337245a34.8.1775857335482; Fri, 10 Apr 2026
 14:42:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAHmME9rTCt5V=4ULQ2XM1DkWMdG_b4VJJCGF4aMBnd6VVnFsXA@mail.gmail.com>
In-Reply-To: <CAHmME9rTCt5V=4ULQ2XM1DkWMdG_b4VJJCGF4aMBnd6VVnFsXA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 10 Apr 2026 23:42:02 +0200
X-Gmail-Original-Message-ID: <CAHmME9qNvO0tOWbs06VmFjiOc1fsyrZuMN-OC2kH4K+4Om4F2A@mail.gmail.com>
X-Gm-Features: AQROBzDi7hkEXj4gdRthxYGaK4aQC7shuEHai9UwZm27ZW0PcaobUezYx-wVqRg
Message-ID: <CAHmME9qNvO0tOWbs06VmFjiOc1fsyrZuMN-OC2kH4K+4Om4F2A@mail.gmail.com>
Subject: Re: [ANNOUNCE] WireGuardNT v0.11 and WireGuard for Windows v0.6
 Released
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

If you're a tiny percentage of users running older builds of Windows
10 and are seeing in your logs, "[MGR] Update checker: The parameter
is incorrect." in WireGuard for Windows v0.6, you'll need to run the
fetcher to get back on track. Download and run
https://download.wireguard.com/windows-client/wireguard-installer.exe
and you should be all set (and will get v0.6.1 installed). If you're
not seeing that in your logs, you don't need to do anything. Sorry
about this! Growing pains.

Jason
