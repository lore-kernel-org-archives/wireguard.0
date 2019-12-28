Return-Path: <SRS0=tjFT=2S=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28F1FC2D0C8
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 28 Dec 2019 20:53:34 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70FA0207E0
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 28 Dec 2019 20:53:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=web.de header.i=@web.de header.b="al7B+8Yj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70FA0207E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eb4edf28;
	Sat, 28 Dec 2019 20:53:31 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2c549b01
 for <wireguard@lists.zx2c4.com>;
 Sat, 28 Dec 2019 20:53:28 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 48d0f768
 for <wireguard@lists.zx2c4.com>;
 Sat, 28 Dec 2019 20:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1577566407;
 bh=Z9ObfUvbV5LJFTf93e9C4Fso0p4KqU4NJDiqVmvkuxA=;
 h=X-UI-Sender-Class:Subject:To:References:From:Date:In-Reply-To;
 b=al7B+8Yj89H2EiDM80dJwYmFFJM60/FCM55ui8CnwKwxXbg1Dyb3IZqc5i94aibl+
 kvjZU4ADEylvOlHtnhwpzx9Sj9xaTOT2UQIwG9h6558Z+bCifG5mK1Teb6F7FC4TUG
 VGEY6iQ7ocvY5eTHMP8mPCpSOsnZXWI3JeKmhjUs=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.178.34] ([80.135.80.47]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MaJgG-1j52rf1E0O-00JsDE for
 <wireguard@lists.zx2c4.com>; Sat, 28 Dec 2019 21:53:27 +0100
Subject: Re: remove peer endpoint
To: wireguard@lists.zx2c4.com
References: <CtiLrRxfJF8VjxK15ZVRrI9eJBflmVjOBKiOTYAHVAmF7lVPMuQvg3luFb89M3FKdy2fvemWnkfXd-LRJ1MCGy0GC2TddQuX0-Wga9hBS_4=@protonmail.com>
 <A02FDAAF-B405-4735-9DD1-95A7F6CE9B3F@lonnie.abelbeck.com>
 <bWad1d4zSz8UESfEBgTLTfDZQbC9-fLXfJF2R3GoONB9PuL3WjNnYrnFQOYmt-gQa9sLLMDJJ8p6zY8XEUlXxxudvzNC5OUjuG75yjbBMIY=@protonmail.com>
From: em12345 <em12345@web.de>
Autocrypt: addr=em12345@web.de; prefer-encrypt=mutual; keydata=
 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
Message-ID: <c58f53cd-5e9e-1008-97cc-ef160d35ce60@web.de>
Date: Sat, 28 Dec 2019 21:53:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <bWad1d4zSz8UESfEBgTLTfDZQbC9-fLXfJF2R3GoONB9PuL3WjNnYrnFQOYmt-gQa9sLLMDJJ8p6zY8XEUlXxxudvzNC5OUjuG75yjbBMIY=@protonmail.com>
Content-Language: en-US
X-Provags-ID: V03:K1:7QNo9AG3+7vlvL/9+hxdl/ngp3HnKkmp1jBAOmQ5U+CxTLkbmNR
 VrLUpmjvCBTgSA4X0RixB/0ek64eHFmPEIpTdNB9/LSjnMxmKuOMDTtobjPYGDQE/GBgAr0
 dfXX6KdrbHe61RwpVK9KshmVX0xIzUGSzNdldEcnrWwYc5kuNy5eGy2h3S1epCTDl9P8F43
 GOKdwsu7qrKclmXPr/QVA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/lIke+GIegQ=:Mc7HR9BJCzXeWGuoYp+FrQ
 Z/lT6liMaSsEdcs29wi7y1puObGMXL6nFclK4hQwuyj6EyqW32JI1B3+kwQVK189MyjLcT6vR
 bADLpd404KrYWI/U0GJ4/IPaOg4AOGww/oOVdUCCKi8Qgarzj2i+WjFFRDEpU8C0g7Jl3/H8n
 vAxbcDpqGGRzJxh4nv175RApez2WE1JPhmikzrNvIFvsFfIRbVr0erEcryLyNMHBtmm9qoRoB
 fvYdTg3Zc1ZBrSLxrD1MhLxDOMCy9pWPRC1HQkBRBhln7ccCtBEY70RjC8NIVKpflW7TA7AOv
 FQl9H8Zfig6jZDVgfHY0lg3VKcd5DF60EtgBJgJkEQXuHdh5/rSUwpEoCNBrwAIbkICtpI2dH
 4pOk45+A6Z8VVUOZw+avAAOSMt1jzgXtWXrstD0qro77JoQ7W1UgDYi4Eu9pb8Ra30Rlqp3bT
 yPu32/m8T1hgZKwo0ZEE8CKGez3Ovmbm7yjggwZVDawqJoHDzaTlg1qIU9EAIbG2xXjSiUqdj
 BeQkZigBiRMEjV3i0zG909gpWmeYLTzStUTXNGs6FDpqDws9OAYiwTujnVRhPaCSZDPB5w1yE
 IJ5KG8pP0YisWesMBa9kBWOWgUd12cbYs84UcsC2fbeXGfw9IH3o7jQQIGlp1Jfl/EK5HMm4i
 6ldgnTM39SZ3SYvVDjuASPCNrkwiskvec8DhYjujvcZCjFbhj9tVQ9/hCM1bCKQrSdatkSELi
 8KHga3iwfZEebBjv1rmapLk2Pdb8mdZtdPJAS2Mra+mMJ9hPkXlUvYSqenBxenElZ7QZKoZ8r
 eSWWo+4TeFdsa5k6SBGH1PS+qg6qME/vDV8Ek7yQN7U9DKqrCht7XnnvhiRT3z3bjp6423vKL
 m6ckXN9pIYS1sblBW5jd3zRfD/tQev0U8pNsiJYPcCRA4kJ5tFxnn8P2vTQcIMsrbgf4BDIOt
 Ji2KtkRXiCRpkyA3LyzTVQToPIjg0Pu+pwBJ/7v7aRPnO++44uzKj2SzeqN2kh1BpPU4wtHJN
 7vu+zQ+rQ0VN/tROdmtiiQNkhq/aG3Hql11DRcsqOKqTnzV6QrmfdhYXqt8EgZ3QNUbfRJaQG
 zrEVaAkZtqAhZe5koDblKv3nw4PRoLI1VurbqwIjtz2XOBfOXh1uHM8glufMeHsqkgYN+kG+q
 ++VjoVv9d0foseLUEKkM0QF+J85fxSo2zeAMMaZmnAxZKIXNAJ+3+kYBlsJHJxzYsWrcw/YJh
 R7zRQgW/rUMQibH5QQ75AQrbSL6BuPa73YShkSA==
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

SGksCgpob3cgYWJvdXQgc2V0dGluZyB0aGUgcGVlcnMgZW5kcG9pbnQgdG8gYW55IGxvY2FsIElQ
ICgxMjcuMC45OS4xKT8KSSdtIHNldHRpbmcgdGhlIHBlZXJzIGVuZHBvaW50IGluaXRpYWxseSB0
byAxMjcuMC4xLjEsIGFuZCBvbmx5IGxhdGVyIEkKcmVzb2x2ZSB0aGUgaG9zdG5hbWUgb2YgdGhl
IGVuZHBvaW50IGFuZCB1cGRhdGUgdG8gdGhhdCBJUC4KQmVjYXVzZSBpbiBteSBjYXNlIEkgbmVl
ZCBtb3JlIGNvbnRyb2wgb2YgdGhlIHJlc29sdmluZyBwcm9jZXNzLCB0aGFuCnN0YW5kYXJkICJ3
ZyIgc3VwcGxpZXMuCgoKLS0KRW1tYW51ZWwKCgoKT24gMjAxOS0xMi0yNyAxOToyOCwgRGV2aW4g
U21pdGggd3JvdGU6Cj4gSWYgSSdtIG5vdCBtaXN0YWtlbiwgYHdnIHNldCA8aW50ZXJmYWNlPiBw
ZWVyIDxiYXNlNjQ+IHJlbW92ZWAgcmVtb3ZlcyB0aGUgd2hvbGUgcGVlciAtIEknbSBsb29raW5n
IHRvIHJlbW92ZSBqdXN0IHRoZSBwZWVyJ3MgZW5kcG9pbnQgYXR0cmlidXRlIFtlbmRwb2ludCA8
aXA+Ojxwb3J0Pl0uCj4KPiDigJDigJDigJDigJDigJDigJDigJAgT3JpZ2luYWwgTWVzc2FnZSDi
gJDigJDigJDigJDigJDigJDigJAKPiBPbiBGcmlkYXksIERlY2VtYmVyIDI3LCAyMDE5IDEwOjUx
IEFNLCBMb25uaWUgQWJlbGJlY2sgPGxpc3RzQGxvbm5pZS5hYmVsYmVjay5jb20+IHdyb3RlOgo+
Cj4+PiBPbiBEZWMgMjcsIDIwMTksIGF0IDk6NTEgQU0sIERldmluIFNtaXRoIGRldmlucnNtaXRo
QHByb3Rvbm1haWwuY29tIHdyb3RlOgo+Pj4gSXMgaXQgcG9zc2libGUgdG8gcmVtb3ZlIHRoZSBl
bmRwb2ludCBvZiBhIHBlZXIgdmlhIHRoZSBgd2cgc2V0YCBjb21tYW5kPyBBbGwgb2YgdGhlIG90
aGVyIHBlZXIgYXR0cmlidXRlcyAocHJlc2hhcmVkLWtleSwgcGVyc2lzdGVudC1rZWVwYWxpdmUs
IGFsbG93ZWQtaXBzKSBhcmUgcmVtb3ZhYmxlIGluIHRoaXMgZmFzaGlvbiAoYW5kIGRvY3VtZW50
ZWQgaW4gdGhlIG1hbiBwYWdlKS4gSSd2ZSB0cmllZCBgd2cgc2V0IDxpbnRlcmZhY2U+IHBlZXIg
PGJhc2U2NC1wdWJsaWMta2V5PiBlbmRwb2ludCAwYCAuLi4KPj4KPj4gWWVzLCB0aGlzIHdvcmtz
Ogo+Pgo+PiAtLS0tLS0tLS0tLS0tLS0tLS0tCj4+Cj4+IHdnIHNldCA8aW50ZXJmYWNlPiBwZWVy
IDxiYXNlNjQtcHVibGljLWtleT4gcmVtb3ZlCj4+IC0tCj4+Cj4+IElmIHlvdSBmb3JnZXQsICJ3
ZyBzZXQgLS1oZWxwIiB3aWxsIHJlbWluZCB5b3UuCj4+Cj4+IExvbm5pZQo+Cj4KPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IFdpcmVHdWFyZCBtYWls
aW5nIGxpc3QKPiBXaXJlR3VhcmRAbGlzdHMuengyYzQuY29tCj4gaHR0cHM6Ly9saXN0cy56eDJj
NC5jb20vbWFpbG1hbi9saXN0aW5mby93aXJlZ3VhcmQKPgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpXaXJlR3VhcmQgbWFpbGluZyBsaXN0CldpcmVHdWFy
ZEBsaXN0cy56eDJjNC5jb20KaHR0cHM6Ly9saXN0cy56eDJjNC5jb20vbWFpbG1hbi9saXN0aW5m
by93aXJlZ3VhcmQK
