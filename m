Return-Path: <SRS0=bERg=IP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8804CC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Mar 2021 22:26:15 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20AC464F2A
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Mar 2021 22:26:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20AC464F2A
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2be1f1e5;
	Wed, 17 Mar 2021 22:26:12 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3f363052
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Mar 2021 22:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1616019966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nayozV+zNI4M9LETECACqsfjvlcRdkv1+/rYoXrCmj0=;
 b=fe3pDLp5loqdbalJQrJhLBnn3+4J0mMQUvayrWaC+oEwHXVS677TN1FJ6WOa9tL6o/BFod
 +K4wROs15rrSBKS1t4aM4/FO+MQmrNL0fpeUTtvNsQYLHA9c3jS77cyEaCV2As4wYVzf1e
 M1gL/5NBLO/ytIZ0TP9Wbns+TQz32bc=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e0f6c4b3
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Mar 2021 22:26:06 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id
 h6-20020a0568300346b02901b71a850ab4so3349477ote.6
 for <wireguard@lists.zx2c4.com>; Wed, 17 Mar 2021 15:26:06 -0700 (PDT)
X-Gm-Message-State: AOAM5333S67ZRP6msySAoZqjhAM2MS5AERrUyS8nCTTdHY3jEkAoJ84W
 /7myKpJGtYZzfJuOH8NYhjzeuKMAcKa+xyq3/U8=
X-Google-Smtp-Source: ABdhPJy2zawiKT9sKsMfyZd7x0qfCjdG0B3ksnmlLf/z/tPPcif8lK2TtHhFS0G8m3n2J83aoXJkpVAPQ5nVe28+XLE=
X-Received: by 2002:a25:9bc5:: with SMTP id w5mr7429619ybo.279.1616019491360; 
 Wed, 17 Mar 2021 15:18:11 -0700 (PDT)
MIME-Version: 1.0
References: <CACNAnaHR9Li0wPOjmwRk7jG76-AESoTt0QrrG_UVTrev38N=bQ@mail.gmail.com>
 <YFH7yIJ9OImHUwYO@lion.0xfce3.net>
 <CAHmME9pqVfzWVsuTrC2eovbWTVeTSX086ZM6DSOK1ejPjkV3uQ@mail.gmail.com>
 <4621c1df-1fd0-489a-8a7d-b1731ae6626c@harz.behrens.de>
In-Reply-To: <4621c1df-1fd0-489a-8a7d-b1731ae6626c@harz.behrens.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 17 Mar 2021 16:17:59 -0600
X-Gmail-Original-Message-ID: <CAHmME9qKqLnoFEJVk+3FH5Y7HM+6D=i6n=Ln4+HBntxjJpWWRw@mail.gmail.com>
Message-ID: <CAHmME9qKqLnoFEJVk+3FH5Y7HM+6D=i6n=Ln4+HBntxjJpWWRw@mail.gmail.com>
Subject: Re: Wireguard for FreeBSD without iflib
To: Frank Behrens <frank@harz.behrens.de>
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

Hi Frank,

On Wed, Mar 17, 2021 at 1:29 PM Frank Behrens <frank@harz.behrens.de> wrote:
> I read your messages from the last days in the freebsd lists.
> In the version before removal from freebsd and in your current
> repository at https://git.zx2c4.com/wireguard-freebsd/ I see a problem.
> I can't load the module, because I get the error:
> Mar 17 20:07:53 <kern.crit> moon kernel: link_elf_obj: symbol
> qgroup_if_io_tqg undefined
> Mar 17 20:07:53 <kern.crit> moon kernel: linker_load_file:
> /usr/local/src/wg/src/if_wg.ko - unsupported file type
>
> I guess that is caused my the fact, that I do not have iflib in the
> kernel and you have only a TASKQGROUP_DECLARE(if_io_tqg) in the source
> and not TASKQGROUP_DEFINE(..).

Thanks for the report. Indeed it may yet take more time to clear out
all the iflib stuff.

Fixed here:
https://git.zx2c4.com/wireguard-freebsd/commit/?id=39c05742f16da7f71f4c781759a4b5135916a249

And this will be available in the next snapshot.

Jason
