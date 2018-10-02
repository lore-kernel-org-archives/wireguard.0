Return-Path: <SRS0=l6+B=MO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E8B5C43143
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  2 Oct 2018 09:47:14 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABD1920878
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  2 Oct 2018 09:47:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABD1920878
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bernhard-ehlers.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ceb71ad8;
	Tue, 2 Oct 2018 09:46:44 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9ae0fba8
 for <wireguard@lists.zx2c4.com>; Tue, 2 Oct 2018 09:46:42 +0000 (UTC)
Received: from wild.uberspace.de (wild.uberspace.de [185.26.156.86])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7a6beb84
 for <wireguard@lists.zx2c4.com>; Tue, 2 Oct 2018 09:46:42 +0000 (UTC)
Received: (qmail 10177 invoked from network); 2 Oct 2018 09:46:43 -0000
Received: from unknown (HELO imac.lan) (85.222.214.21)
 by wild.uberspace.de with SMTP; 2 Oct 2018 09:46:43 -0000
From: Bernhard Ehlers <wg@bernhard-ehlers.de>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: bash_completion errors when installed with homebrew
Date: Tue, 2 Oct 2018 11:46:38 +0200
References: <CAEy7hVPn++92XRedQg2OSwK0OAoqds6b15U2iHjePrWie1qrKw@mail.gmail.com>
To: wireguard@lists.zx2c4.com
In-Reply-To: <CAEy7hVPn++92XRedQg2OSwK0OAoqds6b15U2iHjePrWie1qrKw@mail.gmail.com>
Message-Id: <2A7E108A-8FAC-485A-A17F-1895AB3D3DCF@bernhard-ehlers.de>
X-Mailer: Apple Mail (2.3445.9.1)
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

PiBBZnRlciBpbnN0YWxsaW5nIHdpcmVndWFyZCwgd2hlbiBJIG9wZW4gYSBuZXcgdGVybWluYWws
IEkgc2VlIHRoZQo+IGZvbGxvd2luZyBlcnJvcnM6Cj4gYGBgCj4gLWJhc2g6IGNvbXBsZXRlOiBu
b3NvcnQ6IGludmFsaWQgb3B0aW9uIG5hbWUKPiAtYmFzaDogY29tcGxldGU6IG5vc29ydDogaW52
YWxpZCBvcHRpb24gbmFtZQo+IGBgYAoKQWxtb3N0IGFsbCBzeXN0ZW1zIGFyZSB1c2luZyBiYXNo
IHY0LCBNYWMgT1MgWCBpcyBvbmUgb2YgdGhlIGZldyBzeXN0ZW1zIHRoYXQKc3RpbGwgdXNlIGJh
c2ggdjMuIE9mIGNvdXJzZSBpdOKAmXMgcG9zc2libGUgdG8gcmV3cml0ZSB0aGUgY29tcGxldGlv
biBzY3JpcHRzIGZvciB2Mwpjb21wYXRpYmxpbGl0eSwgYnV0IEnigJltIG5vdCBzdXJlIGlmIHRo
ZSBkZXZzIGFyZSBlbnRodXNpYXN0aWMgYWJvdXQgdGhhdC4gQ2hhbmdlcwp0byB0aGUgY29tcGxl
dGlvbiBzY3JpcHRzIGVmZmVjdCBhbGwgc3lzdGVtcy4KCkluIGFub3RoZXIgcG9zdCBJIHN1Z2dl
c3RlZCB0byBjaGFuZ2UgdGhlIHdnLXF1aWNrIGZvciBPUyBYIHRvIHN1cHBvcnQgYmFzaCB2MywK
YnV0IHRoYXQgY2hhbmdlIHdvbuKAmXQgYWZmZWN0IG90aGVyIHN5c3RlbXMuCgpNeSBzdWdnZXN0
aW9uIGlzLCB0aGF0IHRoZSBjb21wbGV0aW9uIHNjcmlwdHMgZG8gbm90aGluZyBmb3IgYmFzaCB2
ZXJzaW9ucyBsb3dlcgp0aGFuIDQuIFRoZW4gdGhpcyBlcnJvciBtZXNzYWdlcyB3b27igJl0IHNo
b3cgdXAsIGJ1dCAob2YgY291cnNlKSB0aGUgY29tcGxldGlvbgp3b27igJl0IHdvcmsuCgpTbyBz
b21ldGhpbmcgbGlrZSB0aGlzIGF0IHRoZSBiZWdpbm5pbmcgb2YgdGhlIGNvbXBsZXRpb24gc2Ny
aXB0czoKCltbICR7QkFTSF9WRVJTSU5GT1swXX0gLWdlIDQgXV0gfHwgcmV0dXJuIDAKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KV2lyZUd1YXJkIG1haWxp
bmcgbGlzdApXaXJlR3VhcmRAbGlzdHMuengyYzQuY29tCmh0dHBzOi8vbGlzdHMuengyYzQuY29t
L21haWxtYW4vbGlzdGluZm8vd2lyZWd1YXJkCg==
