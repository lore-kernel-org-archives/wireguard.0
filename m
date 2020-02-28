Return-Path: <SRS0=PDJl=4R=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 566DEC3F2D5
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 29 Feb 2020 11:35:22 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2A46246A2
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 29 Feb 2020 11:35:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="msv99xVJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2A46246A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4bbb222a;
	Sat, 29 Feb 2020 11:31:05 +0000 (UTC)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d6d6fd6e
 for <wireguard@lists.zx2c4.com>;
 Fri, 28 Feb 2020 11:42:29 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id i10so8059525wmd.1
 for <wireguard@lists.zx2c4.com>; Fri, 28 Feb 2020 03:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=C5V9kpXavKURdhgcyzAh/1Bjuzx9hvn05CNi+KPL9sM=;
 b=msv99xVJhI1TClWukPDLXvtGW470f9kOpiE5xre9wxcmgOc0wr9mS8D4UdWj1FYWq1
 WytqAkzar+F3MUQAdsKE/g7a8iMq9hVJBpgBVpciFQbbtnTVxVNatoiLpcvNmPUfGS5j
 gY3lLRT08hah45p9BZp2qjRiizJZdXrF2JphoM6c66A9r7YTZ/tYGru5XfXCWGCYG6fv
 bTzk6o5OVkpQ7GSwJpYKO94lg4T9RNOprDYZ0/TmBmx1rTxutWlHuk9ar8vMnuRxszN8
 2b8xeRLBkPN2gSmtxwTB9QVwJ91pzoWfb2JSCFT2Ofo/vynlQGBT2HODI3DaG1O9ilc1
 lAiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=C5V9kpXavKURdhgcyzAh/1Bjuzx9hvn05CNi+KPL9sM=;
 b=skIyCdMynpsZIBKeNPTpGeGBxywJMIe5n1X9LZ6znqNh+V+ddpecvpjC3UxWS8jfe/
 Hn7Is4tn0n0uf0y1fKiTKOzwvfMq3tfDGIenva9Fwy6pq4jEBXM6wor1i/a1R8v9LSxv
 ac4C4rkxLGVYIvh16sgixbZOfqzoOhexcD/INPwubXeWqKZ8qUQ4U9zIVx30wL/EKcOy
 2xKXGgOpzu6c8U25DTQ4hPr1+ackz2XOGJBDH+KiAZfdFwNRRdE4V3r5+dyiJWG5E7Wf
 yKcuhyhQKp4v5mK+2LpDMgmS3GM70M+C7D5T6jmJ7Hva3Xnmn3JjSoJyzGk6zDYJ7mDB
 jwPA==
X-Gm-Message-State: APjAAAUfPKiWKuC2rjNC9lXnxkwDxIL1CPw8eYbsshx+ZXELpKMvhvkb
 W1rfiBfBBYBVGhKJ/txKJfmgSzo=
X-Google-Smtp-Source: APXvYqxlUn0QV37gY4tZNUH52NWiGMHgPnpjd2YZ6oBXCcYx+jrJJCrD5Sl8m6AcCzm/pz3N7OLXKA==
X-Received: by 2002:a1c:df45:: with SMTP id w66mr4432841wmg.171.1582890382960; 
 Fri, 28 Feb 2020 03:46:22 -0800 (PST)
Received: from mechanicum.chadwicks.me.uk (mail.oesys.co. [84.92.86.82])
 by smtp.gmail.com with ESMTPSA id c9sm1805416wmc.47.2020.02.28.03.46.22
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Feb 2020 03:46:22 -0800 (PST)
Subject: Re: Endpoint default route (Windows)
From: Kevin Chadwick <m8il1ists@gmail.com>
To: wireguard@lists.zx2c4.com
References: <96de0e37-fba0-9187-9bd2-47e5fa469edf@gmail.com>
Message-ID: <7886753e-c3f6-f94c-6ea4-f767f59af5d6@gmail.com>
Date: Fri, 28 Feb 2020 11:46:21 +0000
User-Agent: Mozilla/5.0 (X11; OpenBSD amd64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <96de0e37-fba0-9187-9bd2-47e5fa469edf@gmail.com>
Content-Language: en-GB
X-Mailman-Approved-At: Sat, 29 Feb 2020 12:30:59 +0100
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

On 2020-02-27 18:12, Kevin Chadwick wrote:
> I have it working now BTW.

Well it isn't any more. Some kind of ARP issue ignoring replies from the server.
Perhaps having no gateway set would work and allow the entry to be written.
Manual entry didn't seem to work.

Now back to investigating using OpenSSH instead for inuse ports via loopback and
FYI, have found that after uninstalling wireguard and creating an extra loopback
adapter in windows that the new KM-Test loopback device is called wireguard
tunnel device. Running a restore in case anything else has been left behind.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
