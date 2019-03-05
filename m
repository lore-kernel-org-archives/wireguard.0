Return-Path: <SRS0=tKTr=RX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69986C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Mar 2019 22:40:52 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D412D2183E
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Mar 2019 22:40:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D412D2183E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=youplala.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c3d2f383;
	Wed, 20 Mar 2019 22:38:58 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 59d92870
 for <wireguard@lists.zx2c4.com>; Tue, 5 Mar 2019 15:19:11 +0000 (UTC)
Received: from kermit.youplala.net (kermit.youplala.net [163.172.95.122])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 22923d93
 for <wireguard@lists.zx2c4.com>; Tue, 5 Mar 2019 15:19:11 +0000 (UTC)
Received: from [192.168.1.44] (unknown [94.1.172.156])
 by kermit.youplala.net (Postfix) with ESMTPSA id 24FF12380107
 for <wireguard@lists.zx2c4.com>; Tue,  5 Mar 2019 16:29:02 +0100 (CET)
From: Nicolas Will <nico@youplala.net>
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Subject: Broadcasts - Is it possible?
Message-Id: <4D121B4D-A1E9-40BB-8206-269D7B2A85F0@youplala.net>
Date: Tue, 5 Mar 2019 15:29:01 +0000
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3445.102.3)
X-Mailman-Approved-At: Wed, 20 Mar 2019 23:38:57 +0100
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

SGVsbG8sCgpJIGhhdmUgc2V0dXAgYSBXaXJlR3VhcmQgVlBOIGJldHdlZW4gbXkgbGFwdG9wIHJ1
bm5pbmcgdGhlIGNsaWVudCBzb2Z0d2FyZSBhbmQgdGhlIG1hY2hpbmUgYXQgaG9tZSBydW5uaW5n
IHRoZSBzZXJ2ZXIgc29mdHdhcmUuIEkgbG92ZSB0aGUgc2ltcGxpY2l0eSBhbmQgZWZmaWNpZW5j
eSBvZiBXaXJlR3VhcmQuIFZlcnkgbmljZSBqb2IhCgpUaGlzIGNsaWVudC9zZXJ2ZXIgc29mdHdh
cmUgbWFkZSB0aGUgZGVzaWduIGRlY2lzaW9uIHRvIGJ1aWxkIGNvbm5lY3Rpb25zIGJ5IHJlbHlp
bmcgZXhjbHVzaXZlbHkgb24gYnJvYWRjYXN0cyBmb3IgYXV0byBkaXNjb3ZlcnkuIFRoZXJlIGlz
IG5vIG1hbnVhbCBvdmVycmlkZSB0aGF0IGFsbG93cyBtZSB0byBwb2ludCB0aGUgY2xpZW50IGF0
IHRoZSBzZXJ2ZXIgdXNpbmcgYSBob3N0IG5hbWUgb3IgSVAgYWRkcmVzcy4KCkkgd2FzIGhvcGlu
ZyB0aGF0LCBieSBzZWVpbmcgdXAgdGhlIFZQTiBiZXR3ZWVuIHRoZSBtYWNoaW5lIHJ1bm5pbmcg
dGhlIGNsaWVudCBhbmQgdGhlIG1hY2hpbmUgcnVubmluZyB0aGUgc2VydmVyLCBJIHdvdWxkIGVu
ZCB1cCB3aXRoIGJvdGggcGllY2VzIGRpcmVjdGx5IG9uIHRoZSBzYW1lIEwzIG5ldHdvcmsuCgpI
b3dldmVyIFdpcmVHdWFyZCBjcmVhdGVzIHBvaW50IHRvIHBvaW50IGxpbmtzIHdpdGggbm8gYnJv
YWRjYXN0IHN1cHBvcnQsIHdoaWNoLCBvZiBjb3Vyc2UsIGRvZXMgbm90IGhlbHAgbWUuCgpNeSBn
b29nbGluZyBsZWQgdG8gYSBwb3N0IChjYW7igJl0IGZpbmQgaXQgYWdhaW4sIGdycnJyISkgd2hl
cmUgaXQgd2FzIHNhaWQgdGhhdCBub3Qgc3VwcG9ydGluZyBicm9hZGNhc3RzIHdhcyBhIGRlc2ln
biBkZWNpc2lvbi4gCgpJcyB0aGVyZSBhIHdheSBhcm91bmQgdGhpcz8gQW4gb3B0aW9uIG9yIHNl
dHRpbmcgdGhhdCBJIG1pc3NlZCBhbmQgd291bGQgYWxsb3cgYnJvYWRjYXN0cyB0byBiZSBzdXBw
b3J0ZWQ/IElzIGl0IHNvbWV0aGluZyBvbiB0aGUgcm9hZG1hcCB0aGF0IGRpZG7igJl0IG1ha2Ug
aXQgdG8gdGhlIHRvcCBvZiB0aGUgcGlsZSB5ZXQ/CgpNYW55IHRoYW5rcyEKCk5pY28KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KV2lyZUd1YXJkIG1haWxp
bmcgbGlzdApXaXJlR3VhcmRAbGlzdHMuengyYzQuY29tCmh0dHBzOi8vbGlzdHMuengyYzQuY29t
L21haWxtYW4vbGlzdGluZm8vd2lyZWd1YXJkCg==
