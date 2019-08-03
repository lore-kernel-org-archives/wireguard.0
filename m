Return-Path: <SRS0=QHSY=WV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D5D7C3A5A1
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:51:07 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D515F2080C
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:51:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=tingvold.com header.i=@tingvold.com header.b="GDnOfxYz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D515F2080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=tingvold.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 85539da3;
	Sun, 25 Aug 2019 15:40:18 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6f2d4835
 for <wireguard@lists.zx2c4.com>; Sat, 3 Aug 2019 14:54:25 +0000 (UTC)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ad78b2ff
 for <wireguard@lists.zx2c4.com>; Sat, 3 Aug 2019 14:54:24 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id x3so1176745lfn.6
 for <wireguard@lists.zx2c4.com>; Sat, 03 Aug 2019 07:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tingvold.com; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aheH1s/OmRhYnsGKN9NJB7UrqBBEQ/Qqt5RTNj73CZI=;
 b=GDnOfxYzrzj5KgahZ2Era5eTU4Dfd1wLMjfKkzCf4yx7niUFsKkFNYaxElqqqCg26S
 Jjq6CFxd3Sj2FrtYMvBN6vNYILyxZgOkTix2OlF61bflfsRa/6WyaaGjHg17i2lONzyl
 SWhuBj0Ws79A0HrM3xtUhycsYTj+Lp/xeEBJ0SJBo+L+YteNFBDnzJAyJZ1XEBpCJpOj
 3AQSIAMvhW3GrnzmhZwSEo8slj3AyMODV7U4L5OdtU08VSX3uIrDDzzM0BoetDUNdHdi
 H0UuYrIprENgKgp1MYyje7qYtHJNdm83E3B/RKbITmDsRf4FdWzjcLwX6kyzMO/g/UVB
 KI4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aheH1s/OmRhYnsGKN9NJB7UrqBBEQ/Qqt5RTNj73CZI=;
 b=C2PJ4QLKBXw0pM98P8SQ3yxXsDeDrqcvzqoinNHVG1GxlrHdZPPB+TGM1IIRqKwyLm
 HhkWY4bD29Bmoyer/uwFTHkjdyeY8S92g/rjOhvtpvpkwE3E2TODDgocG7e1c1Xib3KA
 vw0QWyeEMnWlUhte/591NCw56fklQbQYtoExC+myoMCGrz6ehzrk06xBNr0oKCc79FQL
 PIIaUFum+mZ7l6m7ShVkm8ZYhnd53m/TdhEDT3MAdH/pQ6PEahyKG1JzlA/bBOJ3dFsv
 Ekx3y10k4kVnIIu+jrduHnCfOfU0/wg72uD8KbRyi8Co8uzXKa+qS9VOshclcm+/L5r0
 ULNg==
X-Gm-Message-State: APjAAAXJQdpMjWML5wg6hvEO467bARbRrJXI3GBIlCMNdxRvFbXdws1K
 5YMS5wWzwqNBvSMZ9ivo8VndvcyL0HeWyA==
X-Google-Smtp-Source: APXvYqyFQP3wHejCtLxd370HJ2OrwTVQ85sPaGQv1XYqlRi5jGzB3qX279NGL/dd4xq69YMxM4o1TQ==
X-Received: by 2002:ac2:55a3:: with SMTP id y3mr1645776lfg.101.1564844062524; 
 Sat, 03 Aug 2019 07:54:22 -0700 (PDT)
Received: from [10.10.200.10] ([185.54.31.1])
 by smtp.gmail.com with ESMTPSA id v4sm15768980lji.103.2019.08.03.07.54.21
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 03 Aug 2019 07:54:21 -0700 (PDT)
From: "Joachim Tingvold" <joachim@tingvold.com>
To: wireguard@lists.zx2c4.com
Subject: Mac OS + IPv6 via WireGuard: "Network is down"
Date: Sat, 03 Aug 2019 16:54:18 +0200
X-Mailer: MailMate (1.12.5r5635)
Message-ID: <3C95A64B-469C-4291-BB7D-51C80FBB8CA9@tingvold.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 25 Aug 2019 17:40:17 +0200
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

