Return-Path: <SRS0=QHSY=WV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 477A1C3A5A1
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:37:32 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D464C2080C
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:37:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hi/j5EDM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D464C2080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 659d2e67;
	Sun, 25 Aug 2019 15:36:19 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e8f1c915
 for <wireguard@lists.zx2c4.com>;
 Wed, 24 Jul 2019 10:06:03 +0000 (UTC)
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 808a2d7c
 for <wireguard@lists.zx2c4.com>;
 Wed, 24 Jul 2019 10:06:03 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id m10so46584207edv.6
 for <wireguard@lists.zx2c4.com>; Wed, 24 Jul 2019 03:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=qiLTdhiBqojQDS+Uy7ePXFAtf8jCGB4OzP50ZVUoOSU=;
 b=Hi/j5EDMzQT7eAx4lbrp0unKYnYCjMBaY3HmLncLkcn0UYE4bBWEPNk2xYaVme2HiQ
 3d+mFS++yRXCgOjQYiK+Bcs9I4ZJFqeUHIq+BqqivWHIMjNVtBtD6x6Q9DAk9M91+o+K
 S5WkRaxCPZdce7ZqX53W1mC+Ee8PXS1DxLHBumrQjCv0YzkBlxIyXZgEqqmamAQ6UEuY
 8hrNfWZy28nla7vn/qbKgIiRoTzOcczdoxYR4cCvncUGejy3F9LHIjdXANZNX6k9fiOC
 cRk8ixr/wtw99pmPkTkAgDaBVB7va8o1GQadhi6aQcQ/2azvmLHQh0SIXzYQfT/pSI2z
 Am1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=qiLTdhiBqojQDS+Uy7ePXFAtf8jCGB4OzP50ZVUoOSU=;
 b=s3JQ2oKUcI8QnnDqKo3PA6r6/eTyHm1IISmXt3Po+f5SOHGFJEoqinHPyHjUOwqf57
 EiI5EJjdeAHFG64AWZrERRbZ/UDGGUkXxn5IYrUxY8Vh+XSTMQNDE4oWO/LxHwICHuxs
 S4V5XPA8DnEWNe0sK2ufz+/3qeIFk8MybBe3oxCzAh3tTTQrKcafJFdFpWDy7hCjIP0a
 gdcPdXRbvqwIPWj9C8UuMD/PoHbBb/mZNh/CoKeI9iywaN5hVeVzF4o0sDq/8s/3VynD
 nnielzC0jVJm1PBq3AUndaOcPyOhArU52J1/+SownjYPHQPoBUZ4vWls4WfQURJMdR8X
 x1mw==
X-Gm-Message-State: APjAAAW6vaMGme/iE1XbSMszeRv2ZMbCGoX+eIT8+Gwme48Xu/9kuajU
 Be2ezLx7+4bjDct+fvLx6ENbPhE0
X-Google-Smtp-Source: APXvYqzqKfEVPEALLSWwUeTpM1lUDzT8Lur2Z3xXOobz3RNE2kD8u5/NzHcZTMwAxPpxxB7SI91j1g==
X-Received: by 2002:a17:906:7f01:: with SMTP id
 d1mr59825113ejr.310.1563962761973; 
 Wed, 24 Jul 2019 03:06:01 -0700 (PDT)
Received: from [127.0.0.1] (minus360.net. [176.12.8.240])
 by smtp.gmail.com with ESMTPSA id fk15sm9304001ejb.42.2019.07.24.03.06.01
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Jul 2019 03:06:01 -0700 (PDT)
From: Hristo Georgiev <hristo.metal@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Nonce in out-of-order messages
Message-Id: <E6BE60A6-0A9F-4A45-9FCE-155410ECDC6F@gmail.com>
Date: Wed, 24 Jul 2019 13:05:58 +0300
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3445.104.11)
X-Mailman-Approved-At: Sun, 25 Aug 2019 17:36:17 +0200
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

SGVsbG8KSeKAmW0gd29ya2luZyBvbiBmaWxlIHRyYW5zZmVyIHByb3RvY29sIGluc3BpcmVkIGJ5
IE5vaXNlIGFuZCBXaXJlZ3VhcmQgb3ZlciBVRFAgIHdpdGggc3RhdGljIGtleXMgc28gdGhlIGhh
bmRzaGFrZSBwYXR0ZXJuIGlzIGdvaW5nIHRvIGJlIE5vaXNlX0lLXzI1NTE5X0NoYUNoYVBvbHlf
QkxBS0UycyAgb3IgS0suIEluIGdlbmVyYWwgaeKAmW0gdHJ5aW5nIHRvIGZvbGxvdyBOb2lzZVNv
Y2tldCBzcGVjIGJ1dCBhZGFwdGVkIHRvIFVEUCBhbmQgaSB3YXMgd29uZGVyaW5nIHdoZXJlIHRv
IHBsYWNlIHRoZSDigJhub25jZeKAmSBpbnRvIHBhY2tldCB0byBleHRlbmQgdGhlIHByb3RvY29s
IGFzIGRlc2NyaWJlZCBpbnRvIHAuMTEuNCBpbiBOb2lzZVByb3RvY29sIHNwZWMgaHR0cDovL3d3
dy5ub2lzZXByb3RvY29sLm9yZy9ub2lzZS5odG1sI291dC1vZi1vcmRlci10cmFuc3BvcnQtbWVz
c2FnZXMgLiAgU28gSSBoYWQgYSBsb29rIGludG8gV2lyZUd1YXJkIGltcGxlbWVudGF0aW9uICh3
aGljaCBJIHVzZSBhIGxvdCBpbiBtdWx0aXBsZSBzaXRlcywgbW9zdGx5IG9uIEVkZ2VSb3V0ZXJz
KQpzbyB3aGF0IGkgZm91bmQgaW4gbm9pc2UuYyBsaW5lIDQ0NSBtZXNzYWdlX2RlY3J5cHQ6Cgpj
aGFjaGEyMHBvbHkxMzA1X2RlY3J5cHQoZHN0X3BsYWludGV4dCwgc3JjX2NpcGhlcnRleHQsIHNy
Y19sZW4sCgkJCQkgICAgICBoYXNoLCBOT0lTRV9IQVNIX0xFTiwKCQkJCSAgICAgIDAgLyogQWx3
YXlzIHplcm8gZm9yIE5vaXNlX0lLICovLCBrZXkpKQoKQ29ycmVjdCBtZSBpZiBJ4oCZbSBtaXN0
YWtlbiwgSeKAmW0gbm90IEMgcHJvZ3JhbWVyIG5vciBjcnlwdG9ncmFwaGVyLCBJIHRoaW5rIHRo
aXMgemVybyBoZXJlIGlzIHRoZSBOb25jZS4gSWYgdGhhdOKAmXMgdGhlIGNhc2Ugd2hhdCBzZWN1
cml0eSBzYWNyaWZpY2VzIGFuZCB0aGUgY2hhbmNlIGZvciByZXBsYXkgYXR0YWNrcyBhcmU/Cldv
dWxkIGl0IGJlIE9rIGlmIEkgYWxzbyBoYXJkY29kZSB0aGUgTm9uY2UgdG8gMCBpbiBteSBpbXBs
ZW1lbnRhdGlvbj8KClRoYW5rIHlvdSwKSHJpc3RvCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCldpcmVHdWFyZCBtYWlsaW5nIGxpc3QKV2lyZUd1YXJkQGxp
c3RzLnp4MmM0LmNvbQpodHRwczovL2xpc3RzLnp4MmM0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3dp
cmVndWFyZAo=
