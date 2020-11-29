Return-Path: <SRS0=qAD6=FD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD790C5519F
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 29 Nov 2020 20:59:44 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D15E620786
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 29 Nov 2020 20:59:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="NGXJIKjK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D15E620786
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 33415a45;
	Sun, 29 Nov 2020 20:53:02 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 09d78192
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 29 Nov 2020 20:53:00 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c989039d
 for <wireguard@lists.zx2c4.com>;
 Sun, 29 Nov 2020 20:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=exISuVE640FE1OXHTVhrnP+SlQA=; b=NGXJIK
 jKHicUNWNk1uVr4czj38n2/75PhAtFVtfSIJ2ac7xwPt7F9nR2yJY5Z9xEuDTHpR
 YRxq80S3ZxtPrlcmGGTPnqjWEX9sdcqV1SytAA81ZOX6OA3AxxwlNL71bWXAqFOF
 mu9fPC+dUvqetdKB6goYyNHhOKOToY2mhIEJCO73SVID80TlXtZNU89AuDQ67Gon
 FBQXtAQJt/34LZTonCbQIGqMV6FNE2uQHWMMeA3qLKqQcyjtek8iK2dUWB7KQ1HN
 lxnPwweYi05TKVxhnPE69wK8D0nLRKnVvH/8VsqZSlR88CDwfuqhkpvKBPlnZTJQ
 uM/a7Dpm3vbrvJ6A==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id afaf8534
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 29 Nov 2020 20:53:45 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id 2so9554220ybc.12
 for <wireguard@lists.zx2c4.com>; Sun, 29 Nov 2020 12:59:12 -0800 (PST)
X-Gm-Message-State: AOAM5320Ex4dtnam9oqSqceq4nmU6lOefki/NpBPMGOY9HprbSJKx6jG
 24U/D4s3DWdPekPEE1WF0i5eT0S61yP5y4wlnOk=
X-Google-Smtp-Source: ABdhPJxdEiaKlG8ZF+Wxk90sRhOWsn0qZLZv49QUoEnuvHOzLanausodWd8yNp7EAJpy1LhyC8JNn4nYr2CShkytZ8E=
X-Received: by 2002:a25:df05:: with SMTP id w5mr37882003ybg.20.1606683551572; 
 Sun, 29 Nov 2020 12:59:11 -0800 (PST)
MIME-Version: 1.0
References: <CAHmME9oMFQtePYt37+4eyOn23mwHwP2UGxQi=SaJk9J3p1zCpw@mail.gmail.com>
 <C7CEJYWC3YU7.2DQYKR91NB6CP@enhorning>
 <8bf9e364f87bd0018dabca03dcc8c19b@mail.gmail.com>
 <CAHmME9pdDDjVWmxGdh42tJy2KbxT7ZSj9PEsjEyHRMwZpora+A@mail.gmail.com>
 <d9dc454a-15fd-a547-8d0f-b7916818c3de@maidenheadbridge.com>
 <CAHmME9q_UbmfVyd9hH5+b1n6pE=mOgZdKMcyF=AFf2Nm0QHumg@mail.gmail.com>
 <3b4f9ec2-2f50-25c9-0e27-7ca0d2f16943@maidenheadbridge.com>
 <CAHmME9pP4u5-HjZcdj0SAymGmoG36kA0sbcvRo7=mr8XZ-RXHA@mail.gmail.com>
 <CABtXGiD7Q4904nit3C=A12AnJh0rmLeW3skhPoWXEYdP2mLTXw@mail.gmail.com>
 <CAHmME9ohy8Tfko=hO3jLDCJ92X6LQmYoCyTmCgH9N0R5EdPw5g@mail.gmail.com>
 <CABtXGiDREy3K00JLQfuCmu3hTrKnorBd0VrL5kKEL4_x3Lc1jA@mail.gmail.com>
 <CAHmME9o6MdOW=ODPH=Ksh5urUJaaE5Y8HPwkdL7F-_3XCa1KJQ@mail.gmail.com>
 <CABtXGiAK_T0sVPPq_aXLs_fnPG=A9bKZrN-oj7dZa4Wb2j0_Eg@mail.gmail.com>
In-Reply-To: <CABtXGiAK_T0sVPPq_aXLs_fnPG=A9bKZrN-oj7dZa4Wb2j0_Eg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 29 Nov 2020 21:59:00 +0100
X-Gmail-Original-Message-ID: <CAHmME9qAmJt7C7KefU9m-9NkqdmkkGWY34YFwNT0Qm-N_1Tkxw@mail.gmail.com>
Message-ID: <CAHmME9qAmJt7C7KefU9m-9NkqdmkkGWY34YFwNT0Qm-N_1Tkxw@mail.gmail.com>
Subject: Re: Using WireGuard on Windows as non-admin - proper solution?
To: Phillip McMahon <phillip.mcmahon@gmail.com>
Cc: Adrian Larsen <alarsen@maidenheadbridge.com>, 
 Clint Dovholuk <clint.dovholuk@netfoundry.io>,
 Riccardo Paolo Bestetti <pbl@bestov.io>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
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

On Sun, Nov 29, 2020 at 8:44 PM Phillip McMahon
<phillip.mcmahon@gmail.com> wrote:
> Won't drag this already long and confusing thread out. Not challenging
> the current implementation, just the notion that any other suggestion
> is a dead end and the topic is closed.

Alright. Well, if you do think of good reasons why NCO is not a good
match for unpriv'd WireGuard control, please let me know. The whole
basis of going that route is the apparent intuition that these two
types of things, network modification and tunnel up/down, are one and
the same. But if you have in mind a way where the analogy breaks down,
that'd be very interesting to learn and would potentially be grounds
for changing course.

Jason
