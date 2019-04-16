Return-Path: <SRS0=O3Vp=SS=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA70BC10F13
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 16 Apr 2019 16:26:03 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA5B520868
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 16 Apr 2019 16:26:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="hQthmO3x";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="aN9zKnH+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA5B520868
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mailbox.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 080602d0;
	Tue, 16 Apr 2019 16:26:00 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 48638787
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 Apr 2019 16:25:58 +0000 (UTC)
Received: from mx1.mailbox.org (mx1.mailbox.org
 [IPv6:2001:67c:2050:104:0:1:25:1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7f2d2d9b
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 Apr 2019 16:25:57 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:2:0])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mx1.mailbox.org (Postfix) with ESMTPS id 8632C4CDED
 for <wireguard@lists.zx2c4.com>; Tue, 16 Apr 2019 18:25:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
 content-transfer-encoding:content-type:content-type:mime-version
 :subject:subject:message-id:from:from:date:date:received; s=
 mail20150812; t=1555431950; bh=AZOknx74VMrS/WxEfHD0MuPv6G5SkCYE0
 pOTaHJ6U0k=; b=hQthmO3xr4FHlZp5R/WnMyeXI4umJbXxIFHN8ftcH6Nu3z0B0
 +bj0WryBUYB3dHMHX1iAwBdTHIbkoeVyNqgS+vklo5FD0z00Sx1FW6AK/npSFKlz
 92dZaCaWWtfzXevSJhp8K8D4gzT63cZ+fr2xD4WCxSBPiOnrz1BYCH9NsLRGi4rI
 UOqJY5YzzPMfeWTVPZJvWJL/nQuBUJEijdsuISFSF5BfzeGn13H+0iadclhrfQNL
 QVDJIQlbrF7DcOCJjMRhl+pAuFxzwFZcGIH1yNT0l6o0lIKWz7O7iwkJulO/fL7I
 uX8YIq9FafIFP2QQWn2tThU4nZf+63huzYJ9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1555431953; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:in-reply-to:
 references; bh=AZOknx74VMrS/WxEfHD0MuPv6G5SkCYE0pOTaHJ6U0k=;
 b=aN9zKnH+MA8qqbAvzvji1OzT5wx82+BzrvSSd3qGB3y7vfBpe5GoA9Akz49Xcs+o6Andkt
 y6zFgj/vnNKVj5RrHtbfn75kWMHYi7aaWYtm2+fvr3WczjRlWZeqI5KOw62eGopb4JIV2u
 EEAV5H2FPaQwQqophQGAR+VVfK5OqUP4WXZoGYqf1mUlUSmNuemn7ZILjLeo/WC8y2Qkmu
 hPtZN6A8PBI4WpE37wwxj+/jlL/AiAJlA1+AR5njDhI7tc1P5r/o9ktSqBsmFUMUSPxd/M
 bNMGReTkJG4J3P7i6wYE6RC5bJDrAPcVaKcJnddaCe0ANS3LO1850sjPLgb5aA==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
 by spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de
 [80.241.56.122]) (amavisd-new, port 10030)
 with ESMTP id 61tq3Poqmtm4 for <wireguard@lists.zx2c4.com>;
 Tue, 16 Apr 2019 18:25:50 +0200 (CEST)
Date: Tue, 16 Apr 2019 18:25:50 +0200 (CEST)
From: blipp@mailbox.org
To: wireguard@lists.zx2c4.com
Message-ID: <1676414122.33317.1555431950456@office.mailbox.org>
Subject: Mechanised cryptographic proof of the WireGuard protocol
MIME-Version: 1.0
X-Priority: 3
Importance: Medium
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

