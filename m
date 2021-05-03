Return-Path: <SRS0=aU6O=J6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62D1EC433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 May 2021 13:09:27 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38425611AC
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 May 2021 13:09:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38425611AC
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 68228a46;
	Mon, 3 May 2021 13:07:33 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0ce3ea3c
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 3 May 2021 13:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1620047247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=E+IMRw/x99/IATtumsgNOast84dqEuP8PvWa9xhPsEY=;
 b=bJc4KeG39vU7S8CkjFGX7sFHF22bnql+qG06LLZg/HUpeC++P1DETm8u65gpHEJHlxLTkX
 0HAJJac6vWXqPBv5f8NyCdJLP+DqkJ5MOsI1U/ZooyGmZYraTO+aC6BaXkg4YrZwGa8I/k
 hDdr9dUjpYfmIz66AssaO13j7TBJqpE=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3417b77e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 3 May 2021 13:07:26 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id p126so7430872yba.1
 for <wireguard@lists.zx2c4.com>; Mon, 03 May 2021 06:07:26 -0700 (PDT)
X-Gm-Message-State: AOAM531JhdQYtaOO6Jx78gNK+DP3WxIeY8dpbBM84Ylc+pXzkWFPLwhz
 eLgUtAtX5PRtoxanHmeghnvfk/uTURXy47Ka6os=
X-Google-Smtp-Source: ABdhPJxYndVWl00WJ/V8w/NSnU8KHS7e3GTdS/I/BtlBw+dMsrrfb+gpUcDS8e6yO/y/O3XKs7/X/0lp63BDdTOt2yk=
X-Received: by 2002:a25:abaa:: with SMTP id v39mr28818869ybi.20.1620047246452; 
 Mon, 03 May 2021 06:07:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAGaAVNVPhaXnRyS8TaNddNEGJqGBcW=5cWyb1c=vV0yeOovwqQ@mail.gmail.com>
In-Reply-To: <CAGaAVNVPhaXnRyS8TaNddNEGJqGBcW=5cWyb1c=vV0yeOovwqQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 3 May 2021 15:07:15 +0200
X-Gmail-Original-Message-ID: <CAHmME9o+aSX5f_KZ9UKWNdKUwpjnMU3iKn1e8bBdTvsDCqfceg@mail.gmail.com>
Message-ID: <CAHmME9o+aSX5f_KZ9UKWNdKUwpjnMU3iKn1e8bBdTvsDCqfceg@mail.gmail.com>
Subject: Re: kp's and mem corruption?
To: Manojav Sridhar <manojav@manojav.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hi Manojav,

On Mon, May 3, 2021 at 3:05 PM Manojav Sridhar <manojav@manojav.com> wrote:
> --- trap 0x9, rip = 0xffffffff840fd580, rsp = 0xfffffe004d02c7a0, rbp =
> 0xfffffe004d02c7e0 ---
> noise_remote_index_insert() at noise_remote_index_insert+0xb0/frame
> 0xfffffe004d02c7e0
> noise_consume_initiation() at noise_consume_initiation+0x6bb/frame
> 0xfffffe004d02ca10
> wg_softc_handshake_receive() at wg_softc_handshake_receive+0x27a/frame
> 0xfffffe004d02cb20

Do you know how to reproduce this? Do you have the symbol file
anywhere? Otherwise, do you think you could send me (off list) your
if_wg.ko file that produced this stack trace? Then I can put it into
the disassembler.

> Second issue is that I am seeing memory silent corruption where the pfSense
> UI stops responding and serves up invalid files.

Fixed in https://lists.zx2c4.com/pipermail/wireguard/2021-May/006694.html .

Jason
