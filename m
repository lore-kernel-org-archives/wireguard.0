Return-Path: <SRS0=F87Q=YJ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7395FA372D
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Oct 2019 20:15:46 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BCF0218DE
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Oct 2019 20:15:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mac.com header.i=@mac.com header.b="J+ZyD1hp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BCF0218DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mac.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dbb8e3a4;
	Wed, 16 Oct 2019 20:15:31 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8d32e3dd
 for <wireguard@lists.zx2c4.com>;
 Mon, 14 Oct 2019 14:58:39 +0000 (UTC)
Received: from ms11p00im-hyfv17281201.me.com (ms11p00im-hyfv17281201.me.com
 [17.58.38.39])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1bcf94c6
 for <wireguard@lists.zx2c4.com>;
 Mon, 14 Oct 2019 14:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mac.com; s=1a1hai;
 t=1571065116; bh=dws5pmJN5R9ct8IKDn7hARQI1qjKwcUUvP4ODvjtucY=;
 h=From:Content-Type:Subject:Message-Id:Date:To;
 b=J+ZyD1hp4LGMMyE8qaVkDcZU6BYoKMV3S2f2dCDDUPq+icKSHFj4OukH5Hy4qLjSL
 yKlVVKgi3xX/I5s3KScRh3ZsSfZIPXGA+X5Kl6nQ3KUSi3fISHRpyP+f2lcsVm4uXV
 LAn/js35IyNKlzMiD25mZs27xGUrj1Do3SA8jNl4MLgpLV5O9Q1+8VnXX/Vjc10DXc
 FFoFHj4orLNxXDjFBxooZbuJVzhXTk3QOPhnl5/X6kzwwQqizm49VWpz3dgSHdLCXQ
 iGfdHfI7TSxvSgiUS5Y3uHi8DtZuSXu1vyRqRAOSzbkB1D+YOZROUi1Un5D9r9mvNL
 geBrM/LU00HlQ==
Received: from macbook-pro.localdomain (c-73-94-133-55.hsd1.mn.comcast.net
 [73.94.133.55])
 by ms11p00im-hyfv17281201.me.com (Postfix) with ESMTPSA id 6EF57C006E9
 for <wireguard@lists.zx2c4.com>; Mon, 14 Oct 2019 14:58:36 +0000 (UTC)
From: Chase Lau <chase9@mac.com>
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3594.4.19\))
Subject: Re: WireGuard on macOS: config self-deletes
Message-Id: <D053CD7B-3542-4979-B175-51B497E55D9B@mac.com>
Date: Mon, 14 Oct 2019 09:58:35 -0500
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3594.4.19)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-14_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011 mlxscore=0
 mlxlogscore=392 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1910140137
X-Mailman-Approved-At: Wed, 16 Oct 2019 22:15:27 +0200
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

QXQgVHVlIFNlcCAzIDE3OjE4OjU3IENFU1QgMjAxOSwgTmFkaW0gS29iZWlzc2kgc2FpZCBoZSB3
YXMgaGF2aW5nIGEgcHJvYmxlbSB3aXRoIFdpcmVHdWFyZCBjb25maWd1cmF0aW9ucyBiZWluZyBw
dXJnZWQsIHNlZW1pbmdseSBvdmVyIG5pZ2h0LCB3aGlsZSBvbiBtYWNPUyAxMC4xNS4gSSBoYXZl
IGFsc28gYmVlbiBoYXZpbmcgdGhpcyBpc3N1ZSBzaW5jZSB0aGUgZmlyc3QgYmV0YSBvZiBtYWNP
UyAxMC4xNS4KClRoZXJl4oCZcyBubyBsb2dzIGluZGljYXRpbmcgYSBwcm9ibGVtIHdpdGhpbiB0
aGUgV2lyZUd1YXJkIGFwcCwgYnV0IGl0IGdvZXMgc2VlbSB0byBoYXBwZW4gYXJvdW5kIHRoZSB0
aW1lIG9mIGEgV2lyZUd1YXJkIHVwZGF0ZS4gUGVyaGFwcyBpdCBoYXMgc29tZXRoaW5nIHRvIGRv
IHdpdGggdGhlIFdpcmVHdWFyZCBjb250YWluZXIgYmVpbmcgb3ZlcndyaXR0ZW4gb24gdXBncmFk
ZT8KCkNoYXNlIExhdQpjaGFzZTlAbWFjLmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KV2lyZUd1YXJkIG1haWxpbmcgbGlzdApXaXJlR3VhcmRAbGlz
dHMuengyYzQuY29tCmh0dHBzOi8vbGlzdHMuengyYzQuY29tL21haWxtYW4vbGlzdGluZm8vd2ly
ZWd1YXJkCg==
