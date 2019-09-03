Return-Path: <SRS0=Y3Bu=W6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37FF8C3A5A2
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  3 Sep 2019 17:35:28 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6049E21897
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  3 Sep 2019 17:35:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=symbolic.software header.i=@symbolic.software header.b="STJQxbhi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6049E21897
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=symbolic.software
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 430f1987;
	Tue, 3 Sep 2019 17:35:09 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 671a7b19
 for <wireguard@lists.zx2c4.com>; Tue, 3 Sep 2019 15:19:12 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e27ec528
 for <wireguard@lists.zx2c4.com>; Tue, 3 Sep 2019 15:19:12 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id n10so8062713wmj.0
 for <wireguard@lists.zx2c4.com>; Tue, 03 Sep 2019 08:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=symbolic.software; s=google;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=SkedKtMru6+0KpcTUCpVMPoxNjE4uOFjOxJa6gHQWYE=;
 b=STJQxbhiDbf13Xv70xP8aS0aC86VkdA6lMrMcjhUGSGW/MHzl+2cZXrRgYUgy4JRi2
 KOuv7+1ur/Orte3sR8PymXu39JEr/zGeQ61WRW3a5H5CiSAQj41c02G7AnvtKXXx/3Y4
 w5uYh4aTZI5R8lpcUcuyP9eSzefaKppOcD5cQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=SkedKtMru6+0KpcTUCpVMPoxNjE4uOFjOxJa6gHQWYE=;
 b=oMty07P2ZH0WOZ/+VWYloGnrppTWy8bfY4J8UK2DpRhAQtmMxY5ozK2I62hdpujE8C
 i/b9ATzr2OHg9aYYlBdGjM5OUR1BXs0VkYWkolQq+q5erBJ7fku+DZrJyxjP4nbQjvGw
 Bo/SHA03FPUqfbwmCi5MPYvrCUEwpcipAZlqgnFl3QiZLJ21711mkZQ4PLvm/xbEGVSt
 0Zwx6YkpV6mGPgkxBCh67nfapBBR15YwE5dJZ8KBS4aK9UXzlSGjChDLCVFklg+ZRoYd
 UrM0U3QzJ/YZ8taj3V/Xp6FxtLRXczcm+fJhaOQxfzvO8z7cCOxlk6b2e3SpBFnsszbZ
 godw==
X-Gm-Message-State: APjAAAUAzuPHpkbRTBi3svuCFAcwMcs8XMYYd9vFh/J6VICD+uGUmuU/
 2eTAJlj6fG8Q15yDbl6+PGn4O6kvTi8=
X-Google-Smtp-Source: APXvYqzUGsDUk48X87OHk3BxpDSBC/SYgRyy08gkTQi6jmxJdIZ8V5mCrFg91FQlMy7WGYeX9i4B9w==
X-Received: by 2002:a7b:c019:: with SMTP id c25mr750478wmb.116.1567523950233; 
 Tue, 03 Sep 2019 08:19:10 -0700 (PDT)
Received: from [192.168.43.124] ([80.12.33.113])
 by smtp.gmail.com with ESMTPSA id w9sm4349423wra.15.2019.09.03.08.18.58
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 03 Sep 2019 08:19:01 -0700 (PDT)
From: Nadim Kobeissi <nadim@symbolic.software>
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3578.1\))
Subject: WireGuard on macOS: config self-deletes
Message-Id: <F64B8A21-7B78-4E61-8297-40B711D0FC02@symbolic.software>
Date: Tue, 3 Sep 2019 17:18:57 +0200
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3578.1)
X-Mailman-Approved-At: Tue, 03 Sep 2019 19:35:08 +0200
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

SGVsbG8sCgpPbiBtYWNPUyAxMC4xNSBCZXRhIDcgKDE5QTU0NmQpLCB0aGUgbGF0ZXN0IHZlcnNp
b24gb2YgV2lyZUd1YXJkIChhcyBkb3dubG9hZGVkIGZyb20gdGhlIEFwcCBTdG9yZSkgZXhoaWJp
dHMgc3RyYW5nZSBiZWhhdmlvcjogb3Zlcm5pZ2h0LCB0aGUgY29uZmlndXJhdGlvbiBmb3IgbXkg
dHVubmVsIHZhbmlzaGVzLiBUaGlzIGhhcyBzbyBmYXIgaGFwcGVuZWQgdHdpY2UuCgpUaGlzIGRv
ZXMgbm90IG9jY3VyIG9uIG15IG90aGVyIG1hY09TIG1hY2hpbmUsIHdoaWNoIHJ1bnMgbWFjT1Mg
MTAuMTQuCgpJIGFtIGhhcHB5IHRvIGhlbHAgZGlhZ25vc2UgdGhpcyBwcm9ibGVtIGFzIG5lY2Vz
c2FyeS4KCk5hZGltIEtvYmVpc3NpClN5bWJvbGljIFNvZnR3YXJlIOKAoiBodHRwczovL3N5bWJv
bGljLnNvZnR3YXJlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpXaXJlR3VhcmQgbWFpbGluZyBsaXN0CldpcmVHdWFyZEBsaXN0cy56eDJjNC5jb20KaHR0
cHM6Ly9saXN0cy56eDJjNC5jb20vbWFpbG1hbi9saXN0aW5mby93aXJlZ3VhcmQK
