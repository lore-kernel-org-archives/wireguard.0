Return-Path: <SRS0=tjuz=QY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE2ABC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Feb 2019 01:24:15 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5388121874
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Feb 2019 01:24:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=alexago.xyz header.i=@alexago.xyz header.b="2kjWerqh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5388121874
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=alexago.xyz
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b794805b;
	Sun, 17 Feb 2019 01:15:44 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e04223f3
 for <wireguard@lists.zx2c4.com>; Sat, 9 Feb 2019 09:13:01 +0000 (UTC)
Received: from mail4.protonmail.ch (mail4.protonmail.ch [185.70.40.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cb361e3a
 for <wireguard@lists.zx2c4.com>; Sat, 9 Feb 2019 09:13:01 +0000 (UTC)
Date: Sat, 09 Feb 2019 09:20:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alexago.xyz;
 s=protonmail; t=1549704014;
 bh=vPMuQP5twxeIRWyNJxjJpnQ1Rkr+Hds2YYZX1C0nR1g=;
 h=Date:To:From:Reply-To:Subject:Feedback-ID:From;
 b=2kjWerqhecsCvSWzrPICC8wwG2E0iBF3H66z/gfKUWWEOIZnMzIZIrhQ+RZOj/ERZ
 ZYi/ZHLD5x86lXx9K8uH39uLKXgYtKrkoAFeVZSwOsDYESR1fH5K9GtB3ZQZjMlfMJ
 PYKaWcwmu/iOd0JnSaQuU9ueIKPZfoEj/7+Gz9Vk=
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
From: Alexago <alexago@alexago.xyz>
Subject: Load Balancing and policy routing with Wireguard
Message-ID: <s7r35rV6aqXJrq9tA0DjWLgyiS1fYwO_0gkBFyuyVK73vx5qN60gt2_1ZVRHnG6R3htZiBJOWZMz9wBmMLYP3Bz0SZYvNvIrhKLjkNbzTxI=@alexago.xyz>
Feedback-ID: pfwXG0rs77vT9Xb909Qom4UilFeT-4DGJw0Xg-GGT6MM5mJcb8BXUkSvGmsIzk8qP2hDPZAKr7WeZSjJspJ3lQ==:Ext:ProtonMail
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 17 Feb 2019 02:15:43 +0100
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: Alexago <alexago@alexago.xyz>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0655255708961538810=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is a multi-part message in MIME format.

--===============0655255708961538810==
Content-Type: multipart/alternative;
	boundary="b1_310815d877794f5cafe516dcea0b3045"

This is a multi-part message in MIME format.

--b1_310815d877794f5cafe516dcea0b3045
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

SGksCgphY3R1YWxseSBJIHVzZSBvbiBteSByb3V0ZXIgKE9wZW5XUlQpIHR3byBPcGVuVlBOIGNv
bm5lY3Rpb25zIGFuZCBvbmUgV2lyZWd1YXJkIGNvbm5lY3Rpb24gKGFsbCBWUE4gY29ubmVjdGlv
bnMgYXJlIGNsaWVudCkgb3ZlciBteSBXQU4gY29ubmVjdGlvbiAoMUdicHMvNTAwTWJwcykgd2l0
aCAyIGRpZmZlcmVudCBWUE4gcHJvdmlkZXJzIChNdWxsdmFkIGFuZCBJVlBOKTogZm9yIHBvbGlj
eSByb3V0aW5nIGFuZCBsb2FkIGJhbGFuY2luZywgd2l0aCB0aGVzZSBjb25uZWN0aW9ucywgSSB1
c2UgTVdBTjMgcGFja2FnZS4KCk1XQU4zIGlzIHVzZWZ1bCB0byBjaG9vc2UKCi0gVlBOIGNvbm5l
Y3Rpb24gYmFzZWQgb24gc291cmNlIG9yIGRlc3RpbmF0aW9uIGFkZHJlc3MsIHBvcnQsIGZvciBl
eGFtcGxlCi0gbG9hZCBiYWxhbmNpbmcgdHdvIG9yIG1vcmUgVlBOIGNvbm5lY3Rpb25zLCBiYXNl
ZCBvbiBzb3VyY2UsIGRlc3RpbmF0aW9uIGFuZCBwb3J0LCBmb3IgZXhhbXBsZQoKTm93IEkgd291
bGQgbGlrZSB0byBzd2l0Y2ggbXkgdHdvIE9wZW5WUE4gY29ubmVjdGlvbnMgdG8gV2lyZWd1YXJk
LCBzbyBJIHdvdWxkIGxpa2UgdG8gaGF2ZSB0aHJlZSBzaW11bHRhbmVvdXMgV2lyZWd1YXJkIGNv
bm5lY3Rpb25zIChvYnZpb3VzbHkgd2l0aCAzIGRpZmZlcmVudCBXaXJlZ3VhcmQgc2VydmVycyku
CgpNeSBwcm9ibGVtIGlzIGhvdyB0byB1c2Ugc2ltdWx0YW5lb3VzIFdpcmVndWFyZCBjb25uZWN0
aW9ucyAod2l0aCBhbGxvd2VkIGlwcyA9MC4wLjAuMC8wKSBhbmQgdG8gbGVhdmUgdG8gZXh0ZXJu
YWwgcGFja2FnZSAobGlrZSBNV0FOMykgdG8gY2hvb3NlIHJvdXRpbmcgcG9saWN5IGFuZCBhbHNv
IGxvYWQgYmFsYW5jaW5nLgoKSSB0cmllZCB0byBjb25maWd1cmUgdHdvIFdpcmVndWFyZCBjb25u
ZWN0aW9ucyBidXQgb25seSBvbmUgb2YgdGhlc2UgZ29lcyBvbmxpbmUsIHRoZSBvdGhlciBvbmUg
aXMgYWx3YXlzIG9mZmxpbmU6IEkgdGhpbmsgcHJvYmxlbSBpcyBtdWx0aXBsZSAiMC4wLjAuMC8w
IiBhbGxvd2VkIElQcy4KCkNhbiB5b3UgaGVscCBtZT8KClRoYW5rcw==


--b1_310815d877794f5cafe516dcea0b3045
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdj5IaSw8YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5hY3R1YWxseSBJIHVzZSBvbiBt
eSByb3V0ZXIgKE9wZW5XUlQpIHR3byBPcGVuVlBOIGNvbm5lY3Rpb25zIGFuZCBvbmUgV2lyZWd1
YXJkIGNvbm5lY3Rpb24gKGFsbCBWUE4gY29ubmVjdGlvbnMgYXJlIGNsaWVudCkgb3ZlciBteSBX
QU4gY29ubmVjdGlvbiAoMUdicHMvNTAwTWJwcykgd2l0aCAyIGRpZmZlcmVudCBWUE4gcHJvdmlk
ZXJzIChNdWxsdmFkIGFuZCBJVlBOKTogZm9yIHBvbGljeSByb3V0aW5nIGFuZCBsb2FkIGJhbGFu
Y2luZywgd2l0aCB0aGVzZSBjb25uZWN0aW9ucywgSSB1c2UgTVdBTjMgcGFja2FnZS48YnI+PC9k
aXY+PGRpdj48YnI+PC9kaXY+PGRpdj5NV0FOMyBpcyB1c2VmdWwgdG8gY2hvb3NlIDxicj48L2Rp
dj48dWw+PGxpPlZQTiBjb25uZWN0aW9uIGJhc2VkIG9uIHNvdXJjZSBvciBkZXN0aW5hdGlvbiBh
ZGRyZXNzLCBwb3J0LCBmb3IgZXhhbXBsZTxicj48L2xpPjxsaT5sb2FkIGJhbGFuY2luZyB0d28g
b3IgbW9yZSBWUE4gY29ubmVjdGlvbnMsIGJhc2VkIG9uIHNvdXJjZSwgZGVzdGluYXRpb24gYW5k
IHBvcnQsIGZvciBleGFtcGxlPGJyPjwvbGk+PC91bD48ZGl2Pk5vdyBJIHdvdWxkIGxpa2UgdG8g
c3dpdGNoIG15IHR3byBPcGVuVlBOIGNvbm5lY3Rpb25zIHRvIFdpcmVndWFyZCwgc28gSSB3b3Vs
ZCBsaWtlIHRvIGhhdmUgdGhyZWUgc2ltdWx0YW5lb3VzIFdpcmVndWFyZCBjb25uZWN0aW9ucyAo
b2J2aW91c2x5IHdpdGggMyBkaWZmZXJlbnQgV2lyZWd1YXJkIHNlcnZlcnMpLjxicj48L2Rpdj48
ZGl2Pjxicj48L2Rpdj48ZGl2Pk15IHByb2JsZW0gaXMgaG93IHRvIHVzZSBzaW11bHRhbmVvdXMg
V2lyZWd1YXJkIGNvbm5lY3Rpb25zICh3aXRoIGFsbG93ZWQgaXBzID0wLjAuMC4wLzApIGFuZCB0
byBsZWF2ZSB0byBleHRlcm5hbCBwYWNrYWdlIChsaWtlIE1XQU4zKSB0byBjaG9vc2Ugcm91dGlu
ZyBwb2xpY3kgYW5kIGFsc28gbG9hZCBiYWxhbmNpbmcuPGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2
PjxkaXY+SSB0cmllZCB0byBjb25maWd1cmUgdHdvIFdpcmVndWFyZCBjb25uZWN0aW9ucyBidXQg
b25seSBvbmUgb2YgdGhlc2UgZ29lcyBvbmxpbmUsIHRoZSBvdGhlciBvbmUgaXMgYWx3YXlzIG9m
ZmxpbmU6IEkgdGhpbmsgcHJvYmxlbSBpcyBtdWx0aXBsZSAiMC4wLjAuMC8wIiBhbGxvd2VkIElQ
cy48YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5DYW4geW91IGhlbHAgbWU/PGJyPjwvZGl2
PjxkaXY+PGJyPjwvZGl2PjxkaXY+VGhhbmtzPGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+
PGJyPjwvZGl2PjxkaXYgY2xhc3M9InByb3Rvbm1haWxfc2lnbmF0dXJlX2Jsb2NrIj48ZGl2IGNs
YXNzPSJwcm90b25tYWlsX3NpZ25hdHVyZV9ibG9jay11c2VyIHByb3Rvbm1haWxfc2lnbmF0dXJl
X2Jsb2NrLWVtcHR5Ij48YnI+PC9kaXY+PGRpdiBjbGFzcz0icHJvdG9ubWFpbF9zaWduYXR1cmVf
YmxvY2stcHJvdG9uIj48YnI+PC9kaXY+PC9kaXY+PGRpdj48YnI+PC9kaXY+



--b1_310815d877794f5cafe516dcea0b3045--


--===============0655255708961538810==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============0655255708961538810==--

