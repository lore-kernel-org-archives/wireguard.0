Return-Path: <SRS0=O0ly=UR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1854C31E5B
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Jun 2019 15:20:33 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4642E213F2
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Jun 2019 15:20:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="G0MoIO1a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4642E213F2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d3748ce8;
	Tue, 18 Jun 2019 15:20:32 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 341b4072
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Jun 2019 19:58:08 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f7c25f95
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Jun 2019 19:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1560196686;
 bh=stfJs6fqzg5l9y3Y5v4nEZ24GlWlSUcAY1bHhmOl9r4=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=G0MoIO1amaDzz2awv592QQrkmir6TTTAHnn0SvV/On//ubuWL5GkHtCQJAXX3A/Dw
 ghN3rCv+fJ94Msw/mwKbkRWUCTsYJTNjew/CURVTo5V4mDtWRuDkOACJOU3pvHp01h
 iqhVbIHZdBzVlt51cVreJY65pGLihxH3wC/gxFds=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [77.11.86.11] ([77.11.86.11]) by web-mail.gmx.net
 (3c-app-gmx-bs07.server.lan [172.19.170.56]) (via HTTP); Mon, 10 Jun 2019
 21:58:06 +0200
MIME-Version: 1.0
Message-ID: <trinity-3e3baf09-be1e-485c-b0f4-055e0b04701b-1560196686030@3c-app-gmx-bs07>
From: "sch tel" <telsch@gmx.de>
To: wireguard@lists.zx2c4.com
Subject: traffic shaping on vlan make wireguard stop working
Date: Mon, 10 Jun 2019 21:58:06 +0200
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:pESHDJCSZsY5w9EqmV/SabM2aM7o2eBkU/5SnNNBpqU0XM0opeNvbW6JFu3UWI88M2u9Z
 nfxfim7CIq+EhQxYYCD+M6pwp2iP1+UxGFn1Xa3apSsM5hPxS9LIRewMnoagPEvlRWgrBg3AHyQe
 V90cC36SFaaBx7aNA1P0voQyaqUZppST9SoQdhB54AWdPI77M7ZXWzmMuOqT5pARqZbZuqDP10EA
 dapk4Nmo/eaBF3m7WHQB5JqPML1gSsFC/fpiuIH8KSpc5u4MHmJkwEi8/9R7ILBP5C1MkMSEiS87
 1Y=
X-UI-Out-Filterresults: notjunk:1;V03:K0:lcaXy6o2Ay8=:nScN2t0c9Z1FY7gbTfboWl
 cfoPJ9Ff8m0FVlBqUXRKfEoRp0Vw0o0DwXIBY1F1+85GzGTsRl8O7+4Ey+iW0HIJwnN8cvenh
 7fUsFYj1mFwIvvpw6Tf22TT/PUbcjRiImqHjvSCK5xahRa2xI8Oge/oJt47OD2UNQztUb/WeF
 HIxTG6cVo7TS9uI62TIJT8y6y7fVc6LVljEM0PjbkCoQyJBjT8KIC54LozvKIwtsPiBQCI18y
 LjZeYvf92aQoFtLK64sxxzG8w3fYyr5XE44F1ZGRVPyvE+GLpyKqbLOMuV1IdOpHcZwwTvRz2
 el9OcOcAtDqSmpnS36V1ouyWEhZWco/nX0waBiknHb3jkW1kd52lZKAruTqVeuR/WGidZXDpy
 DMOnwm1JOCn0yhEbOu+ZaZn373eRT705eym5ReJvvbubyJkvM2GYMFPGyGDgeUHKXt7E7p3kb
 3fMGdMnHk4RcHSn8OslGHUesBRK3mV/QneBJWyk+AkaqWbVw1TmawTVSo9aKFFoih6FklKzz5
 6OGFNJALPhavywwQaL4OlTvRgf0QqZ30ora2DDQhHo8/+1IWIfMsIzrw576N6Z83HCKFEf706
 rsmqx3rof8DbTAIrjOn5VrETUx9ncEZbhC0nvUuusXxkUnzjp0ihSRBA==
X-Mailman-Approved-At: Tue, 18 Jun 2019 17:20:30 +0200
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

