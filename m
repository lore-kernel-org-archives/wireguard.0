Return-Path: <SRS0=EM+o=NB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,FREEMAIL_REPLYTO_END_DIGIT,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 231D4ECDE43
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 21 Oct 2018 12:12:26 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFB672083E
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 21 Oct 2018 12:12:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=protonmail.ch header.i=@protonmail.ch header.b="L5QW3+SK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFB672083E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e60f1de1;
	Sun, 21 Oct 2018 12:10:00 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3fae6de8
 for <wireguard@lists.zx2c4.com>;
 Sun, 21 Oct 2018 12:09:58 +0000 (UTC)
Received: from mail-40135.protonmail.ch (mail-40135.protonmail.ch
 [185.70.40.135])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f2ee690b
 for <wireguard@lists.zx2c4.com>;
 Sun, 21 Oct 2018 12:09:58 +0000 (UTC)
Date: Sun, 21 Oct 2018 12:12:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
 s=default; t=1540123939;
 bh=Wqu39aTq7+xLsdatWJW1cFRmq7QeNnvq9ckaAEoSVf0=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=L5QW3+SKm0CdP62gIqijZJmtkby2wU9kumyp7fdCGQVSiVDKPSH7L8kJ6mryom/bi
 CvDYMqX94tqcjUR803SSDuPb2/jeS9tPvn7v28usYa5MvKBD6GiINAODMz3xcWK82M
 +DAezOMla3soIzmKPVrOTpbJuibICABFI6eSioAY=
To: Lucian Cristian <luci@powerneth.ro>
From: Jordan Glover <Golden_Miller83@protonmail.ch>
Subject: Re: wireguard dkms systemd
Message-ID: <b0nxrg6FW687Fl8Gai_Eo8VNChZfWGIxiEhhrcjdPJY9UKGgbYOTzxkzek-YZ01khNfWy76jBAsL8wtUVj0ECl3uF_nu3r6Yk_mYSpY4O28=@protonmail.ch>
In-Reply-To: <0e93f5b4-8883-57e4-0114-42f0bfd5f6c3@powerneth.ro>
References: <0e93f5b4-8883-57e4-0114-42f0bfd5f6c3@powerneth.ro>
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
4oCQCk9uIFNhdHVyZGF5LCBPY3RvYmVyIDIwLCAyMDE4IDEwOjU5IFBNLCBMdWNpYW4gQ3Jpc3Rp
YW4gPGx1Y2lAcG93ZXJuZXRoLnJvPiB3cm90ZToKCj4gdXBkYXRpbmcgdGhlIHdpcmVndWFyZCBt
b2R1bGUgb24gc3lzdGVtZCBiYXNlZCBsaW51eCBnaXZlcwo+Cj4gV2FybmluZzogVGhlIHVuaXQg
ZmlsZSwgc291cmNlIGNvbmZpZ3VyYXRpb24gZmlsZSBvciBkcm9wLWlucyBvZgo+IHdnLXF1aWNr
QHdnMC5zZXJ2aWNlIGNoYW5nZWQgb24gZGlzay4gUnVuICdzeXN0ZW1jdGwgZGFlbW9uLXJlbG9h
ZCcgdG8KPiByZWxvYWQgdW5pdHMuCj4gU2xlZXBpbmcgMyBzZWNvbmRzLi4uCj4KClRoaXMgaGFz
IG5vdGhpbmcgdG8gZG8gd2l0aCBka21zLiBTeXN0ZW1kIHVuaXRzIGFyZSBwYXJ0IG9mCndpcmVn
dWFyZC10b29scyBwYWNrYWdlLgoKPiBjYW4gdGhpcyBiZSBmaXhlZCBpbnQgdGhlIHJlc3RhcnQg
c2NyaXB0ID8KPgoKVGhlcmUgaXNuJ3QgYSAicmVzdGFydCBzY3JpcHQiIGluIGFueSB3aXJlZ3Vh
cmQgcGFja2FnZS4KCj4gdGhlIHR1bm5lbCB3b24ndCBjb21lIHVwIGlmIHRoZSB1bml0IGlzIG5v
dCByZWxvYWRlZAo+CgpUaGVuIHJlbG9hZCBpdC4gWW91IGhhdmUgZXhhY3QgY29tbWFuZCBwcmlu
dGVkLgoKPiBUaGFuayB5b3UgIQoKSm9yZGFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpXaXJlR3VhcmQgbWFpbGluZyBsaXN0CldpcmVHdWFyZEBsaXN0
cy56eDJjNC5jb20KaHR0cHM6Ly9saXN0cy56eDJjNC5jb20vbWFpbG1hbi9saXN0aW5mby93aXJl
Z3VhcmQK
