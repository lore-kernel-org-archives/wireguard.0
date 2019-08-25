Return-Path: <SRS0=QHSY=WV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8B5DC3A5A4
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 19:24:51 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 509F5206BA
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 19:24:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lindenberg.one header.i=@lindenberg.one header.b="lM9BG5Ns"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 509F5206BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=lindenberg.one
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 88c3b2d8;
	Sun, 25 Aug 2019 19:23:14 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fd119264
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 19:04:14 +0000 (UTC)
Received: from mailarchive.lindenberg.one (mailarchive.lindenberg.one
 [62.113.211.160])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ef55adfd
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 19:04:14 +0000 (UTC)
Received: from Alex (unknown [192.168.177.5])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: news@lindenberg.one)
 by mailarchive.lindenberg.one (Postfix) with ESMTPSA id A5EF82805B9;
 Sun, 25 Aug 2019 21:04:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lindenberg.one;
 s=dkim180429; t=1566759852;
 h=from:sender:reply-to:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:resent-to:resent-cc:resent-from:resent-sender:resent-message-id:in-reply-to:references:list-id:list-owner:list-unsubscribe:list-subscribe:list-post;
 bh=mODVshdqFZ+k/ciB93Ngc8GwmeYXRd23k1yrBbzFxtU=;
 b=lM9BG5Nskjn2cznQt4g6CJDhrBg0hjRa4NZA5lh6QRmmoHQSAypFT9phZKcoQJUrNNxwRX
 xi9fFmaryNIYndMFE5ah8V3BlGZUnda0HVNFlV6oZQdJUeRvMxhptMeifuTXz9gm/qKBI+
 zlZg2Mmi3pywl/CtJt3/WWPLf4drcLJeIo+/rtfuVtL9XIfHlkyx9EvkUlKN8QEfn+jvuR
 O5QK9QoZRL6ns+0Gu1ijh9HyfnK+pU9uZLpXYhPt4iPbBaN5XRzGRHGe/L6jtsPBxHUkBZ
 5a7zjUDSDOyR8LARkJzGcUms4cBmmuM5URhnmiY7345chbjj/JGBrNGOh2dDTw==
From: <news@lindenberg.one>
To: "'Jason A. Donenfeld'" <Jason@zx2c4.com>,
 "'Simon Rozman'" <simon@rozman.si>
References: <036a01d54abe$4c049cb0$e40dd610$@lindenberg.one>
 <CAHmME9r6XdEMUxwq5p9S0pcC4d6dneM5pcv6bU0H0MHEMzP9SA@mail.gmail.com>
 <014e01d55b69$d19256e0$74b704a0$@lindenberg.one>
 <CAHmME9o7PrETcRuLdO7DnpUiKNyO1AyL0qY4Xa1XFT4FPVsVvQ@mail.gmail.com>
 <015d01d55b76$30373290$90a597b0$@lindenberg.one>
 <CAHmME9qf_kpT=u3JfLDh2fENq=z6P5cebYC5YRwTBF2P7NcGWg@mail.gmail.com>
In-Reply-To: <CAHmME9qf_kpT=u3JfLDh2fENq=z6P5cebYC5YRwTBF2P7NcGWg@mail.gmail.com>
Subject: AW: Hyper-V 2019: unable to create wintun device: no interfaces found
Date: Sun, 25 Aug 2019 21:04:12 +0200
Message-ID: <015e01d55b77$e1ec8e30$a5c5aa90$@lindenberg.one>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-de
Thread-Index: AQGl1jjZadwHrDiDTTS7Xq7i75kXDAJFFK7HAfYLZGwBulWLbwJg0UAxARhLNnOnH8144A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=lindenberg.one; 
 s=dkim180429; t=1566759852;
 h=from:sender:reply-to:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:resent-to:resent-cc:resent-from:resent-sender:resent-message-id:in-reply-to:references:list-id:list-owner:list-unsubscribe:list-subscribe:list-post;
 bh=mODVshdqFZ+k/ciB93Ngc8GwmeYXRd23k1yrBbzFxtU=;
 b=jWFarabXtEjFjtSUeI8pVLIDtAYVcV7n/s0/h6glKyQtq/w0V3xpITrxpEw9qcG16IABmS
 w5T+h/BQwZIyJfMyGjMEqRDJCdBhezIXFYX92/RVmGfmPw1GUj5dlyoin1wO1u9GdazPc1
 6vHyeHfYFeBY5AIKDHT9iUYRGvJLcPWrSZ2pMPFtkUdEv7/SWeJ2cXLlC3lK+GPv2XVqmG
 yVb1i72IgVJg0gh0R3RiCcMmZEggp7kFO5PHh2Qc4FB/UIDd+N0PI4NlEhcpZ1o9ZRJuG0
 ZAsbx5L/87031yuxZWq/Il3zNAypanjUffzXjAUoQv8rqALRaTPqA0wk0E5ThA==
