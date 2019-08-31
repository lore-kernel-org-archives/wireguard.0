Return-Path: <SRS0=Lcmb=XB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F20BC43331
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Sep 2019 19:08:19 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA0A22081B
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Sep 2019 19:08:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=astrogeo.va.it header.i=@astrogeo.va.it header.b="KwTJXJ9R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA0A22081B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=astrogeo.va.it
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e5b98204;
	Fri, 6 Sep 2019 19:07:45 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 161c35ec
 for <wireguard@lists.zx2c4.com>;
 Sat, 31 Aug 2019 16:00:22 +0000 (UTC)
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8bc94f77
 for <wireguard@lists.zx2c4.com>;
 Sat, 31 Aug 2019 16:00:22 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id s21so20455300ioa.1
 for <wireguard@lists.zx2c4.com>; Sat, 31 Aug 2019 09:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=astrogeo.va.it; s=google;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=+O9y6cloP7E6M7h4Wn59xLjFqHJu6iH3EPGiLG5opQE=;
 b=KwTJXJ9RQSa7pJC9wMpGSZFt0Ku0HyT3gemvvkIrpHGx89szxjfTKKTJj7U9YdzwuU
 cj1r0u2S/sPSNpLfI3W9PbcRTAEBySE1bEVFRGKWjaY04580kysKvHvOk15brwntnN/M
 +qLujGgqt378n58aTPYcwhcSbp2uTzdsAbAHJL2z+VVjOt+50FyUkrnPOGULFbRDPDev
 msfdjKIWTO32BV99PKnEyqE+hFd2QopG66U0Yv2ckF6h9FwrFQIaubiJe6m3LtK5/Esw
 PqFa6J5SoSDlHDts7rBhk9ENaVnrZ4EF/FAyplYYY0RDzeGeImL1CN4SFS1TsO8k6uHt
 3Knw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=+O9y6cloP7E6M7h4Wn59xLjFqHJu6iH3EPGiLG5opQE=;
 b=PK8c9RsVFudivbGl/i6BDnPeDUm9ptDHJbWZifzWplK8G1aOKy9h1QqtCAqGdGkdN/
 uzgfID5b6IitbXdV6mHoRT4Y2qmdokGlStE0VnyRUYeqD7E9tjWOYSIEf4DX8JN/2rUo
 GfGs1KNJAlA2r4+csvtXowttDYNIPMRpoi0Cw2bCB7oEKW54GV5OA48zLtj7Lma6xMtH
 WB8RahI0vEsh6t8yGKocxOL+eFKtREUs2vrDcC4xC1Q1Kj4KW8W939MfpHvnvkIPQFC6
 MvC8s00kIaT6RpIzKB588vuj0akGJdeI3x/Vf6Q/s+eAA4IXw9cKX6CcI/Ojno3r8KMA
 qU8Q==
X-Gm-Message-State: APjAAAX83Z16xkY1NilxVCTZ1e8OjzsAImas9Q6Fsi1Tef1zUfitlaHu
 VuF3fwXiJGef3XtbulHFklvlV83sxHCdpNafRNmijYytsAg=
X-Google-Smtp-Source: APXvYqxCob1tjA89aLfTz43+teJUKlvVSz1Gr8ayj1Lav1FtWGmctjm/ezx7KK/1P0EIEaC03y5WrEQvUJqLarqjt/Q=
X-Received: by 2002:a6b:731a:: with SMTP id e26mr8688404ioh.188.1567267221410; 
 Sat, 31 Aug 2019 09:00:21 -0700 (PDT)
MIME-Version: 1.0
From: Dario Pilori <dario.pilori@astrogeo.va.it>
Date: Sat, 31 Aug 2019 18:00:44 +0200
Message-ID: <CAMKRnFh4XvqYzPDVjy_NOpeHY+KgsRfEuHfEjWy9N1wfY9MwTg@mail.gmail.com>
Subject: WireGuard fails to build on CentOS 7.1908
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Fri, 06 Sep 2019 21:07:45 +0200
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

