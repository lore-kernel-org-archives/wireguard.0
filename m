Return-Path: <SRS0=QHSY=WV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CCD2C3A5A1
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:59:10 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 201692070B
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:59:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="srFmNuAw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 201692070B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 309ddf64;
	Sun, 25 Aug 2019 15:58:32 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fbfc41ea
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 15:58:30 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a561edeb
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 15:54:15 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 89c0b0e7
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 15:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type:content-transfer-encoding; s=mail; bh=sqqwS5zKUCWc
 0Y30TLm33GLDE3k=; b=srFmNuAwOjZkeN/5y25j9szTMTyRKc0WFqeWGl5lqozN
 SSOZfC9DtDs0yzWF2C/uO/dkdpjAUGY8WIy2CQiGaCVi6x/Us6nTmpqFuBfYdVBa
 3M3DR9QBpodBlpexLySUq/zKvAjpXZftnUlBrLmvncS/0Xwe2UQ7+Cx+lTpv4MKs
 8GaTF9p976uQX+t8OFVoDqFkBImtJWtLVN/xzYIrw5ffqxc/uZPaYtmon0r94xtg
 WJB0Lqpmc+XK21ChBWIXF0nouLO8rRahyj3lNHhMDMsyuDi9RFYda2IuM4AsAx0t
 5NV2ZYHrhonWGdj8W+hJbhGCouuxBcPIJxLKLdEmoQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e3fd43c6
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 15:12:27 +0000 (UTC)
Received: by mail-ua1-f41.google.com with SMTP id m8so2105007uap.2
 for <wireguard@lists.zx2c4.com>; Sun, 25 Aug 2019 08:54:15 -0700 (PDT)
X-Gm-Message-State: APjAAAWDEGiBpOqw9Os+/VUDa2cHASKFHTd3run2vJ+iE7cII6zAhL2k
 xAZfLJz8AMin3w6m/You7OwkJxKZ9DpSNpfL8mQ=
X-Google-Smtp-Source: APXvYqylqcv9i/Z6ZJhGmIpJm+Q3ypAZLSH8U9/5ATJoP9iQZRCX5EEQd3GyU6Mc3iy78IrYhY/nsp9xO0uGDHcax3Q=
X-Received: by 2002:ab0:290a:: with SMTP id v10mr6912901uap.74.1566748455089; 
 Sun, 25 Aug 2019 08:54:15 -0700 (PDT)
MIME-Version: 1.0
References: <036a01d54abe$4c049cb0$e40dd610$@lindenberg.one>
In-Reply-To: <036a01d54abe$4c049cb0$e40dd610$@lindenberg.one>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 25 Aug 2019 09:54:03 -0600
X-Gmail-Original-Message-ID: <CAHmME9r6XdEMUxwq5p9S0pcC4d6dneM5pcv6bU0H0MHEMzP9SA@mail.gmail.com>
Message-ID: <CAHmME9r6XdEMUxwq5p9S0pcC4d6dneM5pcv6bU0H0MHEMzP9SA@mail.gmail.com>
Subject: Re: Hyper-V 2019: unable to create wintun device: no interfaces found
To: Joachim Lindenberg <wireguard@lindenberg.one>,
 Simon Rozman <simon@rozman.si>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

T24gU3VuLCBBdWcgMjUsIDIwMTkgYXQgOTozNCBBTSBKb2FjaGltIExpbmRlbmJlcmcKPHdpcmVn
dWFyZEBsaW5kZW5iZXJnLm9uZT4gd3JvdGU6Cj4KPiBIZWxsbywKPgo+IEkgYW0gdXNpbmcgV2ly
ZWd1YXJkIGZvciBxdWl0ZSBzb21lIHRpbWUgb24gVWJ1bnR1LCBhbmQgYW0gbm93IHRyeWluZyB0
byB1c2UgaXQgb24gSHlwZXItViAyMDE5IGFzIHdlbGwuIE15IGdvYWwgaXMgdG8gc2V0IHVwIGEg
VlBOIGJldHdlZW4gdHdvIEh5cGVyLVYgc3lzdGVtcyBhbmQgYWxsb3cgY29ubmVjdGlvbnMgYmV0
d2VlbiB0aGUgdmlydHVhbCBtYWNoaW5lcyBob3N0ZWQgKGluY2x1ZGluZyBTYW1iYSBBRCBEQ3Mp
Lgo+Cj4gSSBkb3dubG9hZGVkIGFuZCBpbnN0YWxsZWQgV2lyZWd1YXJkIGZvciBXaW5kb3dzLCBh
bmQgY3JlYXRlZCBhIHR1bm5lbCBjb25maWd1cmF0aW9uIG9uIHNlcnZlciBhbmQgY2xpZW50LiBI
b3dldmVyIHdoZW4gSSB0cnkgdG8gYWN0aXZhdGUgYW55IG9mIHRoZXNlLCBJIGdldCB0aGUgbWVz
c2FnZSDigJxVbmFibGUgdG8gY3JlYXRlIFdpbnR1biBkZXZpY2U6IG5vIGludGVyZmFjZXMgZm91
bmTigJ0gb24gYm90aCBzaWRlcy4KPgo+IFRvIG1lIGl0IGRvZXNuwrR0IGxvb2sgIGxpa2UgYW4g
aXNzdWUgd2l0aCB0aGUgY29uZmlndXJhdGlvbiBidXQgbW9yZSBsaWtlbHkgV2luVHVuIGlzIG1p
c3NpbmcgKHRyaWVkIHRvIGRvd25sb2FkIHNlcGFyYXRlbHksIGJ1dCBhcyBpdCBpcyBhIC5tc20g
SSBhc3N1bWUgdGhhdCBpcyBpbmNsdWRlZCBpbiB3aXJlZ3VhcmQgaW5zdGFsbGF0aW9uKSBvciBk
b2VzIG5vdCB3b3JrIHdpdGggSHlwZXItViAyMDE5Lgo+Cj4gQW55IHN1Z2dlc3Rpb24/Cj4KPiBU
aGFua3MsIEpvYWNoaW0KCkludGVyZXN0aW5nLiBXZSBqdXN0IHJld29ya2VkIHRoZSBXaW50dW4g
aW5zdGFsbGF0aW9uIHByb2Nlc3MsIHRvCmhvcGVmdWxseSBtYWtlIGl0IG1vcmUgcmVsaWFibGUu
IENvdWxkIHlvdSB0cnkgYWdhaW4sIGFuZCBwZXJoYXBzCnByb3ZpZGUgYSBiaXQgb2YgbG9nZ2lu
ZyB0b28/CgpUcnkgcnVubmluZyB0aGlzOgoKbXNpZXhlYyAvbG9nIHNlbmQtdG8tamFzb24tcGxl
YXNlLnR4dCAvaQpodHRwczovL2Rvd25sb2FkLndpcmVndWFyZC5jb20vd2luZG93cy1jbGllbnQv
d2lyZWd1YXJkLWFtZDY0LTAuMC4yMi5tc2kKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KV2lyZUd1YXJkIG1haWxpbmcgbGlzdApXaXJlR3VhcmRAbGlzdHMu
engyYzQuY29tCmh0dHBzOi8vbGlzdHMuengyYzQuY29tL21haWxtYW4vbGlzdGluZm8vd2lyZWd1
YXJkCg==
