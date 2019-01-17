Return-Path: <SRS0=nQDx=PZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37C5AC43387
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 17 Jan 2019 00:40:27 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4040205C9
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 17 Jan 2019 00:40:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sholland.org header.i=@sholland.org header.b="VbpZNv8S";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="mM3yjCqm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4040205C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sholland.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 17e5bac8;
	Thu, 17 Jan 2019 00:35:55 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5744b14f
 for <wireguard@lists.zx2c4.com>;
 Thu, 17 Jan 2019 00:35:54 +0000 (UTC)
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2cdd9771
 for <wireguard@lists.zx2c4.com>;
 Thu, 17 Jan 2019 00:35:54 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 10AF813F8;
 Wed, 16 Jan 2019 19:40:07 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 16 Jan 2019 19:40:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=Y
 u+0b8nmzVblbe4EygK7ZXN//+qDDots8uu98LQvJtw=; b=VbpZNv8SHjZCRZzaa
 F8x0r9ypAKZ1dFJqna6vWME/bcq+e0xYgmoUf0d88fgy5nieN/FnBYrK0YGFh+Su
 4G91+D7dQSEaQ8yhuIqvWe8clF9+wfTf48FTKhtjSngAVwMYNPeig/zJpnOMxsqD
 0UzE4q2hKTscWfTfm7Bv0ch4cScldOC/2QOpBRxuYlcG11rFAQ/5uisWWAQDrlG+
 nxzMMEH9r1CprBmFw2x3rPLklBj4nTXHOpSU4u9FdkXHTEa6ZI2TLgRifcH1yqf0
 f7jBg62wIk/YqHzSKVD+4FnJ4dffHbwwtMilRWZDbIdgh0kmw1/OxRij/ot8eP+J
 9RXkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=Yu+0b8nmzVblbe4EygK7ZXN//+qDDots8uu98LQvJ
 tw=; b=mM3yjCqmZpgm1IogGpUsP/M0lJ++lT1N9crYBPupGrLWdLFMAi2pCPRBm
 qr6/iNC8VR8qBGBIio3HAd1r2R3xcu93H8fYkfhsxBKFoqcVX5+vzBH5qAoybsx6
 WagOs8nVSZTQjBBVy+NOnUhtfe9pZwfIyWNYA3bSl5MNex+u7nc1jNQnnReUrwFK
 o2PJ4JRW7qAOoGwSwmTouhSfIIJCCJFtf/WxHnDdyqYRIgR2CreT64Y3iicRWm4u
 0BwsWPuGJbNQ10egqezWipQ4c7nmmw1d9qINnAPppWPahbgeMZAmMzBHsndfG/+Z
 uLAkR8IUkc+dDyyF4GFJyhranfKDA==
X-ME-Sender: <xms:5c4_XPwed9LLI2-Jn-J6bs0zWFuK0V8ulMCx1FJc9yvKws6GL5lSHA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledrgeeigddvgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthenuceurghilhhouhhtmecufedt
 tdenucenucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpe
 furghmuhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
 qeenucfkphepjedtrddufeehrddugeekrdduhedunecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgnecuvehluhhsthgvrhfuihiivgep
 td
X-ME-Proxy: <xmx:5c4_XJ15ku1awnWDSo7OTgk9-EGgi1cMzujJHtqlpunUInAMORHRgg>
 <xmx:5c4_XM-qeopOxoL4avPnHKyAsvsabF-GQIKPoQ9jZd-TX--efj7PYA>
 <xmx:5c4_XJppETKnYHMTUPEAMaqmhnOHH1mLEic5xijoU5wijA2WtqWFlQ>
 <xmx:5s4_XMEIE198Tc6wOEqmnd-QSStPQ9jQULxkOmJmQoDyE0_1AHDbjA>
Received: from [192.168.50.162]
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 71DAA100E4;
 Wed, 16 Jan 2019 19:40:05 -0500 (EST)
Subject: Re: WireGuard roaming behind a load balancer
To: =?UTF-8?Q?Ivan_Lab=c3=a1th?= <labawi-wg@matrix-dream.net>,
 pdub <pdub@pdub.net>
