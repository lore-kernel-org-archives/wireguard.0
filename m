Return-Path: <SRS0=PPAX=MS=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9578C65C31
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  6 Oct 2018 13:41:14 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3D8321473
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  6 Oct 2018 13:41:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="X+xHpCtE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3D8321473
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 975ff2a8;
	Sat, 6 Oct 2018 13:40:39 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cd95b418
 for <wireguard@lists.zx2c4.com>; Sat, 6 Oct 2018 13:40:34 +0000 (UTC)
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9df82b4d
 for <wireguard@lists.zx2c4.com>; Sat, 6 Oct 2018 13:40:34 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id u34-v6so16749846qth.3
 for <wireguard@lists.zx2c4.com>; Sat, 06 Oct 2018 06:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=IRk9t9mcgVBmFr+XqYsmAGfnKwdLWAeLleYYq2h9uIw=;
 b=X+xHpCtEGH8IPFZsOIXmHsDn3gy2OiqsTXiOG0yaChcBkbIZ9b94jm/M6r64sgz0lH
 ONBj2x0Npxt6e1vU78Q02C4t9AT2QfqoW+tBcF3Gr56cBzLo6d2RAaZlTx9GSZZomldC
 ofORNekNgQgZ5PPhO4uMFHLJLxqiTACGCsoMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=IRk9t9mcgVBmFr+XqYsmAGfnKwdLWAeLleYYq2h9uIw=;
 b=WRCjE9mnQIwb7NOofOWVhI9oykyAQC9g0dU26ApvrWXuH/Uuctdw+nvtKzFYGEUnt4
 /G/iSi3o3GK6QGod3k2K3nvtX2Ss5JUR0lXKWRt3tDXm60WqZ/hyn7Zhub9lR6s4Xmie
 JhCwOSFJPRbze6WcR5MFK+JEfqKqA5CnaSWba3SVBh8tPjIBh3Wphc7ijy4LERMqeJth
 6uIRAlCSz+AWqL2lfJ07gFwoOrr5ZNImiu0YO9y8NM/Cabrg8cbdgOnbpwc1wLSF1qZV
 huP74/w+icIDmU8TitrX5RGukhL6dR+oV5sVQFW21iK4EMypy88qAfu48QvJFH3POQ0A
 WHbg==
X-Gm-Message-State: ABuFfoi1Lb+d6hxUZ9Z7GC2HAtlvlWBWOUiI0aEI1Bqxob8hXzvlX/U4
 z3K88mzHCVnoo6Ww9Nf1GA1kXg==
X-Google-Smtp-Source: ACcGV61RJqpgKW2VEbAPJihfW1gZjo+eA5TQSNsVeHan/PLk29FIXg6o6dCs0ssxEoux9dB/0LBL1Q==
X-Received: by 2002:ac8:f57:: with SMTP id
 l23-v6mr13134044qtk.158.1538833265792; 
 Sat, 06 Oct 2018 06:41:05 -0700 (PDT)
Received: from puremoods ([185.232.22.59])
 by smtp.gmail.com with ESMTPSA id f11-v6sm2429124qkb.47.2018.10.06.06.41.04
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 06 Oct 2018 06:41:05 -0700 (PDT)
Date: Sat, 6 Oct 2018 09:41:02 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Brian Candler <b.candler@pobox.com>
Subject: Re: Sending just ssh traffic via wg
Message-ID: <20181006134102.GA10369@puremoods>
Mail-Followup-To: Brian Candler <b.candler@pobox.com>,
 wireguard@lists.zx2c4.com
References: <mailman.1.1538820001.22807.wireguard@lists.zx2c4.com>
 <3a187f3e-faa8-fcb2-4d14-a07fe9781809@pobox.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3a187f3e-faa8-fcb2-4d14-a07fe9781809@pobox.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: wireguard@lists.zx2c4.com
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

