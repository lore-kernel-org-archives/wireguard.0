Return-Path: <SRS0=8BwB=4N=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CA09C35DEA
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 25 Feb 2020 00:56:42 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E978520838
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 25 Feb 2020 00:56:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sholland.org header.i=@sholland.org header.b="m8WhI+EM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Np0ZiCsf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E978520838
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sholland.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 49cdfbd4;
	Tue, 25 Feb 2020 00:53:13 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3130477b
 for <wireguard@lists.zx2c4.com>;
 Tue, 25 Feb 2020 00:53:11 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0fe0ac03
 for <wireguard@lists.zx2c4.com>;
 Tue, 25 Feb 2020 00:53:11 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id C737321EAE;
 Mon, 24 Feb 2020 19:56:38 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 24 Feb 2020 19:56:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 subject:to:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=d
 m2bE7DNje9ZZLSJ/dMCoNjER7WTUpBCOJgiiDte2d4=; b=m8WhI+EMRWpFa2vuA
 Mbw6CqQGP1eH/d72eevpq7GYqgMm9MaungrDWA/pXmqzCucwUifYc/zk5v9E+rDn
 vjRNCx8fmPR2s+55ET+Y+QVOtd2W08376mLp5QdNY98FpDC0hxDe8cwmHGG87/pm
 B7rIHBxZOJsOq2RylaaIIQND4WAtPl0OqrojnXId/0pHSuC6MvP5YABSRQyCnTDE
 vBzUbyENMgN2uOrDDx5CpNU3gPiUaRFnPyaOJgYoai16Vo6XaqUHNTPi48GjSDEF
 9aWkP4cC/LT9o+E24lp5BV/jV13y9FQ34lB0JyAPaUPytnBW1WqID0bQ9h9zsLLQ
 yQzyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=dm2bE7DNje9ZZLSJ/dMCoNjER7WTUpBCOJgiiDte2
 d4=; b=Np0ZiCsfHu6AWcM9Roe2f4DlIb84rUaRPiy4aWPiExDmw+C2JssbTV8aF
 b5vuuldrzpprd31FxVWmzFIY+PV3Z2+cqr83sx/P6Xvl4XZIrQZ0GMFVwkvn1TYH
 bnubYtBkrq251rwDs+QVYIdePkam1+Omia1CTvCY/MngcAuyuou9c4Kw0woVYVuv
 WiKzrVORn2jU/B4DBZ7UxXRLfWSqzZlNvIqOD0ZcilMIgZbOlYFyHtrN4FAAYEMx
 1oA4F/8FNa7FApA96M636V4/PTCohZ0kVgy8qz0QmI+b7t1TJEHn4T1F/GkvvJYd
 yjos2cBj8+N3K+ML8DtvUFqGyGcSw==
X-ME-Sender: <xms:xnBUXu7k9oaWdFX24eZT3HukGVb7GnZbvEbO_gsfBWRFLMqaeYUFkQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrledugddvkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepuffvfhfhkffffgggjggtgfesthekre
 dttdefjeenucfhrhhomhepufgrmhhuvghlucfjohhllhgrnhguuceoshgrmhhuvghlsehs
 hhholhhlrghnugdrohhrgheqnecuffhomhgrihhnpegrnhgurhhoihgurdgtohhmpdgtoh
 hnfhdriihiphenucfkphepjedtrddufeehrddugeekrdduhedunecuvehluhhsthgvrhfu
 ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrg
 hnugdrohhrgh
X-ME-Proxy: <xmx:xnBUXpLBCmROPrHHOugWush-OiI5w9-IHZd1R1OYDTOt91ceUigPvA>
 <xmx:xnBUXqj0J-znmj0VxqxkSDg2xG6yu5B8trM58TSgMbuCA0keX2SDSA>
 <xmx:xnBUXuId1oCnOJzbbkMbcO5Zpfo577QXd6EhdgRdy7_Cr-mHMUywYg>
 <xmx:xnBUXnccJWWdabEkIQv2pO4lU0VdyEB-MpMiHUsey2MNvmqPLdkQrA>
Received: from [192.168.50.169]
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2CBDD3060FD3;
 Mon, 24 Feb 2020 19:56:38 -0500 (EST)
Subject: Re: [PATCH] Update Simplified Chinese translation
To: srb12345@vip.qq.com, wireguard@lists.zx2c4.com
References: <20200223111248.1083-1-srb12345@vip.qq.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <8b65014d-b6b9-c933-1ccd-d92d9f28ed23@sholland.org>
Date: Mon, 24 Feb 2020 18:56:37 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200223111248.1083-1-srb12345@vip.qq.com>
Content-Language: en-US
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

