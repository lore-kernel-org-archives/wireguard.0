Return-Path: <SRS0=qAD6=FD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74827C3E8C5
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 29 Nov 2020 17:53:21 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 984EA206DF
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 29 Nov 2020 17:53:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="I9wgbBdk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 984EA206DF
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 92bba325;
	Sun, 29 Nov 2020 17:46:41 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 521185cd
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 29 Nov 2020 17:46:38 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4d5cbf92
 for <wireguard@lists.zx2c4.com>;
 Sun, 29 Nov 2020 17:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=BmUSK8uA1Re3Ru2PfbV2qzeG2Ow=; b=I9wgbB
 dkkbogCwUFfD/Z2ETuLxG8+4qHTjVSFUy2aq8tnKCoXEBrFeoRIWphtfC+1a7Lv0
 nE9Vv0ryyYIpMNuIY6zCGtLgPv0y/WlZiuJC6fyityfteJiJPavcpGBYujOv2bAB
 kT7IhaVJp3wEuaG+AemvCjbsqMWWGjpzHV+ZFI+iIcfMJSkmdwv5ZATp0uHnsDRM
 rWepBRZuTAbPBLiYsp2YlxpzWbaciNcMlcpdnRNTg6xUuC5r+V2pMc8FJ2f1SPub
 GEXxPJ+euZbKb9ij12nbNSBCJpFsHGE5N30R6kQm+PGI4rm0fTBFeyt5tCgFFtCn
 /iqIlHKevHFWf6tw==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0ed3e3eb
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 29 Nov 2020 17:47:24 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id o71so9340689ybc.2
 for <wireguard@lists.zx2c4.com>; Sun, 29 Nov 2020 09:52:50 -0800 (PST)
X-Gm-Message-State: AOAM532vNBJCddXA3K7S5HoMX281yEC1rA8sMFwPWbpo/uVgd6RjIEv6
 ovZgoi4C5k1IojDA8pmsavvKDQsYb05XRDodFGo=
X-Google-Smtp-Source: ABdhPJxfH5ncJ/cfwQbvVW0QFVkqK1o8XHQB/yyA84mEyAEo9iF8seUCnO3H9njolzHCplMZwhgUZNbn5Z4zggz53cc=
X-Received: by 2002:a25:df05:: with SMTP id w5mr36562955ybg.20.1606672369558; 
 Sun, 29 Nov 2020 09:52:49 -0800 (PST)
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
In-Reply-To: <CABtXGiDREy3K00JLQfuCmu3hTrKnorBd0VrL5kKEL4_x3Lc1jA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 29 Nov 2020 18:52:38 +0100
X-Gmail-Original-Message-ID: <CAHmME9o6MdOW=ODPH=Ksh5urUJaaE5Y8HPwkdL7F-_3XCa1KJQ@mail.gmail.com>
Message-ID: <CAHmME9o6MdOW=ODPH=Ksh5urUJaaE5Y8HPwkdL7F-_3XCa1KJQ@mail.gmail.com>
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

Hi Phillip,

On Sun, Nov 29, 2020 at 2:40 PM Phillip McMahon
<phillip.mcmahon@gmail.com> wrote:
> I have been following the wider thread and maybe I misunderstood but
> believe the solution requires some registry tweaks and membership to
> the Network Operators Group, along with Windows Home requiring the
> creation of a group not officially supported on that platform. Correct
> or not?
>
> It was with all the in mind that I wrote the two points.

I must admit I misunderstood your first message. Sorry for that. I
understand you now to be questioning two things:

- That this is gated behind a registry key;
- That it works by using the network operators group.

The first point is something I could imagine changing down the line as
we learn more about the NCO group's usage. To start, and for now, I
prefer to put "risky" settings behind a flag.

But the latter point I'm much more hesitant to change. You recalled
that I was initially entirely wary of this feature all together. This
is true. It was only upon hearing the excellent idea of the NCO group
that it became tenable for me. The reason is that the NCO group is a
preexisting designation as part of the operating system that confers
these privileges. And there's an easy argument to be made that adding
the ability to stop/start tunnels does not add anything extra beyond
what NCO can already do (like changing IP addresses or disabling
adapters). Therefore, the brilliance of the NCO suggestion, in my
mind, was that we're not adding any additional holes to the Windows
security model. That makes it very compelling to me.

It seems like you want to go back to challenge the initial hesitation
again: maybe we _should_ add additional caveats to the existing
Windows model, you suggest. Maybe. But if we can avoid doing so, I
really would prefer that, and it seems like NCO group strikes a good
balance.

What's the situation you have in mind in which an administrator would
permit a user to enable and disable tunnels but would not permit the
other privileges conferred by NCO? What is the impedance mismatch that
you are thinking about?

Jason
