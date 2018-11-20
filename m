Return-Path: <SRS0=90jI=OP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB99FC65BAF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Dec 2018 23:13:35 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46A3820989
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Dec 2018 23:13:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="RwokH7to"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46A3820989
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 36040257;
	Thu, 6 Dec 2018 23:05:19 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 07726494
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Nov 2018 05:26:12 +0000 (UTC)
Received: from mail-40136.protonmail.ch (mail-40136.protonmail.ch
 [185.70.40.136])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5bb671f0
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Nov 2018 05:26:12 +0000 (UTC)
Date: Tue, 20 Nov 2018 05:32:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1542691931;
 bh=N6UzkBMId5tGjyGOWRB1LsfTFWeeJzHUu4EHMNhy54U=;
 h=Date:To:From:Reply-To:Subject:Feedback-ID:From;
 b=RwokH7toJikg4S87XGNMCVJvfEqhTeK6VsTazAlmxhDCGPHaA8CLjcOGt3CtWobkq
 biYMNKm9XQLLvukJkJ57MBotEu/AbqpdcGcHFNePMumsR/ZTzvSsfO1mWRpxywgAOa
 hjVgTMX6yLsStrbEXXqMKTAzpFPDnrV0EBBodR9o=
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
From: DARANGH <darangh@protonmail.com>
Subject: Problems with kernel 4.15 on Ubuntu Bionic & Xenial to use wireguard
 dkms
Message-ID: <yhOEntUhW9Wi4z-1KZGSZ9_aZWfoThyA5G38azfKjd-ZCJ7O1eoqmGVVRND0TcgR5cb6JXkUXKV0xng9NY9NR0MAsRuAq_GKBpfsknG5ujI=@protonmail.com>
Feedback-ID: I8SD0p0GTtyTBTc1-E-EH46uGA06cZdLaEwcd0xFf8usCe4PWat-6OCwTeNJcoaHbnuxNtlDN-jLf1plKvLdwQ==:Ext:ProtonMail
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 07 Dec 2018 00:05:18 +0100
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: DARANGH <darangh@protonmail.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2384801135503554040=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is a multi-part message in MIME format.

--===============2384801135503554040==
Content-Type: multipart/alternative;
	boundary="b1_f6134e1e1e359e8376020cd5fb3a8fca"

This is a multi-part message in MIME format.

--b1_f6134e1e1e359e8376020cd5fb3a8fca
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

SGVsbG8sCgpJIHBvc3QgdGhpcyBzZWNvbmQgbWVzc2FnZSB0byB0ZWxsIHlvdSB0aGF0IFdpcmVH
dWFyZCBTbmFwc2hvdCBgMC4wLjIwMTgxMTE5YCBzb2x2ZWQgbXkgZGttcyBwcm9ibGVtIG9uIExp
bnV4TWludCAxOSAhCkl0IHdvcmtzIHBlcmZlY3RseSBub3chIE1hbnkgdGhhbmtzICEgOi0pCkp1
c3Qgb25lIHF1ZXN0aW9uIDogSSBjYW4ndCBmaW5kIGFuICJhbnN3ZXIiIGJ1dHRvbiBpbiB0aGUg
bWFpbGxpc3Qgd2ViIHBhZ2UgdG8gYW5zd2VyIHRvIGFuIGV4aXN0aW5nIHRocmVhZC4uLiBEaWQg
SSBtaXNzIHNvbWV0aGluZz8KUmVnYXJkcywKCkRvbS4gSAoKLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpNYXJyZSBkZSBsYSBjZW5zdXJlPyBNYXJyZSBkJ8Oq
dHJlIHBpc3TDqSBwYXIgeW91dHViZT8KUGFzc2V6IMOgIHBlZXJ0dWJlICEgOi0pCmh0dHBzOi8v
am9pbnBlZXJ0dWJlLm9yZy9mci8KaHR0cHM6Ly9wZWVydHViZS5wbC9hY2NvdW50cy9hZGFtLnF1
ZXIvdmlkZW9zCgpTZW50IHdpdGggW1Byb3Rvbk1haWxdKGh0dHBzOi8vcHJvdG9ubWFpbC5jb20p
IFNlY3VyZSBFbWFpbC4=


