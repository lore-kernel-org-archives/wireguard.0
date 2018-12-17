Return-Path: <SRS0=kUA2=O2=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47C48C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 Dec 2018 01:42:02 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 697972084D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 Dec 2018 01:42:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=diyism.com header.i=@diyism.com header.b="lFzOi/HG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 697972084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=diyism.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 26cb9026;
	Mon, 17 Dec 2018 01:41:43 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fd4bec92
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Dec 2018 01:41:41 +0000 (UTC)
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com
 [IPv6:2607:f8b0:4864:20::e2e])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a67cd08b
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Dec 2018 01:41:41 +0000 (UTC)
Received: by mail-vs1-xe2e.google.com with SMTP id g68so6733365vsd.11
 for <wireguard@lists.zx2c4.com>; Sun, 16 Dec 2018 17:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=diyism.com; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=IKzg4vYhB2nV8fpM7x/IfGRNst2Z1GcUDqmPZq2rzDs=;
 b=lFzOi/HG7+ZGKhHp5OBEpTj1+6knEtKiiaAHF4HCaRNndhfw1itTANeX34A3zhKsu4
 E8/AFOGZTIfiUlg1iexnfNmdRf7QwxqpFgIbVqS1wkpt287drrHPglZpV26a8Ht5+xBe
 8c7TOgB3b4oLRGYRJ/9m86vqs17TQ8AvdAT7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=IKzg4vYhB2nV8fpM7x/IfGRNst2Z1GcUDqmPZq2rzDs=;
 b=fkiHk3FMeH+2d4NKLjCO9kWfAHufI9gXyXpVzVf2LOhmu3rwmpkUhbX4YKWdBnr9D/
 tL0MWGIjJmGolznS2iHf1iSZiTBrjM8W55go9A3xtSjtr8M6h92+MTtEdzdlNJxlltDN
 9F20kB0pnPaDr1YiPyZjosujN2kdjspVVkt6my7RvBY5HgwVirQbYRXdme/F7zo6L2n9
 WIwnbgRW2ZG1SeNuuew76FvXFxms4khM8tL7aEDhlaOkfS6J5Z9GbN20pyzWmHkGpm6v
 eoaLgY4wfXwILN/6EYkYBshoCGdugJXyfRzowS392WrDD4/EWNXDFYMD0JHqwNkn0lUB
 Qz3Q==
X-Gm-Message-State: AA+aEWYu3QR8SoZlNeM0j5OAIDwnFcRakiFPM3OXGIoJ3azy10k6WHkF
 SqFctMkGXyoSc2vJZQVvlN6HObECYY671eALtz3vZ7Sa3lJo5A==
X-Google-Smtp-Source: AFSGD/XX3rmtK+QZpyQ2h9Np5bObtuDaQ9T9znJp5UHPMtN53G2JgPVEVmDMkNYC11p9R7bWGefjsARpPawuejVFpBw=
X-Received: by 2002:a67:1f4a:: with SMTP id f71mr4842922vsf.236.1545010915818; 
 Sun, 16 Dec 2018 17:41:55 -0800 (PST)
MIME-Version: 1.0
From: "KeXianbin(http://diyism.com)" <kexianbin@diyism.com>
Date: Mon, 17 Dec 2018 09:42:17 +0800
Message-ID: <CAKVinOVZ1nVJh8LvqGme5C27+R=AFBOxPKS22ckO7TEHsbc4-A@mail.gmail.com>
Subject: [Question or Feature Request] Any wg1.conf option to limit peer IP as
 1-to-1?
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

For example, my wg1.conf now:

[Interface]
PrivateKey = uMoD1TRi+tRkEVF/B5VrXQwHMN3xC1eLVXNbLkkkkkk=
Address = 10.1.0.1/32
ListenPort = 21404
MTU=1300
PostUp = ip route add 10.1.0.0/24 dev wg1
PostDown = ip route del 10.1.0.0/24

[Peer]
PublicKey = Zd5jssxd4zj/4d6ZpOtClyD/8V2eGR7jpHM3jpppppp=
EndPoint = 162.243.2.2:21403
AllowedIPs = 10.1.0.3/32
PersistentKeepalive = 60

If I want to limit the peer to a fixed IP 10.1.0.3, any wg1.conf
OPTION to config it?

Currently,  the peer can set any IP, for example 10.1.0.4, and can
send packets to my http://10.1.0.1:80 from 10.1.0.4.

Thanks.

Malcolm Ke
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
