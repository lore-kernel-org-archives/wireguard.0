Return-Path: <SRS0=q7qE=4U=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B372C3F2C6
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  3 Mar 2020 23:13:17 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A36E20870
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  3 Mar 2020 23:13:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A36E20870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=barrys-emacs.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 50deb34a;
	Tue, 3 Mar 2020 23:08:47 +0000 (UTC)
Received: from claranet-outbound-smtp02.uk.clara.net
 (claranet-outbound-smtp02.uk.clara.net [195.8.89.35])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3041b2cb
 for <wireguard@lists.zx2c4.com>; Sun, 1 Mar 2020 08:51:30 +0000 (UTC)
Received: from 92.40.170.155.threembb.co.uk ([92.40.170.155]:15897
 helo=[192.168.43.121])
 by relay02.mail.eu.clara.net (relay.clara.net [81.171.239.32]:10587)
 with esmtpsa (authdaemon_plain:barry@barrys-emacs.org)
 (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256) id 1j8KNs-0004TO-81 
 (return-path <barry@barrys-emacs.org>); Sun, 01 Mar 2020 08:55:37 +0000
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: macOS Catalina failing https
From: Barry Scott <barry@barrys-emacs.org>
In-Reply-To: <CAAF+QM=2cF9nV2Fq-HbUrbFbNwzw51FqAcG6RBvXv-07YWmp5Q@mail.gmail.com>
Date: Sun, 1 Mar 2020 08:55:35 +0000
Message-Id: <0E67F928-58C9-4F00-A55E-7DD2A25D34AB@barrys-emacs.org>
References: <CAAF+QM=2cF9nV2Fq-HbUrbFbNwzw51FqAcG6RBvXv-07YWmp5Q@mail.gmail.com>
To: Sean Baildon <sean@baildon.co>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
X-Mailman-Approved-At: Wed, 04 Mar 2020 00:08:45 +0100
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

Cgo+IE9uIDI3IEZlYiAyMDIwLCBhdCAxNjo0NiwgU2VhbiBCYWlsZG9uIDxzZWFuQGJhaWxkb24u
Y28+IHdyb3RlOgo+IAo+IEhleSwKPiAKPiBSZWNlbnRseSBwdXJjaGFzZWQgYW5kIHVwZ3JhZGVk
IGEgbmV3IE1CUCB0byBDYXRhbGluYS4KPiAKPiBSZXF1ZXN0cyB0byBodHRwcyBlbmFibGVkIHNp
dGVzIG92ZXIgdGhlIFZQTiBubyBsb25nZXIgd29yaywgZXZlbgo+IHVzaW5nIG15IG9sZCBjb25m
aWd1cmF0aW9uLiBSZXF1ZXN0cyB0byBpbnNlY3VyZSBzaXRlc+KAlGV4Lgo+IGh0dHA6Ly9leGFt
cGxlLmNvbeKAlHdvcmsganVzdCBmaW5lLgo+IAo+IE15IGlPUyBkZXZpY2VzIHdvcmsgYXMgZXhw
ZWN0ZWQuIEkndmUgdHJpZWQgdXNpbmcgdGhlIGlPUwo+IGNvbmZpZ3VyYXRpb25zIG9uIHRoZSBs
YXB0b3AsIGJ1dCBpdCdzIHRoZSBzYW1lIGJlaGF2aW91cjsgaGFuZ2luZy4KPiAKPiBJJ20gdXNp
bmcgdGhlIE1hYyBBcHAgU3RvcmUgdmVyc2lvbiBvZiB3aXJlZ3VhcmQgb24gYSB2YW5pbGxhIGlu
c3RhbGwKPiBvZiBtYWNPUyBDYXRhbGluYS4gQXJlIHRoZXJlIGFueSBrbm93biBpc3N1ZXM/IEhh
cHB5IHRvIHByb3ZpZGUgYW55Cj4gdXNlZnVsIGRlYnVnCgpJIGp1c3Qgbm90aWNlZCB0aGF0IEkg
dGVzdGVkIHdpdGggL29wdC9sb2NhbC9iaW4vY3VybCBub3QgL3Vzci9iaW4vY3VybC4KCkJvdGgg
d29ya2VkLiBGb3IgY29tcGxldGVuZXNzIGhlcmUgaXMgdGhlIHN0YXJ0IG9mIHRoZSBjdXJsIC0t
dmVyYm9zZQp0aGF0IHNob3dzIHRoZSBjZXJ0aWZpY2F0ZSBzdG9yZSB0aGF0IGlzIHVzZWQ6Cgok
IC91c3IvYmluL2N1cmwgLS12ZXJib3NlIGh0dHBzOi8vZXhhbXBsZS5jb20KKiAgIFRyeWluZyA5
My4xODQuMjE2LjM0Li4uCiogVENQX05PREVMQVkgc2V0CiogQ29ubmVjdGVkIHRvIGV4YW1wbGUu
Y29tICg5My4xODQuMjE2LjM0KSBwb3J0IDQ0MyAoIzApCiogQUxQTiwgb2ZmZXJpbmcgaDIKKiBB
TFBOLCBvZmZlcmluZyBodHRwLzEuMQoqIHN1Y2Nlc3NmdWxseSBzZXQgY2VydGlmaWNhdGUgdmVy
aWZ5IGxvY2F0aW9uczoKKiAgIENBZmlsZTogL2V0Yy9zc2wvY2VydC5wZW0KICBDQXBhdGg6IG5v
bmUKCkJhcnJ5CgoKPiAKPiBUaGFua3MsCj4gU2Vhbgo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gV2lyZUd1YXJkIG1haWxpbmcgbGlzdAo+IFdpcmVH
dWFyZEBsaXN0cy56eDJjNC5jb20KPiBodHRwczovL2xpc3RzLnp4MmM0LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL3dpcmVndWFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KV2lyZUd1YXJkIG1haWxpbmcgbGlzdApXaXJlR3VhcmRAbGlzdHMuengyYzQuY29t
Cmh0dHBzOi8vbGlzdHMuengyYzQuY29tL21haWxtYW4vbGlzdGluZm8vd2lyZWd1YXJkCg==
