Return-Path: <SRS0=wYFz=3R=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D6E3C2D0DB
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Jan 2020 12:53:02 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DB0924681
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Jan 2020 12:53:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ungleich.ch header.i=@ungleich.ch header.b="rOBMqbZQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DB0924681
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ungleich.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a0a0321f;
	Tue, 28 Jan 2020 12:52:44 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d13b9362
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Jan 2020 12:52:42 +0000 (UTC)
Received: from smtp.ungleich.ch (mx.ungleich.ch [185.203.112.16])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dda1d80e
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Jan 2020 12:52:42 +0000 (UTC)
Received: from diamond.localdomain (localhost [IPv6:::1])
 by smtp.ungleich.ch (Postfix) with ESMTP id 416DF22EED;
 Tue, 28 Jan 2020 13:52:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch; s=mail;
 t=1580215961; bh=/xUZ9UQ4x2YhourP4L8vrvWcjchyqu/0ni9ueJB1MNo=;
 h=References:From:To:Cc:Subject:In-reply-to:Date:From;
 b=rOBMqbZQW5Pwcqa3X/EgKQB11spt47xwXv+YdviDprZogYl6bz+pGG4j30sBLZ10I
 az43Vav1i0IuzpXWxczDxC8WukG75NkFk9IqPYz2bkP6/famurkGHESvLm2CSINCLL
 YxcFCeFKH0GLmsRTOVxRXUHLRb3U19MB8YSnxeDOTSKOOhlwP8WFLx1SIc2UFUzuy2
 +hdtzRIREfw3kSroX+v92E8aN4gLATIIPfnDtndkNjQyTMGhg6xYd19xMruRIMgGv6
 HI0Z/74WGRZ3PrRYA6QRA/UB6ONTKciSEt9akQiW/FKc3J97avvvct1dF1KRJKKKD/
 zJPhqqEDyp4rw==
Received: by diamond.localdomain (Postfix, from userid 1000)
 id 0F5B713E2CDA; Tue, 28 Jan 2020 13:52:41 +0100 (CET)
References: <39913106ac854a2f2515aa2ad10d71ad@rfraile.eu>
 <CAHmME9ra9_gXEq4x75MZy2d0Otbs-k9g_GKHcM8d3f4+=GVy7A@mail.gmail.com>
 <CAPWNY8W4oXesE53MMDNZC092xN8nK9iyKV-pcNpvMxcH1y4LuQ@mail.gmail.com>
User-agent: mu4e 1.3.5; emacs 26.3
From: Nico Schottelius <nico.schottelius@ungleich.ch>
To: wireguard@lists.zx2c4.com
Subject: Re: [PATCH] wg-quick: Linux and FreeBSD: Add support to search domain
 in wg-quick
In-reply-to: <CAPWNY8W4oXesE53MMDNZC092xN8nK9iyKV-pcNpvMxcH1y4LuQ@mail.gmail.com>
Date: Tue, 28 Jan 2020 13:52:41 +0100
Message-ID: <878slreo9y.fsf@ungleich.ch>
MIME-Version: 1.0
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

Ckkgc2Vjb25kIE1hbnRhcyBpbiB0aGlzIHJlZ2FyZCAtIGRvbid0IGJsb2F0IHdnLXF1aWNrLCBi
dXQgYSBETlMKc2VhcmNoIHBhdGggaXMgcHJldHR5IHN0YW5kYXJkIHRvIGJlIHN1Ym1pdHRlZCBi
eSAiYSBuZXR3b3JrIi4KCldlIGFyZSBub3QgdGFsa2luZyBkaGNwIGJvb3Qgb3B0aW9ucywgZXZl
biB0aG91Z2ggTlRQIHNlcnZlcnMgd291bGQKcHJvYmFibHkgYWxzbyBtYWtlIHNlbnNlLCBpZiB5
b3Ugc2VlIHdpcmVndWFyZCBhcyBwcm92aWRpbmcgYSBuZXR3b3JrLgoKQmVzdCwKCk5pY28KCgoK
TWFudGFzIE1pa3VsxJduYXMgPGdyYXdpdHlAZ21haWwuY29tPiB3cml0ZXM6Cgo+IFRoYXQgbWln
aHQgYmUgdHJ1ZSwgYnV0IElNSE8gdGhlIGxpc3Qgb2Ygc2VhcmNoIGRvbWFpbnMgZG9lc24ndCBm
YWxsCj4gdW5kZXIgInNwZWNpYWxpemVkIG9wdGlvbnMiIOKAkyBpdCBpcyBldmVuIGRlcGxveWVk
IHZpYSBESENQIGFuZCBzaW1pbGFyCj4gbWVjaGFuaXNtcyBhbG1vc3QgYXMgY29tbW9ubHkgYXMg
dGhlIGxpc3Qgb2YgRE5TIHJlc29sdmVycyB0aGVtc2VsdmVzLAo+IHNvIGlmIGEgVlBOIGNsaWVu
dCBzdXBwb3J0cyB0aGUgbGF0dGVyIHRoZW4gaXQgbWFrZXMgc2Vuc2UgdG8gc3VwcG9ydAo+IGJv
dGguCj4KPgo+IE9uIFR1ZSwgSmFuIDI4LCAyMDIwIGF0IDEyOjM3IFBNIEphc29uIEEuIERvbmVu
ZmVsZCA8SmFzb25AengyYzQuY29tPiB3cm90ZToKPj4KPj4gSSdtIG5vdCBzbyBzdXJlIHRoYXQg
d2Ugd2FudCB0byBmaWxsIHdnLXF1aWNrKDgpIHVwIHdpdGggZXZlcnkgZG5zCj4+IG5vYi4uLiBJ
ZiB5b3UgaGF2ZSBzcGVjaWFsaXplZCBuZXR3b3JraW5nIHJlcXVpcmVtZW50cywgd2ctcXVpY2so
OCkgaXMKPj4gcHJvYmFibHkgbm90IGZvciB5b3UgYW55d2F5Lgo+PiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBXaXJlR3VhcmQgbWFpbGluZyBsaXN0
Cj4+IFdpcmVHdWFyZEBsaXN0cy56eDJjNC5jb20KPj4gaHR0cHM6Ly9saXN0cy56eDJjNC5jb20v
bWFpbG1hbi9saXN0aW5mby93aXJlZ3VhcmQKCgotLQpNb2Rlcm4sIGFmZm9yZGFibGUsIFN3aXNz
IFZpcnR1YWwgTWFjaGluZXMuIFZpc2l0IHd3dy5kYXRhY2VudGVybGlnaHQuY2gKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KV2lyZUd1YXJkIG1haWxpbmcg
bGlzdApXaXJlR3VhcmRAbGlzdHMuengyYzQuY29tCmh0dHBzOi8vbGlzdHMuengyYzQuY29tL21h
aWxtYW4vbGlzdGluZm8vd2lyZWd1YXJkCg==
