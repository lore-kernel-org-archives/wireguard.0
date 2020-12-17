Return-Path: <SRS0=K437=FV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67540C4361B
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 17 Dec 2020 10:36:14 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83EDD23741
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 17 Dec 2020 10:36:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83EDD23741
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=alexburke.ca
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 85b2d7c5;
	Thu, 17 Dec 2020 10:26:11 +0000 (UTC)
Received: from mx.kolabnow.com (mx.kolabnow.com [95.128.36.40])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id abcef188
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 17 Dec 2020 10:26:08 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by ext-mx-out002.mykolab.com (Postfix) with ESMTP id 1899ABAD;
 Thu, 17 Dec 2020 11:34:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
 references:message-id:content-transfer-encoding:date:date
 :in-reply-to:from:from:subject:subject:mime-version:content-type
 :content-type:received:received:received; s=dkim20160331; t=
 1608201276; x=1610015677; bh=CFbn8+Sg2MGQJRPtH3zxOOU5m7K+ROFGTUB
 jjWParms=; b=OrL0SUdKoovinxNNiGz4/iA1jAgrl1WMk120g7lTpDMEbcsfrnZ
 cDz1mTkKmRXVyPOJjR8MEBsNBbAah0j3PlMv4Nxch+ixNHCh6KRMhrxccxN3utxi
 pNED80cgb/kVn5bKw8F2P70SjzP0xgm3RtoKByUqtxtr1TFR0sKifz9d7VD2Yx84
 A0Y6ZD7uK/67BSKUmI2qmZn9X431/AfwR3BBfxAydke13uXcqiU0AE/RjkElJm98
 csmqWFQuvrUd6JbT+Nsh3L4XZqB2wl0Gaj6tR9rVFj4SvWlMj71LruxzQ2uqNYnH
 WOq6Uu+IvWylcP1DVK0rDxaGEE7X2D3dOsVa26kC7/BaqW+NEEsF1QZ9HfiJoyRT
 PQwrlT6LyYLfdb2iv5opiGpWAOHsmtSfNMPNCT0SwNeUuLoLFMlTTqYUBMHGrmlb
 LelDdErB/IeVMoZwuMZIDTywS6tfqDitVV+G7uQuDxRkGLuNEdrh7z7fSkzmgtBf
 FHU8Vl6hmxlv4uKlq81QA1GZ5kIkAcS9OOARpEWLVhqEXgDaolqnY0xIBVoEvx09
 iR2J/TtnE0KpbSrLgJDntmyB1KPAALGACB2/u5vJWhFCog5E3rHOPczl+FyaQfcX
 59uSRNQ2HyDxAiOu/Adw/HziTTiM8z+0nlp7R4X17b8/5FLlymOO6t6A=
X-Virus-Scanned: amavisd-new at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
 by localhost (ext-mx-out002.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u5-XOWUqMeH0; Thu, 17 Dec 2020 11:34:36 +0100 (CET)
Received: from int-mx002.mykolab.com (unknown [10.9.13.2])
 by ext-mx-out002.mykolab.com (Postfix) with ESMTPS id 34AE7880;
 Thu, 17 Dec 2020 11:34:35 +0100 (CET)
Received: from ext-subm003.mykolab.com (unknown [10.9.6.3])
 by int-mx002.mykolab.com (Postfix) with ESMTPS id BC5801B58;
 Thu, 17 Dec 2020 11:34:35 +0100 (CET)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: macOS update logic needs improving
From: Alexander Burke <alex@alexburke.ca>
In-Reply-To: <Em6qFgnUJHoAWQmkBzNyZi4JA8DAd7Ylk0OANNRR1LVrZs8SzGAWkGCvyYj-jQPMTg3AV83_0oGW8Z40Uxm-KvseNM_CWXM9kQQLaOoOJPY=@protonmail.ch>
Date: Thu, 17 Dec 2020 11:34:33 +0100
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <F4FA02E0-62E2-4508-99FD-B917F8252346@alexburke.ca>
References: <Em6qFgnUJHoAWQmkBzNyZi4JA8DAd7Ylk0OANNRR1LVrZs8SzGAWkGCvyYj-jQPMTg3AV83_0oGW8Z40Uxm-KvseNM_CWXM9kQQLaOoOJPY=@protonmail.ch>
To: Laura Smith <n5d9xq3ti233xiyif2vp@protonmail.ch>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is also the case on iOS for the same reason: because an app cannot =
be updated while it=E2=80=99s running, and while at least one tunnel is =
up the OS will not terminate the app.


> On 17 Dec 2020, at 05:25, Laura Smith =
<n5d9xq3ti233xiyif2vp@protonmail.ch> wrote:
>=20
> Thank you for the recent efforts to bring macOS/iOS up to date.
>=20
> However there is a little bit of a problem with the logic for your =
macOS App Store updates.
>=20
> The update downloads fine, and *appears* to install, but the App Store =
app continues to show the update as available and installed.
>=20
> Further investigation shows that if Wireguard is running and/or open, =
the app will not actually be updated (App Store will roll back to the =
existing version).
>=20
> If Wireguard is quit, then the update will install OK.
>=20
> So you probably need to add some logic somewhere to detect and deal =
with open/running Wireguard (e.g. prompt user to exit).

