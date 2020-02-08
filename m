Return-Path: <SRS0=FiAf=34=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24133C35242
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  8 Feb 2020 22:21:03 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC7942082E
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  8 Feb 2020 22:21:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="k3SN2Lfj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC7942082E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 20b7132b;
	Sat, 8 Feb 2020 22:19:38 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bbaafeb2
 for <wireguard@lists.zx2c4.com>; Sat, 8 Feb 2020 22:19:36 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 505f4ddc
 for <wireguard@lists.zx2c4.com>; Sat, 8 Feb 2020 22:19:36 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 08346966
 for <wireguard@lists.zx2c4.com>; Sat, 8 Feb 2020 22:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=B4ZgXSdNqF5jASEIOjghbUwPSqI=; b=k3SN2L
 fjaF4JEU0BZXQNmRLqFQh+lHZTSsGPzYdo5vlOzNclxx6XKZIIo1w67G9WYcjQud
 3sBxzDBdhfj7OCLQDLMoQlK0YedIUj1Sq/gSKgsTEC0rdsM5K/xCG4LDlCApB9eB
 KV/gwH3teeCXP78UrNA7EJn/RePiUC5/KJmFJoyqdcZhYIQAI9P98jsUB3u7UE8h
 fsiQB3xPea8TrPVDyb+N9ZhiLqfq52iuhXz+us2e2WXvW9FNAaG5VDHJkVD11dYh
 Ousi14RielIxigbXqtMRB3GhmSQjVDaWivQ6p5mEPYC2A7vaeu3pXsvhzOgFtGFx
 hyDTXpaKbdg+RRyw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 73b67d04
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 8 Feb 2020 22:19:36 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id i6so2787918otr.7
 for <wireguard@lists.zx2c4.com>; Sat, 08 Feb 2020 14:20:59 -0800 (PST)
X-Gm-Message-State: APjAAAWDMIemgQOTC6pShE612UcoviE+896epsx751chVMaDgUjoqmd6
 GzS37sQvwQhlSEscv6t/AreLe0vTZMSl4VYjIe0=
X-Google-Smtp-Source: APXvYqxDz7tAaMlMOJQ20GAB0XEdLe24lspelTtN7QlqmGDNVQj2LOQk1pzQKJl17Hb7xWmbGpX6uzG85IYvMIqBqi0=
X-Received: by 2002:a9d:7a47:: with SMTP id z7mr5010645otm.179.1581200458549; 
 Sat, 08 Feb 2020 14:20:58 -0800 (PST)
MIME-Version: 1.0
References: <20200207200035.69579-1-hristo@venev.name>
In-Reply-To: <20200207200035.69579-1-hristo@venev.name>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 8 Feb 2020 23:20:47 +0100
X-Gmail-Original-Message-ID: <CAHmME9owUFjKsW=oGWeziQk8rjPm4cMrArJQ=nDP8+793w5PsA@mail.gmail.com>
Message-ID: <CAHmME9owUFjKsW=oGWeziQk8rjPm4cMrArJQ=nDP8+793w5PsA@mail.gmail.com>
Subject: Re: [PATCH] Implement reading keys from stdin.
To: Hristo Venev <hristo@venev.name>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Thank for the patch, and nice hanging with you at FOSDEM.

Trying to get a handle on the use case for this. Is this so that you
can put the private key and the preshared key in a single file
together? Is there a situation where the shell redirection trick
doesn't cut it? For example:

wg set wg0 private-key <(head -n 1 bothkeys) preshared-key <(tail -n 1 bothkeys)
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
