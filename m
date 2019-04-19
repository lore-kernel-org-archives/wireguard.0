Return-Path: <SRS0=zOjE=TG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 627DEC04A6B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 May 2019 20:29:11 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFE1D20830
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 May 2019 20:29:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=jerde-org.20150623.gappssmtp.com header.i=@jerde-org.20150623.gappssmtp.com header.b="TI8j0+1a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFE1D20830
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jerde.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6935bba2;
	Mon, 6 May 2019 20:28:42 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f5165f3f
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Apr 2019 02:07:40 +0000 (UTC)
Received: from mail-it1-x133.google.com (mail-it1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8e37f678
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Apr 2019 02:07:40 +0000 (UTC)
Received: by mail-it1-x133.google.com with SMTP id a190so6325479ite.4
 for <wireguard@lists.zx2c4.com>; Thu, 18 Apr 2019 19:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jerde-org.20150623.gappssmtp.com; s=20150623;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=jI5yewqZmuGCfH35565mFYqmwsdX3ekWK3G23cg5UzU=;
 b=TI8j0+1auJ1FjktVAWkKkmTREbof8MZLngQMD83tyCUYI5ne+BjRqz7dc4agnJh1ph
 GSRocW1wR2vMiAHtrCgh2vmc3PvdJ36K8nPMVzxXZel5ugEq+TaKGdUFvKBNIqAuRbfP
 XcS/tEP+sQQsM+xbVyJ5WtqimXf9Rcf5qqnBUseNE502/vXAzxVzN8SRr1dAYSVgNhDX
 Wx2tmP9DPp3pgQNLUuQzdi0LSMuNNwK1aH6VZIiIDwKGLjM9ziVBXOWFnQivr4nGIQPJ
 6+gd4RqTLDPOz1cj2P9IMrHWqESsTTiUkEucWu1FNTDu+lH6M5OXxsaq8DtEP4MjX8ds
 OYog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=jI5yewqZmuGCfH35565mFYqmwsdX3ekWK3G23cg5UzU=;
 b=TWx9/ezhdxyve1ve44Jw8aXDtJ2tYf6ypYMyub8zzJ1ZeQByi+h9r/F9hQTvQbjKR1
 xETy9dGRjeJg1s8Z5YPsGoDFIk80gNDD7Az8kzHekiM2Ny9PQ4vPjizljrqS9I1axD8M
 E9XGyp/v3TriHmryAcQOWLg8tfAXDOGYkV0ZJvwwsdt2uxDF71B0wcj8h0CUjWgtfRzR
 QyXESeX6KDZXo3M+BPjHuZj9hW5dk0FvIC41aCtCR3FYrq5sZR2kosVlmhwILceNTRnl
 3hDYD9BcKcAHnL84tXmXQKiutCBNZQYtI4Pmtv4Kgbgk60CYaoWwkA+m+SiYFLTvP0g/
 sHgw==
X-Gm-Message-State: APjAAAX56ZuRkaf4Y6q0D5qrg8SEy6ZS408oOKm8rudfYak9PxhJLLDT
 k8uBbcll9aLcyjhZGQDB3rRNR/dtBuE=
X-Google-Smtp-Source: APXvYqzx3Eb2ga25rxConDtcigKXK84qZTzu3gJ7bfquPUUG1DSiHYPCUH6Z7FBg3UMFWOAZm/4zWQ==
X-Received: by 2002:a24:f949:: with SMTP id l70mr1148174ith.116.1555639659272; 
 Thu, 18 Apr 2019 19:07:39 -0700 (PDT)
Received: from [10.2.10.100] (c-107-2-122-17.hsd1.mn.comcast.net.
 [107.2.122.17])
 by smtp.gmail.com with ESMTPSA id k203sm879683itb.0.2019.04.18.19.07.38
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Apr 2019 19:07:38 -0700 (PDT)
From: Erik Jerde <erik@jerde.org>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.8\))
Subject: Tunnels not coming up on reboot
Message-Id: <7F8E9113-9721-4AEC-984E-7291AEA9F75D@jerde.org>
Date: Thu, 18 Apr 2019 21:07:37 -0500
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3445.104.8)
X-Mailman-Approved-At: Mon, 06 May 2019 22:28:35 +0200
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