RGVhciBhbGwsCgpXaXRoIEJydW5vIEJsYW5jaGV0IGFuZCBLYXJ0aGlrIEJoYXJnYXZhbiBmcm9t
IHRoZSBQcm9zZWNjbyByZXNlYXJjaCBncm91cCBhdCBJbnJpYSBQYXJpcywgd2UgY29udGludWVk
IHdvcmtpbmcgb24gb3VyIG1lY2hhbmlzZWQgY3J5cHRvZ3JhcGhpYyBwcm9vZiBvZiB0aGUgV2ly
ZUd1YXJkIHByb3RvY29sIHNpbmNlIG15IG1hc3RlcidzIHRoZXNpcyB3YXMgZmluaXNoZWQgbGFz
dCB5ZWFyLgoKSSBhbSBoYXBweSB0byBzYXkgdGhhdCBhIHBhcGVyIHdlIHdyb3RlIGFib3V0IG91
ciB3b3JrIHdhcyBhY2NlcHRlZCBhdCB0aGlzIHllYXIncyBFdXJvUyZQIGNvbmZlcmVuY2UgWzFd
LiBBIGxvbmcgdmVyc2lvbiBvZiB0aGUgcGFwZXIgaXMgYXMgb2Ygbm93IGF2YWlsYWJsZSBhdCBo
dHRwczovL2hhbC5pbnJpYS5mci9oYWwtMDIxMDAzNDUsIGFuZCB0aGUgY29kZSBhbmQgdGhlIG1v
ZGVscyBhdCBodHRwczovL2NyeXB0b3ZlcmlmLmlucmlhLmZyL1dpcmVHdWFyZC4KCkRpZmZlcmVu
Y2VzIHRvIG15IG1hc3RlcidzIHRoZXNpcyB0aGF0IGlzIGxpbmtlZCBhdCB0aGUgbW9tZW50IG9u
IFdpcmVHdWFyZCdzIGZvcm1hbCB2ZXJpZmljYXRpb24gcGFnZSBodHRwczovL3d3dy53aXJlZ3Vh
cmQuY29tL2Zvcm1hbC12ZXJpZmljYXRpb24vIHVuZGVyIHRoZSBoZWFkbGluZSDigJxDb21wdXRh
dGlvbmFsIFByb29mIG9mIFByb3RvY29sIGluIEFDQ0UgTW9kZWzigJ0gaW5jbHVkZToKCi0gV2Ug
bm93IHVzZSBhIHByZWNpc2UgbW9kZWwgb2YgdGhlIGVsbGlwdGljIGN1cnZlIGdyb3VwIEN1cnZl
MjU1MTkuIFRoaXMgcmVtb3ZlcyB0aGUgZ2FwIGJldHdlZW4gb3VyIHByZXZpb3VzIHByb29mIGFu
ZCB3aGF0IFdpcmVHdWFyZCBhY3R1YWxseSBkb2VzLCBhbmQgdGh1cyBpbmNyZWFzZXMgY29uZmlk
ZW5jZSBpbiB0aGUgcHJvb2YuIFRoaXMgaXMsIHRvIHRoZSBiZXN0IG9mIG91ciBrbm93bGVkZ2Us
IHRoZSBmaXJzdCB3b3JrIHRoYXQgYW5hbHlzZXMgV2lyZUd1YXJkIHdpdGggc3VjaCBhIHByZWNp
c2UgbW9kZWwuCi0gV2UgYW5hbHlzZSB0aGUgaWRlbnRpdHkgaGlkaW5nIHByb3BlcnR5IG9mIFdp
cmVHdWFyZC4KLSBXZSBhbmFseXNlIHRoZSBEb1MgcHJvdGVjdGlvbiBwcm92aWRlZCBieSB0aGUg
TUFDcyBhbmQgdGhlIGNvb2tpZSBtZXNzYWdlLgotIFdlIHByb3ZpZGUgYSBjb21wYXJpc29uIHdp
dGggNSBvdGhlciB3b3JrcyB0aGF0IGFuYWx5c2VkIFdpcmVHdWFyZCBvciB0aGUgdW5kZXJseWlu
ZyBOb2lzZSBJS3BzazIgcHJvdG9jb2wuIFRoaXMgaW5jbHVkZXMgc3ltYm9saWMgYW5hbHlzZXMg
dXNpbmcgUHJvVmVyaWYgYW5kIFRhbWFyaW4sIGFuZCBhIG1hbnVhbCBjcnlwdG9ncmFwaGljIHBy
b29mLgoKSWYgeW91IGhhdmUgcXVlc3Rpb25zIHJlZ2FyZGluZyBvdXIgd29yaywgcGxlYXNlIHJl
YWNoIG91dCwgSSBhbSBoYXBweSB0byBleHBsYWluIG1vcmUgZGV0YWlscy4KCkJlc3QgcmVnYXJk
cywKQmVuamFtaW4KClsxXSBodHRwczovL3d3dy5pZWVlLXNlY3VyaXR5Lm9yZy9UQy9FdXJvU1Ay
MDE5LwoKLS0gClJlc2VhcmNoIGdyb3VwOiBodHRwczovL3Byb3NlY2NvLmdmb3JnZS5pbnJpYS5m
ci8KUGVyc29uYWwgd2Vic2l0ZTogaHR0cHM6Ly9iZW5qYW1pbmxpcHAuZGUvCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCldpcmVHdWFyZCBtYWlsaW5nIGxp
c3QKV2lyZUd1YXJkQGxpc3RzLnp4MmM0LmNvbQpodHRwczovL2xpc3RzLnp4MmM0LmNvbS9tYWls
bWFuL2xpc3RpbmZvL3dpcmVndWFyZAo=
