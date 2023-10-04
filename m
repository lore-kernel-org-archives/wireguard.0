Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60481E7B5F5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  4 Oct 2023 11:52:13 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f2d5ef87;
	Wed, 4 Oct 2023 11:46:35 +0000 (UTC)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 70210d17
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 4 Oct 2023 11:46:32 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-405505b07dfso4945035e9.0
 for <wireguard@lists.zx2c4.com>; Wed, 04 Oct 2023 04:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mullvad.net; s=july2021; t=1696419992; x=1697024792; darn=lists.zx2c4.com;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C/HP9HvZfYH9vML3wzvpano7Fx6pCXVvNdxsZBSoJ/c=;
 b=QSnSIgH1jI3uSaMPnjBOjMwyw5YMqxp4/HyxBEeGhPF/OFfx/96TuCzRhSZG+ieIys
 C+8grKfAIUMwnGp6/YMvVTvxEf7FxNTjANxPv+jTKK3kYZ+q7tCh8cs6fGaf3l78Wig7
 qbnxp5fUtkXobf7DYPnx7ApB7NY59jhnNU7t1G/yFZHS5WV7bl2eWk+oghOlxeGfCY+B
 N/xw095bPzW1uY/UBsHkB97tg2TDlrg364M7tC8IMkuslj6DdimgwbF0ZlthswriJZcZ
 5xPkRZJR+i2Ab7C/nYd34UqRzJfzjeJ1nyxKSj69PNKZ6QNWsFDbUpVL3TMf9T2Ms+Yo
 yg/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696419992; x=1697024792;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C/HP9HvZfYH9vML3wzvpano7Fx6pCXVvNdxsZBSoJ/c=;
 b=SuUhtA5AQxTL6Kcp3DooqnUQ5EggKUizALXmRRckOz7Cpwxi1D/nm3rhSdVRXNu4ra
 7772EWTi1Rn0nNSlM3+33uVgFDesj3vh//6eGmHfihBX7wm3GMI6My5HyhxJSZvSaBr1
 thXozKid8jW5LHu1zyseYN2dy0ZglipPNpwIWToR4DUY5ILm5U7BCCaKnbiD1RXeVNmq
 ihylIdgGYRCTHO7VOPhHggSTOHpiz3dXQJ6yM9SNplq08yrmB3ZXxHbQsqD5Be42NE0m
 buxV0+b1DEIywAYr7HW3Pz7PfYVoCalkSjKXmjJfIdc/wbsO4gERUlSsBqDT4n0DEsVY
 LT6A==
X-Gm-Message-State: AOJu0YwwuaGeQU82j908qgtul68HK/vwwXlM0hybIHomCh0iFAz+F3tE
 xn6+26ELoM6mkysl4VCZPvbImQ==
X-Google-Smtp-Source: AGHT+IG9ljt45nQUY5coLS78FucbyHPbhn6xzsa95n/NyzqlQyH4gBuxCiztQHG7+bX+TBFa8I/k6Q==
X-Received: by 2002:adf:fa0b:0:b0:31f:ebfa:54eb with SMTP id
 m11-20020adffa0b000000b0031febfa54ebmr4758332wrr.3.1696419992356; 
 Wed, 04 Oct 2023 04:46:32 -0700 (PDT)
Received: from smtpclient.apple (84-52-158-57.dynamic.telemach.net.
 [84.52.158.57]) by smtp.gmail.com with ESMTPSA id
 c15-20020a7bc84f000000b00405323d47fdsm1315787wml.21.2023.10.04.04.46.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 04 Oct 2023 04:46:32 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Subject: =?utf-8?Q?Re=3A_Wireguard-apple_1=2E0=2E16-27_can=E2=80=99t_be_ad?=
 =?utf-8?Q?ded_via_SPM?=
From: Andrej Mihajlov <and@mullvad.net>
In-Reply-To: <CABBZOskMb-6Lc9rAyuqQvYbs3HX-yGXoQHJHcrZzJrbRfsq1wg@mail.gmail.com>
Date: Wed, 4 Oct 2023 13:46:20 +0200
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Transfer-Encoding: 7bit
Message-Id: <DDB7ACE8-3757-43C1-B0B6-0FB9C53079E8@mullvad.net>
References: <CABBZOskMb-6Lc9rAyuqQvYbs3HX-yGXoQHJHcrZzJrbRfsq1wg@mail.gmail.com>
To: Houman <houmie@gmail.com>
X-Mailer: Apple Mail (2.3731.700.6)
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

Right. I think that preamble in Package.swift should be changed from:

> // swift-tools-version:5.3

to at least:

> // swift-tools-version:5.5

Which works with Xcode 15 based on my experience.

Jason could you please bump it?

Best,

Andrej

> On 30 Sep 2023, at 21:09, Houman <houmie@gmail.com> wrote:
> 
> Hello Jason, Andrej
> 
> Please try to add the latest Wireguard-Apple 1.0.16-27 via Swift
> Package Manager and you will see that fails. The issue could be
> related to swift-tools-version.
> 
> Please advise what to do?
> Thank you.
> Houman