SGVsbG8gbGlzdCEKCmkgdHJpZWQgdG8gYXBwbGllZCB0YyB0cmFmZmljIHNoYXBpbmcgcnVsZXMg
dG8gbGltaXQgb3V0Z29pbmcgdHJhZmZpYyAoaW5kZXBlbmRlbnQgb2Ygd2lyZWd1YXJkIG9yIG5v
dCkgb24gZXh0ZXJuYWwgdmxhbiBpbnRlcmZhY2UgYnV0IGFmdGVyIHNob3J0IHRpbWUgaSBhcHBs
aWVkIHRoYXQgcnVsZXMgaSBjYW4ndCBldmVuIHBpbmcgdGhlIG90aGVyIGhvc3QgdGhyb3VnaCB3
ZzAgaW50ZXJmYWNlLgoKSSBoYXZlIGZvbGxvd2luZyBzZXR1cDoKCmV0aDA6IGV4dGVybmFsIGxp
bmsKwqDCoMKgIGV0aDAuMTogdmxhbjEgZmFzdCB1cGxpbmsgKHByaW1hcnkpCsKgwqDCoCBldGgw
LjI6IHZsYW4yIHNsb3cgdXBsaW5rIChiYWNrdXApCgp3ZzA6IHdpcmVndWFyZCBpbnRlcmZhY2UK
CmV0aDE6IGludGVybmFsIGxpbmsKCk15IGdvYWxzIHdhcyB0byBzaGFwZSBhbGwgdHJhZmZpYyBn
b2VzIHRvIG9uZSBvZiB0aGUgMiB2bGFuIGludGVyZmFjZXMgd2l0Y2ggaGFzIGRpZmZlcmVudCBz
cGVlZHMuIFNvIGkgYXBwbGllZCB0aGUgcnVsZXMgb24gZXRoMC4xIChhbmQgZXRoMC4yKToKwqDC
oMKgIHRjIHFkaXNjIGRlbCBkZXYgZXRoMC4xIHJvb3QgMj4vZGV2L251bGwKwqDCoMKgIHRjIHFk
aXNjIGFkZCBkZXYgZXRoMC4xIHJvb3QgaGFuZGxlIDE6IGh0YiBkZWZhdWx0IDE3CsKgwqDCoCB0
YyBjbGFzcyBhZGQgZGV2IGV0aDAuMSBwYXJlbnQgMTogY2xhc3NpZCAxOjEgaHRiIHJhdGUgMTBt
Yml0CsKgwqDCoCB0YyBjbGFzcyBhZGQgZGV2IGV0aDAuMSBwYXJlbnQgMToxIGNsYXNzaWQgMTox
NiBodGIgcmF0ZSAybWJpdCBjZWlsIDEwbWJpdCBidXJzdCA0bQrCoMKgwqAgdGMgY2xhc3MgYWRk
IGRldiBldGgwLjEgcGFyZW50IDE6MSBjbGFzc2lkIDE6MTcgaHRiIHJhdGUgOG1iaXQgY2VpbCAx
MG1iaXQgYnVyc3QgNG0KwqDCoMKgIHRjIHFkaXNjIGFkZCBkZXYgZXRoMC4xIHBhcmVudCAxOjE2
IGhhbmRsZSAxNjogc2ZxIHBlcnR1cmIgMTAKwqDCoMKgIHRjIHFkaXNjIGFkZCBkZXYgZXRoMC4x
IHBhcmVudCAxOjE3IGhhbmRsZSAxNzogc2ZxIHBlcnR1cmIgMTAKwqDCoMKgIHRjIGZpbHRlciBh
ZGQgZGV2IGV0aDAuMSBwYXJlbnQgMTogcHJvdG9jb2wgaXAgaGFuZGxlIDB4NjQgZncgZmxvd2lk
IDE6MTYKwqDCoMKgIGlwdGFibGVzIC10IG1hbmdsZSAtQSBPVVRQVVQgLW8gJ3dnKycgLWogTUFS
SyAtLXNldC1tYXJrIDB4NjQKCkluIGlwdGFibGVzIGkgc2VlIHRoYXQgcGFja2V0cyBhcmUgbWFy
a2VkIGFuZCBwYWNrZXQgY291bnRlcnMgY291bnQgdXAsIGFsc28gaW4gaW4gdGM6CsKgwqDCoCB0
YyAtcyBjbGFzcyBscyBkZXYgZXRoMC4xCgpPbiBzZXJ2ZXIgc2lkZSB1ZHAgcGFja2V0ZXMgYXJl
IHN0aWxsIHJlY2VpdmVkLgoKQW55IGhpbnRzIHdoYXRzIGknbSBkb2luZyB3cm9uZyB3aXRoIHRo
aXMga2luZCBvZiBzZXR1cD8KVGhhbmtzIGZvciBoZWxwIQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpXaXJlR3VhcmQgbWFpbGluZyBsaXN0CldpcmVHdWFy
ZEBsaXN0cy56eDJjNC5jb20KaHR0cHM6Ly9saXN0cy56eDJjNC5jb20vbWFpbG1hbi9saXN0aW5m
by93aXJlZ3VhcmQK