References: <CABbM=Lk6WQGctp7Z3YBYBcq9CKwRn-KWC-e8DeHxvYF+Cda8Og@mail.gmail.com>
 <20190117002100.GA24923@matrix-dream.net>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <d66b2b95-ee36-ed16-b8fa-94edfe092478@sholland.org>
Date: Wed, 16 Jan 2019 18:40:05 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190117002100.GA24923@matrix-dream.net>
Content-Language: en-US
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

T24gMDEvMTYvMTkgMTg6MjEsIEl2YW4gTGFiw6F0aCB3cm90ZToKPiBJbiB5b3VyIHNldHVwLCB3
aGVyZSBILEEsQiBhcmUgd2cgbm9kZXMsIGFuZAo+ICAgKEgpQSAtIEIKPiBpcyBzd2l0Y2hlZCB0
bwo+ICAgKEEpSCAtIEIKCkkgYXNzdW1lIGhlcmUgQSBhbmQgSCBhcmUgdGhlIGFjdGl2ZS9ob3Qt
c3BhcmUgcGFpciwgYW5kIEIgaXMgdGhlIHJlbW90ZSBub2RlLgoKPiBCLT5IQSB0cmFmZmljIHdp
bGwgYmUgbG9zdCAoY29uc2lkZXJlZCBqdW5rKSB1bnRpbCBlaXRoZXIKPiAKPiAgLSBCJ3MgdGlt
ZXIgZXhwaXJlcyBhbmQgYSBCLT5IIHJla2V5IGlzIGlzc3VlZCAobWF5YmUgMTBzIG9mIHNlY29u
ZHM/KQoKVG8gYmUgcHJlY2lzZSwgdGhpcyB0aW1lciBpcyAxMjAgc2Vjb25kcyBmcm9tIHRoZSBs
YXN0IHN1Y2Nlc3NmdWwgaGFuZHNoYWtlLgoKPiAgLSBILT5CIHRyYWZmaWMgYW5kL29yIHRpbWVy
IGluaXRpYXRlcyBhIEgtPkIgcmVrZXkKPiAKPiBJZiBIQSBjYW4gaW5pdGF0ZSB0cmFmZmljIHRv
IEIsIHlvdSBtYXkgYmUgYWJsZSB0byByaWcgYSByZWtleSBzb29uLAo+IHdpdGggYSA8MXMgb3V0
YWdlLCBvciBldmVuIGxvc3NsZXNzIGluIHNvbWUgY2lyY3Vtc3RhbmNlcywgYnV0IHlvdSBhcmUK
PiBnb2luZyBhZ2FpbnN0IHRoZSBkZXNpZ24gb2YgYSBob3N0LXRvLWhvc3QgInN0YXRlbGVzcyIg
dnBuLgoKSCBjYW4gaW1tZWRpYXRlbHkgc2VuZCBoYW5kc2hha2VzIHRvIGFsbCBwZWVycyB3aGVu
IGl0IGlzIGJyb3VnaHQgdXAgKGFuZCB3aWxsCmRvIHNvIHRvZGF5IGlmIHRoZXkgaGF2ZSBwZXJz
aXN0ZW50IGtlZXBhbGl2ZXMgc2V0KS4gQnV0IHlvdSBuZWVkIG1vcmUgdGhhbiBIQQpiZWluZyBh
YmxlIHRvIGluaXRpYXRlIHRyYWZmaWMgdG8gQi4gQiBjb3VsZCBoYXZlIHJvYW1lZCB0byBhIG5l
dyBJUCB3aGlsZSBpdAp3YXMgY29tbXVuaWNhdGluZyB3aXRoIEEuIFRoZW4gQSB3b3VsZCBrbm93
IGFib3V0IHRoZSBuZXcgSVAgKGJlY2F1c2UgaXQKcmVjZWl2ZWQgYW4gYXV0aGVudGljYXRlZCBw
YWNrZXQgZnJvbSB0aGVyZSksIGJ1dCBIIHdvdWxkIG5vdC4KClNvIHlvdSBuZWVkIHNvbWUgd2F5
IHRvIHN0cmVhbSBlbmRwb2ludCB1cGRhdGVzIGJldHdlZW4gQSBhbmQgSC4gSSdtIG5vdCBzdXJl
IGlmCldpcmVHdWFyZCdzIG5ldGxpbmsgaGFzIGEgd2F5IHRvIHB1c2ggZW5kcG9pbnQgY2hhbmdl
cyAodGhhdCB3b3VsZCBiZSBuaWNlKSwgYnV0CnlvdSBjb3VsZCBhdCBsZWFzdCBwb2xsIG5ldGxp
bmsgb24gdGhlIGFjdGl2ZSBob3N0LCBhbmQgcHVzaCBuZXRsaW5rIG9uIHRoZSBzdGFuZGJ5LgoK
WW91IGNvdWxkIGFsc28gZXh0ZW5kIHRoZSBuZXRsaW5rIGludGVyZmFjZSB3aXRoIGEgd2F5IGZv
ciB1c2Vyc3BhY2UgdG8gcmVxdWVzdAphIGhhbmRzaGFrZSBvbiBhbGwgcGVlcnMuIFRoZW4geW91
IGNvdWxkIGxlYXZlIHRoZSBpbnRlcmZhY2UgdXAsIGFuZCB3b3VsZG4ndApuZWVkIGFueSBwZXJz
aXN0ZW50IGtlZXBhbGl2ZXMuCgo+IFJlYWwgaG90LXN0YW5kYnkgSEEgVlBOcyB3aXRoIHRyYW5z
cGFyZW50IGxvc3NsZXNzIHN3aXRjaGluZwo+IG9uIHRoZSBIQSBzaWRlIHVzdWFsbHkgc2hhcmUg
dGhlaXIgZXBoZW1lcmFsIGtleXMuCgpTaGFyaW5nIGVwaGVtZXJhbCBrZXlzIHdvdWxkIGF2b2lk
IHRoZSBuZWVkIGZvciBhIG5ldyBoYW5kc2hha2UgYXQgZmFpbG92ZXIsIGJ1dAp0aGF0IGlzIHZl
cnkgbGl0dGxlIGJlbmVmaXQsIHNpbmNlIGhhbmRzaGFrZXMgaGFwcGVuIGV2ZXJ5IGNvdXBsZSBv
ZiBtaW51dGVzCmFueXdheS4gTW9yZSBpbXBvcnRhbnRseSwgc2hhcmluZyBrZXlzIGNvbWVzIHdp
dGggdGhlIHNlY3VyaXR5IHJpc2sgb2Ygc2VuZGluZwp5b3VyIG1vc3Qgc2Vuc2l0aXZlIGRhdGEg
b3ZlciB0aGUgbmV0d29yay4gQW55b25lIHdpdGggdGhvc2Uga2V5cyBjYW4gZGVjcnlwdApWUE4g
dHJhZmZpYyBpbiByZWFsIHRpbWUuCgpQbHVzIHlvdSAqc3RpbGwqIG5lZWQgdGhlIHVwZGF0ZWQg
ZW5kcG9pbnQgaW5mb3JtYXRpb24gdG8gc2VuZCBwYWNrZXRzIGZyb20gSCB0bwpCIGJlZm9yZSBC
IHNlbmRzIGFueXRoaW5nIHRvIEFILCBldmVuIGlmIHRoZSBzZXNzaW9uIGtleSBpcyBzdGlsbCB2
YWxpZC4gU28gSQpoaWdobHkgcmVjb21tZW5kIGFnYWluc3QgYXR0ZW1wdGluZyB0byBleHRyYWN0
IHRoZSBlcGhlbWVyYWwga2V5cyBmcm9tIHRoZSBrZXJuZWwuCgo+IFJlZ2FyZHMsCj4gSXZhbgoK
Q2hlZXJzLApTYW11ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KV2lyZUd1YXJkIG1haWxpbmcgbGlzdApXaXJlR3VhcmRAbGlzdHMuengyYzQuY29tCmh0
dHBzOi8vbGlzdHMuengyYzQuY29tL21haWxtYW4vbGlzdGluZm8vd2lyZWd1YXJkCg==
