Return-Path: <SRS0=zOjE=TG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 484F5C04A6B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 May 2019 20:40:07 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AC4C2087F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 May 2019 20:40:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ubstee.fr header.i=@ubstee.fr header.b="caDvIoWj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AC4C2087F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ubstee.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5cf88ee1;
	Mon, 6 May 2019 20:39:12 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 74e78568
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 Apr 2019 22:41:19 +0000 (UTC)
Received: from epimetheus.ubstee.fr (epimetheus.ubstee.fr [91.121.220.128])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 51a33022
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 Apr 2019 22:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender:
 antoine@ubstee.fr)
 by epimetheus.ubstee.fr (Postcow) with ESMTPSA id 68C081DFBDB
 for <wireguard@lists.zx2c4.com>; Tue, 30 Apr 2019 00:37:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubstee.fr; s=dkim;
 t=1556577462; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:in-reply-to:
 references; bh=xlpXgzCCGdB4vABDwm7hex2cv7j2QyS7FFPxWDHEKgE=;
 b=caDvIoWjrda/9lxJ7LPyPoBAzsEjBZrVKUTnrTsvQxkKElFXwSppXDid7P5NKQ8F498Jd1
 uw2lnCzH4eBN/HdPkjxp9gn3TDLIfPr7xzCeHvyr8BTpmgK5FvmdNjBnoDVYpn+ovoyLkP
 p3enxgyktyUmNUvfRflPHoj27WlSl9kmo1M5ifvkWD9Ae3KwzTOZthPXzGmKZapOj8s6Fg
 5G6NlsMTEz03WmhnWAaFOuR0pO8t6tacS1dVckzUYYVvd0ibVsgfhjY7odzs6k1O6DelJV
 g9KAMniltIEFi4wNIKImDaQwx0RemKpFZwjaaQ2l1lTP2vlOfbDRSFGcFVnaUw==
From: Illule <illule@ubstee.fr>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.8\))
Subject: DNS on macos
Message-Id: <8D6A8B89-F86B-4899-92FB-BCA9D455D79C@ubstee.fr>
Date: Tue, 30 Apr 2019 00:41:14 +0200
To: wireguard@lists.zx2c4.com
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=ubstee.fr;
 s=dkim; t=1556577462; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:in-reply-to:
 references; bh=xlpXgzCCGdB4vABDwm7hex2cv7j2QyS7FFPxWDHEKgE=;
 b=XpJxyzBON8+nX8tLtFbsIglDB3GHH9T0ch6B4Z/zJ42Dp+uQrlmu6Y6B6n2/I5yUACE73X
 U3oqJzNOmwxr4vBWkE9+DTK9eMI4V7i7nHsW7vCyAnk7guQHEnb45/A3OfphaS/hjwYwAh
 fi7IPQc1/yozjfHNBw7CaXNxP0DLliB5qotlhZ1N2yFcSBUTnn94B3Icyf2UlrXN8FhT6V
 t/f7nz7WGBRGYfZHUfUaHxcw71dDWjFNJWKXLDrrAi756AUYez2jHVndjA5XrZghD9DS0I
 XTq5gbjlrVGygWljejHv7y9YHGdFPKAXSOjAp1ncOjL8+31nYQRqfsqIywyrhg==
ARC-Seal: i=1; s=dkim; d=ubstee.fr; t=1556577462; a=rsa-sha256; cv=none;
 b=p1D0xf/zLlfvWYSvLKLcfb43EclW9J6StzYiEm/epGeVt6YwwvbfB+aPfvucGMSkB0UHEb
 Y+S+X/seJjjFfrFuKi1CN6FQjGayUAgHUYLWJ0x7MPCPelETaa5EW2mBIeB3M5LbKbgARo
 irFvUyrmcTo4dpytu67KZvT/9fdBNjKwFgUlg9UCFYPHcBksO9GX4apCmKzVliJqpPXYat
 v0q1HPJtGcSieyRba+NB3yOfRlnwVq/x7F7VUL/YkRYY/I2fI46OPRT4pLlbsIK6SeMVYY
 BuV1P27/rCwC7HHQbDR6U+RA+O32WRxjopNoWGLYY4NOkWgVCULboy+2Tim3pg==
ARC-Authentication-Results: i=1; epimetheus.ubstee.fr;
 auth=pass smtp.auth=antoine@ubstee.fr smtp.mailfrom=illule@ubstee.fr
X-Mailman-Approved-At: Mon, 06 May 2019 22:39:06 +0200
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

SGksCgpPbiBtYWNvcyB0aGUgRE5TIHNldCBieSB3aXJlZ3VhcmQgaXMgdXNlZCBhcyBzZWNvbmRh
cnkgRE5TIDoKc3VkbyBzY3V0aWwg4oCUZG5zIHJldHVybnMgOgpgYGAKRE5TIGNvbmZpZ3VyYXRp
b24gKGZvciBzY29wZWQgcXVlcmllcykKCnJlc29sdmVyICMxCiBzZWFyY2ggZG9tYWluWzBdIDog
aG9tZQogbmFtZXNlcnZlclswXSA6IGZlODA6OjkyNGQ6NGFmZjpmZWViOjJlYjAlZW4wCiBuYW1l
c2VydmVyWzFdIDogMTkyLjE2OC4xMzcuMQogaWZfaW5kZXggOiA4IChlbjApCiBmbGFncyAgICA6
IFNjb3BlZCwgUmVxdWVzdCBBIHJlY29yZHMsIFJlcXVlc3QgQUFBQSByZWNvcmRzCiByZWFjaCAg
ICA6IDB4MDAwMjAwMDIgKFJlYWNoYWJsZSxEaXJlY3RseSBSZWFjaGFibGUgQWRkcmVzcykKCnJl
c29sdmVyICMyCiBuYW1lc2VydmVyWzBdIDogMTAuMTM3LjMuMwogaWZfaW5kZXggOiAxNyAodXR1
bjEpCiBmbGFncyAgICA6IFNjb3BlZCwgUmVxdWVzdCBBIHJlY29yZHMKIHJlYWNoICAgIDogMHgw
MDAwMDAwMyAoUmVhY2hhYmxlLFRyYW5zaWVudCBDb25uZWN0aW9uKQpgYGAKCklzIGl0IHdhbnRl
ZCA/IEnigJlkIHByZWZlciB1c2UgbXkgcGVyc29ubmFsIEROUyBhcyBtYWluIHJlc29sdmVyLiBN
b3Jlb3ZlciBzYWZhcmkgc2VlbXMgdG8gYmVpbmcgYWJsZSB0byB1c2UgaXQgd2hlbiBhIGRvbWFp
biBpcyBub3QgcHVibGljIGJ1dCBub3QgY29tbWFuZCBsaWtlIGRpZy4KCkJlc3QgcmVnYXJkcywK
CklsbHVsZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpX
aXJlR3VhcmQgbWFpbGluZyBsaXN0CldpcmVHdWFyZEBsaXN0cy56eDJjNC5jb20KaHR0cHM6Ly9s
aXN0cy56eDJjNC5jb20vbWFpbG1hbi9saXN0aW5mby93aXJlZ3VhcmQK
