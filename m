Return-Path: <SRS0=zOjE=TG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,FREEMAIL_REPLYTO_END_DIGIT,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3565DC04A6B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 May 2019 20:37:54 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 572DE206BF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 May 2019 20:37:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="UiFgB49b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 572DE206BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5a443d5a;
	Mon, 6 May 2019 20:28:43 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4e1dcf7e
 for <wireguard@lists.zx2c4.com>; Wed, 1 May 2019 20:23:11 +0000 (UTC)
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 19b056ed
 for <wireguard@lists.zx2c4.com>; Wed, 1 May 2019 20:23:10 +0000 (UTC)
Date: Wed, 01 May 2019 20:23:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1556742189;
 bh=I29HiibFj3OEbBw1X/UfTn7LRurSyaMX1Zu0cxXuEFU=;
 h=Date:To:From:Reply-To:Subject:Feedback-ID:From;
 b=UiFgB49bhQwwVdiS6Bxd3ayGmMfslO5gx4XzyqsFPOeb8OuVdiMQjiHb2+7c0Z1mj
 5Uca9c7bHHoiRm/Y7I9Xly6+r7fjWdldYE53T/Pi+AYJfJd2dsfSQamXCcN4d4ZiP5
 UEDIISznMoSY0GwKZfjXvyJ1wuB4GGMRzHFjOy8E=
To: wireguard@lists.zx2c4.com
From: Proton <dr.morgan.00@protonmail.com>
Subject: With WG on Router: Apple iCloud Auth Issues
Message-ID: <C3816F08-7F84-44FC-91B4-41FF2BEF4C77@protonmail.com>
Feedback-ID: 2trPGghQ7XcqFV8MopMfdxHMaGpjRWR4NBk6-hy7E7_fBHneP8YmQvUCyEYdpk7Zd5zB74JK7TAShs4Bb_QSgg==:Ext:ProtonMail
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 06 May 2019 22:28:35 +0200
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: Proton <dr.morgan.00@protonmail.com>
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