ARC-Seal: i=1; s=dkim180429; d=lindenberg.one; t=1566759852; a=rsa-sha256;
 cv=none;
 b=olBmp55O5bSSIhmMDPuD1lE9Lm17Yc6Aa+bGl4uOr44PiKJIPr1YTBE6DsoMP2Laddu0/6vVceoLEj4pMlud2xGTLNO28buW3NkjCQu3hj9SG5h9wY/+haMMmFYVamBSEfkebRHMvzZCutXMZ84NzRXa7J92xYsZbXrACNtY1h98GM89yyAcwKHaHACfVDmhg8p25xCzNfmofypQeIIiaOrHz4GkosWTr/MPyBhwp7yPztmcxle8tPHYfC2iWq6wxeyFMX7Vu2l+8/rYYX4sqHBvSNYJaLN1RAWdo6Y92/3pWcAAoTcKYUmxth3uJ+fs52+YBj2iB5Tpsbons/HnMQ==
ARC-Authentication-Results: i=1; auth=pass smtp.auth=news@lindenberg.one
 smtp.mailfrom=news@lindenberg.one
X-Mailman-Approved-At: Sun, 25 Aug 2019 21:23:11 +0200
Cc: 'WireGuard mailing list' <wireguard@lists.zx2c4.com>
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

