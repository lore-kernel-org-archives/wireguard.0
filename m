Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56EF1E9B24D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 24 Feb 2026 11:01:17 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 78847018;
	Tue, 24 Feb 2026 10:58:03 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 48895154
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 24 Feb 2026 10:57:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 91052433D3
 for <wireguard@lists.zx2c4.com>; Tue, 24 Feb 2026 10:57:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1006FC116D0
 for <wireguard@lists.zx2c4.com>; Tue, 24 Feb 2026 10:57:54 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="QFzYTtZG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1771930673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FtObsgZts/2LPfxkvkENu+ADdqVnIKMFuySBVs8um9Q=;
 b=QFzYTtZGazZnYV8Wjv0ohsKJSVfatURO+9aiP0KkbTCcb+exxX0lubkuAOleHDtN4mGgGJ
 GiqCdQ6DqP1KW9lt6D+PwET/uPYq5HvLtEyfieOqbVp4+2IyUHWOQZcGn5W8xIeLx2PrrG
 Nv6js7ai2Nb0BvSvXpD70uen4dWQaSA=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7300da7b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 24 Feb 2026 10:57:52 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id
 46e09a7af769-7d4be7c4ebeso3315544a34.1
 for <wireguard@lists.zx2c4.com>; Tue, 24 Feb 2026 02:57:52 -0800 (PST)
X-Gm-Message-State: AOJu0YwHk83VAwH4sETEsDo/2o2X36OdjTvPhVafbsoo8MQmrxo0v5IY
 mVNRh/i8jQbZJ8LqAWjYDC/joj1YF5keNEfLzeGECbrjPUoPZI6+G5wJzSxQVpdpUlCSP0mmWHM
 Z3OMnFg7E2zP3LMEabp3vLhujVI+9OdU=
X-Received: by 2002:a05:6830:829a:b0:7cf:db63:e3dd with SMTP id
 46e09a7af769-7d52bf1630dmr7241198a34.17.1771930671842; Tue, 24 Feb 2026
 02:57:51 -0800 (PST)
MIME-Version: 1.0
References: <20260210143016.0144acf1@leda.eworm.net>
 <20260224115254.761df5a9@leda.eworm.net>
In-Reply-To: <20260224115254.761df5a9@leda.eworm.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 24 Feb 2026 11:57:39 +0100
X-Gmail-Original-Message-ID: <CAHmME9pf=TNw6S6HB48q3NKhHzNLAo4qxH64Y7i8Lgg6etFCsg@mail.gmail.com>
X-Gm-Features: AaiRm52FCVuGbOCVVCdUA7JHB2zl2dsnNXz7tWcTPxjaJDRrqihYhBxWA_z8nas
Message-ID: <CAHmME9pf=TNw6S6HB48q3NKhHzNLAo4qxH64Y7i8Lgg6etFCsg@mail.gmail.com>
Subject: Re: Arch Linux - out of date?!
To: Christian Hesse <list@eworm.de>
Cc: wireguard@lists.zx2c4.com
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

On Tue, Feb 24, 2026 at 11:53=E2=80=AFAM Christian Hesse <list@eworm.de> wr=
ote:
>
> Christian Hesse <list@eworm.de> on Tue, 2026/02/10 14:30:
> > Hello everybody,
> >
> > for some time already I am annoyed by mails clogging my input regarding
> > wireguard-tools for Arch Linux being out of date. Obviously this is not
> > true, I built the package the day of release. [0]
> >
> > Now found the install page mentioning the package being out-of date... =
[1]
> > What goes wrong and how to fix that?
> >
> > [0] https://archlinux.org/packages/extra/x86_64/wireguard-tools/
> > [1] https://www.wireguard.com/install/#arch-module-tools
>
> Ping... I would like to see this resolved.
>
> Alternatively I will set up my mail server to forward these mails to you
> personally, Jason.

Hehe.

In the midst of a big infrastructure refresh (as perhaps you've
noticed), so this is certainly in the queue there. Sorry about this.

Jason
