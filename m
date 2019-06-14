Return-Path: <SRS0=VRfM=UN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B954FC31E44
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 14 Jun 2019 11:56:50 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E99352133D
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 14 Jun 2019 11:56:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="sqRSGw/E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E99352133D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0499e10e;
	Fri, 14 Jun 2019 11:56:48 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3d78c20f
 for <wireguard@lists.zx2c4.com>;
 Fri, 14 Jun 2019 11:56:46 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e990ce5a
 for <wireguard@lists.zx2c4.com>;
 Fri, 14 Jun 2019 11:56:46 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d89bcf13
 for <wireguard@lists.zx2c4.com>;
 Fri, 14 Jun 2019 11:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=ociq0bAD/jal1zyUQMtvY/620QA=; b=sqRSGw
 /EOAtLR++yP2A2b1GD4dYi56JF3dzH0yZfZRZqcpQnF6nfFgdqFOAy0dI5WRelEF
 XcDyuJG+I30I9fyof7YaCcwSK2tzzvbVNDOy1KZugqtIQnlzw+dE+UOR1GgFzDf3
 1198pijbx0q3CXm4uqitNGTB7gz3M/aBm8UpewmXWyZ0WiTj+XSc6C8ghqLU52t6
 0I85EkWQAsbay89EcA+9PKIohFsNCr5v8ERGRl37Q8Kzx6TfsAtYUv/jC8Wxh5b9
 EU8yw4363mZ0TLbhvF3YWYOAGmJkOefAk/ZItDtRWmReXMClAsgRlSS2gi8PYK7v
 SPUC5/rcPaHAS7AQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4ca6f55a
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 14 Jun 2019 11:24:16 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id w79so1731308oif.10
 for <wireguard@lists.zx2c4.com>; Fri, 14 Jun 2019 04:56:46 -0700 (PDT)
X-Gm-Message-State: APjAAAXuL00GsBYAedIP7D/WNFn9uAJPhj+1cvP7/3rnwzxW3067+zgs
 uQHS/K5SzqRz7J/OqVHfLBXXLXN/gKEDgu39VmU=
X-Google-Smtp-Source: APXvYqxmOU+HJnzmeT1OeeV5XeD5Z9onk1QL0gtoitXyS2vEf3Z7aDTyBgUjN99p1kat62/Mhe3ry3Z7alQmOsyj3DA=
X-Received: by 2002:aca:ccd2:: with SMTP id c201mr1481347oig.119.1560513405907; 
 Fri, 14 Jun 2019 04:56:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAM3m09Q3LCCFRJEe6J1UO0mtTiuVOYEiiyhEJJppDnuDnZZTwA@mail.gmail.com>
In-Reply-To: <CAM3m09Q3LCCFRJEe6J1UO0mtTiuVOYEiiyhEJJppDnuDnZZTwA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 14 Jun 2019 13:56:33 +0200
X-Gmail-Original-Message-ID: <CAHmME9qM1xrUcC2Am+RsNr=4dXJKsUiOPmsgisn8hM-QjHLvjw@mail.gmail.com>
Message-ID: <CAHmME9qM1xrUcC2Am+RsNr=4dXJKsUiOPmsgisn8hM-QjHLvjw@mail.gmail.com>
Subject: Re: Wireguard Bug?
To: Ryan Whelan <rcwhelan@gmail.com>
Content-Type: multipart/mixed; boundary="0000000000003a2549058b47571f"
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
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--0000000000003a2549058b47571f
Content-Type: text/plain; charset="UTF-8"

Hey Ryan,

If you still have a reliable test rig for the bug, would you try
running with you kernel compiled with the attached patch?

Jason

--0000000000003a2549058b47571f
Content-Type: text/x-patch; charset="US-ASCII"; name="willitwork.diff"
Content-Disposition: attachment; filename="willitwork.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_jww1dr8w0>
X-Attachment-Id: f_jww1dr8w0

ZGlmZiAtLWdpdCBhL2tlcm5lbC93b3JrcXVldWUuYyBiL2tlcm5lbC93b3JrcXVldWUuYwppbmRl
eCBkOGEyMDg0Yjg4ZGIuLjM4NjBjMDlkNmFjMSAxMDA2NDQKLS0tIGEva2VybmVsL3dvcmtxdWV1
ZS5jCisrKyBiL2tlcm5lbC93b3JrcXVldWUuYwpAQCAtMTQ1NCw2ICsxNDU0LDkgQEAgYm9vbCBx
dWV1ZV93b3JrX29uKGludCBjcHUsIHN0cnVjdCB3b3JrcXVldWVfc3RydWN0ICp3cSwKIAogCWxv
Y2FsX2lycV9zYXZlKGZsYWdzKTsKIAorCS8qIFBhaXIgd2l0aCB0aGUgc21wX3dtYigpIGluIHNl
dF93b3JrX3Bvb2xfYW5kX2NsZWFyX3BlbmRpbmcuICovCisJc21wX3JtYigpOworCiAJaWYgKCF0
ZXN0X2FuZF9zZXRfYml0KFdPUktfU1RSVUNUX1BFTkRJTkdfQklULCB3b3JrX2RhdGFfYml0cyh3
b3JrKSkpIHsKIAkJX19xdWV1ZV93b3JrKGNwdSwgd3EsIHdvcmspOwogCQlyZXQgPSB0cnVlOwo=
--0000000000003a2549058b47571f
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--0000000000003a2549058b47571f--
