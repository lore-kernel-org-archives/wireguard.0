Return-Path: <SRS0=K437=FV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E5BDC4361B
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 17 Dec 2020 10:38:44 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FCC32388E
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 17 Dec 2020 10:38:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FCC32388E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=alexburke.ca
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 722d0b30;
	Thu, 17 Dec 2020 10:30:00 +0000 (UTC)
Received: from mx.kolabnow.com (mx.kolabnow.com [95.128.36.41])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6162ea82
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 17 Dec 2020 10:29:58 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by ext-mx-out003.mykolab.com (Postfix) with ESMTP id 77428403EB;
 Thu, 17 Dec 2020 11:38:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
 references:message-id:content-transfer-encoding:date:date
 :in-reply-to:from:from:subject:subject:mime-version:content-type
 :content-type:received:received:received; s=dkim20160331; t=
 1608201506; x=1610015907; bh=o4auxzEAOMyNiA8Ivc1fAmdDNSB9INzbIZd
 y3Gn3g9I=; b=RTWiINSJLNcOIUbrQGn8NK8K5FgjG9GXUR6fRVw3Tqx5Vp8EVW/
 CSBw08FVJ6Yt1cJU4Uyq+zOQ15V9keQoL+cFVJ3L5OBTIH8QG61HQDNWvpLwUMTm
 dQ4iHB2jyr5rG7d0sGS7kieMFs3OPYSLqq8oCQ6kem3fxKuRPi5DqFmYz/RDCmCC
 B4ZgR004XERu7aKhSZUQ17TeGGDupbQfYnqDJ31tdjipIQR3NK0vABtflHcYKCT0
 mIRn+M289fDEiIz6wK2DpO7AYrfw+cErix0jWEypU62lusfRiAlZmRcjspY/AiRK
 7mzvD9CZ0Mr6B9SH09JasfPbcuofeGiOypaUh+pjthcHcisRfC9FNwHAyWUEievz
 YDZQiUxyZmYUixqKhGIT3kdDy5HrB7BvKyS4BweUmwxC3rl9Nz3V/8eHs1eQeJcG
 LrAKUdXaFCIYH/ohdFDonFBOqfAIuL7+2FNTPMXHy5rAzhD3FbdYW62nf1B4q2oI
 Ij+et4qdR3jUelrcXfVY5gE7zs7TdF2qRMa+MHT/2dPO8LM6Sd/Ow96caGduY/bT
 vI9nIQKUs5jU55YhEoShwF9ZSm1kE1H8saeCTz6FUOGoSVLvHwJsUAQd6loOtkqv
 7o0nDW715T9En0H7Dn1Wll3MuVqX3jQhrjqYiIRR6rYTCQ38XFYjuxlY=
X-Virus-Scanned: amavisd-new at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
 by localhost (ext-mx-out003.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8jY_43J8dI6K; Thu, 17 Dec 2020 11:38:26 +0100 (CET)
Received: from int-mx003.mykolab.com (unknown [10.9.13.3])
 by ext-mx-out003.mykolab.com (Postfix) with ESMTPS id BC5CC4038C;
 Thu, 17 Dec 2020 11:38:26 +0100 (CET)
Received: from ext-subm003.mykolab.com (unknown [10.9.6.3])
 by int-mx003.mykolab.com (Postfix) with ESMTPS id 68C11A1A;
 Thu, 17 Dec 2020 11:38:26 +0100 (CET)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: macOS update logic needs improving
From: Alexander Burke <alex@alexburke.ca>
In-Reply-To: <F4FA02E0-62E2-4508-99FD-B917F8252346@alexburke.ca>
Date: Thu, 17 Dec 2020 11:38:24 +0100
Cc: wireguard@lists.zx2c4.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <C129E431-FB4C-44E7-B55F-26C604321272@alexburke.ca>
References: <Em6qFgnUJHoAWQmkBzNyZi4JA8DAd7Ylk0OANNRR1LVrZs8SzGAWkGCvyYj-jQPMTg3AV83_0oGW8Z40Uxm-KvseNM_CWXM9kQQLaOoOJPY=@protonmail.ch>
 <F4FA02E0-62E2-4508-99FD-B917F8252346@alexburke.ca>
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

Awfully gauche to reply to myself, but here we are.

This is the case on iOS at least in the event of an active =
Connect-on-Demand tunnel; the update sits and spins in the App Store =
until a few seconds after Connect-on-Demand is disabled, at which time =
the update proceeds and Connect-on-Demand can be re-enabled.


> On 17 Dec 2020, at 5:34, Alexander Burke <alex@alexburke.ca> wrote:
>=20
> This is also the case on iOS for the same reason: because an app =
cannot be updated while it=E2=80=99s running, and while at least one =
tunnel is up the OS will not terminate the app.
>=20
>=20
>> On 17 Dec 2020, at 05:25, Laura Smith =
<n5d9xq3ti233xiyif2vp@protonmail.ch> wrote:
>>=20
>> Thank you for the recent efforts to bring macOS/iOS up to date.
>>=20
>> However there is a little bit of a problem with the logic for your =
macOS App Store updates.
>>=20
>> The update downloads fine, and *appears* to install, but the App =
Store app continues to show the update as available and installed.
>>=20
>> Further investigation shows that if Wireguard is running and/or open, =
the app will not actually be updated (App Store will roll back to the =
existing version).
>>=20
>> If Wireguard is quit, then the update will install OK.
>>=20
>> So you probably need to add some logic somewhere to detect and deal =
with open/running Wireguard (e.g. prompt user to exit).
>=20

