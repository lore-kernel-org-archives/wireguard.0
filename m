Return-Path: <SRS0=/nf9=RE=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBBFFC4360F
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  1 Mar 2019 10:02:41 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F5F02085A
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  1 Mar 2019 10:02:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="hqwWIJkD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F5F02085A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b6847656;
	Fri, 1 Mar 2019 09:52:34 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id db1730a1
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Feb 2019 11:57:32 +0000 (UTC)
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 701875b0
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Feb 2019 11:57:32 +0000 (UTC)
Date: Thu, 28 Feb 2019 12:07:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1551355632;
 bh=C9U3BP1t28A8mhcSFpNldnEeVrFL0xXvTZU8G/bkyvQ=;
 h=Date:To:From:Reply-To:Subject:Feedback-ID:From;
 b=hqwWIJkDiLrbrJYeCqN4oxxdJNc/oRNRc7Jt8elPWfS3LBuHuD+2CG4Kz84X5iAwW
 hbvwkbPVVchGdmZVpmVmND2GwPymftrjs4F6yTVOTpJjzA8vMpsbabFOXNVgzc7fBO
 Sv5PYkx3TqHRhIVbGwK4GDlhLyxy7i+oBmx7n6gQ=
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
From: kolargol <kolargol@protonmail.com>
Subject: iOS WG Battery Life
Message-ID: <zk1gAdr9rlJCh4vzh4DYSc11v_Ja4r_9xYurdAcwFsa50g2zMxHskd5Nb0leXZKUZrCqV3YIZFI5pNYptUGXTyQBIl5zWoF_N306lQKO_tg=@protonmail.com>
Feedback-ID: BeuBiSQcqsr-Krwtcv9IekhH3G8BPby93wz9So6BEG3RLXEAsJdmMzmwNOSrHC8ToF3fQqLPAjlqXY7tyhxFEQ==:Ext:ProtonMail
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 01 Mar 2019 10:52:31 +0100
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: kolargol <kolargol@protonmail.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8926510069568205097=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is a multi-part message in MIME format.

--===============8926510069568205097==
Content-Type: multipart/alternative;
	boundary="b1_6a4169c30ba1d2ab4346ee528bfebf75"

This is a multi-part message in MIME format.

--b1_6a4169c30ba1d2ab4346ee528bfebf75
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

SGkKClRoYW5rcyBmb3IgZ3JlYXQgd29yayB3aXRoIFdpcmVndWFyZCwgaXQncyBmcmVzaCBicmVl
emUgb2YgYWlyIGNvbXBhcmVkIG9uIHllYXJzIHNwZW5kIG9uIE9wZW5WUE4uLi4KCkkgYW0gdGVz
dGluZyBXRyBvbiB2YXJpdXMgT1NlcyBhbmQgZGV2aWNlcyBhbmQgSSBoYXZlIG5vdGVkIHNldmVy
ZSBiYXR0ZXJ5IGRyYWluIG9uIGlPUyAoMTIuMiwgaVBob25lIDgpLiBUeXBpY2FsbHkgYmF0dGVy
eSBkcm9wcyA0MCUgZHVyaW5nIG5pZ2h0LXRpbWUgKHRoYXQgaXMgNyBob3VycyBvZiBpbmFjdGl2
aXR5IG9uIHRoZSBwaG9uZSkgd2hlbiBXaXJlR3VhcmQgaXMgZW5nYWdlZC4KSXMgdGhpcyBzb21l
IGtpbmQgb2Yga25vd24gaXNzdWU/IEkgZGlkIG5vdCBoYWQgY2hhbmNlIHRvIHRlc3QgcHJldmlv
dXMgaU9TIHZlcnNpb24gd2l0aG91dCBTSU1EIENoYUNoYTIwIHN1cHBvcnQgc28gaSBjYW5ub3Qg
dGVsbCBpZiBpdCBpcyBiZWNvdXNlIG9mIHRoZSBsYXN0IHVwZGF0ZS4KCkFueXRoaW5nIGkgY2Fu
IGRvIHRvIHRyYWNrIGlzc3VlIGhlcmU/Cgp0aGFua3MsCmtvbGFyZ29s


--b1_6a4169c30ba1d2ab4346ee528bfebf75
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdj5IaTxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PlRoYW5rcyBmb3IgZ3JlYXQgd29y
ayB3aXRoIFdpcmVndWFyZCwgaXQncyBmcmVzaCBicmVlemUgb2YgYWlyIGNvbXBhcmVkIG9uIHll
YXJzIHNwZW5kIG9uIE9wZW5WUE4uLi48YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5JIGFt
IHRlc3RpbmcgV0cgb24gdmFyaXVzIE9TZXMgYW5kIGRldmljZXMgYW5kIEkgaGF2ZSBub3RlZCBz
ZXZlcmUgYmF0dGVyeSBkcmFpbiBvbiBpT1MgKDEyLjIsIGlQaG9uZSA4KS4gVHlwaWNhbGx5IGJh
dHRlcnkgZHJvcHMgNDAlIGR1cmluZyBuaWdodC10aW1lICh0aGF0IGlzIDcgaG91cnMgb2YgaW5h
Y3Rpdml0eSBvbiB0aGUgcGhvbmUpIHdoZW4gV2lyZUd1YXJkIGlzIGVuZ2FnZWQuIDxicj48L2Rp
dj48ZGl2PklzIHRoaXMgc29tZSBraW5kIG9mIGtub3duIGlzc3VlPyBJIGRpZCBub3QgaGFkIGNo
YW5jZSB0byB0ZXN0IHByZXZpb3VzIGlPUyB2ZXJzaW9uIHdpdGhvdXQgU0lNRCBDaGFDaGEyMCBz
dXBwb3J0IHNvIGkgY2Fubm90IHRlbGwgaWYgaXQgaXMgYmVjb3VzZSBvZiB0aGUgbGFzdCB1cGRh
dGUuPGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+QW55dGhpbmcgaSBjYW4gZG8gdG8gdHJh
Y2sgaXNzdWUgaGVyZT88YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj50aGFua3MsPGJyPjwv
ZGl2PjxkaXY+a29sYXJnb2w8YnI+PC9kaXY+



--b1_6a4169c30ba1d2ab4346ee528bfebf75--


--===============8926510069568205097==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============8926510069568205097==--

