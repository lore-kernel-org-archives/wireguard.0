Return-Path: <SRS0=NPIR=XJ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C7C4C4CEC7
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 14 Sep 2019 16:52:08 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC68C20640
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 14 Sep 2019 16:52:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="vsU8d05o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC68C20640
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 873c839b;
	Sat, 14 Sep 2019 16:52:06 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 511489ec
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Sep 2019 16:52:03 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f64638e5
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Sep 2019 16:52:03 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f5e69b73
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Sep 2019 16:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=Yp1iAEoEgRRtAhzqYbU6CRVT8tg=; b=vsU8d0
 5oHQW53OYGJGEZ3jviJKVqYwI6j4Y6zwRwEQ2BGzA2Yf3Zwh+8Cu0ugglOpdV3BJ
 Ujq5kl17eEv/arYuoMRdkRAzO3KBJzkpYwVkiZN5vjN/36GPce4d1TMzXd74xUdD
 S2fg346C4xJNZkTdjdMU2xbFl0lciTfydzZgDlTfGk/wgcaGu2FL/7fzQMcAlkCy
 q179jBDfku73QuXhGVY4jAg9Njt6cEpHekts/UBUDZDD340djao3guMkAhM+ZU4B
 ynRvymNrVMCH2uYIO7xl45pOhL0SNgmvCR1j2RfYHNxPHKENP+81GIALfXqLfkN1
 YOUphBJS9dELfJkA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 690fafee
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Sep 2019 16:07:40 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id g13so2250016otp.8
 for <wireguard@lists.zx2c4.com>; Sat, 14 Sep 2019 09:52:02 -0700 (PDT)
X-Gm-Message-State: APjAAAXLDluanYJuDD3GjS30PwTVhZah/vxmKH9jaJKd32797K7cWaVR
 w4VUN2zCGpkJw/+oWUdpDO/rExHxLEB204EDq5o=
X-Google-Smtp-Source: APXvYqz/7OBu+ZPDrpd1yqtrkQK+7FGXl+4MFBwakHRp/INDPwNt8udc2VsEzLc4/1Qg/mSx9WOvaYufksQmlhdYGsE=
X-Received: by 2002:a9d:6748:: with SMTP id w8mr26926496otm.243.1568479921780; 
 Sat, 14 Sep 2019 09:52:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAHo=znZWFs427fDRYPUx3jxjXR01McUFwsOQR9rQy4ocWwyRNA@mail.gmail.com>
In-Reply-To: <CAHo=znZWFs427fDRYPUx3jxjXR01McUFwsOQR9rQy4ocWwyRNA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 14 Sep 2019 10:51:50 -0600
X-Gmail-Original-Message-ID: <CAHmME9rXV2_YG3fGMErDeTjfHeNKhDC2cCYA6Kw93n9A328QpQ@mail.gmail.com>
Message-ID: <CAHmME9rXV2_YG3fGMErDeTjfHeNKhDC2cCYA6Kw93n9A328QpQ@mail.gmail.com>
Subject: Re: On Windows: Wrong source IP address
To: Sebastiano Barrera <sebastiano.barrera@gmail.com>
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

We do this in order to prevent routing loops. Since the endpoints
can't roam, we can't add an explicit route for it (efficiently and
easily, at least) with the 0/1,128/1 hack. So instead on each platform
we attempt to use some form of policy routing to exclude the wireguard
socket from the wireguard route. On windows, policy routing
capabilities seem somewhat limited, and IP_UNICAST_IF to the default
route seemed like it'd work good enough for most people's use cases.
It obviously totally breaks when you're not using the default route. I
wonder if WFP can be made to attach some kind of context that we can
route on late in the stack, but I haven't looked into that yet. If
you'd like to tackle this issue and find something better than
IP_UNICAST_IF with the default for policy routing, I'd be happy to
take patches.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