SeKAmXZlIGdvdCB0d28gVk1zIHJ1bm5pbmcgVWJ1bnR1IDE4LjEwIHdpdGggd2lyZWd1YXJkIDAu
MC4yMDE5MDQwNi13ZzF+Y29zbWljIGluc3RhbGxlZC4gIEnigJl2ZSBlbmFibGVkIHRoZSBXaXJl
Z3VhcmQgaW50ZXJmYWNlIHRvIGNvbWUgdXAgd2l0aCB0aGUgc3lzdGVtY3RsIGVuYWJsZSB3Zy1x
dWlja0B3ZzAuc2VydmljZSBvbiBib3RoIHN5c3RlbXMuICBUaGUgaW50ZXJmYWNlIGdvZXMgdXAg
YW5kIGRvd24gYXMgZXhwZWN0ZWQgd2hlbiB1c2luZyB0aGUgc3lzdGVtY3RsIHN0YXJ0IGFuZCBz
dG9wIGNvbW1hbmRzLiAgTXkgcHJvYmxlbSBpcyB0aGF0IHdoZW4gZWl0aGVyIG9mIHRoZSBWTXMg
YXJlIHJlYm9vdGVkIHRoZSB0dW5uZWxzIGRvIG5vdCBjb21lIGJhY2sgdXAuICBUaGUgV0cgY29t
bWFuZCBzaG93cyB0aGF0IHRoZSBpbnRlcmZhY2UgaXMgdXAgYnV0IHRoZXJl4oCZcyBubyBoYW5k
c2hha2UvdHJhbnNmZXIvZXRjLiAgT24gdGhlIHN5c3RlbSB0aGF0IHdhcyByZWJvb3RlZCBpZiBJ
IGlzc3VlIGEgc3lzdGVtY3RsIHN0b3AgdGhlbiBzdGFydCBjb21tYW5kIHRoZSB0dW5uZWwgY29t
ZXMgcmlnaHQgdXAgYW5kIHBlcmZvcm1zIGFzIGV4cGVjdGVkLgoKSeKAmW0gcHJldHR5IGdyZWVu
IHdpdGggc3lzdGVtY3RsIGJ1dCB0aGlzIHJlbWluZHMgbWUgb2YgcHJvYmxlbXMgSeKAmXZlIHNl
ZW4gd2l0aCBvdGhlciBkYWVtb25zIHRoYXQgZGlkbuKAmXQgaGF2ZSBhbGwgb2YgdGhlaXIgbmVl
ZHMgYmVpbmcgbWV0IGJlZm9yZSB0aGV5IHN0YXJ0ZWQuICBJbiB0aGUgb2xkIGRheXMgb2YgaW5p
dC5kIEkgY291bGQgZml4IHRoaXMgYnV0IG5vdyBJ4oCZbSBraW5kYSBzdHVjay4gIE15IC5zZXJ2
aWNlIGZpbGUgaXMgc2hvd2luZyBBZnRlcj1uZXR3b3JrLW9ubGluZS50YXJnZXQgbnNzLWxvb2t1
cC50YXJnZXQgYW5kIFdhbnRzPW5ldHdvcmstb25saW5lLnRhcmdldCBuc3MtbG9va3VwLnRhcmdl
dC4gIElzIHRoZXJlIHNvbWV0aGluZyBtb3JlIHRoYXQgc2hvdWxkIGJlIGluIHRoZXJlPyAgQW55
IGlkZWFzIG9mIHdoYXQgZWxzZSBtaWdodCBiZSBjYXVzaW5nIHRoZSB0dW5uZWwgdG8gbm90IGNv
bWUgdXA/CgpUaGFua3MhCkVyaWsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCldpcmVHdWFyZCBtYWlsaW5nIGxpc3QKV2lyZUd1YXJkQGxpc3RzLnp4MmM0
LmNvbQpodHRwczovL2xpc3RzLnp4MmM0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3dpcmVndWFyZAo=
