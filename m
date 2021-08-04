Return-Path: <SRS0=O1+2=M3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D8B2C4338F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  4 Aug 2021 00:37:08 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B830560295
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  4 Aug 2021 00:37:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B830560295
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f3432625;
	Wed, 4 Aug 2021 00:34:29 +0000 (UTC)
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 041d4be1
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 4 Aug 2021 00:34:26 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id i6so1353923edu.1
 for <wireguard@lists.zx2c4.com>; Tue, 03 Aug 2021 17:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TnKPeLID22IywH25Uq+OFmR0h1NrUkPck0dYDdLYiAo=;
 b=keKtqSUrYG2pVRRih3ejd2nb6POuzsaIj3svjMkFxaEDPt7KCgVtF96Gx7KY/i607L
 YEH+u8bDnCyU1In4rITEkTJ0BzZJ01XJMPKMRa7qpxuwU9asz4+C65xNbQRPlFSHCBVs
 vOPWlLLUM69XiobaA7hYL4pGUsTCrbA3Ta+6GAPs9qqj/QCwzu46U85jTX8SVnKFAIGS
 +n6u4sNe7EU/18NITeE3UQBQsr4Ha+QD+o6aeOmkKzaOB1j24VBRupCW7LxfOqid/Fhb
 KQJ0kD0YRQ+4RPRn1zC3LVrt++JAElyINABtgrgodSHRoqOX65NXEeIBL+yTQm9IM4AO
 bMwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TnKPeLID22IywH25Uq+OFmR0h1NrUkPck0dYDdLYiAo=;
 b=bw1L+K3y0YVW2TxU8xlM6amw8pQaJyYx/B3oB88LBoTeDO1sqntE2iytatMG6PARr3
 U2uADZFro8gSRCSbhCy+l+fpjubIMaSPSMOroPYHa2EK7LM8SbeGQrZWublBpChVrgXz
 NmPgOyEIKF2X65tKgfvvdAKF7eIy/1KN1ot42gnZmRfWnWte0ivJCKZo8q6AGNAbzEqj
 yQEuOsmPFf+Wb9b0HPy2lLEpDpYafdKEsorb3XMycP2T+8R2PZZcR+OGCNtR26Fk7NOZ
 xDkRqSCCHPLyH2a5NzwbPDbZZFWay0BCMzZkgyo/8sCF7So9WnDt/G2MWnt2bGBeQuGD
 yLNQ==
X-Gm-Message-State: AOAM531lHyveGRYV2tJETnAeU1XTS0jU0s3Lm6qxkOi4zhV8UgibJI/x
 3Psbd+r6sujQ6ubtsjd+2FozBRqd70hBYsvvSzs=
X-Google-Smtp-Source: ABdhPJya5w8SGX23loE5wOtLd4pXPB8VZamYzpmRYceGBJcwX2YirSL+Z+l0he4p4Ua1ZFBXB/aRSwnt+fNJbXhCOi0=
X-Received: by 2002:a50:858b:: with SMTP id a11mr28340325edh.56.1628037266292; 
 Tue, 03 Aug 2021 17:34:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAOWZXk1JwVVVZdRfDk9JX8tQdDnp3zbqrGL4mjCN39UuN7oJGg@mail.gmail.com>
 <6d0a94a0-ae09-39a3-7b83-c40efe40246b@zx2c4.com>
 <50d9869c-0b89-c62e-35ff-79186413727c@zx2c4.com>
In-Reply-To: <50d9869c-0b89-c62e-35ff-79186413727c@zx2c4.com>
From: Hiroshi Shirosaki <h.shirosaki@gmail.com>
Date: Wed, 4 Aug 2021 09:34:13 +0900
Message-ID: <CAOWZXk0q0ST7LA-S53UZYXqzhYeGzCtQGXfjuW=BJAONG9knkg@mail.gmail.com>
Subject: Re: Blue Screen errors with WireGuardNT using two peers
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com
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

On Wed, Aug 4, 2021 at 2:25 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> v0.4.1 is now released. Please see if that fixes the issue.

Thank you for the fix.
I tried and it works stably for now.

FYI
I confirmed windbg minidump result of the previous(v0.4.0) failure.
It shows the following.

2: kd> !analyze -v

DRIVER_IRQL_NOT_LESS_OR_EQUAL (d1)
An attempt was made to access a pageable (or completely invalid) address at an
interrupt request level (IRQL) that is too high.  This is usually
caused by drivers using improper addresses.
If kernel debugger is available get stack backtrace.
Arguments:
Arg1: 0000000000000024, memory referenced
Arg2: 0000000000000002, IRQL
Arg3: 0000000000000000, value 0 = read operation, 1 = write operation
Arg4: fffff801245e2d54, address which referenced memory

Debugging Details:
------------------
(snip)

Thanks,
Hiroshi Shirosaki
