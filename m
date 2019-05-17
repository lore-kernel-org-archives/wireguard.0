Return-Path: <SRS0=x/BS=TS=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,FROM_EXCESS_BASE64,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCFF2C04AAF
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 18 May 2019 16:45:44 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E82A20872
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 18 May 2019 16:45:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="MYk0ohhO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E82A20872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a9c134dd;
	Sat, 18 May 2019 16:45:27 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 27b59058
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 May 2019 13:18:32 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1787d11e
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 May 2019 13:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1558099110;
 bh=96c/XIM/OpY4M3VJMRpEkF4Uh/iL9MCPBvhVKJKs284=;
 h=X-UI-Sender-Class:Reply-To:From:To:Subject:Date;
 b=MYk0ohhOY4ODI7o7MIOmO8KwDW3ZwCfuCYt8q7see8wKmvv2sdBQUmA9+ONm0jdz9
 MbuIjPL6qEHBHcH2i5slMajDvuw+5N15vx8hk1LEa+uAyVegjRTq9BoQCBEp6oWtQ4
 1Wfnwi8z8zUsvDWEdqQnp3pDv1AcPxjub5d6tN38=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.84.223] ([179.43.174.98]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Md6Mj-1gs15S3XbX-00aE4B for
 <wireguard@lists.zx2c4.com>; Fri, 17 May 2019 15:18:30 +0200
From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Autocrypt: addr=vtol@gmx.net; prefer-encrypt=mutual; keydata=
 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
To: wireguard@lists.zx2c4.com
Subject: high count of dropped packets
Message-ID: <de3c132d-9c25-dcd8-77f9-179c149dc179@gmx.net>
Date: Fri, 17 May 2019 15:18:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: en-GB
X-Provags-ID: V03:K1:uXBwrhS8tlaixnH2CQvkEnQVTdCcEMOOJhjv6wzW5B08qmhFeK/
 MWYlqksqnAmEjgon0YyXdqITPA86H214yA/TFVPjKU0Pf0x1k/Oovo3UVwFS9bBBo5SdLCi
 ofgrF2li/3/ICYEWTCoWzWrgGiB1DI/+yQDuD9E6R63LHP37KWDkPIB7O/FrA/pZMgxm8CZ
 2+vRvINyicgnh6k4YE60w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:cxVReeFMsuE=:mcP9XqNfXN6ZH4v+lDAk2e
 J8TwdOOh8yhDMuJxbLhJCSWRluF6hst7UCTxHcSS0GSwj4QRpkYpvDyoikV4aKmKn6UWqhR/q
 FyIJnTYb3BIrlWPKJ8olCqlzceQ1sY7lA51AHvkv5AxVmZ8rYrFZ05HdIx64u8nJecj6PwdJB
 s4+kr+nPHXwdyiLtnA9SXKiZSJul5gXQ1obslS5G50ypk1XljNf782AfhzjUIFB96p7fK0s3n
 w1rjUje3YiykCqZUXuZiptTOikNWaw1lp2yedBRNz6/6IVF/J77rWNyitxIc896bRF9LjwXVC
 1UVXYSjltMrvMgTnalf+5BcJAgZZLQz/50VV/rObtROlN84uff633kmemZ+77Ogd7p2AVfI4/
 njH6i/f6oJth5XzUKDX6bJEDWokVfkN4wDOZGYH2FuJNyib9GusmiOusK7cSy1013AIh13Q3N
 0lfXb2jfWlWFFTvHXLXTD9Pbf+/PqQu6rGUKji4PL+jEvuVyQeLji9ubKbPz/WxLxdV4Cx6IV
 mHJsKdgFjimfkN+7G6gN0Sy5ebi5lGYZdbQx/JZydJK+XYm90nHbyFqYSBLUxnnjQc0aetRII
 VocVzwTXcniGudda+G5bWoaj1uAo4jm45eiFXawQa2JkO5CcukDUMzMAjCsAC+ydCWhc1b3fw
 i77drjExp/grj4Eh5BBqAgP4uNIdn7fEM5bmupaN/ZJAHuoayl1A8xbLdtWIcNBimMpqYMPh9
 CWnXGyCg1vS1pMq/EW/TRjs94vi1bjspDYqD8S848q6la1RiEvWi2sFefS1KUbYWbJzupludY
 Ej0GQ3RPaoriflG2CWMRlRVvGNUXX5ZCqsmfaQcf4RO1DRQ5N5KCFflE/QsOADwhyONcF1LI5
 nfy0V82+IPd+bpcIdnSithTxtVLojTykKh/BleWPo0RIepsgs2YxZV+TTm36xKpJxT2Qs6vZM
 xWYos23JIOZMbWFDTgfnIXiauUP1G+YE=
X-Mailman-Approved-At: Sat, 18 May 2019 18:45:26 +0200
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: vtol@gmx.net
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

SGksDQoNCkkgYW0gZXhwZXJpZW5jaW5nIGFuIGluZXhwbGljYWJsZSBoaWdoIGNvdW50IG9mIGRy
b3BwZWQgcGFja2V0cyBiZXR3ZWVuDQoyIHdnIG5vZGVzOg0KDQpsb2NhbCBub2RlICgwLjAuMjAx
OTAxMjMgaW4ga2VybmVsIG1vZGUgb24gT3BlbldSVCAxOC4wNiB3aXRoIGtlcm5lbA0KNC4xNC4x
MTMpDQoNCj4gd2cwOiA8UE9JTlRPUE9JTlQsTk9BUlAsVVAsTE9XRVJfVVA+IG10dSAxNDIwIHFk
aXNjIGNha2Ugc3RhdGUgVU5LTk9XTg0KPiBtb2RlIERFRkFVTFQgZ3JvdXAgZGVmYXUNCj4gwqDC
oMKgIGxpbmsvbm9uZcKgIHByb21pc2N1aXR5IDANCj4gwqDCoMKgIHdpcmVndWFyZCBhZGRyZ2Vu
bW9kZSBub25lIG51bXR4cXVldWVzIDEgbnVtcnhxdWV1ZXMgMQ0KPiBnc29fbWF4X3NpemUgNjU1
MzYgZ3NvX21heF9zZWdzIDY1NTM1DQo+IMKgwqDCoCBSWDogYnl0ZXPCoCBwYWNrZXRzwqAgZXJy
b3JzwqAgKmRyb3BwZWQqIG92ZXJydW4gbWNhc3QNCj4gwqDCoMKgIDg1OTg0MjDCoMKgwqAgNjAy
MMKgwqDCoMKgIDDCoMKgwqDCoMKgwqAgwqDCoMKgICo5NTE4KsKgwqDCoCDCoMKgwqAgMMKgwqDC
oMKgwqDCoCDCoMKgwqAgwqDCoCAwDQo+IMKgwqDCoCBUWDogYnl0ZXPCoCBwYWNrZXRzwqAgZXJy
b3JzwqAgZHJvcHBlZCBjYXJyaWVyIGNvbGxzbnMNCj4gwqDCoMKgIDMxODg0NTbCoMKgwqAgMTI0
OTHCoMKgwqAgMMKgwqDCoMKgwqDCoCAwwqDCoMKgwqDCoMKgIDDCoMKgwqDCoMKgwqAgMA0KDQpy
ZW1vdGUgbm9kZSAoMC4wLjIwMTkwNDA2IGluIGtlcm5lbCBtb2RlIG9uIFVidW50dSAxOS4wNCB3
aXRoIGtlcm5lbA0KNS4wLjAtMTMpDQoNCj4gwqB3ZzA6IDxQT0lOVE9QT0lOVCxOT0FSUCxVUCxM
T1dFUl9VUD4gbXR1IDE1MDAgcWRpc2Mgbm9xdWV1ZSBzdGF0ZQ0KPiBVTktOT1dOIG1vZGUgREVG
QVVMVCBncm91cCBkZWZhdWx0IHFsZW4gMTAwMA0KPiDCoMKgwqAgbGluay9ub25lwqAgcHJvbWlz
Y3VpdHkgMA0KPiDCoMKgwqAgd2lyZWd1YXJkIGFkZHJnZW5tb2RlIG5vbmUgbnVtdHhxdWV1ZXMg
MSBudW1yeHF1ZXVlcyAxDQo+IGdzb19tYXhfc2l6ZSA2NTUzNiBnc29fbWF4X3NlZ3MgNjU1MzUN
Cj4gwqDCoMKgIFJYOiBieXRlc8KgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAg
wqDCoMKgIHBhY2tldHPCoCBlcnJvcnPCoCBkcm9wcGVkDQo+IG92ZXJydW4gbWNhc3QNCj4gwqDC
oMKgIDE0NDI0NDExODQgMzUxMTc4NMKgIDEzODbCoMKgwqAgwqDCoMKgIDUwwqDCoMKgwqDCoCAw
wqDCoMKgwqDCoMKgIDANCj4gwqDCoMKgIFRYOiBieXRlc8KgIMKgwqDCoCDCoCBwYWNrZXRzwqAg
ZXJyb3JzwqAgZHJvcHBlZCBjYXJyaWVyIGNvbGxzbnMNCj4gwqDCoMKgIDg2NjE2NTI4MDQgNzE1
MDQzM8KgIDDCoMKgwqDCoMKgwqAgNDU0wqDCoMKgwqAgMMKgwqDCoMKgwqDCoCAwDQoNCldoYXQg
Y291bGQgYmUgdGhlIGNhdXNlIGFuZCBob3cgdG8gcmVtZWR5Pw0KDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpXaXJlR3VhcmQgbWFpbGluZyBsaXN0Cldp
cmVHdWFyZEBsaXN0cy56eDJjNC5jb20KaHR0cHM6Ly9saXN0cy56eDJjNC5jb20vbWFpbG1hbi9s
aXN0aW5mby93aXJlZ3VhcmQK
