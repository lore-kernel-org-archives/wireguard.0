Return-Path: <SRS0=Cs4w=2J=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A66FC43603
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 19 Dec 2019 01:28:03 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2422C21D7D
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 19 Dec 2019 01:28:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="OFwcTL14"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2422C21D7D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 186f9720;
	Thu, 19 Dec 2019 01:27:16 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8a67246e
 for <wireguard@lists.zx2c4.com>;
 Thu, 19 Dec 2019 01:27:16 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 387458b4
 for <wireguard@lists.zx2c4.com>;
 Thu, 19 Dec 2019 01:27:16 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 51afbabf
 for <wireguard@lists.zx2c4.com>;
 Thu, 19 Dec 2019 00:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type:content-transfer-encoding; s=mail; bh=m+Kcz6kx5kOn
 3MlTIRsNE0HUEAE=; b=OFwcTL144d3jrmla0o6sjeXc1bxgUuvkEFJt9TnSxhg9
 WB9IrQAb+VBBzf26DmLizati6m5RUN8l0gc+C6cIILqsNR6w6hQ/cNWLp1Fp198R
 NBhxFEUtCBjPN4dTdhUR+kcucln1JOmbmbfwIuj0hmviwKOOxY9kEt3c9mEbwE9y
 ESWqfAivmUHIGnEC/Fiu8FwDg2Zmxbfuo8Czmkhuac4vhm4CozLDPWRmcpqAb3Eb
 C16vkkfslQT0izKhsxWTwyEtfEyW+KEudw5VXKSU9XkAp7VGVOrghdjTwXSRrYnD
 Tk7yX0lsh83y0a/cmCEttwmssac4gGbq/GmGwR5tSQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 15b1b707
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 19 Dec 2019 00:30:37 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id a15so4944661otf.1
 for <wireguard@lists.zx2c4.com>; Wed, 18 Dec 2019 17:27:15 -0800 (PST)
X-Gm-Message-State: APjAAAUwwVGLgP0vdirdjBF47JTW4+i/QNZa/mN8vPv/sbnqCa/TiarC
 mlcJ0mk7SsNCzG23HyUjPojbV+SE5CdWFsmvIpE=
X-Google-Smtp-Source: APXvYqxxAN1R7uDaqIDSqPmIwNx5K8O4UDoP6Mq2y+n2VrriH94lKdgxWwpLU5kc7LoHDRLzJVD/2TiBC2gGhRpnxug=
X-Received: by 2002:a9d:4f18:: with SMTP id d24mr291405otl.179.1576718835252; 
 Wed, 18 Dec 2019 17:27:15 -0800 (PST)
MIME-Version: 1.0
References: <CA+jiYFD1SD-FgjgkwSTmkog1CYJYrEY87MKwD3StzAmmCJkn3w@mail.gmail.com>
In-Reply-To: <CA+jiYFD1SD-FgjgkwSTmkog1CYJYrEY87MKwD3StzAmmCJkn3w@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 19 Dec 2019 02:27:04 +0100
X-Gmail-Original-Message-ID: <CAHmME9rKOd1rLygTtbho-vo85wQBGo5tQXdBrDvE-Fdk+r=_aw@mail.gmail.com>
Message-ID: <CAHmME9rKOd1rLygTtbho-vo85wQBGo5tQXdBrDvE-Fdk+r=_aw@mail.gmail.com>
Subject: Re: MTU on wireguard-apple for IPv6
To: =?UTF-8?Q?R=C3=A9mi_Lapeyre?= <remi.lapeyre@henki.fr>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

T24gVGh1LCBEZWMgMTksIDIwMTkgYXQgMjoyMSBBTSBSw6ltaSBMYXBleXJlIDxyZW1pLmxhcGV5
cmVAaGVua2kuZnI+IHdyb3RlOgo+IERvZXMgYG5ldHdvcmtTZXR0aW5ncy50dW5uZWxPdmVyaGVh
ZEJ5dGVzID0gODBgIG1lYW5zIHRoZSBNVFUgd2lsbAo+IHVzZWQgYmUgdGhlIG9uZSBvZiB0aGUg
aW50ZXJmYWNlIG1pbnVzIDgwIGJpdHMgb2Ygb3ZlcmhlYWQgZm9yIHRoZQo+IFdpcmVHdWFyZCBw
cm90b2NvbD8KClJpZ2h0LCBpdCBtZWFucyB0aGUgTVRVIG9mIHRoZSBXaXJlR3VhcmQgaW50ZXJm
YWNlIHdpbGwgYmUgdGhlIE1UVSBvZgp5b3VyIHdpZmkgaW50ZXJmYWNlIG1pbnVzIDgwLgoKPiBT
b21lIG9mIG91ciB1c2VycyB3aGVyZSB0ZXRoZXJpbmcgb3ZlciB0aGVpciBwaG9uZSBjb25uZWN0
aW9uIHNvIGl0Cj4gc2VlbXMgdGhhdCAxMjgwIGlzIGFwcHJvcHJpYXRlIGluIHRoYXQgY2FzZSwg
YnV0IEnigJltIGNvbmZ1c2VkIGFzIHRvCj4gd2h5IGNvbm5lY3Rpb25zIG5vdCBnb2luZyB0aHJv
dWdoIHRoZSBXaXJlR3VhcmQgdHVubmVsIHdoZXJlIG5vdAo+IGltcGFjdGVkIGluIHRoYXQgY2Fz
ZS4KClByb2JhYmx5IHRoZSBwaG9uZSdzIGRoY3Agc2VydmVyIGRvZXNuJ3QgcGFzcyB0aGUgcmln
aHQgTVRVIGJhY2sgdG8KdGhlIGNsaWVudCwgYnV0IHRoZW4gdGhlIHBob25lIGRvZXMgdGhlIG1z
cy1tdHUgaGFjayB0byBmaXggdXAgVENQCmNvbm5lY3Rpb25zLiBUaGF0IGhhY2sgZG9lc24ndCB3
b3JrIHdoZW4gdGhlIHRyYWZmaWMgaXMgZW5kLXRvLWVuZAplbmNyeXB0ZWQsIGFzIGlzIHRoZSBj
YXNlIHdpdGggV2lyZUd1YXJkLCBzbyBubyBzbWFsbGVyIE1TUyBpcyBldmVyCm5lZ290aWF0ZWQu
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCldpcmVHdWFy
ZCBtYWlsaW5nIGxpc3QKV2lyZUd1YXJkQGxpc3RzLnp4MmM0LmNvbQpodHRwczovL2xpc3RzLnp4
MmM0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3dpcmVndWFyZAo=
