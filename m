Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4110C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 14 Mar 2022 19:07:43 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 2d0cebe8;
	Mon, 14 Mar 2022 19:07:29 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id ab55c6aa
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 14 Mar 2022 19:07:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 11900CE16EA
 for <wireguard@lists.zx2c4.com>; Mon, 14 Mar 2022 19:07:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1297DC340E9
 for <wireguard@lists.zx2c4.com>; Mon, 14 Mar 2022 19:07:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="nUgNOyh3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1647284841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JHX85dZt8ij4dhNTM/OQg1qRkRBf8Iz/EIo7SA2t8wI=;
 b=nUgNOyh3VCyDtuu2Z2KL5Blv5j7FsKIR8gkLNM1qe3H0NJ6lwMW8S0hRgHs+cK/Sdg1bMy
 kumcVnaQyDw5v3ecyFjbuSRdnLzm9B487U69vKVjbVqg8wuCnz3Pwwodc7vFeYwwZf0f66
 u07RB59NybgMBOuVMDTNFv/kZLoOqS4=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8c3c2540
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 14 Mar 2022 19:07:21 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-2dbd8777564so176455717b3.0
 for <wireguard@lists.zx2c4.com>; Mon, 14 Mar 2022 12:07:21 -0700 (PDT)
X-Gm-Message-State: AOAM531c9LkND+XTc5t7rAmC74BLzPFqEboRBiDTiMMjc1Ml+cQE15Fd
 0PiG/Ox8thxjQXVP1+xcuECO2xgEGa6PRK0smIU=
X-Google-Smtp-Source: ABdhPJxDjNo5JQostd2d6LUlwepQy+SU078M+LtaONkSyPQBeFV7C5VHv5PnedVGrtpV77++CzjFggqgMj6Ng2lMXDY=
X-Received: by 2002:a81:8984:0:b0:2db:6b04:be0c with SMTP id
 z126-20020a818984000000b002db6b04be0cmr19860042ywf.2.1647284840679; Mon, 14
 Mar 2022 12:07:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220311052832.86700-1-john@gravitl.com>
In-Reply-To: <20220311052832.86700-1-john@gravitl.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 14 Mar 2022 13:07:10 -0600
X-Gmail-Original-Message-ID: <CAHmME9q__P3xT7KECWo-1D=irhBj4PWDV8Qw8dbwBh3=9q_RZw@mail.gmail.com>
Message-ID: <CAHmME9q__P3xT7KECWo-1D=irhBj4PWDV8Qw8dbwBh3=9q_RZw@mail.gmail.com>
Subject: Re: [PATCH] tun/netstack: implement MaxHeaderLength
To: john@gravitl.com
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

Can you describe what this is doing in a real commit message? And why
is the v6 case smaller than v4?
