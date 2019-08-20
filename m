Return-Path: <SRS0=QHSY=WV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,PI_HELLO,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C06CC3A5A4
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:37:34 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A59972080C
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:37:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NmeQcEJO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A59972080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1c8c4905;
	Sun, 25 Aug 2019 15:36:45 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 78e42e2a
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Aug 2019 04:49:43 +0000 (UTC)
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7b0034d3
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Aug 2019 04:49:43 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id w26so2578444pfq.12
 for <wireguard@lists.zx2c4.com>; Mon, 19 Aug 2019 21:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=MB4MsVKo624OPDNgCmUCdVIyj44zbbRZ14TfbnUwYt8=;
 b=NmeQcEJOHEk0lSOkqATacy9HiXbk11crkVDRVBQlJGJyha/cJTV6hUfgvADGKKtPRM
 wwyUfeqyZcAdsIMSqL+k+vVZw3H4FdcFFkQYKkAl9oFlGz08s3EzJHSDv82Bxj+9zRCp
 nW4DG0eRebJrleniBv5HT4bDF2VzxCgUHSjxau2TUFhUZxPKJXUa1IACq5WEm4qenvMg
 2MZ33Fqrx4k3dVcKQLg16ZAdN5O0zUB4b8VQwNFY3LJ4ke2vLFT2Yo2QF1DOd0jqLFZR
 6yw961kdq8RMTUomG1EDtzypJ9Cig34P35guAi98QukflBfMzsakDjza9k52jl5X7hct
 /MHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=MB4MsVKo624OPDNgCmUCdVIyj44zbbRZ14TfbnUwYt8=;
 b=UZ9LVhq8Pvm6iBpBiQhymIAkyObzMCpFIIaPLHxCE2JlnvIiczBGw7treCJk75ON2J
 vLcdNTjnbtFgYnhjDcdgpLYmrC2x8vnLcP5IGwQgZYWcwuI7ZZOCopMHKaUy6n3tNLxb
 hFiJF1uicerunSLAa/PWL51uJ+Qz56pD9Svcy5XkcNUrCB9SwHZgd1/iFPGFCCLCYimn
 L88Hkq3LpXm0DYS9imcr9ziVCVxyU1Y6Lr6xvGFeId12qvglLdlKSRwgxzRJI8hHkwjc
 uS5v8iLM0C6FmdPkhUIYf+RBz6DGkRupvwPgfEamxx9zz6CvQdt6tnfnP40EZTP1uJEN
 Fjlw==
X-Gm-Message-State: APjAAAW48LJglgyEY05seDY3DbNv0VngrxiRF2gcZyrRKnOsl/79mSUY
 YE4KF5IR26oVSm80fYsucJL/qI0W0xE=
X-Google-Smtp-Source: APXvYqyFovFnavWRWxqEViaUW8UERWElZ2ymlrAjGjzqNQTNs2A3MnRge+yS/KnL1NmcFv6iM37sow==
X-Received: by 2002:a63:6a4a:: with SMTP id f71mr7739229pgc.409.1566276582498; 
 Mon, 19 Aug 2019 21:49:42 -0700 (PDT)
Received: from [10.0.1.6] (c-73-70-224-13.hsd1.ca.comcast.net. [73.70.224.13])
 by smtp.gmail.com with ESMTPSA id
 j6sm35113908pje.11.2019.08.19.21.49.40
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 19 Aug 2019 21:49:41 -0700 (PDT)
From: Ian Morris Nieves <imnieves@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: hello all
Message-Id: <69D20D0F-66B1-4327-B401-C97C0B291C04@gmail.com>
Date: Mon, 19 Aug 2019 21:49:37 -0700
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3445.104.11)
X-Mailman-Approved-At: Sun, 25 Aug 2019 17:36:44 +0200
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

aGkgYWxsLCBteSBuYW1lIGlzIElhbiBNb3JyaXMgTmlldmVzLiAgSSBhbSBvbiBkYXkgMiBvZiBt
eSB3ZyB0cmlwLgppIGhhdmUgYSBzaW1wbGUgdHVubmVsIGdvaW5nIGJldHdlZW4gYW4gb3N4IHNl
cnZlciBhbmQgYW4gb3N4IGNsaWVudC4KCmkgYW0gdXNpbmcgdGhlIG9zeCBhcHAgaW4gdGhlIGFw
cCBzdG9yZS4KCnF1ZXN0aW9uLCBpcyB0aGlzIGFwcCBpbnRlbmRlZCBwcmltYXJpbHkgYXMgYSBj
bGllbnQgKGFuZCBub3QgYSBzZXJ2ZXIpPwppIGFzayBiZWNhdXNlIGkgd2FzIHVuYWJsZSB0byBm
aW5kIGFueSAuY29uZiBvdXRwdXQgZnJvbSB0aGUgR1VJ4oCmIGkgd291bGQgbmVlZCBzdWNoIC5j
b25mIG91dHB1dCB0byBsYXVuY2ggd2cgdmlhIGxhdW5jaGQgYXQgc3lzdGVtIHN0YXJ0dXDigKYg
ZXNwZWNpYWxseSBzaW5jZSB0aGUgZ3VpIGhhcyBubyDigJxsYXVuY2ggYXQgc3RhcnR1cOKAnSBj
aGVja2JveC4KCmFuZCBzbyBpdCBzZWVtcyB0aGF0IEkgY2FuIHVzZSB0aGUgYXBwIG9uIHRoZSBj
bGllbnQgc2lkZSwgYnV0IGZvciB0aGUgc2VydmVyIEkgYW0gZ29pbmcgdG8gbmVlZCB0byBzdGFy
dCB1c2luZyB0aGUgd2cgY29tbWFuZCBsaW5l4oCmIGlzIHRoYXQgYWJvdXQgY29ycmVjdD8KCmVp
dGhlciB3YXksIHdoZXJlIGlzIHRoZSBvc3ggYXBwIHN0b3JpbmcgdGhlIHR1bm5lbCBkYXRhPwoK
QmVzdCwKSWFuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CldpcmVHdWFyZCBtYWlsaW5nIGxpc3QKV2lyZUd1YXJkQGxpc3RzLnp4MmM0LmNvbQpodHRwczov
L2xpc3RzLnp4MmM0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3dpcmVndWFyZAo=
