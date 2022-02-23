Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44561C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 23 Feb 2022 12:25:23 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 108f093f;
	Wed, 23 Feb 2022 12:25:22 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 9d498bb9
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 23 Feb 2022 12:25:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 19AE961225
 for <wireguard@lists.zx2c4.com>; Wed, 23 Feb 2022 12:25:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1498CC340E7
 for <wireguard@lists.zx2c4.com>; Wed, 23 Feb 2022 12:25:17 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="k75HDqiU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1645619116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nS4pigYHyvws+YAn4BNG44JuTlQno6y2bi2A1BnvWeo=;
 b=k75HDqiUqjJ+1f480Ze2af/IgTOmHF+nyY5YF1rB8b/2pH5bz+wmmWl4nQsxmXJ7YmmFkZ
 pNb/hFfBR9S8QGSM8okFGnfxTzsMo8Yqudmhuenv1X1W5l2KyxzVGgPG68AK1Jb9IKzCr9
 kdy58YZ2ZofKwl7HNPg9N5BQrp4t7Zs=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6e82b105
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 23 Feb 2022 12:25:16 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-2d68d519a33so207366877b3.7
 for <wireguard@lists.zx2c4.com>; Wed, 23 Feb 2022 04:25:15 -0800 (PST)
X-Gm-Message-State: AOAM532r0pYujft+DeuCrOLehkkHcxYa1IDbeoi8ICUrsMwphk/OX2AD
 gazHKkssp02hgEBKC/oONaKKcivZOrtUEqMaTtE=
X-Google-Smtp-Source: ABdhPJxT/r+exvXJgk074UqOGShRpQsGMpPwJgReuy1MT9lanadNuFtLoAiF/Q+rmejOQ/K99q+rGBHddAJV3LqRops=
X-Received: by 2002:a81:5a83:0:b0:2ca:287c:6b5d with SMTP id
 o125-20020a815a83000000b002ca287c6b5dmr27606619ywb.2.1645619115036; Wed, 23
 Feb 2022 04:25:15 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7110:71a8:b0:167:24f9:2d40 with HTTP; Wed, 23 Feb 2022
 04:25:14 -0800 (PST)
In-Reply-To: <CAMTfdYqOySWMEELoW6X2b=es8mkGUffMv4zw_g3=Wm1QDAQtLg@mail.gmail.com>
References: <CAMTfdYqOySWMEELoW6X2b=es8mkGUffMv4zw_g3=Wm1QDAQtLg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 23 Feb 2022 13:25:14 +0100
X-Gmail-Original-Message-ID: <CAHmME9qomn+R54d4KPYAjB3Ry9WbwoNj82FpuxwKt4=pCLz6NQ@mail.gmail.com>
Message-ID: <CAHmME9qomn+R54d4KPYAjB3Ry9WbwoNj82FpuxwKt4=pCLz6NQ@mail.gmail.com>
Subject: Re: [wireguard-apple] Merge of contributions
To: Alessio Nossa <alessio.nossa+list@gmail.com>
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

Hi Alessio,

There's quite a bit of iOS/macOS backlog. But I'll get to it (or Roop
will) eventually.

Jason