RGVhciBhbGwsCgpJIGp1c3QgdXBncmFkZWQgYSB0ZXN0IG1hY2hpbmUgdG8gQ2VudE9TIDcuMTkw
OCAoYmFzZWQgb24gUkhFTCA3LjcpLApjdXJyZW50bHkgb24gQ1IgcmVwb3NpdG9yeSwgd2hpY2gg
Y2FycmllcyBMaW51eCBrZXJuZWwgMy4xMC4wLTEwNjIuCgpMYXRlc3QgV2lyZUd1YXJkIHJlbGVh
c2UgZnJvbSBDZW50T1MgUlBNIHJlcG8gKDAuMC4yMDE5MDcwMikgZmFpbHMgdG8KYnVpbGQgd2l0
aCB0aGUgZm9sbG93aW5nIGVycm9yOgoKREtNUyBtYWtlLmxvZyBmb3Igd2lyZWd1YXJkLTAuMC4y
MDE5MDcwMiBmb3Iga2VybmVsCjMuMTAuMC0xMDYyLmVsNy54ODZfNjQgKHg4Nl82NCkKU2F0IEF1
ZyAzMSAxNzo1MTo0MyBDRVNUIDIwMTkKbWFrZTogRW50ZXJpbmcgZGlyZWN0b3J5IGAvdXNyL3Ny
Yy9rZXJuZWxzLzMuMTAuMC0xMDYyLmVsNy54ODZfNjQnCiAgTEQgICAgICAvdmFyL2xpYi9ka21z
L3dpcmVndWFyZC8wLjAuMjAxOTA3MDIvYnVpbGQvYnVpbHQtaW4ubwogIENDIFtNXSAgL3Zhci9s
aWIvZGttcy93aXJlZ3VhcmQvMC4wLjIwMTkwNzAyL2J1aWxkL21haW4ubwogIENDIFtNXSAgL3Zh
ci9saWIvZGttcy93aXJlZ3VhcmQvMC4wLjIwMTkwNzAyL2J1aWxkL25vaXNlLm8KICBDQyBbTV0g
IC92YXIvbGliL2RrbXMvd2lyZWd1YXJkLzAuMC4yMDE5MDcwMi9idWlsZC9kZXZpY2UubwogIEND
IFtNXSAgL3Zhci9saWIvZGttcy93aXJlZ3VhcmQvMC4wLjIwMTkwNzAyL2J1aWxkL3BlZXIubwog
IENDIFtNXSAgL3Zhci9saWIvZGttcy93aXJlZ3VhcmQvMC4wLjIwMTkwNzAyL2J1aWxkL3RpbWVy
cy5vCiAgQ0MgW01dICAvdmFyL2xpYi9ka21zL3dpcmVndWFyZC8wLjAuMjAxOTA3MDIvYnVpbGQv
cXVldWVpbmcubwogIENDIFtNXSAgL3Zhci9saWIvZGttcy93aXJlZ3VhcmQvMC4wLjIwMTkwNzAy
L2J1aWxkL3NlbmQubwogIENDIFtNXSAgL3Zhci9saWIvZGttcy93aXJlZ3VhcmQvMC4wLjIwMTkw
NzAyL2J1aWxkL3JlY2VpdmUubwovdmFyL2xpYi9ka21zL3dpcmVndWFyZC8wLjAuMjAxOTA3MDIv
YnVpbGQvcmVjZWl2ZS5jOiBJbiBmdW5jdGlvbgrigJh3Z19wYWNrZXRfY29uc3VtZV9kYXRhX2Rv
bmXigJk6Ci92YXIvbGliL2RrbXMvd2lyZWd1YXJkLzAuMC4yMDE5MDcwMi9idWlsZC9yZWNlaXZl
LmM6NDAzOjQ6IHdhcm5pbmc6CnBhc3NpbmcgYXJndW1lbnQgMSBvZiDigJhJUDZfRUNOX3NldF9j
ZeKAmSBmcm9tIGluY29tcGF0aWJsZSBwb2ludGVyIHR5cGUKW2VuYWJsZWQgYnkgZGVmYXVsdF0K
ICAgIElQNl9FQ05fc2V0X2NlKHNrYiwgaXB2Nl9oZHIoc2tiKSk7CiAgICBeCkluIGZpbGUgaW5j
bHVkZWQgZnJvbSBpbmNsdWRlL25ldC9pcF90dW5uZWxzLmg6MTQ6MCwKICAgICAgICAgICAgICAg
ICBmcm9tCi92YXIvbGliL2RrbXMvd2lyZWd1YXJkLzAuMC4yMDE5MDcwMi9idWlsZC9jb21wYXQv
Y29tcGF0Lmg6OTIsCiAgICAgICAgICAgICAgICAgZnJvbSA8Y29tbWFuZC1saW5lPjowOgppbmNs
dWRlL25ldC9pbmV0X2Vjbi5oOjEyMDoxOTogbm90ZTogZXhwZWN0ZWQg4oCYc3RydWN0IHNrX2J1
ZmYgKuKAmSBidXQKYXJndW1lbnQgaXMgb2YgdHlwZSDigJhzdHJ1Y3QgaXB2NmhkciAq4oCZCiBz
dGF0aWMgaW5saW5lIGludCBJUDZfRUNOX3NldF9jZShzdHJ1Y3Qgc2tfYnVmZiAqc2tiLCBzdHJ1
Y3QgaXB2NmhkciAqaXBoKQogICAgICAgICAgICAgICAgICAgXgovdmFyL2xpYi9ka21zL3dpcmVn
dWFyZC8wLjAuMjAxOTA3MDIvYnVpbGQvcmVjZWl2ZS5jOjQwMzo0OiBlcnJvcjogdG9vCmZldyBh
cmd1bWVudHMgdG8gZnVuY3Rpb24g4oCYSVA2X0VDTl9zZXRfY2XigJkKICAgIElQNl9FQ05fc2V0
X2NlKHNrYiwgaXB2Nl9oZHIoc2tiKSk7CiAgICBeCkluIGZpbGUgaW5jbHVkZWQgZnJvbSBpbmNs
dWRlL25ldC9pcF90dW5uZWxzLmg6MTQ6MCwKICAgICAgICAgICAgICAgICBmcm9tCi92YXIvbGli
L2RrbXMvd2lyZWd1YXJkLzAuMC4yMDE5MDcwMi9idWlsZC9jb21wYXQvY29tcGF0Lmg6OTIsCiAg
ICAgICAgICAgICAgICAgZnJvbSA8Y29tbWFuZC1saW5lPjowOgppbmNsdWRlL25ldC9pbmV0X2Vj
bi5oOjEyMDoxOTogbm90ZTogZGVjbGFyZWQgaGVyZQogc3RhdGljIGlubGluZSBpbnQgSVA2X0VD
Tl9zZXRfY2Uoc3RydWN0IHNrX2J1ZmYgKnNrYiwgc3RydWN0IGlwdjZoZHIgKmlwaCkKICAgICAg
ICAgICAgICAgICAgIF4KbWFrZVsxXTogKioqIFsvdmFyL2xpYi9ka21zL3dpcmVndWFyZC8wLjAu
MjAxOTA3MDIvYnVpbGQvcmVjZWl2ZS5vXSBFcnJvciAxCm1ha2VbMV06ICoqKiBXYWl0aW5nIGZv
ciB1bmZpbmlzaGVkIGpvYnMuLi4uCm1ha2U6ICoqKiBbX21vZHVsZV8vdmFyL2xpYi9ka21zL3dp
cmVndWFyZC8wLjAuMjAxOTA3MDIvYnVpbGRdIEVycm9yIDIKbWFrZTogTGVhdmluZyBkaXJlY3Rv
cnkgYC91c3Ivc3JjL2tlcm5lbHMvMy4xMC4wLTEwNjIuZWw3Lng4Nl82NCcKCkkgYW0gbm90IHN1
cmUgaWYgdGhpcyBpcyBhIGtub3duIGJ1ZyBvciBub3QuCgpUaGFua3MsCkRhcmlvCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCldpcmVHdWFyZCBtYWlsaW5n
IGxpc3QKV2lyZUd1YXJkQGxpc3RzLnp4MmM0LmNvbQpodHRwczovL2xpc3RzLnp4MmM0LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL3dpcmVndWFyZAo=
