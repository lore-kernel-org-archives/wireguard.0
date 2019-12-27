Return-Path: <SRS0=Ew3a=2R=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99F26C2D0C6
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 27 Dec 2019 16:41:36 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C28020882
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 27 Dec 2019 16:41:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="OpVUsTmW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C28020882
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e491d7c2;
	Fri, 27 Dec 2019 16:40:12 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 748ce1e8
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Dec 2019 15:51:33 +0000 (UTC)
Received: from mail4.protonmail.ch (mail4.protonmail.ch [185.70.40.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f9ed7b3b
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Dec 2019 15:51:33 +0000 (UTC)
Date: Fri, 27 Dec 2019 15:51:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1577461891;
 bh=X7+ZXAkrc9yLsvq9mdavkUM5EIA8iff/XBFi/ZSpDX0=;
 h=Date:To:From:Reply-To:Subject:Feedback-ID:From;
 b=OpVUsTmWcqRA0LRULuaq4Tu4cgNqX5TmrdPkVu7FkBmDaorL9FlAr4hRbK/vZ3Xer
 44WWOkdUgwnetb84OFEvuPi9LIfuDyA9q9+U53Ybgl3hE/aveyG7nmeL08E991NL3W
 J54erFqDq67DKGVBLjA645dj24V8h46K+G3XdP4U=
To: "WireGuard@lists.zx2c4.com" <WireGuard@lists.zx2c4.com>
From: Devin Smith <devinrsmith@protonmail.com>
Subject: remove peer endpoint
Message-ID: <CtiLrRxfJF8VjxK15ZVRrI9eJBflmVjOBKiOTYAHVAmF7lVPMuQvg3luFb89M3FKdy2fvemWnkfXd-LRJ1MCGy0GC2TddQuX0-Wga9hBS_4=@protonmail.com>
Feedback-ID: XeGiycWlBLSU4ELhwyilafnp6KvXo0lPbKJxA_NjPuEyMu8EOfSDLrsklLCIx1Se8qkoT0W-9YiW9Q-F6KAU4g==:Ext:ProtonMail
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 27 Dec 2019 17:40:10 +0100
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: Devin Smith <devinrsmith@protonmail.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============7168816120355899797=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is a multi-part message in MIME format.

--===============7168816120355899797==
Content-Type: multipart/alternative;
	boundary="b1_a9c7a64488123b063362bce82bda6e34"

This is a multi-part message in MIME format.

--b1_a9c7a64488123b063362bce82bda6e34
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

SXMgaXQgcG9zc2libGUgdG8gcmVtb3ZlIHRoZSBlbmRwb2ludCBvZiBhIHBlZXIgdmlhIHRoZSBg
d2cgc2V0YCBjb21tYW5kPyBBbGwgb2YgdGhlIG90aGVyIHBlZXIgYXR0cmlidXRlcyAocHJlc2hh
cmVkLWtleSwgcGVyc2lzdGVudC1rZWVwYWxpdmUsIGFsbG93ZWQtaXBzKSBhcmUgcmVtb3ZhYmxl
IGluIHRoaXMgZmFzaGlvbiAoYW5kIGRvY3VtZW50ZWQgaW4gdGhlIG1hbiBwYWdlKS4gSSd2ZSB0
cmllZCBgd2cgc2V0IDxpbnRlcmZhY2U+IHBlZXIgPGJhc2U2NC1wdWJsaWMta2V5PiBlbmRwb2lu
dCAwYCwgYGVuZHBvaW50IG9mZmAsIGBlbmRwb2ludCAiImAsIGFuZCBgcmVtb3ZlIGVuZHBvaW50
YC4KCk15IHdvcmthcm91bmQgZm9yIG5vdyBpcyB0byBqdXN0IHJlbW92ZSB0aGUgd2hvbGUgcGVl
ciwgYW5kIHRoZW4gcmUtc2V0IHRoZSBvdGhlciBhdHRyaWJ1dGVzLgoKSWYgaXQgaXMgbm90IHBv
c3NpYmxlIHRvIGN1cnJlbnRseSBkbyB0aGlzIHdpdGggYHdnIHNldGAsIHRoZSBzeW50YXggYHJl
bW92ZSA8YXR0cmlidXRlLW5hbWU+YCBtaWdodCBiZSBhIGdvb2Qgd2F5IHRvIGdlbmVyYWxpemUg
dGhlIG5vdGlvbiBvZiB1bnNldHRpbmcgYW55IHBlZXIgYXR0cmlidXRlLgoKVGhhbmtzLAotRGV2
aW4=


--b1_a9c7a64488123b063362bce82bda6e34
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdj5JcyBpdCBwb3NzaWJsZSB0byByZW1vdmUgdGhlIGVuZHBvaW50IG9mIGEgcGVlciB2aWEg
dGhlIGB3ZyBzZXRgIGNvbW1hbmQ/IEFsbCBvZiB0aGUgb3RoZXIgcGVlciBhdHRyaWJ1dGVzIChw
cmVzaGFyZWQta2V5LCBwZXJzaXN0ZW50LWtlZXBhbGl2ZSwgYWxsb3dlZC1pcHMpIGFyZSByZW1v
dmFibGUgaW4gdGhpcyBmYXNoaW9uIChhbmQgZG9jdW1lbnRlZCBpbiB0aGUgbWFuIHBhZ2UpLiBJ
J3ZlIHRyaWVkIGB3ZyBzZXQgJmx0O2ludGVyZmFjZSZndDsgcGVlciAmbHQ7YmFzZTY0LXB1Ymxp
Yy1rZXkmZ3Q7IGVuZHBvaW50IDBgLCBgZW5kcG9pbnQgb2ZmYCwgYGVuZHBvaW50ICIiYCwgYW5k
IGByZW1vdmUgZW5kcG9pbnRgLjxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pk15IHdvcmth
cm91bmQgZm9yIG5vdyBpcyB0byBqdXN0IHJlbW92ZSB0aGUgd2hvbGUgcGVlciwgYW5kIHRoZW4g
cmUtc2V0IHRoZSBvdGhlciBhdHRyaWJ1dGVzLjxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2
PklmIGl0IGlzIG5vdCBwb3NzaWJsZSB0byBjdXJyZW50bHkgZG8gdGhpcyB3aXRoIGB3ZyBzZXRg
LCB0aGUgc3ludGF4IGByZW1vdmUgJmx0O2F0dHJpYnV0ZS1uYW1lJmd0O2AgbWlnaHQgYmUgYSBn
b29kIHdheSB0byBnZW5lcmFsaXplIHRoZSBub3Rpb24gb2YgdW5zZXR0aW5nIGFueSBwZWVyIGF0
dHJpYnV0ZS48YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5UaGFua3MsPGJyPjwvZGl2Pjxk
aXY+LURldmluPC9kaXY+



--b1_a9c7a64488123b063362bce82bda6e34--


--===============7168816120355899797==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7168816120355899797==--

