Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95571C636CD
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  8 Feb 2023 02:06:45 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 958a8718;
	Wed, 8 Feb 2023 02:04:16 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a98d11c0
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 8 Feb 2023 02:04:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 291D0CE0DA3
 for <wireguard@lists.zx2c4.com>; Wed,  8 Feb 2023 02:04:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6775BC433EF
 for <wireguard@lists.zx2c4.com>; Wed,  8 Feb 2023 02:04:09 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="bbPNgp0w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1675821847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0WC3RWiNgyFw0WReI/GQn5s+1VZV5zVdLSqq8Ectkf0=;
 b=bbPNgp0w1Icn2q8ZkgiW/n+3shO20qpoG8CCb3ZOY/WuhqXPachjxVC7OkY09t5c1db4KL
 4d6PRAUvBr44SLqyuM9pSp8O/NT0voXBsNWP8ztd40kpDJnJ4Nm1swP6qCYDwRm9eutiSE
 tICW38r2aLl8S054tSznEblRjfaxCgY=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 948d61e8
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 8 Feb 2023 02:04:07 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id gr7so47621699ejb.5
 for <wireguard@lists.zx2c4.com>; Tue, 07 Feb 2023 18:04:07 -0800 (PST)
X-Gm-Message-State: AO0yUKUpvAvyXQ+1KQBs2dG2d5StyLYXMdpmf8nQcGwIvNZba2MpDABN
 XhcLP+0j/8sdf46BeliXR16GFGD1kvdbwq1G7Fg=
X-Google-Smtp-Source: AK7set/z9oYkC2/ZClhbss6XJT+FocY0CuqnBPSYkRjtDwVNYqh1vdm+a0TQAjQwOOfQ+SXuDUNseR7wDkd/K5V8MZg=
X-Received: by 2002:a17:906:e24c:b0:89c:7298:2de4 with SMTP id
 gq12-20020a170906e24c00b0089c72982de4mr1165131ejb.91.1675821846376; Tue, 07
 Feb 2023 18:04:06 -0800 (PST)
MIME-Version: 1.0
References: <5e029a99-a860-0ae0-be72-df53cf82d0ce@mokrynskyi.com>
In-Reply-To: <5e029a99-a860-0ae0-be72-df53cf82d0ce@mokrynskyi.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 7 Feb 2023 23:03:54 -0300
X-Gmail-Original-Message-ID: <CAHmME9oBexy2JahGPbbgxHBcuiGdc1u4JeCoxtYDRPJkJWZ55w@mail.gmail.com>
Message-ID: <CAHmME9oBexy2JahGPbbgxHBcuiGdc1u4JeCoxtYDRPJkJWZ55w@mail.gmail.com>
Subject: Re: Allow client-side encrypted backups for Android app
To: Nazar Mokrynskyi <nazar@mokrynskyi.com>
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

I think I'd prefer to still keep this a bit more locked down. There is
the "export tunnels as zip" feature (which requires an explicit
authentication step each time), which you can use for backup/restore.

Jason
