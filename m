Return-Path: <SRS0=ZLx+=WB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E570EC0650F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Aug 2019 18:46:11 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 826ED214C6
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Aug 2019 18:46:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=syseleven.de header.i=@syseleven.de header.b="S+SDj086"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 826ED214C6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=syseleven.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 722c0332;
	Mon, 5 Aug 2019 18:46:11 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b4f75e31
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Jul 2019 16:44:16 +0000 (UTC)
Received: from smtp01.syseleven.net (smtp01.syseleven.net [77.247.83.123])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bba982a1
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Jul 2019 16:44:15 +0000 (UTC)
Received: from 127.0.0.1 (localhost [127.0.0.1])
 by smtp01.syseleven.net (Postfix) with ESMTPSA id 0CEB22461AAA;
 Fri, 19 Jul 2019 18:44:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=syseleven.de;
 s=2015n001; t=1563554654;
 bh=K+qGUTTeYv8oT/oc6w59cAKCEflZJZgAe1Go0oQjkYY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=S+SDj086tTz23kE5xf37lTUArbGo2FfFs1FM98HYk9eEvBtDDBgXgqpg1jin3qMMD
 PPq70Gh7ylkBQriZM0uAbwcgq3wEZkEV1aCmBR0CUkX6TR0wfIPXzgXkQt/Sj/WK7f
 jM5ZWhOwORA2ukcmSugjS4P0FGvH7jeJEkRj6Z98=
Subject: Re: Wireguard in OpenVZ with NETIF_F_VIRTUAL feature
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <e332179c-68e7-46f4-1f4c-7c6b899b0864@syseleven.de>
 <CAHmME9pYWcA_AJ6-UFqq-hUVdXfSadkBWQpg68ee=_R-ttgthA@mail.gmail.com>
 <CAHmME9qATuY5us=Tb9rDXpDqM2yC-14os1=_26q3zfXv0RvJ2g@mail.gmail.com>
 <fc83f1a4-2523-5e6a-1647-d5e5535074ae@syseleven.de>
 <CAHmME9q4kfAkrt=t65Y2cpUTmabFVmUPh2ughjy=+zb4WnAoqA@mail.gmail.com>
From: Benedikt Braunger <b.braunger@syseleven.de>
Openpgp: preference=signencrypt
Autocrypt: addr=b.braunger@syseleven.de; prefer-encrypt=mutual; keydata=
 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
Message-ID: <e1aa01a0-8da7-37e8-4a86-1a4bcbd3c947@syseleven.de>
Date: Fri, 19 Jul 2019 18:44:12 +0200
MIME-Version: 1.0
In-Reply-To: <CAHmME9q4kfAkrt=t65Y2cpUTmabFVmUPh2ughjy=+zb4WnAoqA@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.100.3 at milter01.syseleven.net
X-Virus-Status: Clean
X-Mailman-Approved-At: Mon, 05 Aug 2019 20:46:09 +0200
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

Works like a charm! I can compile without any problems and I get
2Gbits/s out of the box between to containers on different hosts.

Thanks a lot!
Beni

Am 19.07.19 um 17:25 schrieb Jason A. Donenfeld:
> How's this look?
> https://git.zx2c4.com/WireGuard/commit/?id=08f1bfe29a08d9f10f9fa4c47e07a3501a4a8c8a

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