VGhlIHNjcmlwdCBpcyBwcm9iYWJseSBtb3JlIGVmZmljaWVudCBidXQgc2lnbmlmaWNhbnRseSBs
ZXNzIGNvbnN1bWFibGUgdG8gbWUgKEkgd291bGQgbm90IGJlIHdpbGxpbmcgdG8gdHJ5IHRvIHRy
YW5zbGF0ZSB0aGlzIHRvIHdpbmRvd3MpIHRoZW4gcGluZyAtYzEgfHwgcHVsbCBkb3duIGFuZCB1
cCBJIHJlYWQgc29tZXdoZXJlIGVsc2UuIEFjdHVhbGx5IEkgaGF2ZSBzb21lIG1vcmUgY2FzZXMg
aW4gbXkgc2NyaXB0LCBidXQgY2Fubm90IGluY2x1ZGUgdGhlbSBiZWNhdXNlIHRoZSBjbGllbnQg
aXMgc2xlZXBpbmcgKGFuZCB0aGUgcm91dGVyIGhhcyBhbiBpc3N1ZSB3aXRoIHdvbCByaWdodCBu
b3cpLiBJIGd1ZXNzIG15IHNjcmlwdCBpcyBsZXNzIGFkYXB0YWJsZSBhbmQgc3VwcG9ydHMganVz
dCBvbmUgY2xpZW50LCBidXQgZG9lcyB0aGUgdHJpY2suClBsZWFzZSwgcGxlYXNlLCBwbGVhc2Ug
LSB0aGVyZSBtdXN0IGJlIGEgYmV0dGVyIHBsYWNlIHRvIGRvIHRoaXMgYXV0b21hdGljYWxseSB3
aXRob3V0IGV4dHJhIHNjcmlwdGluZy4uClRoYW5rcywgSm9hY2hpbQoKLS0tLS1VcnNwcsO8bmds
aWNoZSBOYWNocmljaHQtLS0tLQpWb246IEphc29uIEEuIERvbmVuZmVsZCA8SmFzb25AengyYzQu
Y29tPiAKR2VzZW5kZXQ6IFN1bmRheSwgMjUgQXVndXN0IDIwMTkgMjA6NTUKQW46IG5ld3NAbGlu
ZGVuYmVyZy5vbmU7IFNpbW9uIFJvem1hbiA8c2ltb25Acm96bWFuLnNpPgpDYzogV2lyZUd1YXJk
IG1haWxpbmcgbGlzdCA8d2lyZWd1YXJkQGxpc3RzLnp4MmM0LmNvbT4KQmV0cmVmZjogUmU6IEh5
cGVyLVYgMjAxOTogdW5hYmxlIHRvIGNyZWF0ZSB3aW50dW4gZGV2aWNlOiBubyBpbnRlcmZhY2Vz
IGZvdW5kCgpPbiBTdW4sIEF1ZyAyNSwgMjAxOSBhdCAxMjo1MiBQTSA8bmV3c0BsaW5kZW5iZXJn
Lm9uZT4gd3JvdGU6Cj4gbm90IHRoZSBwb3J0LiBNeSBleHRlcm5hbCBJUCBpcyBkeW5hbWljLiBU
aGlzIGlzIHJlYWxseSBzdGFuZGFyZCBmb3IgaW50ZXJuZXQgc2VydmljZXMgaW4gR2VybWFueSBv
ZmZlcmVkIHRvIG5vbi1idXNpbmVzcyB1c2Vycywgb3IgYWxzbyBidXNpbmVzcyB0aGF0IHByZWZl
ciBub3QgdGhlIHBheSBleHRyYSBjaGFyZ2VzIGZvciB0aGUgYXNzaWdubWVudCBvZiBhIHN0YXRp
YyBpcCBhZGRyZXNzLiBNeSBJUCBhZGRyZXNzIGNoYW5nZXMgYXQgbGVhc3Qgb25jZSBhIGRheSAo
dXN1YWxseSBiZXR3ZWVuIDEgYW0gYW5kIDIgYW0pLiBVc3VhbGx5IG9uZSB1c2VzIGEgZHluZG5z
IHByb3ZpZGVyLCBhbmQgbWFueSByb3V0ZXJzIHN1cHBvcnQgdXBkYXRpbmcgdGhlIGlwIGFkZHJl
c3MgYXV0b21hdGljYWxseS4gQXMgSSBhbSBydW5uaW5nIG15IGV4dGVybmFsIEROUyB3aXRoIGNs
b3VkZmxhciwgSSBhbSBjYWxsaW5nIHRoZWlyIEFQSSB0byB1cGRhdGUgbXkgZXh0ZXJuYWwgYWRk
cmVzcy4KPiBOb3cgYWZhaWsgV2lyZWd1YXJkIHJlc29sdmVzIHRoZSBkb21haW4gbmFtZSBvZiB0
aGUgc2VydmVyIGp1c3Qgb25jZSB0byBhbiBJUCBhZGRyZXNzIGFuZCBub3QgcmVndWxhcmx5IG9y
IHdoZW5ldmVyIHRoZSBjb25uZWN0aW9uIGJyZWFrcyBkb3duIG9yIGhhcyBiZWVuIGlkbGUgZm9y
IHNvbWUgdGltZS4KPiBQZXJzaXN0ZW50S2VlcEFsaXZlIGNhbm5vdCBhZGRyZXNzIHRoZSBpc3N1
ZSwgYXMgdGhlIGNsaWVudCBpcyBhbHNvIG5vdCBhd2FrZSBhbGwgdGhlIHRpbWUgaW4gb3JkZXIg
dG8gc2F2ZSBlbmVyZ3kuIExvb2tpbmcgYXQgd2cgLz8gb24gd2luZG93cyBJIGFsc28gZG9uwrR0
IHNlZSBhbnkgb3B0aW9uIHRoYXQgc2VlbXMgYXBwbGljYWJsZS4uCgpBaGhoLCB0aGUgRE5TIHJl
LXJlc29sdXRpb24gaXNzdWUuIE9uIGxpbnV4IHdlIGhhdmUgdGhpcyBuaWNlIHNjcmlwdDoKCmh0
dHBzOi8vZ2l0Lnp4MmM0LmNvbS9XaXJlR3VhcmQvdHJlZS9jb250cmliL2V4YW1wbGVzL3JlcmVz
b2x2ZS1kbnMKCk9uIHdpbmRvd3MsIGl0IHNob3VsZCBiZSBwcmV0dHkgZWFzeSB0byBkbyBhcyB3
ZWxsLiBZb3UgY2FuIGFjdHVhbGx5IGp1c3QgdXNlIHRhc2sgc2NoZWR1bGVyIHRvIHJ1biBgd2cg
c2V0IHdnMCBwZWVyIEFCQ0QuLi5FRj0gZW5kcG9pbnQgc29tZXdoZXJlLm9uLmR5bmRuczoxMjM0
YCBldmVyeSBtaW51dGUgb3Igd2hhdGV2ZXIgeW91IGZlZWwgaXMgYmVzdC4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCldpcmVHdWFyZCBtYWlsaW5nIGxp
c3QKV2lyZUd1YXJkQGxpc3RzLnp4MmM0LmNvbQpodHRwczovL2xpc3RzLnp4MmM0LmNvbS9tYWls
bWFuL2xpc3RpbmZvL3dpcmVndWFyZAo=
