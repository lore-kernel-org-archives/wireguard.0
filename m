Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C1ED49212
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 12:40:43 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cb8356f2;
	Mon, 18 Nov 2024 12:36:09 +0000 (UTC)
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [2607:f8b0:4864:20::530])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5228944a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 May 2024 08:21:36 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-681907af4e7so408600a12.1
 for <wireguard@lists.zx2c4.com>; Tue, 28 May 2024 01:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716884494; x=1717489294; darn=lists.zx2c4.com;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=xadGf4WbX/+Acxp4NerUTTyVYhC/7TsxkWe9ZA5TfuQ=;
 b=ebXbthaFGkMUnWYPvF7Gzw7gIja3tdYZxDrXbCh8M3i5yLrlUli6vahGoGB9/KNd2C
 R3G5m4PEYI2G7LvOaYucoizTPjJJgp8HYOsU/7y1bhBZOF1I56paliJBLt93P9bcUEi6
 werJISrk+Vooe9IY1m8jnc/gmd3IxC6dq+8tP0JH7N+qi1TNxrBuArC6/fFcV/+2Pe64
 2uYmL31qsJ1u2kiODfGa1OP3dIp7ACkubJAcX1xfKsGWZ+WvUZ3kq5dtITboGdB2ND6D
 aGF2+5bdOsHEw5witYGyjeLLeAq6Ge/ZpAE0kHqfhSY3VVns7pnEZ23iuuvNfhTtTxti
 K7eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716884494; x=1717489294;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xadGf4WbX/+Acxp4NerUTTyVYhC/7TsxkWe9ZA5TfuQ=;
 b=mIpe8oQ/D36iWoj23nZcEuq0Klra9hpuh6mbOb3MedpeqXTVmQEpdzgLU1LclqSZUG
 W/k1MBdoUS6XPAH5ETX5sjKg96yMZQ6ivSbg2hH16gKCzu/blSJoRhBCs2RHyMvtfvke
 jnLJ53zHRByHZspi5HmSbS73LYmS5DU9zMgMWvCLGGMaE06BZubn6ccPTKhwrkMYvIRb
 JYVETTx/blpZji8NAibvLaH+Sj3/P2l6tLjZcIMhzogU+JeMQ6j4nEU1nhCqpFb/KpqU
 JOWWEgULBNaEfB9RoTlAw4nr06piAG5s/NkxnePop8zicvnXdA7QYRp6nOtU9v4kXN1c
 qMcQ==
X-Gm-Message-State: AOJu0YwZPvOtbzryp9CjIC4oITZCbeBeMECT1j7ze3p3zjvFwvep0Gke
 nO/Kg+xfpFpFDaDzpDER8Zw5jPAnik1t5OAdRo9DKjbo65tmxNCvklcy9H9OJ4yA/Ept7mqj+2J
 M5/cy+SEFnks2XLGHX09rdnTbR78i93eP
X-Google-Smtp-Source: AGHT+IGK01ZUiXnc0/S2uX3k6WhLZ5amfF7b3vXXPry7TEaql+QZ0B52saefHt9zhebVsosI5eaH4b0YXLHHj838DpA=
X-Received: by 2002:a05:6a20:1585:b0:1af:cf63:3df3 with SMTP id
 adf61e73a8af0-1b212d288bbmr12836231637.14.1716884493930; Tue, 28 May 2024
 01:21:33 -0700 (PDT)
MIME-Version: 1.0
From: Francesco Cheinasso <cheinasso.francesco@gmail.com>
Date: Tue, 28 May 2024 10:21:22 +0200
Message-ID: <CADZwPueVW2DpjgkjmB4OuOFf5n6++bcc4ecd_wt=5DD1rmMJyw@mail.gmail.com>
Subject: Wireguard-go: flags refactoring proposal
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 18 Nov 2024 12:35:39 +0000
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

Hi, I'm Francesco Cheinasso, an open-source developer from the project
liqo (https://github.com/liqotech/liqo).

First of all, thanks for your excellent work and for sharing it with
the open-source community.

In liqo, we are integrating wireguard-go as an alternative for users
with old kernel, but we are facing a problem, it's not possible to set
the MTU at the moment in wireguard-go. I'm taking a look at the code,
to add the possibility to specify the MTU, a flag refactoring should
be necessary.

It would bother you if we take care of a flag refactoring inside wireguard-go?

Regards
Francesco Cheinasso