T24gMi8yMy8yMCA1OjEyIEFNLCBzcmIxMjM0NUB2aXAucXEuY29tIHdyb3RlOgo+IEZyb206IExp
bGxpZ2FudE1hdHN1cmkgPHNyYjEyMzQ1QHZpcC5xcS5jb20+Cj4gCj4gU2lnbmVkLW9mZi1ieTog
TGlsbGlnYW50TWF0c3VyaSA8c3JiMTIzNDVAdmlwLnFxLmNvbT4KPiAtLS0KPiAgYXBwL3NyYy9t
YWluL3Jlcy92YWx1ZXMtemgtckNOL3N0cmluZ3MueG1sIHwgMTAgKysrKysrKystLQo+ICAxIGZp
bGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1n
aXQgYS9hcHAvc3JjL21haW4vcmVzL3ZhbHVlcy16aC1yQ04vc3RyaW5ncy54bWwgYi9hcHAvc3Jj
L21haW4vcmVzL3ZhbHVlcy16aC1yQ04vc3RyaW5ncy54bWwKPiBpbmRleCAzMzYwZGFlLi45N2U4
NzFhIDEwMDY0NAo+IC0tLSBhL2FwcC9zcmMvbWFpbi9yZXMvdmFsdWVzLXpoLXJDTi9zdHJpbmdz
LnhtbAo+ICsrKyBiL2FwcC9zcmMvbWFpbi9yZXMvdmFsdWVzLXpoLXJDTi9zdHJpbmdzLnhtbAo+
IEBAIC0xLDIxICsxLDI3IEBACj4gIDw/eG1sIHZlcnNpb249IjEuMCIgZW5jb2Rpbmc9InV0Zi04
Ij8+Cj4gIDxyZXNvdXJjZXM+Cj4gICAgICA8cGx1cmFscyBuYW1lPSJkZWxldGVfZXJyb3IiPgo+
ICsgICAgICAgIDxpdGVtIHF1YW50aXR5PSJvbmUiPuaXoOazleWIoOmZpCAlZCDpobnvvJolczwv
aXRlbT4KPiAgICAgICAgICA8aXRlbSBxdWFudGl0eT0ib3RoZXIiPuaXoOazleWIoOmZpCAlZCDp
obnvvJolczwvaXRlbT4KClRoZXNlIGxvb2sgdG8gYmUgdGhlIHNhbWUgYXMgdGhlICJvdGhlciIg
Y2FzZS4gQWRkaXRpb25hbCBxdWFudGl0eSBpdGVtcyBhcmUKb25seSBuZWVkZWQgaWYgdGhleSBh
cmUgZGlmZmVyZW50OgoKaHR0cHM6Ly9kZXZlbG9wZXIuYW5kcm9pZC5jb20vZ3VpZGUvdG9waWNz
L3Jlc291cmNlcy9zdHJpbmctcmVzb3VyY2UjcGx1cmFscy1pdGVtLWVsZW1lbnQKCj4gICAgICA8
L3BsdXJhbHM+Cj4gICAgICA8cGx1cmFscyBuYW1lPSJkZWxldGVfc3VjY2VzcyI+Cj4gKyAgICAg
ICAgPGl0ZW0gcXVhbnRpdHk9Im9uZSI+5Yig6Zmk5LqGICVkIOmhuTwvaXRlbT4KPiAgICAgICAg
ICA8aXRlbSBxdWFudGl0eT0ib3RoZXIiPuWIoOmZpOS6hiAlZCDpobk8L2l0ZW0+Cj4gICAgICA8
L3BsdXJhbHM+Cj4gICAgICA8cGx1cmFscyBuYW1lPSJkZWxldGVfdGl0bGUiPgo+ICsgICAgICAg
IDxpdGVtIHF1YW50aXR5PSJvbmUiPuW3sumAieaLqSAlZCDpobk8L2l0ZW0+Cj4gICAgICAgICAg
PGl0ZW0gcXVhbnRpdHk9Im90aGVyIj7lt7LpgInmi6kgJWQg6aG5PC9pdGVtPgo+ICAgICAgPC9w
bHVyYWxzPgo+ICAgICAgPHBsdXJhbHMgbmFtZT0iaW1wb3J0X3BhcnRpYWxfc3VjY2VzcyI+Cj4g
KyAgICAgICAgPGl0ZW0gcXVhbnRpdHk9Im9uZSI+5a+85YWl5LqGICVkIOmhue+8jOivu+WPluWI
sCAlZCDpobk8L2l0ZW0+Cj4gICAgICAgICAgPGl0ZW0gcXVhbnRpdHk9Im90aGVyIj7lr7zlhaXk
uoYgJWQg6aG577yM6K+75Y+W5YiwICVkIOmhuTwvaXRlbT4KPiAgICAgIDwvcGx1cmFscz4KPiAg
ICAgIDxwbHVyYWxzIG5hbWU9ImltcG9ydF90b3RhbF9zdWNjZXNzIj4KPiArICAgICAgICA8aXRl
bSBxdWFudGl0eT0ib25lIj7lr7zlhaXkuoYgJWQg6aG5PC9pdGVtPgo+ICAgICAgICAgIDxpdGVt
IHF1YW50aXR5PSJvdGhlciI+5a+85YWl5LqGICVkIOmhuTwvaXRlbT4KPiAgICAgIDwvcGx1cmFs
cz4KPiAgICAgIDxwbHVyYWxzIG5hbWU9InNldF9leGNsdWRlZF9hcHBsaWNhdGlvbnMiPgo+ICsg
ICAgICAgIDxpdGVtIHF1YW50aXR5PSJvbmUiPiVkIOS4quaOkumZpOW6lOeUqDwvaXRlbT4KPiAg
ICAgICAgICA8aXRlbSBxdWFudGl0eT0ib3RoZXIiPiVkIOS4quaOkumZpOW6lOeUqDwvaXRlbT4K
PiAgICAgIDwvcGx1cmFscz4KPiAgICAgIDxzdHJpbmcgbmFtZT0iYWRkX3BlZXIiPua3u+WKoOiK
gueCuTwvc3RyaW5nPgo+IEBAIC0zOCw3ICs0NCw3IEBACj4gICAgICA8c3RyaW5nIG5hbWU9ImJh
ZF9jb25maWdfcmVhc29uX3Vua25vd25fYXR0cmlidXRlIj7lsZ7mgKfmnKrnn6U8L3N0cmluZz4K
PiAgICAgIDxzdHJpbmcgbmFtZT0iYmFkX2NvbmZpZ19yZWFzb25fdW5rbm93bl9zZWN0aW9uIj7o
ioLmnKrnn6U8L3N0cmluZz4KPiAgICAgIDxzdHJpbmcgbmFtZT0iYmFkX2NvbmZpZ19yZWFzb25f
dmFsdWVfb3V0X29mX3JhbmdlIj7mlbDlgLzotoXlh7rojIPlm7Q8L3N0cmluZz4KPiAtICAgIDxz
dHJpbmcgbmFtZT0iYmFkX2V4dGVuc2lvbl9lcnJvciI+5paH5Lu25omp5bGV5ZCN5b+F6aG75Li6
IC5jb25mIOaIliAuemlwPC9zdHJpbmc+Cj4gKyAgICA8c3RyaW5nIG5hbWU9ImJhZF9leHRlbnNp
b25fZXJyb3IiPuaJqeWxleWQjeW/hemhu+S4uiAuY29uZiDmiJYgLnppcDwvc3RyaW5nPgo+ICAg
ICAgPHN0cmluZyBuYW1lPSJjYW5jZWwiPuWPlua2iDwvc3RyaW5nPgo+ICAgICAgPHN0cmluZyBu
YW1lPSJjb25maWdfZGVsZXRlX2Vycm9yIj7ml6Dms5XliKDpmaTphY3nva4g4oCcJXPigJ08L3N0
cmluZz4KPiAgICAgIDxzdHJpbmcgbmFtZT0iY29uZmlnX2V4aXN0c19lcnJvciI+4oCcJXPigJ0g
55qE6YWN572u5bey5a2Y5ZyoPC9zdHJpbmc+Cj4gQEAgLTYwLDcgKzY2LDcgQEAKPiAgICAgIDxz
dHJpbmcgbmFtZT0iZGFya190aGVtZV9zdW1tYXJ5X29uIj7mraPlnKjkvb/nlKjmmpfoibLvvIjp
u5HlpJzvvInkuLvpopg8L3N0cmluZz4KPiAgICAgIDxzdHJpbmcgbmFtZT0iZGFya190aGVtZV90
aXRsZSI+5L2/55So5pqX6Imy5Li76aKYPC9zdHJpbmc+Cj4gICAgICA8c3RyaW5nIG5hbWU9ImRl
bGV0ZSI+5Yig6ZmkPC9zdHJpbmc+Cj4gLSAgICA8c3RyaW5nIG5hbWU9ImRlc2VsZWN0X2FsbCI+
5YWo6YOo5Y+W5raIPC9zdHJpbmc+Cj4gKyAgICA8c3RyaW5nIG5hbWU9InRvZ2dsZV9hbGwiPuWP
jemAiTwvc3RyaW5nPgo+ICAgICAgPHN0cmluZyBuYW1lPSJkbnNfc2VydmVycyI+RE5TIOacjeWK
oeWZqDwvc3RyaW5nPgo+ICAgICAgPHN0cmluZyBuYW1lPSJlZGl0Ij7nvJbovpE8L3N0cmluZz4K
PiAgICAgIDxzdHJpbmcgbmFtZT0iZW5kcG9pbnQiPuWvueerr+WcsOWdgDwvc3RyaW5nPgo+IAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KV2lyZUd1YXJk
IG1haWxpbmcgbGlzdApXaXJlR3VhcmRAbGlzdHMuengyYzQuY29tCmh0dHBzOi8vbGlzdHMuengy
YzQuY29tL21haWxtYW4vbGlzdGluZm8vd2lyZWd1YXJkCg==
