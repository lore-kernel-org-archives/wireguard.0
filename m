Return-Path: <SRS0=9kqO=ON=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70EF7C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 23 Sep 2021 04:22:39 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7618360FC1
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 23 Sep 2021 04:22:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7618360FC1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4aaafe77;
	Thu, 23 Sep 2021 04:21:35 +0000 (UTC)
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [2607:f8b0:4864:20::529])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0738a200
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Sep 2021 04:21:31 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id g184so5036838pgc.6
 for <wireguard@lists.zx2c4.com>; Wed, 22 Sep 2021 21:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=3T8HPh4DxRI5dKz31MYs/KYRGa7OXhLG0RJ4UkNr1CY=;
 b=h0DHW6ma+7mMq0fhhEMa7HHI8eIzCvC/20D1uA89/q0+RAyfQ69A9z99SfJif1R0kK
 puO0S0IkNtC5fzga7czBWQ5crAtcbs928VJ8w48+NlPH/luR6k/860eE0eFktNrqu8Lf
 q8EzWfs0xbHDFHgiJ+EC/8i1hireSjFZ6/qBdLdJORl97gE7ZMJN9s9jkstWcytAAJ+A
 B5gT4YnQjjR+Nh8dKanrBQEnACuhEO3p9T/2hjBNa+u3Qusn8crNBMn/ojS9HkdOKMAs
 yVAdjPmekRUtuiaMtMRXpsunMX/lveZFrM8Q3yMqCEK2z64EDKMQY+OLluZUGlM2Cwn/
 TUxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=3T8HPh4DxRI5dKz31MYs/KYRGa7OXhLG0RJ4UkNr1CY=;
 b=ts2HdI60Q84L7kx0zSDdk8ingoqJXnVjW+jDzePKQBoo+Hr/oev1V7gcn3W9F9WqFx
 trG/VYIwMz1LjmG70g7B4R9iMAzNSaQ78rxcoju0+s9u9qSxZ2KBSWUnspJCTj/tTa2D
 k1zapJy+e6ENFIR9fr9qcNq6ms+zqxReps3aExdpq8Zkbcp44C489R5zBdmNT38VLvQa
 7qi0/ZUXV27NJ22g1/KIF9K9i2ZJspKHnBPsQ1X0TA1cjthi01Rd2ARcHG+49tCzK31y
 5qNeLl7pPgy3P8d0nnYh2l8dAAxoM7Wlzk4+r7NI9Gn9wjiwCS9+wxTbOt86TjfVLjcL
 wS3g==
X-Gm-Message-State: AOAM532ZCilby8KmqLF8+utmEh0RfqoQRkat+vme9Cut3l2tCKk0xFUb
 YcZEaNd20d4k3nATl1iI0kM=
X-Google-Smtp-Source: ABdhPJyHCtKz4aTM7Of5LgiinqlhYqYvZ/8X/fbvs60Tp9UDUj5nwDKi4EobbKhmoib6lgIct1c94A==
X-Received: by 2002:a63:7789:: with SMTP id s131mr2344432pgc.8.1632370889931; 
 Wed, 22 Sep 2021 21:21:29 -0700 (PDT)
Received: from smtpclient.apple (216-19-179-128.dyn.novuscom.net.
 [216.19.179.128])
 by smtp.gmail.com with ESMTPSA id w8sm3889462pfc.93.2021.09.22.21.21.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 Sep 2021 21:21:29 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: WireGuard Configurations Gone After iOS 15 Upgrade
From: Miguel Arroz <miguel.arroz@gmail.com>
In-Reply-To: <CAHmME9oKfJJfnrKeXcaHeb-oa+JZ+OgnxLVny==uSgwa5c5sKA@mail.gmail.com>
Date: Wed, 22 Sep 2021 21:21:28 -0700
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Eddie <stunnel@attglobal.net>, Anatoli <me@anatoli.ws>,
 Roopesh Chander S <roop@roopc.net>, Alan Graham <alan@meshify.app>,
 oss@jacobwilder.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <D12BB3A3-28D0-4E53-AB85-86E67CED17B5@gmail.com>
References: <95105bdf-8442-4c7c-dcc8-719b0784bced@attglobal.net>
 <CAHmME9qQZMb4ajHKHY8w-b8_9BNv8YM9YKyNO9U9RH0_thrCPw@mail.gmail.com>
 <49d1235b-1ed8-68f6-33bf-574ac0ad40e0@anatoli.ws>
 <CAHmME9q58QCUEY7vqhX767wPtqCPr23gmXgSS_bvbfvNZva=SQ@mail.gmail.com>
 <96bcc87f-7de1-05a4-641a-27ffac7b052d@attglobal.net>
 <DA133F84-7C21-4234-97DB-FFEDF79D1607@gmail.com>
 <CAHmME9p69qDGUJnbHVsqH_vx8mf=dNY3-sQ-7APhOG85xxLYWA@mail.gmail.com>
 <CAHmME9rQY8OU3jbXnB=OroBvudO1KCXL3vL6ESuEgZoMSRqVLw@mail.gmail.com>
 <CAHmME9reWG3UiHQm1fBvyQUoUF5_oJv6YiBGaOE2AUgLt-nK3w@mail.gmail.com>
 <BD9150AA-4F49-416A-A897-A9C4000C354E@gmail.com>
 <CAHmME9rREdEAWEDYyHaRWHwkUUWy1MPdrBokSygO8rhyxTJgXg@mail.gmail.com>
 <1B181919-09C0-4908-82F2-DD5661C53FD0@gmail.com>
 <CAHmME9r5HX6qYNQRarK0Mbv+Vf5dyyWwH-RjLmsjWHSy-YBEUQ@mail.gmail.com>
 <CAHmME9ruxL6LKmPNEhkmUCGG_tNQBhxkPx8v_dujPwAOnXowzw@mail.gmail.com>
 <CAHmME9oKfJJfnrKeXcaHeb-oa+JZ+OgnxLVny==uSgwa5c5sKA@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
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

Hi,

  Awesome! Thank you for the quick fix.

  Regards,

Miguel Arroz

 =20

> On Sep 22, 2021, at 9:13 PM, Jason A. Donenfeld <Jason@zx2c4.com> =
wrote:
>=20
> Hi,
>=20
> Fixed! =
https://git.zx2c4.com/wireguard-apple/commit/?id=3D03a59ff38e96fb3bb5dde2f=
15fe42198d1dfb995
>=20
> Thank you to everyone in this thread who helped get to the bottom of =
this.
>=20
> Jason

