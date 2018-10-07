Return-Path: <SRS0=x3Nk=MT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6925DC46475
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Oct 2018 02:47:29 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA60D20875
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Oct 2018 02:47:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=poorlab.com header.i=@poorlab.com header.b="Vqyluzp2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA60D20875
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=poorlab.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 97f138bc;
	Sun, 7 Oct 2018 02:46:50 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b92ddf46
 for <wireguard@lists.zx2c4.com>; Sun, 7 Oct 2018 02:46:48 +0000 (UTC)
Received: from m32-4.eu.mailgun.net (m32-4.eu.mailgun.net [141.193.32.4])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9120b8e9
 for <wireguard@lists.zx2c4.com>; Sun, 7 Oct 2018 02:46:48 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=poorlab.com; q=dns/txt;
 s=mailo; t=1538880443; h=Content-Transfer-Encoding: Content-Type: Cc:
 To: Subject: Message-ID: Date: From: In-Reply-To: References:
 MIME-Version: Sender; bh=XvJTUFSFpiLZy46D9rt3NwvYGX62QNdOppUtNxD5NTs=;
 b=Vqyluzp21hRuIubYSO5UwaK6Kdly4D2uqpqrLzpol2LQe48Uat4goV7Rzu1xwvsfVbETP+cK
 TOCpAPJ3kti49143zCWdI36MptIa86EqONEOY4NUFP5LhZZzo1dHEomAwuQs8n2C3nIVOZPl
 cnyLwS94+l9nimqyCAWPuxGTKbs=
X-Mailgun-Sending-Ip: 141.193.32.4
X-Mailgun-Sid: WyJkNWMyNiIsICJ3aXJlZ3VhcmRAbGlzdHMuengyYzQuY29tIiwgImJiMCJd
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by mxa.mailgun.org with ESMTP id 5bb973b9.7fd018497eb0-smtp-out-n01;
 Sun, 07 Oct 2018 02:47:21 -0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id q40-v6so17807165qte.0
 for <wireguard@lists.zx2c4.com>; Sat, 06 Oct 2018 19:47:21 -0700 (PDT)
X-Gm-Message-State: ABuFfog+qsnr1a580SIFpuXGgslNvz99qblCmsBMQfEHBkrHyr9kxgua
 d0VZcF5arh+hBOc6Qi1O6d0AyS49RllDHQTCKoQ=
X-Google-Smtp-Source: ACcGV63m5RnwPmu85wfZp4NxzwzA/4K3rf4dYGRJokiPkbEdjU09Eh/HeQ3FjvV16uEwUUb+HqywKUVp8tJSFuWgz/4=
X-Received: by 2002:ac8:4804:: with SMTP id
 g4-v6mr14868261qtq.66.1538880440701; 
 Sat, 06 Oct 2018 19:47:20 -0700 (PDT)
MIME-Version: 1.0
References: <8531EC91-607C-4525-863F-31CDD9FCC791@gmail.com>
In-Reply-To: <8531EC91-607C-4525-863F-31CDD9FCC791@gmail.com>
From: StarBrilliant <coder@poorlab.com>
Date: Sun, 7 Oct 2018 10:46:42 +0800
X-Gmail-Original-Message-ID: <CA+7UkwJ2Rm668-v8R9P4XAGvZh5NnRDSHH08O+rS_G8Q5N99OQ@mail.gmail.com>
Message-ID: <CA+7UkwJ2Rm668-v8R9P4XAGvZh5NnRDSHH08O+rS_G8Q5N99OQ@mail.gmail.com>
Subject: Re: Private and public keys generation
To: wireguard@lists.zx2c4.com
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

T24gU3VuLCBPY3QgNywgMjAxOCBhdCA5OjEzIEFNIEV2Z2VuaXkgSXZhbm92IDxlNjAxODA5QGdt
YWlsLmNvbT4gd3JvdGU6Cj4KPiBIaSBldmVyeWJvZHksCj4KPiBJ4oCZbSBhYmxlIHRvIGdlbmVy
YXRlIHRoZSBwcml2YXRlIGtleXMgcHJldHR5IHN0cmFpZ2h0Zm9yd2FyZCB3aXRoIGFueSB0b29s
IEkgbGlrZSAoZWc6IGRkIGlmPS9kZXYvdXJhbmRvbSBicz0zMiBjb3VudD0xIDI+L2Rldi9udWxs
IHwgYmFzZTY0KQo+Cj4gQnV0IG5vdywgSeKAmW0gbW9yZSBjdXJpb3VzIGFib3V0IGdlbmVyYXRp
bmcgdGhlIHB1YmxpYyBrZXlzIHdpdGhvdXQgdXNpbmcgd2cgcHVia2V5IGRpcmVjdGx5LiBBbnkg
dGhvdWdodHM/Cj4KPiBUaGFua3MhCj4KPiAtLQo+IEJlc3QgUmVnYXJkcywKPiBFdmdlbml5IEl2
YW5vdgoKCkhpIEV2Z2VuaXksCgpUcnkgdGhpcyBQeXRob24gY29kZToKaHR0cHM6Ly9naXRodWIu
Y29tL20xMzI1My9WeFdpcmVndWFyZC1HZW5lcmF0b3IvYmxvYi8xODU5ZTFlZDE5OWIwNjc3NjRi
YjI5YjdiNWNkMzMyMDM3ZjVhNjY1L3Z3Z2VuL2NvbW1vbi5weSNMMjM2CgpTZWUgdGhlIGZ1bmN0
aW9uICJnZW5rZXkiIGFuZCAicHVia2V5Ii4KCkJlc3QgcmVnYXJkcywKU3RhckJyaWxsaWFudApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpXaXJlR3VhcmQg
bWFpbGluZyBsaXN0CldpcmVHdWFyZEBsaXN0cy56eDJjNC5jb20KaHR0cHM6Ly9saXN0cy56eDJj
NC5jb20vbWFpbG1hbi9saXN0aW5mby93aXJlZ3VhcmQK
