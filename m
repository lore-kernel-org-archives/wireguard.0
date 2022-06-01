Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FFCFC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  1 Jun 2022 13:01:56 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 7ca291fe;
	Wed, 1 Jun 2022 13:01:55 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 0d65593b
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 1 Jun 2022 13:01:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E868BB81ADA
 for <wireguard@lists.zx2c4.com>; Wed,  1 Jun 2022 13:01:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 420B0C385A5
 for <wireguard@lists.zx2c4.com>; Wed,  1 Jun 2022 13:01:51 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="WR+ZaaL+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1654088509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lHuXjtnGIwA8Zzr3bT7RPQh03xIe4TvMRJ0gk9Qtcas=;
 b=WR+ZaaL+v6/rkFCVAx+kba+w4uAOvS5lMxpfDyHXwZzxKX+ZHZt+5duujuv1K7eIOzA7lF
 KLfkC3bj2cokLfcfFBDCvNDp2KODjRG2p96wnI8c+fVbpY8YZONFeWlqepwM58QbQpWjtw
 cj6oNWsuUDeyvbIr1ni7t/tvToHymJE=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2044084b
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 1 Jun 2022 13:01:48 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-30c1b401711so17711407b3.2
 for <wireguard@lists.zx2c4.com>; Wed, 01 Jun 2022 06:01:48 -0700 (PDT)
X-Gm-Message-State: AOAM5320uat7LMPHoinRsRaTVI9gScUZ3fz1aUL7YGz/XDzaIUj/YdO0
 eHTU/A2/l8bOH8OuVPSKD8HRRZD7UTo65woUGb0=
X-Google-Smtp-Source: ABdhPJxmVxOs/6FZYvFt7seS6s0M69/4tdGb5uydzFQJ09z92w2vEFgV9cWcIU9OH6v1hIpXueVB2bHDqNOHX3flubk=
X-Received: by 2002:a81:a143:0:b0:30c:28b5:1d09 with SMTP id
 y64-20020a81a143000000b0030c28b51d09mr23032592ywg.404.1654088508045; Wed, 01
 Jun 2022 06:01:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220601093354.30833-1-tklauser@distanz.ch>
In-Reply-To: <20220601093354.30833-1-tklauser@distanz.ch>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 1 Jun 2022 15:01:37 +0200
X-Gmail-Original-Message-ID: <CAHmME9pDtghGf7kynMgQbRCZGXnOtQH2Skd49rH0s19Tdd6KLA@mail.gmail.com>
Message-ID: <CAHmME9pDtghGf7kynMgQbRCZGXnOtQH2Skd49rH0s19Tdd6KLA@mail.gmail.com>
Subject: Re: [PATCH wireguard-go] tun: use ByteSliceToString from
 golang.org/x/sys/unix
To: Tobias Klauser <tklauser@distanz.ch>
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

Applied, thanks.
