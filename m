Return-Path: <SRS0=O1+2=M3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BBEDC432BE
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  4 Aug 2021 00:37:09 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0FF360295
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  4 Aug 2021 00:37:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C0FF360295
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 33135699;
	Wed, 4 Aug 2021 00:36:21 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0c2fc3e3
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 4 Aug 2021 00:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1628037374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iqo43sZCDCLzGKQTvSts5vf2aJPC1Uj+KCDoHUx5Ui8=;
 b=Gv27AkhIRlHShyCcy4zPnUdVUImZNIYea1GRhcUL1Sn9NjCZ11+4mEHo5llVhhi8C7TCuU
 y1rXHk3bEphCIHXtsbwswOeIXvy2rbEUdeE+6M81JxmAIjON6R1qcppYZ9QvKgh0YFYuxh
 PF3sX1eUG2EQtP8u+KoqvB/4BG2Nn6U=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b6a99f90
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 4 Aug 2021 00:36:13 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id z128so1451459ybc.10
 for <wireguard@lists.zx2c4.com>; Tue, 03 Aug 2021 17:36:13 -0700 (PDT)
X-Gm-Message-State: AOAM530BqtdX9xEvt08X0xhTLjHkmSSAWq+Mbe+MySwwj5KLRgS3n29A
 ERIt4ori6Hqu/TkORaJbuCbRU39JzSgjPhHMk54=
X-Google-Smtp-Source: ABdhPJxeyQapnFYmiRzPkMpVtTBDO0TIBZ3NfXr2hkRDyJSza/CxIZ2Y4hNQB5FEHCTHWcXFmS4eGYzpAVtQc64I9lg=
X-Received: by 2002:a25:aaa2:: with SMTP id t31mr32382312ybi.178.1628037372955; 
 Tue, 03 Aug 2021 17:36:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAOWZXk1JwVVVZdRfDk9JX8tQdDnp3zbqrGL4mjCN39UuN7oJGg@mail.gmail.com>
 <6d0a94a0-ae09-39a3-7b83-c40efe40246b@zx2c4.com>
 <50d9869c-0b89-c62e-35ff-79186413727c@zx2c4.com>
 <CAOWZXk0q0ST7LA-S53UZYXqzhYeGzCtQGXfjuW=BJAONG9knkg@mail.gmail.com>
In-Reply-To: <CAOWZXk0q0ST7LA-S53UZYXqzhYeGzCtQGXfjuW=BJAONG9knkg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 4 Aug 2021 02:36:01 +0200
X-Gmail-Original-Message-ID: <CAHmME9pE7Nmdd2M8FaTiZGn1TLZ5nou_TN4bXuVMKg20c4WGLg@mail.gmail.com>
Message-ID: <CAHmME9pE7Nmdd2M8FaTiZGn1TLZ5nou_TN4bXuVMKg20c4WGLg@mail.gmail.com>
Subject: Re: Blue Screen errors with WireGuardNT using two peers
To: Hiroshi Shirosaki <h.shirosaki@gmail.com>
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

Hi Hiroshi,

> I confirmed windbg minidump result of the previous(v0.4.0) failure.
> It shows the following.
>
> 2: kd> !analyze -v
>
> DRIVER_IRQL_NOT_LESS_OR_EQUAL (d1)
> An attempt was made to access a pageable (or completely invalid) address at an
> interrupt request level (IRQL) that is too high.  This is usually
> caused by drivers using improper addresses.
> If kernel debugger is available get stack backtrace.
> Arguments:
> Arg1: 0000000000000024, memory referenced
> Arg2: 0000000000000002, IRQL
> Arg3: 0000000000000000, value 0 = read operation, 1 = write operation
> Arg4: fffff801245e2d54, address which referenced memory
>
> Debugging Details:
> ------------------
> (snip)

Thank you for letting me know that 0.4.1 fixes the issue. With regards
to your windbg - could you send the snipped part, just to be sure?

Jason