SGVsbG8gYWxsISBNeSBmaXJzdCBwb3N0IDopIEkgaGF2ZSB0d28gbGludXggc3lzdGVtcyAoVWJ1
bnR1IDE4LjA0LjIpIHNldCB1cCBhcyByb3V0ZXJzOgoKIE9uZSBpcyBydW5uaW5nIHRoZSBsYXRl
c3QgbWFpbmxpbmUgT3BlblZQTiBhcHQgcGFja2FnZSBjb25uZWN0aW5nIHRvIEFpclZQTiAoaGF2
ZSBhbHNvIHVzZWQgUHJvdG9uVlBOKS4gSSBleHBlcmllbmNlIG5vIGlzc3VlcyB3aXRoIGFueSBp
bnRlcm5ldCBpbnRlcmFjdGlvbnMuIE15IGlPUyBhbmQgTWFjT1MgKGxhdGVzdCB2ZXJzaW9ucykg
d29yayBwZXJmZWN0bHkgZm9yIFdlYiwgZW1haWwgKGltYXAsIHNtdHApLCBtZXNzYWdpbmcsIGlD
bG91ZCBEcml2ZSwgZXRjLi4gVGhlc2UgZW5kcG9pbnQgbWFjaGluZXMgb24gdGhlIGxvY2FsIExB
TiBhcmUgbm90LCB0aGVtc2VsdmVzLCBydW5uaW5nIGFueSBWUE4gc29mdHdhcmUuIFRoZSByb3V0
ZXIgaXMgYWxzbyBydW5uaW5nIFBpaG9sZSBkb21haW4gbmFtZSBmaWx0ZXJpbmcuIExpZmUgaXMg
Z29vZC4KCiBUaGUgb3RoZXIgaXMgcnVubmluZyB0aGUgbGF0ZXN0IFdpcmVndWFyZCBhcHQvZGVi
IHBhY2thZ2UuIEkgaW5pdGlhbGx5IHJhbiBpdCBjb25uZWN0ZWQgdG8gYW4gQWxnbyBpbnN0YW5j
ZSBvbiBhIGRyb3BsZXQgQCBEaWdpdGFsIE9jZWFuLiBJIHJlY2VudGx5IGFsc28gdHJpZWQgaXQg
b24gQ3J5cHRvc3Rvcm0ncyBXaXJlZ3VhcmQgb2ZmZXJpbmcuIEkgaGF2ZSB1c2VkIG5vcm1hbCBl
eHRlcm5hbCBETlMsIGRuc2NyeXB0LXByb3h5LCBhbmQgdGhlIHByb3h5IHdpdGggZG5zbWFzcSBo
b3N0L2RvbWFpbiBmaWx0ZXJpbmcuIEV2ZXJ5dGhpbmcgd29ya3MgKmdyZWF0KiBleGNlcHQsIGlu
IGFsbCBjb25maWd1cmF0aW9uLCBteSBNYWNPUyBzeXN0ZW1zIG9uIHRoZSBMQU4gY2Fubm90IHNl
bmQgb3IgcmVjZWl2ZSAoaW1hcCkgZW1haWwgZm9yICpBcHBsZSogYWNjb3VudHMgKEBpY2xvdWQu
Y29tIGFuZCBAbWFjLmNvbSkuIEFsdGhvdWdoLCBQcm90b25tYWlsLmNvbSBhbmQgZ21haWwuY29t
IGltYXAgYWNjb3VudHMgd29yayB3aXRoIG5vIGlzc3Vlcy4gVGhlIE5vdGVzIGFuZCBDYWxlbmRh
ciBhcHBzIG9uIHRoZSBNYWMgd29yayBmaW5lIGFuZCBzeW5jIHN1Y2Nlc3NmdWxseS4gVGhlIEFw
cGxlIGVtYWlsIGNvbm5lY3Rpb25zIGp1c3Qgc3BpbiB1bnRpbCB0aGV5IHVsdGltYXRlbHkgdGlt
ZSBvdXQuICBJIGV2ZW4gdHJpZWQgYW4gYWx0ZXJuYXRpdmUgZW1haWwgY2xpZW50IChTcGFyayks
IGJ1dCB0aGUgYXBwLXNwZWNpZmljIHBhc3N3b3JkIEFwcGxlIHByb3ZpZGVkIGZvciB0aGUgYXBw
IHdvdWxkIG5vdCBhdXRoZW50aWNhdGUsIHdpdGggYmVoYXZpb3IgdmVyeSBzaW1pbGFyIHRvIHRo
ZSBlbWFpbCBzZXJ2ZXJzLiBUaGVyZeKAmXMgYW4gb2J2aW91cyBwYXR0ZXJuIGVtZXJnaW5nIGhl
cmUgOikgLSBzb21ldGhpbmcgYWJvdXQgV2lyZWd1YXJkIGlzIGJsb2NraW5nIEFwcGxl4oCZcyBp
Q2xvdWQgYXV0aGVudGljYXRpb24gcHJvY2VzcywgYWx0aG91Z2ggSSBkb27igJl0IGtub3cgd2h5
IE5vdGVzIGFuZCBDYWxlbmRhciBjb250aW51ZSB0byB3b3JrLCB0YmguIEnigJl2ZSBzZWFyY2hl
ZCB0aGUgV2ViLCBhbmQgdHJ1bHkgdGhvdWdodCBzb21ldGhpbmcgd291bGQgcG9wIHVwIGltbWVk
aWF0ZWx5LCBnaXZlbiB0aGF0IFdpcmVndWFyZCBoYXMgaU9TIGFuZCBNYWNPUyBjbGllbnQgYXBw
cyBpbiB0aGVpciByZXNwZWN0aXZlIEFwcCBTdG9yZXMsIGJ1dCBub3RoaW5nIHN1cmZhY2VkLiBJ
ICpyZWFsbHkqIHdhbnQgdG8gdXNlIFdpcmVndWFyZCBhcyBteSBWUE4gc29sdXRpb24gKEnigJlt
IHRveWluZyB3aXRoIGRldmVsb3BpbmcgYSBwZXJzb25hbCBhcHBsaWFuY2UgdXNpbmcgVlBOIGZ1
bmN0aW9uYWxpdHkpLCBidXQgdGhpcyBBcHBsZSBpc3N1ZSBpcyBhIHNob3cgc3RvcHBlci4gU3Vy
ZWx5LCBnaXZlbiB0aGUgQXBwbGUgYXBwcyB0aGF0IHlvdSBoYXZlIGRldmVsb3BlZCwgdGhlcmUg
bXVzdCBiZSBzb21ldGhpbmcgZWxzZSBJIG5lZWQgdG8gZG8gd2l0aCBteSBjb25maWd1cmF0aW9u
IHRvIGZpeCB0aGlzLgoKQW55IGFzc2lzdGFuY2UgeW91IGFsbCBjYW4gcHJvdmlkZSB3b3VsZCBi
ZSAqZ3JlYXRseSogYXBwcmVjaWF0ZWQuIEnigJltIG1vcmUgdGhhbiBoYXBweSB0byBkb25hdGUg
dG8gdGhlIHByb2plY3QsIGV0Yy4gLSBidXQgSSBuZWVkIHRoaXMgYWxsIHRvIOKAnGp1c3Qgd29y
a+KAnS4gV2lyZWd1YXJkIGlzIHNpbXBseSB0aGUgbW9zdCBlbGVnYW50IFZQTiBzb2x1dGlvbiBJ
4oCZdmUgZXZlciBzZWVuLCBzbyBJ4oCZbSByZWFsbHkgcm9vdGluZyBmb3IgeW91ciBzdWNjZXNz
IQoKLUJlc3QgQ2FyZQogIERhdmlkCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KV2lyZUd1YXJkIG1haWxpbmcgbGlzdApXaXJlR3VhcmRAbGlzdHMuengy
YzQuY29tCmh0dHBzOi8vbGlzdHMuengyYzQuY29tL21haWxtYW4vbGlzdGluZm8vd2lyZWd1YXJk
Cg==
