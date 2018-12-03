Return-Path: <SRS0=SfGb=OM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=3.0 tests=DKIM_ADSP_ALL,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B2B3C04EB9
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Dec 2018 13:14:17 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6F13206B7
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Dec 2018 13:14:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=toke.dk header.i=@toke.dk header.b="uyTPF1Xv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6F13206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=toke.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 71335f40;
	Mon, 3 Dec 2018 13:06:28 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id db82fb5e
 for <wireguard@lists.zx2c4.com>; Mon, 3 Dec 2018 13:06:27 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [IPv6:2a00:7660:6da:2001::664])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c3639c71
 for <wireguard@lists.zx2c4.com>; Mon, 3 Dec 2018 13:06:26 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
 t=1543842849; bh=BBm9gz2shVQWInPzWXEAThwdcfYewo8Z/7qzPyFAyyk=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=uyTPF1XvGnRyRx61eI0x7o8R+nh/T5WlkjAsdkjXvazCUHEgCfV0vHkrYOd5mLa5c
 Tt56aZB9KzxO6vXX6B3sOzR7KQRn10LODkmrug+xlkWhawWcD/GUjdxd4xFJjVZTzP
 Gm2dpk29lX01zlGBl3hrrEH2eLnRpNKmltcISYrO2ndMdz2yyT01vpZPjAg8QeUH2q
 mK9YHHXLdON2K9cvFIPCwcdARedzII0rNBS2ri2ZjGGcFgMdtZCQvLCjJ0/AUXMuvm
 ZSOj7UNQWI1c1MSDGfyoyeBXhYYoBEpJqM6D+1qJiRD0OQJAj2N5IZy3PbbK77laxd
 8jzCsYbx4x6ig==
To: Matthias Urlichs <matthias@urlichs.de>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: Host routes =?utf-8?Q?=E2=80=93?= ARP on wireguard interfaces?
In-Reply-To: <8f102b9a-c476-24b7-c800-d4abdb4318d1@urlichs.de>
References: <8f102b9a-c476-24b7-c800-d4abdb4318d1@urlichs.de>
Date: Mon, 03 Dec 2018 15:14:06 +0200
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87h8fukb1d.fsf@toke.dk>
MIME-Version: 1.0
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

TWF0dGhpYXMgVXJsaWNocyA8bWF0dGhpYXNAdXJsaWNocy5kZT4gd3JpdGVzOgoKPiBIaSwKPgo+
IE15IHByb2JsZW06IEkgaGF2ZSBhIGNvdXBsZSBvZiBob3N0IHJvdXRlcyB3aXRoaW4gbXkgbmV0
d29yayB0aGF0IHBvaW50Cj4gdG8gYSBzZXJ2aWNlJ3MgImN1cnJlbnQgbWFzdGVyIi4gV2hlbiB0
aGF0IG1hY2hpbmUgZ29lcyBkb3duLCBJIG5lZWQgdG8KPiBhdXRvbWF0aWNhbGx5IHJlZGlyZWN0
IGl0cyBhZGRyZXNzIHRvIGEgZGlmZmVyZW50IGdhdGV3YXkuIFRoYXQncyBlYXN5IOKAkwo+IGxv
b2t1cCB0aGUgbmV4dGhvcCBmb3IgdGhlICJyZWFsIiBzZXJ2ZXIgYWRkcmVzcyBhbmQgY2hhbmdl
IHRoZSBob3N0Cj4gcm91dGUg4oCTIGV4Y2VwdCB3aGVuIHRoZSBkZXN0aW5hdGlvbiBpcyBvbiB3
aXJlZ3VhcmQgYW5kIG5lZWRzIHRvIGJlCj4gKHJlKWRpcmVjdGVkIHRvIGEgKGRpZmZlcmVudCkg
cGVlci4KPgo+IE15IHByZWZlcnJlZCBzb2x1dGlvbiBmb3IgdGhpcyAoYW5kIGFsc28gdGhlIG9u
ZSB0aGF0IGlzIG1vc3QgaW50dWl0aXZlCj4gSU1ITykgd291bGQgYmUgc29tZSBzb3J0IG9mIHBz
ZXVkby1BUlAg4oCTIGp1c3QgZW5vdWdoIHRvIG1ha2UgImlwIHJvdXRlCj4gYWRkIEZPTyB2aWEg
QkFSIiB3b3JrLCAnQkFSJyBiZWluZyBhIGhvc3QgYWRkcmVzcyB0aGF0J3MgYXNzb2NpYXRlZCB3
aXRoCj4gZXhhY3RseSBvbmUgd2lyZWd1YXJkIHBlZXIuCj4KPiBUaG91Z2h0cz8KCkknbSBub3Qg
c3VyZSBJIHF1aXRlIHVuZGVyc3RhbmQgd2hhdCBpdCBpcyB5b3UgYXJlIHRyeWluZyB0byBhY2hp
ZXZlOwp3aHkgY2FuJ3QganVzdCB5b3UgcmVjb25maWd1cmUgdGhlIHdpcmVndWFyZCBpbnRlcmZh
Y2UgdG8gcm91dGUgdGhlIElQCnRvIHRoZSByaWdodCBwZWVyPwoKLVRva2UKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KV2lyZUd1YXJkIG1haWxpbmcgbGlz
dApXaXJlR3VhcmRAbGlzdHMuengyYzQuY29tCmh0dHBzOi8vbGlzdHMuengyYzQuY29tL21haWxt
YW4vbGlzdGluZm8vd2lyZWd1YXJkCg==
