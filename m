Return-Path: <SRS0=F0uL=3T=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0338DC33CB2
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jan 2020 02:04:35 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1551A206D5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jan 2020 02:04:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=dreamofjapan.de header.i=@dreamofjapan.de header.b="CDcaS7In";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=dreamofjapan.de header.i=@dreamofjapan.de header.b="jd1yfwIi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1551A206D5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dreamofjapan.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2c91a806;
	Thu, 30 Jan 2020 01:53:29 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1ed76460
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jan 2020 10:13:21 +0000 (UTC)
Received: from dreamofjapan.de (dreamofjapan.de [45.85.216.235])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 648d21a9
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jan 2020 10:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by dreamofjapan.de (Postfix) with ESMTP id 566B11F083
 for <wireguard@lists.zx2c4.com>; Wed, 29 Jan 2020 11:13:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dreamofjapan.de;
 s=mail; t=1580292800;
 bh=CzfLhx0WtwDAOypd1kaVHFpcYaJfdTCe5Wk/gdEFj04=;
 h=Subject:From:Reply-To:To:Date:From;
 b=CDcaS7InJpq4RmShypC6Fosa7vNbqiIesxIkQtNEqIglmSjjRry1dU9zgSvOjhl4e
 CEADdpnIIQehmFgdQlXdoJztZznIVAJR3M/8mmwICA9xYIfgiiaL+vjPfX4TQwQiPt
 IWJjN+GMs43/EiqtCaHaK43roHaekQpyn9mioGec=
X-Virus-Scanned: Debian amavisd-new at dreamofjapan.de
Received: from dreamofjapan.de ([127.0.0.1])
 by localhost (mail.dreamofjapan.de [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5ed1scK0SU_t for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jan 2020 11:13:15 +0100 (CET)
Received: from hackbook-ng (unknown [80.64.187.41])
 (Authenticated sender: planung@dreamofjapan.de)
 by dreamofjapan.de (Postfix) with ESMTPSA id 30AB51EE6A
 for <wireguard@lists.zx2c4.com>; Wed, 29 Jan 2020 11:13:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dreamofjapan.de;
 s=mail; t=1580292795;
 bh=CzfLhx0WtwDAOypd1kaVHFpcYaJfdTCe5Wk/gdEFj04=;
 h=Subject:From:Reply-To:To:Date:From;
 b=jd1yfwIinhCN8g0YHOuZ2hDMGexUCHFyNIrb29n4dgiZh4IMpIEDpM6nCH2RMl4uv
 rLhNwH/eJ4WUbRmbPseGpBTaQaJG06E8dmo9qZn4y+tmk0PTZyfDkhTEK1xjlLShx9
 xU+JQe/KlEoj+tRButGV7iL4RGUR/mAthE+U8yuo=
Message-ID: <6cd7ccf2c193ee3bd1db3d5870f6982084d0d0d6.camel@dreamofjapan.de>
Subject: ArchLinux wireguard install
From: Frank Tornack <planung@dreamofjapan.de>
To: wireguard@lists.zx2c4.com
Organization: Familie Tornack
Date: Wed, 29 Jan 2020 11:13:04 +0100
MIME-Version: 1.0
User-Agent: Evolution 3.34.3 
X-Mailman-Approved-At: Thu, 30 Jan 2020 02:53:15 +0100
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: planung@dreamofjapan.de
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

aGVsbG8gYWxsLAoKSSBhcG9sb2dpemUgaW4gYWR2YW5jZSBmb3IgdGhlIHN0dXBpZCBxdWVzdGlv
biwgYnV0IEkgYW0gdmVyeSB1bnN1cmUuCkkgcmVjZWl2ZWQgYSB2b3VjaGVyIGZvciBhIFZQTiBz
ZXJ2aWNlIGF0IGEgdHJhZGUgZmFpciBhbmQgd291bGQgbGlrZQp0byB0ZXN0IGl0LiBUaGUgc2Vy
dmljZSBNdWxsdmFkIFZQTiB1c2VzIHRoZSB0ZWNobm9sb2d5IFdpcmVHdWFyZC4gQW5kCkkgdXNl
IEFyY2hMaW51eC4KCk15IHF1ZXN0aW9uIHdhcyBjcmVhdGVkIGJ5IHRoZSBBcmNoTGludXggV2lr
aS4gVGhlcmUgaXQgYWxyZWFkeSByZWZlcnMKdG8gdGhlIGtlcm5lbCA1LjYsIHdoaWNoIHNob3Vs
ZCBzdXBwb3J0IHRoaXMgZnVuY3Rpb24gd2l0aG91dCBhIG1vZHVsZS4KTm93IG15IHF1ZXN0aW9u
IGlzLCBpcyBpdCBiZXR0ZXIgdG8gd2FpdCBmb3IgdGhpcyBrZXJuZWwgb3IganVzdAppbnN0YWxs
IHRoZSBtb2R1bGU/IFdvdWxkIGl0IGJlIGEgcHJvYmxlbSBpZiBJIGZvcmdvdCB0byBkZWxldGUg
dGhlCm1vZHVsZSBhZ2Fpbj8gSSBhbSB1c2luZyB0aGUgTmV0d29yayBNYW5hZ2VyLCB3aGF0IGRv
IEkgbmVlZCB0byBiZQphd2FyZSBvZj8KCk1hbnkgdGhhbmtzIGluIGFkdmFuY2UgYW5kIHRoYW5r
IHlvdSBmb3IgZGV2ZWxvcGluZyB0aGlzIHRvb2wuCgoKLS0gCk1pdCBmcmV1bmRsaWNoZW4gR3LD
vMOfZW4KRnJhbmsgVG9ybmFjawoKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAgV2h5
IGRvbid0IHlvdSBwYWlyIGBlbSB1cCBpbiB0aHJlZXM/IC1Zb2dpIEJlcnJhCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpXaXJlR3VhcmQgbWFpbGluZyBs
aXN0CldpcmVHdWFyZEBsaXN0cy56eDJjNC5jb20KaHR0cHM6Ly9saXN0cy56eDJjNC5jb20vbWFp
bG1hbi9saXN0aW5mby93aXJlZ3VhcmQK
