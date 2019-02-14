Return-Path: <SRS0=tjuz=QY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DEB7C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Feb 2019 01:35:59 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C74CC222A3
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Feb 2019 01:35:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=wieliczko.ninja header.i=@wieliczko.ninja header.b="nPmhXrj3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C74CC222A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=wieliczko.ninja
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id db0de9c1;
	Sun, 17 Feb 2019 01:27:13 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b15d9218
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Feb 2019 22:20:17 +0000 (UTC)
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 444e7290
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Feb 2019 22:20:17 +0000 (UTC)
Date: Thu, 14 Feb 2019 22:28:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wieliczko.ninja;
 s=protonmail; t=1550183293;
 bh=qEYOyJcJzqv2uUTudJLUUePlPIQupJtTmey8n/346lA=;
 h=Date:To:From:Reply-To:Subject:Feedback-ID:From;
 b=nPmhXrj3T074F+J/Yp1Nvy1n5QpwH4sTOdMXSuKCbimR5t9kUhuktib7I5hGfTmbw
 KEEKRowiGP580tuvVS89pYZJFqwhwvqVJWLyxv/3Bn0QrRPLzalCN8Gt54lB4hqjRc
 YRRqWCD1pd914nIEqn9lfYsIw0MIf4ZoxnFsXadU=
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
From: Eryk Wieliczko <eryk@wieliczko.ninja>
Subject: DNS name resolution should not be done during configuration parsing.
Message-ID: <8_iPFshR7GasRS24vRTFKp3pG-UGxQLluTaoZZeAO-UlYBTQ2nCHNlMniuKWz9tWpWPbbXS8Br3SxRpCjcruohwFw8PD83jko2lrf3E7hq4=@wieliczko.ninja>
Feedback-ID: uBwOhQgAUjO-mCE4v8RZ81RKX0ASW5ZgKh4bYtmyPYWTuWTyJ1pXSKwKpskmlyjfvo8TDukOEh7ekSlJK3Gk3A==:Ext:ProtonMail
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 17 Feb 2019 02:27:11 +0100
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: Eryk Wieliczko <eryk@wieliczko.ninja>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8650580805602153843=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is a multi-part message in MIME format.

--===============8650580805602153843==
Content-Type: multipart/alternative;
	boundary="b1_8dab10b1013bd00b96bfd07a95b2676f"

This is a multi-part message in MIME format.

--b1_8dab10b1013bd00b96bfd07a95b2676f
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

SGVsbG8gZXZlcnlvbmUhCgpJZiB5b3UgdXNlIGEgRE5TIGFkZHJlc3MgYXMgYW4gZW5kcG9pbnQg
YW5kIHRoZXJlIGlzIG5vIGludGVybmV0IGNvbm5lY3Rpb24sIFdpcmVHdWFyZCB3aWxsIGhhbmcg
Zm9yIHR3byBtaW51dGVzIGFuZCB0aGVuIGV4aXQgd2l0aCBlcnJvci4KCklNTyB0aGUgZXhwZWN0
ZWQgYmVoYXZpb3Igc2hvdWxkIGJlIHRoZSBzYW1lIGFzIGluIE9wZW5WUE46CldpcmVHdWFyZCBz
dGFydHMgaW1tZWRpYXRlbHkgYW5kIHBhdGllbnRseSB0cmllcyB0byByZXNvbHZlIHRoZSBETlMg
dW50aWwgaXQgc3VjY2VlZHMuCgpUaHVzLCBXaXJlR3VhcmQgc2hvdWxkIHJlc29sdmUgdGhlIERO
UyBqdXN0IGJlZm9yZSBjb25uZWN0aW5nIHRvIHRoZSBzZXJ2ZXIuIEFuZCBqdXN0IGtlZXAgdHJ5
aW5nIGFuZCB0cnlpbmcgd2l0aG91dCBhbnkgdGltZW91dHMuCgpJJ2QgbGlrZSB0byBpbnN0YWxs
IFdpcmVHdWFyZCBvbiB0ZWNobmljaWFuJ3MgY29tcHV0ZXJzIGFuZCB0aGVyZSBpcyBubyBndWFy
YW50ZWUgdGhhdCB0aGV5IHdpbGwgc3RhcnQgcGhvbmUgdGV0aGVyaW5nIHdpdGhpbiAyIG1pbnV0
ZXMgb2Ygc3RhcnRpbmcgdGhlaXIgbWFjaGluZS4gT3BlblZQTiB3b3VsZCBwYXNzIHRoaXMgc2Nl
bmFyaW8uCgpXaGF0IGRvIHlvdSB0aGluaz8=


--b1_8dab10b1013bd00b96bfd07a95b2676f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdj5IZWxsbyBldmVyeW9uZSE8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PklmIHlvdSB1c2Ug
YSBETlMgYWRkcmVzcyBhcyBhbiBlbmRwb2ludCBhbmQgdGhlcmUgaXMgbm8gaW50ZXJuZXQgY29u
bmVjdGlvbiwgV2lyZUd1YXJkIHdpbGwgaGFuZyBmb3IgdHdvIG1pbnV0ZXMgYW5kIHRoZW4gZXhp
dCB3aXRoIGVycm9yLjxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PklNTyB0aGUgZXhwZWN0
ZWQgYmVoYXZpb3Igc2hvdWxkIGJlIHRoZSBzYW1lIGFzIGluIE9wZW5WUE46PGJyPjwvZGl2Pjxk
aXY+V2lyZUd1YXJkIHN0YXJ0cyBpbW1lZGlhdGVseSBhbmQgcGF0aWVudGx5IHRyaWVzIHRvIHJl
c29sdmUgdGhlIEROUyB1bnRpbCBpdCBzdWNjZWVkcy48YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+
PGRpdj5UaHVzLCBXaXJlR3VhcmQgc2hvdWxkIHJlc29sdmUgdGhlIEROUyBqdXN0IGJlZm9yZSBj
b25uZWN0aW5nIHRvIHRoZSBzZXJ2ZXIuIEFuZCBqdXN0IGtlZXAgdHJ5aW5nIGFuZCB0cnlpbmcg
d2l0aG91dCBhbnkgdGltZW91dHMuPGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+SSdkIGxp
a2UgdG8gaW5zdGFsbCBXaXJlR3VhcmQgb24gdGVjaG5pY2lhbidzIGNvbXB1dGVycyBhbmQgdGhl
cmUgaXMgbm8gZ3VhcmFudGVlIHRoYXQgdGhleSB3aWxsIHN0YXJ0IHBob25lIHRldGhlcmluZyB3
aXRoaW4gMiBtaW51dGVzIG9mIHN0YXJ0aW5nIHRoZWlyIG1hY2hpbmUuIE9wZW5WUE4gd291bGQg
cGFzcyB0aGlzIHNjZW5hcmlvLjxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PldoYXQgZG8g
eW91IHRoaW5rPzxicj48L2Rpdj4=



--b1_8dab10b1013bd00b96bfd07a95b2676f--


--===============8650580805602153843==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============8650580805602153843==--

