Return-Path: <SRS0=OnWR=ZT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F421EC432C0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 09:55:29 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FF382070A
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 09:55:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sQaxJXul"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FF382070A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7abc8ffc;
	Wed, 27 Nov 2019 09:55:28 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 50d7767c
 for <wireguard@lists.zx2c4.com>;
 Sun, 27 Oct 2019 18:19:17 +0000 (UTC)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5348f4f9
 for <wireguard@lists.zx2c4.com>;
 Sun, 27 Oct 2019 18:19:16 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id q13so7533837wrs.12
 for <wireguard@lists.zx2c4.com>; Sun, 27 Oct 2019 11:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=BnEtJGesYiYxJquk2n7RZfyS0pW+Yy8iqMhsQKee0IM=;
 b=sQaxJXul0uH1RQT0eb+2frqfAWIdPZ2rM/NTl4r8YofbY1Z3U5Uw3HHIRSBMoqDDmE
 u6Sb08Np5v4bDbfx+RohkfB0V4bS8B+mgVZza0vdJcs+WDq7w931ixbvc9O81Z4DDc1T
 FvW6zwoygrEboNv1te9CCAIXRybSmvrt316W56G1zhquu1S/UJsTeem9HvaIYpBoy5Mc
 S1UgrZh333IWTzLmwJB2sASKvV1uJiimqMBhqDp2XOyrlGaGuit0EAfVsLHjHF+yymIM
 wBBGtY3FeUVdFtDvHyeH24uI7w8e0ulsTvIoK6NZjQBcR1C1cOSNRRmREJXJluTgYvkj
 6CZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=BnEtJGesYiYxJquk2n7RZfyS0pW+Yy8iqMhsQKee0IM=;
 b=MRFE8HDsCYb5WuGhcXUkLuY5GqUyCgJ9PMu3ZguarzCN3lEIMP9VATRDHCtwFwpLM5
 y9J23MmxS1Hbdag3r34+Jv0edG0I8LXhWXc7aSLEyZmSZ360kk4rCzQ2BszXhPZJCYhR
 8daOrksUdIHTL4sm1tPVjyaD7oDxk0qxDkxlUs0uSD4ackA4lsFLyE0FRmkGZIIa5bBA
 gFDPKpROljddFFWbUGIoNDAyhSR/iOeV4GaS1u7hshyRrE5hOeWo5I3fMUFVjh8JmMBa
 A92rQ6hrDlmIESsA9agk49Cb52hdG49UNsmCzviR8qZuwl31B2olctn449gmliGEN3gA
 q5Ow==
X-Gm-Message-State: APjAAAWXtO3eRgpXTYAOZBJGPCoplmGtprXxUVW0aLuOQAPNglwm3nfE
 +UX7cd1UlhVEXvKgYYl5qbXDNAzqmd4Qhr5sQedSEHpZ
X-Google-Smtp-Source: APXvYqynmFO7hOEvtmNF4B273OL/k9MtrCggmu+uNiBznQkDP2vl8NXzUzkt+EO7RYbt/qdrv+kSemYR2vD+vzX/hso=
X-Received: by 2002:a5d:4808:: with SMTP id l8mr11669087wrq.118.1572200355081; 
 Sun, 27 Oct 2019 11:19:15 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?Mantas_Mikul=C4=97nas?= <grawity@gmail.com>
Date: Sun, 27 Oct 2019 20:19:03 +0200
Message-ID: <CAPWNY8UPSzZuOYb9P1nLV3N6K+C971xjaRteOS2ekTCaFWS=9w@mail.gmail.com>
Subject: Windows: "Not migrating configuration" after every Insider update
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Wed, 27 Nov 2019 10:55:26 +0100
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

SGVsbG8sCgpFdmVyeSB0aW1lIEkgaW5zdGFsbCBhIG5ldyBXaW5kb3dzIEluc2lkZXIgYnVpbGQs
IEkgbG9zZSBteSBXaXJlZ3VhcmQKdHVubmVscyBhbmQgZ2V0IHRoaXMgbG9nIG1lc3NhZ2UgaW5z
dGVhZDoKCjIwMTktMTAtMDUgMTg6MTc6MjUuNDk1OiBbTUdSXSBOb3QgbWlncmF0aW5nIGNvbmZp
Z3VyYXRpb24gZnJvbQrigJhDOlx3aW5kb3dzLm9sZOKAmSwgYXMgaXQgaXMgbm90IGV4cGxpY2l0
bHkgb3duZWQgYnkgU1lTVEVNLCBidXQgcmF0aGVyCuKAmFMtMS01LTMyLTU0NOKAmQoKRWFjaCB0
aW1lIHRoaXMgaGFwcGVucywgdGhlIGRpcmVjdG9yeSB0dXJucyBvdXQgdG8gYmUgb3duZWQgYnkK
IkJVSUxUSU5cQWRtaW5pc3RyYXRvcnMiLCBzbyBJIGhhdmUgdG8gbWFudWFsbHkgZml4IHRoZSBv
d25lcnNoaXAgYW5kCnJlc3RhcnQgdGhlIHNlcnZpY2UuCgpJcyB0aGlzIGNoZWNrIGFjdHVhbGx5
IG5lY2Vzc2FyeSwgYW5kIGlmIHNvLCBjb3VsZCBpdCBiZSB1cGRhdGVkIHRvCmFsbG93IHRoZSBB
ZG1pbmlzdHJhdG9ycyBncm91cD8KCi0tIApNYW50YXMgTWlrdWzEl25hcwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpXaXJlR3VhcmQgbWFpbGluZyBsaXN0
CldpcmVHdWFyZEBsaXN0cy56eDJjNC5jb20KaHR0cHM6Ly9saXN0cy56eDJjNC5jb20vbWFpbG1h
bi9saXN0aW5mby93aXJlZ3VhcmQK
