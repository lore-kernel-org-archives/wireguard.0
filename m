Return-Path: <SRS0=HOwu=BI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0026C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 29 Jul 2020 18:43:16 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F3B52075F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 29 Jul 2020 18:43:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h+yDC5g8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F3B52075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8d6ccd82;
	Wed, 29 Jul 2020 18:19:12 +0000 (UTC)
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [2607:f8b0:4864:20::136])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3eb93365
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jul 2020 18:19:11 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id s21so20310407ilk.5
 for <wireguard@lists.zx2c4.com>; Wed, 29 Jul 2020 11:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=mOp/uztvlqNI5vj86R8cL15fkAzMKxgPhYMZtTtc7c8=;
 b=h+yDC5g82BvDMLfOyigoV3qiQVnj0kk/j51fYa7G1cSBb4/1nmDes3uUNU/nzviMsu
 wn0n18pBdbOhEJlVwKuqtmesJx/W04ylNICGXkP7ubymtYkCxYZwHKDfZsp8cHQ/2GfO
 Dbsx0bhkGYB8FdEMIjXsOLjGMclu1suZOMlrWZ2IYV7YzcGYxovLv3Q+gIHupipKMKhd
 pSaRnmHQKCPtJdEdmGZwcHjFElk194osnPXUhehA+htMj/0HG6xgBktrf+MLNLg01SSX
 R3HCT3TZmYRtqAR2wJETu0oDlxJpvuwKw3ibPwh6IRL8m65g91mAWQv83YGUk/1HP5hI
 smVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=mOp/uztvlqNI5vj86R8cL15fkAzMKxgPhYMZtTtc7c8=;
 b=R7fIgSgVICIAnBbpWYDDkKY86QrcL8zfHAPvkf766CJddDYJAi8nsQs3RE3riJqrWw
 JdpI2PYaX7TEfHgd2KxwmBkl9MSqbsYw4merYKHwOsWPzG1Dzz52wlDV+EHM7jsecjCu
 QAjyL66porwTQ33dpnpUxpJZs7x19WzkJrl4Dx8cEFjGJv9zDdlmK+J3R0u4MJ3MDi3j
 ke2gtPdW0PRJGZuOs4wRybDWrILnsDm8TLFE7ORpLYfzzc9m4+rTFJ6W4sdKQODu1X7O
 5bKTgwefAfISkjmqjXcHHnoFanl0vluiUmjDUbJMI05+bRrSxKRoPP2nL/mYiCGPnHw+
 wq/w==
X-Gm-Message-State: AOAM532q23J+/szDMiDL+3hvbkthuGBoFN+/oHBX+DGK4EprFScbUhI4
 EBeXo9FAyNzKZCSgHXMjJSg4F8quqFalJWPD1PQJQH9o
X-Google-Smtp-Source: ABdhPJx5VO+IwXtLD6d+sg80XsA9PLhZ7qeD3gg5B9BWbXY+OL8XglRZqynfiNshRATrM7ezJCi8mp7WIySOVdzComs=
X-Received: by 2002:a92:c8d1:: with SMTP id c17mr19990948ilq.166.1596048167554; 
 Wed, 29 Jul 2020 11:42:47 -0700 (PDT)
MIME-Version: 1.0
References: <cd5b0b55-fe63-e4ec-7ee3-b68fc9e95e31@gwdg.de>
 <CAH8yC8=V_69QctjdZMpjgkA=ze7KzW8k+HP4xYN_zz3-xDW6OA@mail.gmail.com>
 <6xvBD8jIUMT-g1Be5rHjqCAFr7CGHDAhPV2Sk493EmaOQviayUQKUEfNgyOlFLRuqcjbYrZukzEiKWQ7KpxqrnPxN2q2wS-p9_qIMKUt6pw=@sunfi.sh>
In-Reply-To: <6xvBD8jIUMT-g1Be5rHjqCAFr7CGHDAhPV2Sk493EmaOQviayUQKUEfNgyOlFLRuqcjbYrZukzEiKWQ7KpxqrnPxN2q2wS-p9_qIMKUt6pw=@sunfi.sh>
From: Jeffrey Walton <noloader@gmail.com>
Date: Wed, 29 Jul 2020 14:42:35 -0400
Message-ID: <CAH8yC8nyx_okMxPP6m+VqL+vs9LvyTZc=rhxJjvh-_FgV_iP0Q@mail.gmail.com>
Subject: Re: Hardware Security Token
To: Phil Hofer <phil@sunfi.sh>
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
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
Reply-To: noloader@gmail.com
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Wed, Jul 29, 2020 at 2:37 PM Phil Hofer <phil@sunfi.sh> wrote:
>
> > I believe Google has a secure time server/protocol for this problem,
> > but it is only a partial fix. I don't recall the name of the protocol
> > or the server.
>
> "Roughtime" https://roughtime.googlesource.com/roughtime

That's it, thanks.

It sucks getting old...
