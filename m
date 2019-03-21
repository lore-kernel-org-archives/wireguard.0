Return-Path: <SRS0=gmne=R2=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FF34C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 23 Mar 2019 00:06:18 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2B5C218A1
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 23 Mar 2019 00:06:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="l58BxNOq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2B5C218A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 62bc7c94;
	Sat, 23 Mar 2019 00:05:27 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5080e65e
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Mar 2019 12:34:44 +0000 (UTC)
Received: from mail-40130.protonmail.ch (mail-40130.protonmail.ch
 [185.70.40.130])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7941aee9
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Mar 2019 12:34:43 +0000 (UTC)
Date: Thu, 21 Mar 2019 12:35:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1553171707;
 bh=jx6EE8gDr1AJTMw6U2RUpzwYJykkqj6vsz0QeeN8znY=;
 h=Date:To:From:Reply-To:Subject:Feedback-ID:From;
 b=l58BxNOqQFXvYpuKy4K4zLJuHCs3noBC1m7S8YQrHRuiHvZH+88QAS4cDCC0yDNwg
 cxflxTclfhe+tRg+3MLgqN4y6oRDpMx+A86mXoALV9hIPC6lXJQO+9yTDtKXPXizh9
 39/dpd1E7IrFGzyLqJohKMCWUK3VebR7Y+DL2aXU=
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
From: David Weinberger <cubicalpie@protonmail.com>
Subject: Dealing with large number of IPv4 clients
Message-ID: <1RaAYaEHv_QRKUXdQO3U-bVTh2ZRb_kfhN62pX42RFyL_Jq_Y0Shl1V2t8s665ddlQpXQ80NBzQ4Bi5CUql18GkiZbunLbtDX1qz6yZbWkw=@protonmail.com>
Feedback-ID: rZquK6HTsdyV6ewC9qNg_g4-T1xP5ggv1zNRcHFHnkAuntFn6eyLlkwRFFAnuKfNGIW3i-saATWf1Y7huZlIZg==:Ext:ProtonMail
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 23 Mar 2019 01:05:26 +0100
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
Content-Type: multipart/mixed; boundary="===============1944504999105903917=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is a multi-part message in MIME format.

--===============1944504999105903917==
Content-Type: multipart/alternative;
	boundary="b1_9af9a9a2e6a6eb2f0471606a5d292ab8"

This is a multi-part message in MIME format.

--b1_9af9a9a2e6a6eb2f0471606a5d292ab8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

RGVhciB3aXJlZ3VhcmQgdGVhbSwKCldlIGFyZSBhIFZQTiBzZXJ2aWNlIHByb3ZpZGVyIHRyeWlu
ZyB0byBvZmZlciB3aXJlZ3VhcmQgdG8gb3VyIGN1c3RvbWVycy4KCkdpdmVuIHRoZSBsYXJnZSB1
c2VyIGJhc2UsIHdlIHBsYW4gdG8gbGVhc2UgSVBzIGF1dG9tYXRpY2FsbHkgdXNpbmcgYSBjdXN0
b20gdXBwZXIgbGF5ZXIgc2VydmljZSBiZWZvcmUgdXNlcnMgY2FuIGNvbm5lY3QsIGJ1dCB3ZSBj
YW4gbm90IHNlZW1zIHRvIGZpbmQgYSBwcm9wZXIgb3Bwb3J0dW5pdHkgdG8gcmVjbGFpbSB0aG9z
ZSBJUHMuIE9uY2UgYWxsb2NhdGVkLCBpdCBzZWVtcyB3aXJlZ3VhcmQgYXNzdW1lcyB0aGUgY2xp
ZW50IGNhbiB1c2UgdGhlIElQIGZvcmV2ZXIsIHNpbmNlIHRoZXJlIGlzIG5vIGV4cGxpY2l0IGRp
c2Nvbm5lY3Rpb24uCgpXaGF0J3MgdGhlIHByb3BlciB3YXkgdG8gZGVhbCB3aXRoIGxhcmdlIG51
bWJlciBvZiBJUHY0IGNsaWVudHM/CgooV2UncmUgYXdhcmUgb2YgdGhlIHdnLWR5bmFtaWMgcHJv
amVjdCwgYnV0IGl0IHNlZW1zIGl0J3MgSVB2NiBvbmx5LikKClJlZ2FyZHMu


--b1_9af9a9a2e6a6eb2f0471606a5d292ab8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdj5EZWFyIHdpcmVndWFyZCB0ZWFtLDxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pldl
IGFyZSBhIFZQTiBzZXJ2aWNlIHByb3ZpZGVyIHRyeWluZyB0byBvZmZlciB3aXJlZ3VhcmQgdG8g
b3VyIGN1c3RvbWVycy48YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5HaXZlbiB0aGUgbGFy
Z2UgdXNlciBiYXNlLCB3ZSBwbGFuIHRvIGxlYXNlIElQcyBhdXRvbWF0aWNhbGx5IHVzaW5nIGEg
Y3VzdG9tIHVwcGVyIGxheWVyIHNlcnZpY2UgYmVmb3JlIHVzZXJzIGNhbiBjb25uZWN0LCBidXQg
d2UgY2FuIG5vdCBzZWVtcyB0byBmaW5kIGEgcHJvcGVyIG9wcG9ydHVuaXR5IHRvIHJlY2xhaW0g
dGhvc2UgSVBzLiBPbmNlIGFsbG9jYXRlZCwgaXQgc2VlbXMgd2lyZWd1YXJkIGFzc3VtZXMgdGhl
IGNsaWVudCBjYW4gdXNlIHRoZSBJUCBmb3JldmVyLCBzaW5jZSB0aGVyZSBpcyBubyBleHBsaWNp
dCBkaXNjb25uZWN0aW9uLjxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PldoYXQncyB0aGUg
cHJvcGVyIHdheSB0byBkZWFsIHdpdGggbGFyZ2UgbnVtYmVyIG9mJm5ic3A7SVB2NCBjbGllbnRz
PyA8YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj4oV2UncmUgYXdhcmUgb2YgdGhlIHdnLWR5
bmFtaWMgcHJvamVjdCwgYnV0IGl0IHNlZW1zIGl0J3MgSVB2NiBvbmx5Lik8YnI+PC9kaXY+PGRp
dj48YnI+PC9kaXY+PGRpdj5SZWdhcmRzLjwvZGl2Pg==



--b1_9af9a9a2e6a6eb2f0471606a5d292ab8--


--===============1944504999105903917==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1944504999105903917==--

