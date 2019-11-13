Return-Path: <SRS0=OnWR=ZT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A41E3C432C3
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 09:15:46 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEB2E2070A
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 09:15:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="seFveR3x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BEB2E2070A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9052a92f;
	Wed, 27 Nov 2019 09:15:33 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7e9b8644
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Nov 2019 08:26:02 +0000 (UTC)
Received: from mail-40130.protonmail.ch (mail-40130.protonmail.ch
 [185.70.40.130])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 94f5b3cb
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Nov 2019 08:26:01 +0000 (UTC)
Date: Wed, 13 Nov 2019 08:25:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1573633560;
 bh=GJPpMap/nDU/dcGv5gDXoHoCNWwNkeppaXCEwcjVSXo=;
 h=Date:To:From:Reply-To:Subject:Feedback-ID:From;
 b=seFveR3xE2gZKvkt1ECW6kkegMil5W4rO8GTl3rj+PT7W+YsCBcZbC+O7VEHrR3a0
 mC+8DRhi96LME3yzQQIqXTnBHIpUYBqIWUryfzkW+NV57Hs+gbwMq2PKSBijF2XuOL
 BZvuf2yuF9RiV7kxC9FNk72MpZMSsPVNVckedD90=
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
From: David Weinberger <cubicalpie@protonmail.com>
Subject: Status on wg-dynamic?
Message-ID: <F4cyz6k03CpTVXGL3ROFHAL3FwuPZg8wyyVKgvCVeufcJMCycqMAlqbnPh2H3EU-GnR3GlAjUMbYlPDirGS3hYoNIhOFfn6vd00_SUvud2A=@protonmail.com>
Feedback-ID: rZquK6HTsdyV6ewC9qNg_g4-T1xP5ggv1zNRcHFHnkAuntFn6eyLlkwRFFAnuKfNGIW3i-saATWf1Y7huZlIZg==:Ext:ProtonMail
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 27 Nov 2019 10:15:31 +0100
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: David Weinberger <cubicalpie@protonmail.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0629568306652047983=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is a multi-part message in MIME format.

--===============0629568306652047983==
Content-Type: multipart/alternative;
	boundary="b1_3d0786817df6ee141864db776c0f75d8"

This is a multi-part message in MIME format.

--b1_3d0786817df6ee141864db776c0f75d8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

SGksCgpJcyB3Zy1keW5hbWljIG1vcmUgbGlrZSBhIHByb29mIG9mIGNvbmNlcHRpb24gcmlnaHQg
bm93PyBJIHRyaWVkIHRvIHVzZSBpdCwgYnV0IGZvdW5kIGEgZmV3IGlzc3VlczoKCjEuIERvZXMg
aXRzIGRlcGVuZGVuY3kgb24gbGlibW5sIGFuZCBlcG9sbCBldGMgbWVhbiBpdCBjYW4gb25seSB3
b3JrIGZvciBsaW51eCBjbGllbnRzIG5vdz8KMi4gSXQgZG9lc24ndCBzZWVtIHRvIGhvb2sgaW50
byB3Zy1xdWljayBhcyBtZW50aW9uZWQgaW4gaWRlYS5tZD8gSSBjaGVja2VkIHdnLXF1aWNrJ3Mg
c291cmNlIGNvZGUsIG5vIHdoZXJlIGRvZXMgaXQgc3Bhd24gd2ctZHluYW1pYyBpdCBzZWVtcy4K
My4gSXRzIE1ha2VmaWxlIGJ5IGRlZmF1bHQgb25seSBidWlsZHMgc2VydmVyIGFuZCBub3QgY2xp
ZW50LCBhbmQgIm1ha2UgaW5zdGFsbCIgZmFpbHMgYmVjYXVzZSBpdHMgZGVwZW5kZW5jeSBpcyB3
ZyB3aGljaCBkb2Vzbid0IGV4aXN0LgoKQW5kIGl0IGhhc24ndCBiZWVuIHVwZGF0ZWQgZm9yIDIg
bW9udGhzLiBJIHdvbmRlciB3aGF0J3MgaXRzIHN0YXR1cyBub3c/CgpSZWdhcmRz


--b1_3d0786817df6ee141864db776c0f75d8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdj5IaSw8YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5JcyB3Zy1keW5hbWljIG1vcmUg
bGlrZSBhIHByb29mIG9mIGNvbmNlcHRpb24gcmlnaHQgbm93PyBJIHRyaWVkIHRvIHVzZSBpdCwg
YnV0IGZvdW5kIGEgZmV3IGlzc3Vlczo8YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj4xLiBE
b2VzIGl0cyBkZXBlbmRlbmN5IG9uIGxpYm1ubCBhbmQgZXBvbGwgZXRjIG1lYW4gaXQgY2FuIG9u
bHkgd29yayBmb3IgbGludXggY2xpZW50cyBub3c/Jm5ic3A7PGJyPjwvZGl2PjxkaXY+Mi4gSXQg
ZG9lc24ndCBzZWVtIHRvIGhvb2sgaW50byB3Zy1xdWljayBhcyBtZW50aW9uZWQgaW4gaWRlYS5t
ZD8gSSBjaGVja2VkIHdnLXF1aWNrJ3Mgc291cmNlIGNvZGUsIG5vIHdoZXJlIGRvZXMgaXQgc3Bh
d24gd2ctZHluYW1pYyBpdCBzZWVtcy48YnI+PC9kaXY+PGRpdj4zLiBJdHMgTWFrZWZpbGUgYnkg
ZGVmYXVsdCBvbmx5IGJ1aWxkcyBzZXJ2ZXIgYW5kIG5vdCBjbGllbnQsIGFuZCAibWFrZSBpbnN0
YWxsIiBmYWlscyBiZWNhdXNlIGl0cyBkZXBlbmRlbmN5IGlzIHdnIHdoaWNoIGRvZXNuJ3QgZXhp
c3QuPGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+QW5kIGl0IGhhc24ndCBiZWVuIHVwZGF0
ZWQgZm9yIDIgbW9udGhzLiBJIHdvbmRlciB3aGF0J3MgaXRzIHN0YXR1cyBub3c/PC9kaXY+PGRp
dj48YnI+PC9kaXY+PGRpdj5SZWdhcmRzPC9kaXY+



--b1_3d0786817df6ee141864db776c0f75d8--


--===============0629568306652047983==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============0629568306652047983==--

