Return-Path: <SRS0=1cLN=MU=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,FREEMAIL_REPLYTO_END_DIGIT,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D554DC65C20
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  8 Oct 2018 12:00:12 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C73352075C
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  8 Oct 2018 12:00:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=protonmail.ch header.i=@protonmail.ch header.b="IqXccEy+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C73352075C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4de544bd;
	Mon, 8 Oct 2018 11:59:23 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2a5c5601
 for <wireguard@lists.zx2c4.com>; Mon, 8 Oct 2018 11:59:21 +0000 (UTC)
Received: from mail-40135.protonmail.ch (mail-40135.protonmail.ch
 [185.70.40.135])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 43232ece
 for <wireguard@lists.zx2c4.com>; Mon, 8 Oct 2018 11:59:20 +0000 (UTC)
Date: Mon, 08 Oct 2018 11:59:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
 s=default; t=1539000006;
 bh=Kdcv4TX2T3rfMABYrGgImvoJfRK6GEfYpoO9kNaFhBw=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=IqXccEy+KBLCBi4act3g6+Nuq96s3XN5Z/LbouZp02FQrTLiUYYzqwep8WFWmA8RH
 WvoSbcs+5elWhTgrS8HsbSr3UR/MugjCXc9WjV8uAqu+NIDiLuDs+dg0JgD4AsXDFi
 lO7eUEf/CdoAQp3doe0hnFDf0U8kGKkw855G1PpU=
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
From: Jordan Glover <Golden_Miller83@protonmail.ch>
Subject: Re: [ANNOUNCE] WireGuard Snapshot `0.0.20181007` Available
Message-ID: <AozBfUAj9R6CBOxNr3tbIBtvuptN8Mbtw2ataw0oMolR1d_6hCM_w1NYAUwvRs3c7k7jiOqQcG1S84tidhGtoj6QFz3BXbnHrcCXeNv8qGs=@protonmail.ch>
In-Reply-To: <CAHmME9qboTvSU1+bu8Oi-zwBp8f6UWnfaGb-NEtfsnvnJUL66w@mail.gmail.com>
References: <6b314daa5d672a51@frisell.zx2c4.com>
 <8j30b7w3yIgg5rmXSRUNlDH8yquzSydWwqfdQrnRe-T7mK5e_lYfD2v5IKjgHVAcWptoOVXZ_wENwJ1i733Yn45_TjlMg7Tf_WmW7Dkeuco=@protonmail.ch>
 <CAHmME9qboTvSU1+bu8Oi-zwBp8f6UWnfaGb-NEtfsnvnJUL66w@mail.gmail.com>
Feedback-ID: QEdvdaLhFJaqnofhWA-dldGwsuoeDdDw7vz0UPs8r8sanA3bIt8zJdf4aDqYKSy4gJuZ0WvFYJtvq21y6ge_uQ==:Ext:ProtonMail
MIME-Version: 1.0
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: Jordan Glover <Golden_Miller83@protonmail.ch>
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

4oCQ4oCQ4oCQ4oCQ4oCQ4oCQ4oCQIE9yaWdpbmFsIE1lc3NhZ2Ug4oCQ4oCQ4oCQ4oCQ4oCQ4oCQ
4oCQCk9uIE1vbmRheSwgT2N0b2JlciA4LCAyMDE4IDEyOjM3IEFNLCBKYXNvbiBBLiBEb25lbmZl
bGQgPEphc29uQHp4MmM0LmNvbT4gd3JvdGU6Cgo+IE9uIFN1biwgT2N0IDcsIDIwMTggYXQgMTA6
NDkgUE0gSm9yZGFuIEdsb3Zlcgo+IEdvbGRlbl9NaWxsZXI4M0Bwcm90b25tYWlsLmNoIHdyb3Rl
Ogo+Cj4gPiBJIGdvdCBhbiBlcnJvciB3aGVuIGRvaW5nIGluLXRyZWUgYnVpbGQgdXNpbmcgV2ly
ZUd1YXJkL2NvbnRyaWIva2VybmVsLXRyZWUvY3JlYXRlLXBhdGNoLnNoCj4gPiBuZXQvd2lyZWd1
YXJkL3JlY2VpdmUuYzozMzg6MTA6IGZhdGFsIGVycm9yOiBzZWxmdGVzdC9jb3VudGVyLmM6IE5v
IHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKPiA+ICNpbmNsdWRlICJzZWxmdGVzdC9jb3VudGVyLmMi
Cj4gPiBefn5+fn5+fn5+fn5+fn5+fn5+fgo+ID4gY29tcGlsYXRpb24gdGVybWluYXRlZC4KPgo+
IFlvdWNoLiBJJ20gcmV3cml0aW5nIHRob3NlIHNjcmlwdHMgc28gdGhhdCBpdCBwaWNrcyB1cCBm
aWxlIG5hbWUKPiBjaGFuZ2VzIGxpa2UgdGhpcyBhdXRvbWF0aWNhbGx5LCBzbyBpdCdzIG5vdCBz
dWNoIGEgd2hhY2stYS1tb2xlCj4gc2l0dWF0aW9uLgo+Cj4gTGV0IG1lIGtub3cgaWYgdGhpcyBm
aXhlcyBpdDoKPiBodHRwczovL2dpdC56eDJjNC5jb20vV2lyZUd1YXJkL2NvbW1pdC8/aWQ9Mjgz
NjY0MDgxNDhkMGYyMzBkYWViZDlhNjFjNWY3YmYwYzNlMDM5MAo+Cj4gSmFzb24KClllcywgdGhp
cyBmaXhlcyB0aGlzIGlzc3VlLiBUaGFuayB5b3UuCgpKb3JkYW4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KV2lyZUd1YXJkIG1haWxpbmcgbGlzdApXaXJl
R3VhcmRAbGlzdHMuengyYzQuY29tCmh0dHBzOi8vbGlzdHMuengyYzQuY29tL21haWxtYW4vbGlz
dGluZm8vd2lyZWd1YXJkCg==
