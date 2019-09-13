Return-Path: <SRS0=tD3D=XI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1E5CC4CEC7
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 13 Sep 2019 13:23:17 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1E78206BB
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 13 Sep 2019 13:23:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ungleich.ch header.i=@ungleich.ch header.b="tEMg66PH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1E78206BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ungleich.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cd3bc555;
	Fri, 13 Sep 2019 13:22:59 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 02ed8391
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Sep 2019 13:22:58 +0000 (UTC)
Received: from smtp.ungleich.ch (mx.ungleich.ch [185.203.112.16])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fbd638fe
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Sep 2019 13:22:58 +0000 (UTC)
Received: from nico.schottelius.org (localhost [IPv6:::1])
 by smtp.ungleich.ch (Postfix) with ESMTP id EBC711FD72;
 Fri, 13 Sep 2019 15:22:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch; s=mail;
 t=1568380977; bh=foRZKO9f17T4eVlIa+f5N3uBSoSprMfdQU7VcldNgVI=;
 h=References:From:To:Cc:Subject:In-reply-to:Date:From;
 b=tEMg66PHcYd5aQGb5VySlFzkOxbUI/YJTTooNZlBr92Ij+FsbVDHhtdziNfTiIVL8
 IP6AWXnoGvmZ0n2N7vQrVYnLdCKMUFfArqUjKdxX4HYoNowS3QLWt50ANQAX28GeCY
 +KOC1LV1QSax3V701x4law1RM9uBw1jImk4XAuic=
Received: by nico.schottelius.org (Postfix, from userid 1000)
 id B96131A01027; Fri, 13 Sep 2019 22:22:55 +0900 (KST)
References: <CAFsReqSUQYthBTr4o7HQQGdNUgzA33i9hAoJ_UieNUzJbB=hLA@mail.gmail.com>
 <878sqs8ip3.fsf@line.ungleich.ch>
 <CAFsReqTThNXkkPH+_YHOhC_DEbKwY5rPdmRDVJxLiTQbhfAbDA@mail.gmail.com>
User-agent: mu4e 1.0; emacs 26.1
From: Nico Schottelius <nico.schottelius@ungleich.ch>
To: =?utf-8?Q?R=C3=A9mi?= Lapeyre <remi.lapeyre@lenstra.fr>
Subject: Re: Adding 2FA to WireGuard
In-reply-to: <CAFsReqTThNXkkPH+_YHOhC_DEbKwY5rPdmRDVJxLiTQbhfAbDA@mail.gmail.com>
Date: Fri, 13 Sep 2019 22:22:55 +0900
Message-ID: <875zlw8h5c.fsf@line.ungleich.ch>
MIME-Version: 1.0
Cc: wireguard@lists.zx2c4.com
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

CkhleSBSw6ltaSwKClLDqW1pIExhcGV5cmUgPHJlbWkubGFwZXlyZUBsZW5zdHJhLmZyPiB3cml0
ZXM6Cj4gSGkgTmljbywgeWVzIHB5b3RwIGlzIHRoZSBpbXBsZW1lbnRhdGlvbiBJIHVzZSBvbiB0
aGUgc2VydmVyLCBidXQgYW55dGhpbmcKPiBDb21wYXRpYmxlIHdpdGhyZmM2MjM4IHNob3VsZCB3
b3JrLgoKVGhhdCBzb3VuZHMgYWJvdXQgcmlnaHQhCgo+PiBXZSBoYXZlIHdyaXR0ZW4gdW5nbGVp
Y2gtb3RwIFswXSB0aGF0IGV4dGVuZHMgdGhlIG90cCBhcHByb2FjaCB3aXRoCj4+IHJlYWxtcyBz
aW1pbGFyIHRvIGtlcmJlcm9zLgo+Cj4gVGhpcyBsb29rcyBpbnRlcmVzdGluZywgSSB3aWxsIG1v
dmUgdGhlIGNvZGUgdGhhdCB2YWxpZGF0ZSB0aGUgT1RQIGluIGEKPiBzZXBhcmF0ZSBjbGFzcyBz
byB0aGF0IGFub3RoZXIgdmFsaWRhdGlvbiBiYWNrZW5kIGxpa2Ugb25lIGJhc2VkIG9uIHRoaXMK
PiBwcm9qZWN0IGNhbiBiZSB1c2VkIGluc3RlYWQgb2YgcmVhZGluZyB0aGUgc2VlZHMgZnJvbSBh
IFNRTGl0ZSBmaWxlIGxpa2UKPiBJ4oCZbSBkb2luZyBub3cuCj4KPiBJIGRpZCBub3Qgc2VlIGFu
eSBraW5kIG9mIGNvb2wgZG93biBpbgo+IGh0dHBzOi8vY29kZS51bmdsZWljaC5jaC91bmdsZWlj
aC1wdWJsaWMvdW5nbGVpY2gtb3RwL2Jsb2IvbWFzdGVyL290cGF1dGgvc2VyaWFsaXplci5weS4K
PiBBcmUgeW91IG5vdCB3b3JyaWVkIHRoYXQgc29tZW9uZQo+IGNvdWxkIHRyeSB0byBicnV0ZS1m
b3JjZSB0aGUgT1RQIHZhbGlkYXRpb24/CgpUaGF0IGlzIGEgZ29vZCBwb2ludCEgV2Ugd2lsbCBj
ZXJ0YWlubHkgd2FudCB0byBmaXggdGhhdCwgYXMgdGhlIHNlZWQKZW50cm9weSBpcyBub3QgKnRo
YXQqIGJpZy4KCkJlc3QgcmVnYXJkcywKCk5pY28KCgotLQpZb3VyIFN3aXNzLCBPcGVuIFNvdXJj
ZSBhbmQgSVB2NiBWaXJ0dWFsIE1hY2hpbmUuIE5vdyBvbiB3d3cuZGF0YWNlbnRlcmxpZ2h0LmNo
LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpXaXJlR3Vh
cmQgbWFpbGluZyBsaXN0CldpcmVHdWFyZEBsaXN0cy56eDJjNC5jb20KaHR0cHM6Ly9saXN0cy56
eDJjNC5jb20vbWFpbG1hbi9saXN0aW5mby93aXJlZ3VhcmQK