--b1_f6134e1e1e359e8376020cd5fb3a8fca
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdj5IZWxsbyw8YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5JIHBvc3QgdGhpcyBzZWNv
bmQgbWVzc2FnZSB0byB0ZWxsIHlvdSB0aGF0IFdpcmVHdWFyZCBTbmFwc2hvdCBgMC4wLjIwMTgx
MTE5YCBzb2x2ZWQgbXkgZGttcyBwcm9ibGVtIG9uIExpbnV4TWludCAxOSAhIDxicj48L2Rpdj48
ZGl2Pkl0IHdvcmtzIHBlcmZlY3RseSBub3chIE1hbnkgdGhhbmtzICEgOi0pPGJyPjwvZGl2Pjxk
aXY+SnVzdCBvbmUgcXVlc3Rpb24gOiBJIGNhbid0IGZpbmQgYW4gImFuc3dlciIgYnV0dG9uIGlu
IHRoZSBtYWlsbGlzdCB3ZWIgcGFnZSB0byBhbnN3ZXIgdG8gYW4gZXhpc3RpbmcgdGhyZWFkLi4u
IERpZCBJIG1pc3Mgc29tZXRoaW5nPzxicj48L2Rpdj48ZGl2PlJlZ2FyZHMsPGJyPjwvZGl2Pjxk
aXY+PGJyPjwvZGl2PjxkaXY+RG9tLiBIPGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXYgY2xh
c3M9InByb3Rvbm1haWxfc2lnbmF0dXJlX2Jsb2NrIj48ZGl2IGNsYXNzPSJwcm90b25tYWlsX3Np
Z25hdHVyZV9ibG9jay11c2VyIj48cCBzdHlsZT0ibWFyZ2luLWJvdHRvbTowY207bGluZS1oZWln
aHQ6MTAwJTsiPjxicj48L3A+PGRpdj4tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tPGJyPjwvZGl2PjxkaXY+PGk+TWFycmUgZGUgbGEgY2Vuc3VyZT8gTWFycmUg
ZCfDqnRyZSBwaXN0w6kgcGFyIHlvdXR1YmU/PC9pPjxicj48L2Rpdj48ZGl2PjxpPlBhc3NleiDD
oCBwZWVydHViZSAhIDotKTwvaT48YnI+PC9kaXY+PGRpdj48YSBocmVmPSJodHRwczovL2pvaW5w
ZWVydHViZS5vcmcvZnIvIj5odHRwczovL2pvaW5wZWVydHViZS5vcmcvZnIvPC9hPjxicj48L2Rp
dj48ZGl2PjxhIGhyZWY9Imh0dHBzOi8vcGVlcnR1YmUucGwvYWNjb3VudHMvYWRhbS5xdWVyL3Zp
ZGVvcyI+aHR0cHM6Ly9wZWVydHViZS5wbC9hY2NvdW50cy9hZGFtLnF1ZXIvdmlkZW9zPC9hPjxi
cj48L2Rpdj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2IGNsYXNzPSJwcm90b25tYWlsX3NpZ25h
dHVyZV9ibG9jay1wcm90b24iPlNlbnQgd2l0aCA8YSB0YXJnZXQ9Il9ibGFuayIgaHJlZj0iaHR0
cHM6Ly9wcm90b25tYWlsLmNvbSI+UHJvdG9uTWFpbDwvYT4gU2VjdXJlIEVtYWlsLjxicj48L2Rp
dj48L2Rpdj48ZGl2Pjxicj48L2Rpdj4=



--b1_f6134e1e1e359e8376020cd5fb3a8fca--


--===============2384801135503554040==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============2384801135503554040==--

