Return-Path: <SRS0=QHSY=WV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8821C3A5A1
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:37:45 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67E672080C
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:37:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l0fVj90Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67E672080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4505e726;
	Sun, 25 Aug 2019 15:37:26 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a7db5906
 for <wireguard@lists.zx2c4.com>; Wed, 7 Aug 2019 21:31:17 +0000 (UTC)
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a118bfc9
 for <wireguard@lists.zx2c4.com>; Wed, 7 Aug 2019 21:31:17 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id x3so65245903lfc.0
 for <wireguard@lists.zx2c4.com>; Wed, 07 Aug 2019 14:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=C/dCGJALLS2lkRxZdYKRZqDwqHF5LI9FDDqI46OIzNs=;
 b=l0fVj90YvkQ9eTC//Yf4Pa0sMhf7aC/9ywwLO32Izh1Xc1vjDk6DZbWUXs9Hn6I/DS
 OJCdmRx2cUj9pM1j4r8lhOvWzFFZp7E9t4FI+LQWBNPu/pvwdDomuyOvm9yN1MK0qTYw
 q5nhoNvT5X6Zp4HTlK08HwMWt11qsS5t6/0BIk5O3E4qtuLa1P/QvT+dslASY4BMI73e
 HMbJTys0oLbhJuebqpRa91V7SeExm73KsfXhJPHPZCt8E5JwC3hdpLyZHrE6vsCcfa4U
 aw/O3VKPW11fHOQGkyjwQupdLNC19IDAM5VRCFpgFuQpmi1I/cVqPR0tNIkgPKZmOHfl
 FhvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=C/dCGJALLS2lkRxZdYKRZqDwqHF5LI9FDDqI46OIzNs=;
 b=hRpO5IPW464TpqLtcNjj9TNMXgm7DE8QhSU8s3CLNzc9QgGO7YDEeYGmVkpds7jLQk
 3ctgL5bBFgyrZ/Bf1p2rMuUhe2Mwp0h00Q2lYQpLYmqJbmHxetsEl9XDlizL6y8ldCdg
 iFIz4DYibqqSSlzQHKx2mC/YWjyE8W0ZrSBvV+hRx9G8/4Jvgr2mnt1nokLJkfRx0qvU
 Okr4f7B5V3iavrZKB+FRPDnhG06hJukQJwWzQ38KKMuPvZWyyiJjzYjQkY7vWmODjpsI
 xt/R6lfJQ5I6IyRPXbAzdsslh89OTF1Twuhn7uTsCzqKHjDz71E8ChHFDWhcHEXROHWC
 /dRQ==
X-Gm-Message-State: APjAAAXt00F4WE9EZlvQn1uKVOOLhPktXt9e6M1pfmoKX1oZ5SAI+p/g
 01j2mH97L5NvEGx9cIIet2zTXjRPmg/49rpOn+DHy0YZwK4=
X-Google-Smtp-Source: APXvYqyy3vWdiNwGUVVtZhttIrrU8PkgevYdRSfBTNp5HZC3UXIfp2Lv3VB1HAHJgsWaDk5SPZfYhiJUsE6MDyr4ct4=
X-Received: by 2002:ac2:43d0:: with SMTP id u16mr417929lfl.38.1565213475313;
 Wed, 07 Aug 2019 14:31:15 -0700 (PDT)
MIME-Version: 1.0
From: Reid Rankin <reidrankin@gmail.com>
Date: Wed, 7 Aug 2019 17:30:39 -0400
Message-ID: <CAMaqUZ3z8i2TVPgO6iuGrALueX2kvHLufH7AXCFDXW3T6fBTLA@mail.gmail.com>
Subject: Are cookie-required handshakes at least REKEY_TIMEOUT long?
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Sun, 25 Aug 2019 17:37:24 +0200
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
Content-Type: multipart/mixed; boundary="===============8248738106784517308=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============8248738106784517308==
Content-Type: multipart/alternative; boundary="000000000000319d56058f8da9dc"

--000000000000319d56058f8da9dc
Content-Type: text/plain; charset="UTF-8"

Quick question: I've been looking at the code in
 wg_cookie_message_consume() and wg_receive_handshake_packet(), and as far
as I can tell there's no mechanism that re-initiates a handshake after
receiving a cookie reply to a first handshake other than the  REKEY_TIMEOUT
+ jitter timer.

Is this correct, and do, therefore, all handshakes involving cookies take
at least 5 seconds to complete?

Thanks,
Reid Rankin

--000000000000319d56058f8da9dc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Quick question: I&#39;ve been looking at the code in =C2=
=A0wg_cookie_message_consume() and wg_receive_handshake_packet(), and as fa=
r as I can tell there&#39;s no mechanism that re-initiates a handshake afte=
r receiving a cookie reply to a first handshake other than the =C2=A0REKEY_=
TIMEOUT + jitter timer.<br><span style=3D"color:rgb(51,51,51);font-family:&=
quot;Source Code Pro&quot;,Menlo,Monaco,Consolas,&quot;Courier New&quot;,mo=
nospace;font-size:13.5px;white-space:nowrap;background-color:rgb(245,245,24=
5)"></span><div><br></div><div>Is this correct, and do, therefore, all hand=
shakes involving cookies take at least 5 seconds to complete?</div><div><br=
></div><div>Thanks,</div><div>Reid Rankin</div></div>

--000000000000319d56058f8da9dc--

--===============8248738106784517308==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============8248738106784517308==--
