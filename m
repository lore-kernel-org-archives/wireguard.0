Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE01C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 12 Dec 2021 21:44:09 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id c75b3145;
	Sun, 12 Dec 2021 21:44:07 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id eef7ad84
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 Dec 2021 21:44:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id C1F88CE0DB5
 for <wireguard@lists.zx2c4.com>; Sun, 12 Dec 2021 21:44:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9A5EC341C5
 for <wireguard@lists.zx2c4.com>; Sun, 12 Dec 2021 21:43:59 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="LFs6GHky"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1639345437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wuWWOG06jHoX+4wXbGvhn/Ibb5cdPf3rX931gCVhPHc=;
 b=LFs6GHkyB403z8WVeJnXkBhsfTNyJ71M4uVo1vg4c+iUMSBYmAKWo74IAyljcwAGwpd1F9
 LdgnqwkE0/vDuVUBuG7hg/S4DoEJYiCKYT/gB9xmgZpu7rlqjSqZ8K2obOMeF9JvRI5uNW
 /0NAomuvXD38hMcoPwoI6Y5Gv4J2MBU=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6e379b93
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 Dec 2021 21:43:57 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id q74so33975510ybq.11
 for <wireguard@lists.zx2c4.com>; Sun, 12 Dec 2021 13:43:56 -0800 (PST)
X-Gm-Message-State: AOAM530QW3SFRr1h6kuUtWZXRpD1hZ95jbY8x6Xc9Hcwn+ibpVdOzKKk
 LPULpwichij6r3Cq7XfpBqTCjswqWXyGcTey9pU=
X-Google-Smtp-Source: ABdhPJwjqoNWBa2qQK+rxWr+swgx3+iGACPVZQbxEqd/slrZvqKS1n/I46vgmdC3G8OgZn6X2tSLjVwYFpD1cPCYAIM=
X-Received: by 2002:a25:1e83:: with SMTP id e125mr28011034ybe.32.1639345436480; 
 Sun, 12 Dec 2021 13:43:56 -0800 (PST)
MIME-Version: 1.0
References: <20210706132714.8220-1-minipli@grsecurity.net>
 <CAHmME9opYoaoSTHud9sF4BOFBPS=NVYPJSGQr37bxNai26MGFg@mail.gmail.com>
 <1ef9bbf4-b8f8-18df-3c80-3181c2b5b9c5@grsecurity.net>
 <CAHmME9odv1V9wUrLsX16J68wVD3rq+op0VvaNxtsLGG8Rrz4tQ@mail.gmail.com>
 <3ed9270f-00da-5c88-cadd-59b4419b9a98@grsecurity.net>
 <CAHmME9rFHkydmrYcS83PEf=MJP8brwsdis+7TQ=oLkO4RNTX9g@mail.gmail.com>
 <30231bb2-50e0-3880-b705-942b263eafe8@grsecurity.net>
 <CAHmME9rT+aR-FJKFxVaW+tsACKX0kH-2T6cw7xbjjaeVsJbybw@mail.gmail.com>
 <1554725710.1290070.1639240504281.JavaMail.zimbra@inria.fr>
In-Reply-To: <1554725710.1290070.1639240504281.JavaMail.zimbra@inria.fr>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 12 Dec 2021 22:43:45 +0100
X-Gmail-Original-Message-ID: <CAHmME9ppTs-jmmV9uV+C0jbtQC5a5RWO5zJB5_-dRD3BMjDZZA@mail.gmail.com>
Message-ID: <CAHmME9ppTs-jmmV9uV+C0jbtQC5a5RWO5zJB5_-dRD3BMjDZZA@mail.gmail.com>
Subject: Re: [PATCH 0/2] wireguard-linux-compat: grsecurity compat patches
To: Aymeric Fromherz <aymeric.fromherz@inria.fr>
Cc: Mathias Krause <minipli@grsecurity.net>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi Aymeric, Mathias,

On Sat, Dec 11, 2021 at 5:35 PM Aymeric Fromherz
<aymeric.fromherz@inria.fr> wrote:
>
> Thanks for the heads-up. We were being overly conservative during verific=
ation of inline assembly code in Vale, and marked several registers as poss=
ibly modified while they were only read.
>
> This is now fixed for fmul, fmul2, fsqr and fsqr2, and will be merged int=
o the master branch of EverCrypt shortly.
> In the meantime, the diff for the resulting inline assembly after Vale co=
degen is available here: https://github.com/project-everest/hacl-star/pull/=
501/commits/1a71adb40c3f78da16e16975dbb1d4de5adeab8c#diff-5aabe9f6aa87508c9=
d81d4c9e89eff0b06b1e2aeaf5b04eba51da71c5bea6940

Thanks for that! I've imported this into my staging tree here:
https://w-g.pw/l/rmQK

I'll wait a few days -- and until the Vale PR has been merged -- to
submit that to the linux-crypto mailing list, but there's a preview.
Mathias - I wonder if you still need alternatives with the new codegen
there.

Jason