SGksCgpJJ3ZlIGJlZW4gdHJ5aW5nIG91dCBXaXJlR3VhcmQgZm9yIHNvbWUgdGltZSBub3csIGFu
ZCBJJ3ZlIGVuY291bnRlcmVkIApzb21ld2hhdCBvZiBhbiBpc3N1ZS4KCldoZW5ldmVyIEkgdHJ5
IHRvIHJlYWNoIHJlc291cmNlcyB2aWEgSVB2NiB1c2luZyB0aGVpciBGUUROLCB3aGVuIHRoZSAK
TWFjIG9ubHkgaGFzIElQdjQgYXZhaWxhYmxlIHZpYSBpdCdzIGRlZmF1bHQgaW50ZXJmYWNlIChi
dXQgSVB2NiB2aWEgCldpcmVHdWFyZCksIHRoaW5ncyBiZWhhdmUgc3RyYW5nZWx5OyBJIGNhbiBj
b21tdW5pY2F0ZSB3aXRoIElQdjYtaG9zdHMgCnVzaW5nIHRoZWlyIElQdjYgYWRkcmVzcywgYnV0
IG5vdCB0aGVpciBGUUROLgoKQW55b25lIGtub3dzIHdoYXQgY291bGQgY2F1c2UgdGhpcywgYW5k
IGhvdyB0byBzb2x2ZSBpdD8KCgpqb2NrZUBrZWtsb2x3dGY6IH4gJCBzc2ggZm9vLmpvY2tlLm5v
CnNzaDogQ291bGQgbm90IHJlc29sdmUgaG9zdG5hbWUgZm9vLmpvY2tlLm5vOiBub2RlbmFtZSBu
b3Igc2Vydm5hbWUgCnByb3ZpZGVkLCBvciBub3Qga25vd24KCmpvY2tlQGtla2xvbHd0ZjogfiAk
IHNzaCAtNiBmb28uam9ja2Uubm8Kc3NoOiBjb25uZWN0IHRvIGhvc3QgZm9vLmpvY2tlLm5vOiBO
ZXR3b3JrIGlzIGRvd24KCmpvY2tlQGtla2xvbHd0ZjogfiAkIGRpZyBmb28uam9ja2Uubm8gYWFh
YSArc2hvcnQKMjAwMTo2N2M6MTk3YzpiYXI6OjEKCmpvY2tlQGtla2xvbHd0ZjogfiAkIGhvc3Qg
Zm9vLmpvY2tlLm5vCmZvby5qb2NrZS5ubyBoYXMgSVB2NiBhZGRyZXNzIDIwMDE6NjdjOjE5N2M6
YmFyOjoxCgpqb2NrZUBrZWtsb2x3dGY6IH4gJCBwaW5nNiBmb28uam9ja2Uubm8gLWMxClBJTkc2
KDU2PTQwKzgrOCBieXRlcykgMjAwMTo2N2M6MTk3Yzpmb286OjEgLS0+IDIwMDE6NjdjOjE5N2M6
YmFyOjoxCjE2IGJ5dGVzIGZyb20gMjAwMTo2N2M6MTk3YzpiYXI6OjEsIGljbXBfc2VxPTAgaGxp
bT02MSB0aW1lPTM4LjcwMSBtcwoKLS0tIGZvby5qb2NrZS5ubyBwaW5nNiBzdGF0aXN0aWNzIC0t
LQoxIHBhY2tldHMgdHJhbnNtaXR0ZWQsIDEgcGFja2V0cyByZWNlaXZlZCwgMC4wJSBwYWNrZXQg
bG9zcwpyb3VuZC10cmlwIG1pbi9hdmcvbWF4L3N0ZC1kZXYgPSAzOC43MDEvMzguNzAxLzM4Ljcw
MS8wLjAwMCBtcwoKam9ja2VAa2VrbG9sd3RmOiB+ICQgc3NoIDIwMDE6NjdjOjE5N2M6YmFyOjox
ICJkYXRlIgpTYXQgQXVnICAzIDE2OjQ1OjUwIENFU1QgMjAxOQoKCmpvY2tlQGtla2xvbHd0Zjog
fiAkIG5ldHN0YXQgLXJuClvigKZdCkludGVybmV0NjoKRGVzdGluYXRpb24gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIEdhdGV3YXkgICAgICAgICAgICAgICAgICAgICAgICAgCkZsYWdzICAg
ICAgICAgTmV0aWYgRXhwaXJlCmRlZmF1bHQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAyMDAxOjY3YzoxOTdjOmZvbzo6ICAgICAgICAgICAgIApVR2NJICAgICAgICAgIHV0dW4xCjIw
MDE6NjdjOjE5N2M6Oi80OCAgICAgICAgICAgICAgICAgICAgICBsaW5rIzI5ICAgICAgICAgICAg
ICAgICAgICAgICAgIApVQ1MgICAgICAgICAgIHV0dW4xCgoKam9ja2VAa2VrbG9sd3RmOiB+ICQg
aWZjb25maWcgdXR1bjEKdXR1bjE6IGZsYWdzPTgwNTE8VVAsUE9JTlRPUE9JTlQsUlVOTklORyxN
VUxUSUNBU1Q+IG10dSAxNDIwCglpbmV0NiBmZTgwOjo8c25pcD4ldXR1bjEgcHJlZml4bGVuIDY0
IHNjb3BlaWQgMHgxZAoJaW5ldDYgMjAwMTo2N2M6MTk3Yzpmb286OjEgcHJlZml4bGVuIDEyMAoJ
bmQ2IG9wdGlvbnM9MjAxPFBFUkZPUk1OVUQsREFEPgoKCiMjIwpbSW50ZXJmYWNlXQpQcml2YXRl
S2V5ID0gPHNuaXA+CkFkZHJlc3MgPSAyMDAxOjY3YzoxOTdjOmZvbzo6MS8xMjgKCltQZWVyXQpQ
dWJsaWNLZXkgPSA8c25pcD4KQWxsb3dlZElQcyA9IDIwMDE6NjdjOjE5N2M6Oi80OApFbmRwb2lu
dCA9IDxzbmlwPgojIyMKCi0tIApKb2FjaGltCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCldpcmVHdWFyZCBtYWlsaW5nIGxpc3QKV2lyZUd1YXJkQGxpc3Rz
Lnp4MmM0LmNvbQpodHRwczovL2xpc3RzLnp4MmM0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3dpcmVn
dWFyZAo=
