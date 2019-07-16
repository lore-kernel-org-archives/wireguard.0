Return-Path: <SRS0=qbAp=VN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,FREEMAIL_REPLYTO_END_DIGIT,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D770C7618F
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 16 Jul 2019 17:33:12 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FB5E2064B
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 16 Jul 2019 17:33:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=protonmail.ch header.i=@protonmail.ch header.b="sLsTrdKh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FB5E2064B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 92491865;
	Tue, 16 Jul 2019 17:33:09 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cada6866
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 Jul 2019 17:33:07 +0000 (UTC)
Received: from mail-40135.protonmail.ch (mail-40135.protonmail.ch
 [185.70.40.135])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 820a2024
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 Jul 2019 17:33:07 +0000 (UTC)
Date: Tue, 16 Jul 2019 17:32:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
 s=default; t=1563298385;
 bh=YCzYwfoQq1t9fTcW+azwiFGDcbB932IE3fT07ZpWHBE=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=sLsTrdKhBrDyBRC+mJitPhetcTFTNriW9Upm92nhNkniu5GEsDWUYMYAXhIFnYr7M
 zHu9CU5FTmL9V7KJE5+/fu90jsuVkyrXvwsdHmyG9TXkJhnyM4qJHvkFqFbEKehdrq
 ODVo8b3Qqjb2zlcVpmOW4bY2Tm9bB9eW+ZPQJWFs=
To: =?UTF-8?Q?J=C3=B6rg_Thalheim?= <joerg@higgsboson.tk>
From: Jordan Glover <Golden_Miller83@protonmail.ch>
Subject: Re: [PATCH] treewide: more portable bash shebangs
Message-ID: <YKHm3E7XFkL3dPRaVjHwiURlLU4Q1SCJxWCu4j40Fd1TGco-rzr6XXAJ5I_kjb8H2X_vp5NgKz8EBBOpWqIDE8COgWd4aipFzmbiCaCtLbQ=@protonmail.ch>
In-Reply-To: <ff30a296-bdb9-3b13-5fb1-636a520300c0@higgsboson.tk>
References: <ff30a296-bdb9-3b13-5fb1-636a520300c0@higgsboson.tk>
Feedback-ID: QEdvdaLhFJaqnofhWA-dldGwsuoeDdDw7vz0UPs8r8sanA3bIt8zJdf4aDqYKSy4gJuZ0WvFYJtvq21y6ge_uQ==:Ext:ProtonMail
MIME-Version: 1.0
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: Jordan Glover <Golden_Miller83@protonmail.ch>
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

T24gVHVlc2RheSwgSnVseSAxNiwgMjAxOSAxMjoyMSBQTSwgSsO2cmcgVGhhbGhlaW0gPGpvZXJn
QGhpZ2dzYm9zb24udGs+IHdyb3RlOgoKPiBXaGlsZSAvdXNyL2Jpbi9lbnYgaXMgbW9yZSBvciBs
ZXNzIGF2YWlsYWJsZSBvbiBhbGwgUE9TSVggc3lzdGVtcwo+IC9iaW4vYmFzaCBtaWdodCBub3Qg
YmUuIFRoaXMgaXMgcGFydGljdWxhciB0aGUgY2FzZSBvbiBOaXhPUyBhbmQgdGhlIEJTRAo+IGZh
bWlseSAoL3Vzci9sb2NhbC9iaW4vYmFzaCkuIERvd25zdHJlYW0gcGFja2FnZXJzIHdvdWxkIG9m
dGVuIHJld3JpdGUKPiB0aG9zZSBzaGViYW5ncyBiYWNrIGF1dG9tYXRpY2FsbHkgYXMgdGhleSBj
YW4gcmVseSBvbiBhYnNvbHV0ZSBwYXRocwo+IGJ1dCBoYXZpbmcgcG9ydGFibGUgc2hlYmFuZ3Mg
aW4gdGhlIHJlcG9zaXRvcnkgaGVscHMgdG8gcnVuIHRoZSBjb2RlCj4gd2l0aG91dCBhbnkgZnVy
dGhlciBtb2RpZmljYXRpb24uCj4KClRoZSByZWFzb24gYWxtb3N0IGV2ZXJ5b25lIGhhcmRjb2Rl
cyBiYXNoIHRvIC9iaW4vYmFzaCBpcyB0aGUgcG90ZW50aWFsCmVudmlyb25tZW50IGF0dGFjayB3
aGVyZSBzb21lb25lIGNyZWF0ZSBtYWxpY2lvdXMgImJhc2giIGFuZCBleHBvcnQgaXQgaW4gUEFU
SDoKCmh0dHBzOi8vZGV2ZWxvcGVyLmFwcGxlLmNvbS9saWJyYXJ5L2FyY2hpdmUvZG9jdW1lbnRh
dGlvbi9PcGVuU291cmNlL0NvbmNlcHR1YWwvU2hlbGxTY3JpcHRpbmcvU2hlbGxTY3JpcHRTZWN1
cml0eS9TaGVsbFNjcmlwdFNlY3VyaXR5Lmh0bWwKCk9idmlvdXNseSB3ZyBzY3JpcHRzIGFyZSBo
YW5kbGluZyBxdWl0ZSBzZW5zaXRpdmUgZGF0YSBsaWtlIHByaXZhdGUga2V5cy4uLgoKU2VyaW91
c2x5IGlmIHlvdSBleGNlcHQgdGhhdCBkb3duc3RyZWFtIHBhY2thZ2VycyB3b3VsZCByZXdyaXRl
IGl0IGJhY2sgdG8KL2Jpbi9iYXNoIHRoZW4gd2h5IHRoZSBvdGhlcnMgY2FuJ3QgcmV3cml0ZSBp
dCB0byAvdXNyL2Jpbi9lbnYgYmFzaCByaWdodApub3cgaWYgdGhpcyBpcyBzb21ldGhpbmcgdGhl
eSB3YW50PwoKSm9yZGFuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCldpcmVHdWFyZCBtYWlsaW5nIGxpc3QKV2lyZUd1YXJkQGxpc3RzLnp4MmM0LmNvbQpo
dHRwczovL2xpc3RzLnp4MmM0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3dpcmVndWFyZAo=
