Return-Path: <SRS0=Bwq/=XV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79D68C4360C
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 26 Sep 2019 18:41:21 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5DC9206E0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 26 Sep 2019 18:41:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CKPhfp53"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5DC9206E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c34331f5;
	Thu, 26 Sep 2019 18:40:53 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0bd15b2b
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Sep 2019 18:40:50 +0000 (UTC)
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3074442e
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Sep 2019 18:40:50 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id q1so9304663ion.1
 for <wireguard@lists.zx2c4.com>; Thu, 26 Sep 2019 11:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=aCJpPTV2s3XXGnF2c81nwr15U8HRV1xeJuh5QLZwT6w=;
 b=CKPhfp53AW2g6bSTqXeenHn/mGfq8eatOBLilDbCOxQRFgmYMoqZPobIakWUkcnk4u
 u8YbtLRRBDi7H+MvyRggge5wFlOeRAUZR08sgDhV6Tb/qQgH0OmR5K+qTyxdEWT2T9A+
 xu8HSk2u7odZzj5QcxzW6+CgxWDl//TDNjhWtUFFjoRrTb1nthOFaSuBoli5zvYQw4xv
 qmi+/nJy0vR6biyXfPC/iCLuirXrdGzWJpbUlVAYeGFspy83bm2BY51A0uK21R5YjtZK
 5r1xn5HNtn6WAw1K7Ms/VMd6pyqrYFrRzfIsZxV4YHW/i/vuLwOkA6jOzQ20jHBINdM+
 +FaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=aCJpPTV2s3XXGnF2c81nwr15U8HRV1xeJuh5QLZwT6w=;
 b=mZHBx2MG3AxWq2SVfixpPp6Ui+NjPQH25uicUhV6x+mLHeI4refggFi0ndmc9eH3AJ
 UMou89lyaYAfBlKBRTaOylsoPbNlywFxM67gKUGPX2mOMNNRgR9KtAXzwXWH2CsdYRC3
 fH9LXKRJ9UufjuBSTnlpGp9RDXFy5LK0xkRsBnux0h9mJTaXGsCpNKQlR/qPmjmq/wTV
 E06VMQGRgxpfffZyyJSfRf7886k3uyDGiC0BfBBeQCQaXWl+HF1rwnD8TH/CFTgEPXNV
 7JGDpehkQ0mk7Q5vjzqFeT0rTevdsJrT9n9gg8M508ygMhyH6KVcuqv77sNez67T75Bu
 U1XA==
X-Gm-Message-State: APjAAAUOytT/9NRUJbMTuvAzerHS/2zZf3q+SGBeSIt3ss7VHju4jFRc
 8w1HDpACg5lO3ILrvZ3bFwBoCK8X4pM=
X-Google-Smtp-Source: APXvYqzobGX7y2jVgfeSPSxdveoFcU3OnrZsid+Ox5aoQn9u2o7vNX3aF73mN11Hxwyx4nNUqc5J5w==
X-Received: by 2002:a5e:8341:: with SMTP id y1mr4184877iom.284.1569523249887; 
 Thu, 26 Sep 2019 11:40:49 -0700 (PDT)
Received: from ?IPv6:2600:6c4a:787f:d200:c922:1fee:23fe:4c60?
 ([2600:6c4a:787f:d200:c922:1fee:23fe:4c60])
 by smtp.gmail.com with ESMTPSA id n17sm1183720ioj.73.2019.09.26.11.40.49
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 26 Sep 2019 11:40:49 -0700 (PDT)
To: wireguard@lists.zx2c4.com
From: Matt Layher <mdlayher@gmail.com>
Subject: DNS search domain support in wg-quick
Message-ID: <0b3ec078-48df-472d-8754-c667e300bb90@gmail.com>
Date: Thu, 26 Sep 2019 14:40:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Language: en-US
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

I would like to add DNS search domain support to wg-quick and I have a 
working patch for Linux. It would look something like:

[Interface]
Address = fe80::2/128
PrivateKey = (redacted)
DNS = 192.168.1.1, fd00::1
DNSSearch = lan.example.com, lan.ipv4.example.com, lan.ipv6.example.com

I have a few questions to ask:

1) Is this something that we would like to have upstream? It appears it 
can also be done manually with a PostUp directive, but this also seems 
to wipe out the configuration set by the DNS key under the Interface 
section.

2) What is the policy for adding features like this across multiple 
platforms? It should be straightforward to port the change from Linux to 
FreeBSD and OpenBSD, but I'm unsure about Darwin and Android. Darwin 
appears to have a networksetup flag to do the trick, but the Android C 
changes would require much more scrutiny.

Thanks for your time,
Matt

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
