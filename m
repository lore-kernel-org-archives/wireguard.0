Return-Path: <SRS0=byLw=NS=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1143C0044C
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  7 Nov 2018 04:31:33 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F300A20862
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  7 Nov 2018 04:31:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F300A20862
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fifthhorseman.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f106f1ed;
	Wed, 7 Nov 2018 04:26:50 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c5f60211
 for <wireguard@lists.zx2c4.com>; Wed, 7 Nov 2018 04:26:48 +0000 (UTC)
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f777a8d3
 for <wireguard@lists.zx2c4.com>; Wed, 7 Nov 2018 04:26:48 +0000 (UTC)
Received: from fifthhorseman.net (dhcp-8363.meeting.ietf.org [31.133.131.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by che.mayfirst.org (Postfix) with ESMTPSA id D9BE8F99A;
 Tue,  6 Nov 2018 23:31:12 -0500 (EST)
Received: by fifthhorseman.net (Postfix, from userid 1000)
 id C64EE2020A; Wed,  7 Nov 2018 09:29:10 +0700 (+07)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: Fabian =?utf-8?Q?Gr=C3=BCnbichler?=
 <fabian.gruenbichler@student.tuwien.ac.at>
Subject: Re: wireguard dkms systemd
In-Reply-To: <20181106130443.67eb7j2c2adfq6i2@uni>
References: <0e93f5b4-8883-57e4-0114-42f0bfd5f6c3@powerneth.ro>
 <b0nxrg6FW687Fl8Gai_Eo8VNChZfWGIxiEhhrcjdPJY9UKGgbYOTzxkzek-YZ01khNfWy76jBAsL8wtUVj0ECl3uF_nu3r6Yk_mYSpY4O28=@protonmail.ch>
 <17a30c81-d413-a742-77a7-8743b2574a3c@powerneth.ro>
 <87pnvnmvsc.fsf@fifthhorseman.net>
 <CALJ2VGaq8AasV99YApW5UWEKK0B-r+uafT7nEjbKARfwADab+A@mail.gmail.com>
 <87o9b5frsn.fsf@fifthhorseman.net>
 <CAHmME9pOqbjbnOKi7NYfCp9yGkfNfBZfVMexZAB3SCtEv4NGSQ@mail.gmail.com>
 <87sh0gdomi.fsf@fifthhorseman.net> <20181105112744.zxe3kro53f2ez66a@uni>
 <87bm72ekuv.fsf@fifthhorseman.net> <20181106130443.67eb7j2c2adfq6i2@uni>
Date: Wed, 07 Nov 2018 09:29:10 +0700
Message-ID: <8736sdei2x.fsf@fifthhorseman.net>
MIME-Version: 1.0
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

T24gVHVlIDIwMTgtMTEtMDYgMTQ6MDQ6NDMgKzAxMDAsIEZhYmlhbiBHcsO8bmJpY2hsZXIgd3Jv
dGU6Cj4gaWYgbm9ib2R5IGJlYXRzIG1lIHRvIGl0LCBJIHdpbGwgLSBidXQgbm8gdGltZSB1bnRp
bCB0aGUgd2Vla2VuZC4gZG8geW91Cj4gcHJlZmVyIHBhdGNoIGhlcmUgb3IgdmlhIEJUUyBvciBN
UiBvbiBzYWxzYSBvciBCVFMgcmVmZXJlbmNpbmcgTVI/IDspCgplaXRoZXIgd2F5IHlvdSBsaWtl
IGlzIG9rIHdpdGggbWUgLS0gcGF0Y2hlcyBvciBNUiBvbiBzYWxzYS4gIGJ1dCBwbGVhc2UKZG8g
bWFrZSBzdXJlIGl0IG1ha2VzIGl0IGludG8gdGhlIGRlYmlhbiBCVFMsIHRoYXQnbGwgcHJvdmlk
ZSBhIGdvb2QKcmVjb3JkIHdoZXJlIGl0IG5lZWRzIHRvIGJlLgoKdGhhbmtzLCBGYWJpYW4hCgog
ICAgICAgIC0tZGtnCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCldpcmVHdWFyZCBtYWlsaW5nIGxpc3QKV2lyZUd1YXJkQGxpc3RzLnp4MmM0LmNvbQpodHRw
czovL2xpc3RzLnp4MmM0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3dpcmVndWFyZAo=
