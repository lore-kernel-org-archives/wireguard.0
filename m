Return-Path: <SRS0=aU6O=J6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MISSING_HEADERS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD758C433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 May 2021 15:31:24 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A10BD61073
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 May 2021 15:31:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A10BD61073
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=manojav.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6acd39fc;
	Mon, 3 May 2021 15:31:22 +0000 (UTC)
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [2607:f8b0:4864:20::829])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 12d4bd99
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 3 May 2021 13:33:49 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id y12so3608101qtx.11
 for <wireguard@lists.zx2c4.com>; Mon, 03 May 2021 06:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manojav.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:cc;
 bh=34cFhqA4veg/1U+dGhMpVBYPUOj5GVAiPwHvc6Cvrvg=;
 b=HcYbUnucIKOKo6gi61fZpH5S2lCk6g3OogYp8KiMZ9jKg73VG4DVhyYb7XrBRN5+uJ
 8J5XKn1RVIzEw9A+lqGTzB8+nbw1chGK+j4TvboTjcbm+WsCLaz7RV1yGZVa6QMuHZkL
 /o8C/tP9nfI7l6Tgr5Pt/CRtn2VCnvvO27BM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:cc;
 bh=34cFhqA4veg/1U+dGhMpVBYPUOj5GVAiPwHvc6Cvrvg=;
 b=Zdv37nOaI178kteAckBulTR+qQSyJ61GZ7JV6OOQE9rhgvyz8IUK3TNxmsD1NfPW0A
 8iEqeKEacQ+svExFu7j9Z9FQ8oRqhaoYLIgeqSmD9/ZEZ/BaIWHCyXuyzFL2t9O50Zq9
 yx2Ue1IysJBdyGPww8p6ovd4XC9qWWkhf4XlINBfmacgiVtNAmxLk83lgf2unVPl6v8r
 wp+0P1pwVDFyEKr5UQPCGKMaT2Ml474F0KRb6NxJXDrfA1X6oW54lGpvo4cDXz1uXJ18
 /vDMJNbknqLK02yNpw8Namad5I99160vdNGtJyvzJsFSRE+t/opbAmr+AyVZihmJVtqw
 Aytw==
X-Gm-Message-State: AOAM533sjPD+RnxbMq0qdZyMKYmRJCqnBUlWxkUnrPNL0dUh2dheNYLG
 SEybGFaEHswCykQ+HInS22zP38nxl6xug2wRw+LLMdJ1ifI=
X-Google-Smtp-Source: ABdhPJy+iAlhdz3Q/w35irvy4NFAHfbs4GYi3Iy0AXWhUL9HBvsdgwsnGFtQYQQ7BYCPrUUSsv5ZKQ9NCtGKcxuHl1o=
X-Received: by 2002:aed:2167:: with SMTP id 94mr17252413qtc.378.1620048827925; 
 Mon, 03 May 2021 06:33:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAGaAVNVPhaXnRyS8TaNddNEGJqGBcW=5cWyb1c=vV0yeOovwqQ@mail.gmail.com>
 <CAHmME9o+aSX5f_KZ9UKWNdKUwpjnMU3iKn1e8bBdTvsDCqfceg@mail.gmail.com>
In-Reply-To: <CAHmME9o+aSX5f_KZ9UKWNdKUwpjnMU3iKn1e8bBdTvsDCqfceg@mail.gmail.com>
From: Manojav Sridhar <manojav@manojav.com>
Date: Mon, 3 May 2021 09:33:22 -0400
Message-ID: <CAGaAVNU+gi18iNmAJYjTnEbuD9fPGHz42LEam_UQnuNfHVzmMg@mail.gmail.com>
Subject: Re: kp's and mem corruption?
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 03 May 2021 15:31:21 +0000
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

Thanks. I have responded off list onr your other request. Will
continue to test on the latest snapshots!

On Mon, May 3, 2021 at 9:07 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Hi Manojav,
>
> On Mon, May 3, 2021 at 3:05 PM Manojav Sridhar <manojav@manojav.com> wrote:
> > --- trap 0x9, rip = 0xffffffff840fd580, rsp = 0xfffffe004d02c7a0, rbp =
> > 0xfffffe004d02c7e0 ---
> > noise_remote_index_insert() at noise_remote_index_insert+0xb0/frame
> > 0xfffffe004d02c7e0
> > noise_consume_initiation() at noise_consume_initiation+0x6bb/frame
> > 0xfffffe004d02ca10
> > wg_softc_handshake_receive() at wg_softc_handshake_receive+0x27a/frame
> > 0xfffffe004d02cb20
>
> Do you know how to reproduce this? Do you have the symbol file
> anywhere? Otherwise, do you think you could send me (off list) your
> if_wg.ko file that produced this stack trace? Then I can put it into
> the disassembler.
>
> > Second issue is that I am seeing memory silent corruption where the pfSense
> > UI stops responding and serves up invalid files.
>
> Fixed in https://lists.zx2c4.com/pipermail/wireguard/2021-May/006694.html .
>
> Jason