T24gU2F0LCBPY3QgMDYsIDIwMTggYXQgMTE6MjE6MDFBTSArMDEwMCwgQnJpYW4gQ2FuZGxlciB3
cm90ZToKPiBNeSBldmVuIG1vcmUgc3R1cGlkIHF1ZXN0aW9uIGlzICJ3aHkgdXNlIHdpcmVndWFy
ZCBpZiB0aGUgb25seSB0aGluZyBpdCdzCj4gY2FycnlpbmcgaXMgc3NoPyIgLSBidXQgSSBndWVz
cyBpdCdzIGEgY29udmVuaWVudCB3YXkgdG8gdHVubmVsIHRvIGEgbmV0d29yawo+IHdoaWNoIGRv
ZXNuJ3QgaGF2ZSBwdWJsaWMtcm91dGVkIGFkZHJlc3Nlcy4KClJpZ2h0IC0tIGFuZCBJIGFsc28g
ZG9uJ3Qgd2FudCB0byBleHBvc2Ugc3NoIHBvcnRzIHRvIHRoZSB3b3JsZCB3aGVuIG5vdApuZWNl
c3NhcnkuIEl0J3Mgc3RpbGwgYSByb290LXBlcm1zIGRhZW1vbiB3aXRoIGEgKHJlbW90ZSkgcG9z
c2liaWxpdHkgb2YKdW5rbm93biB2dWxuZXJhYmlsaXRpZXMgaW4gaXQuCgo+IChBc2lkZTogSSB3
aXNoIHNzaCBoYWQgYSBmZWF0dXJlIGxpa2UgU05JLCBzbyB0aGF0IHlvdSBjb3VsZCBidWlsZCBh
biBzc2gKPiBwcm94eSB0aGF0IGZvcndhcmRzIGluY29taW5nIGNvbm5lY3Rpb25zIHRvIHRoZSBy
aWdodCBob3N0LsKgIEkgaGF2ZSBkb25lCj4gdGhpcyBiZWZvcmUgdXNpbmcgYW4gaW5ib3VuZCBT
T0NLUyBwcm94eSwgYnV0IGl0J3MgbWVzc3kgdG8gdXNlKQoKSXQgYWxzbyBoYXMgaW1wb3J0YW50
IGRvd25zaWRlcyB0aGF0IGFyZSBzaW1pbGFyIHRvIHRob3NlIGluIHNzaCBiYXN0aW9uCmhvc3Rz
LiBXaGVuIHlvdSB1c2UgYSBwcm9wZXIgVlBOLCBldmVyeSB1c2VyIGdldHMgdGhlaXIgb3duIGlu
dGVybmFsIElQCmFkZHJlc3MsIHNvIHRoZWlyIHRyYWZmaWMgY2FuIGJlIHN0aWxsIGVhc2lseSBk
aXN0aW5ndWlzaGVkIGZyb20gdHJhZmZpYwpiZWxvbmdpbmcgdG8gYW5vdGhlciBhZG1pbi4gVGhp
cyBpcyB1c2VmdWwgZm9yIGF1ZGl0aW5nIHJlYXNvbnMgYW5kIGZvcgppZGVudGlmeWluZyB1bnVz
dWFsIGFjdGl2aXR5IChlLmcuIEFsZXggbm9ybWFsbHkgYWNjZXNzZXMgaG9zdHMKYmVsb25naW5n
IHRvIHByb2plY3QgWCwgYnV0IHN1ZGRlbmx5IHN0YXJ0cyBhY2Nlc3NpbmcgYSBsb3Qgb2YgaG9z
dHMKdGhhdCBiZWxvbmcgdG8gcHJvamVjdCBZKS4gV2l0aCBiYXN0aW9uIGhvc3RzIG9yIHdpdGgg
RE5BVC1pbmcgcHJveGllcwp0aGlzIGF1ZGl0aW5nIGJlY29tZXMgaW1wb3NzaWJsZSwgc2luY2Ug
YWxsIHRyYWZmaWMgY29tZXMgZnJvbSB0aGUgc2FtZQpJUC4KCi1LCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCldpcmVHdWFyZCBtYWlsaW5nIGxpc3QKV2ly
ZUd1YXJkQGxpc3RzLnp4MmM0LmNvbQpodHRwczovL2xpc3RzLnp4MmM0LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL3dpcmVndWFyZAo=
