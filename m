Return-Path: <SRS0=JcDs=NP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76237C32789
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  4 Nov 2018 15:35:38 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 135F32082E
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  4 Nov 2018 15:35:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="FP+kpdbB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 135F32082E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ae55314a;
	Sun, 4 Nov 2018 15:31:13 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bf94729c
 for <wireguard@lists.zx2c4.com>; Sun, 4 Nov 2018 15:31:12 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dcdc9ba6
 for <wireguard@lists.zx2c4.com>; Sun, 4 Nov 2018 15:31:11 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 83c1b863
 for <wireguard@lists.zx2c4.com>; Sun, 4 Nov 2018 15:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=Ml8KgI6insHQdksei/obICZ3KLQ=; b=FP+kpd
 bBM4r+LndsSZCa53oI2HSbVEI9q3E0HywO4feGfsQWRffvBdCuwLKkFfonLyzDQN
 K/S7jgeYYCYp+D7Nea9DQ9eDSYAWtlXv3Blt9P1lRidH00dXjfzcx6wZP+80ig8q
 dL1IlWAuEQOdFzNNjlGA2Uz+G57cwafp388L8kZ9afMpVyvwstTlAE6s9d3dvHCf
 CWPs6o3jiweP4fSK5Q01YiQAmu7Z2XLOcTOd0y2DQscQnIIMnXTge+56/no8ncSY
 GR5QE79K316BFCbjRtqhdra9X+uO26BbRJMK/WgliIpB7J8d5+re4BTKAclkIdtf
 LR3fGxd+LcxhHjtg==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 88818bd9
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 4 Nov 2018 15:31:11 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id k19-v6so5377162oic.11
 for <wireguard@lists.zx2c4.com>; Sun, 04 Nov 2018 07:35:18 -0800 (PST)
X-Gm-Message-State: AGRZ1gImCIUvZiLP/521nX/hS1zkhYtMCSaI4ZGW3UyhwqDfAl35xPbr
 BxrEWNc1hrfqC+8zgcTQRGKQQeVmfi1+8jkZSvo=
X-Google-Smtp-Source: AJdET5eTJw8EMNzy7cVeeN6UFExsQztm7D66UyacuxFRapYAlRqjF+2HmBXU3yGvzFqUKLVC8BU1ZUkoDHyfmZu+ANw=
X-Received: by 2002:a54:4095:: with SMTP id
 i21-v6mr11526240oii.190.1541345718163; 
 Sun, 04 Nov 2018 07:35:18 -0800 (PST)
MIME-Version: 1.0
References: <0e93f5b4-8883-57e4-0114-42f0bfd5f6c3@powerneth.ro>
 <b0nxrg6FW687Fl8Gai_Eo8VNChZfWGIxiEhhrcjdPJY9UKGgbYOTzxkzek-YZ01khNfWy76jBAsL8wtUVj0ECl3uF_nu3r6Yk_mYSpY4O28=@protonmail.ch>
 <17a30c81-d413-a742-77a7-8743b2574a3c@powerneth.ro>
 <87pnvnmvsc.fsf@fifthhorseman.net>
 <CALJ2VGaq8AasV99YApW5UWEKK0B-r+uafT7nEjbKARfwADab+A@mail.gmail.com>
 <87o9b5frsn.fsf@fifthhorseman.net>
In-Reply-To: <87o9b5frsn.fsf@fifthhorseman.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 4 Nov 2018 16:35:07 +0100
X-Gmail-Original-Message-ID: <CAHmME9pOqbjbnOKi7NYfCp9yGkfNfBZfVMexZAB3SCtEv4NGSQ@mail.gmail.com>
Message-ID: <CAHmME9pOqbjbnOKi7NYfCp9yGkfNfBZfVMexZAB3SCtEv4NGSQ@mail.gmail.com>
Subject: Re: wireguard dkms systemd
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
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

FWIW, Ubuntu users got confused with reloading the kernel module (let
alone systemd's view of units), so we wound up adding something a bit
strange to the postinst:

https://github.com/EggieCode/wireguard-ppa/blob/master/debian/wireguard-dkms.postinst#L36-L72

Not sure that Debian would want to follow suite with such a thing though...
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
