Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2365FC43334
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 Jun 2022 09:24:14 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 9585d8a6;
	Tue, 14 Jun 2022 09:23:27 +0000 (UTC)
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [2607:f8b0:4864:20::b32])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 00311e0e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 3 Jun 2022 18:40:59 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id i11so15201834ybq.9
 for <wireguard@lists.zx2c4.com>; Fri, 03 Jun 2022 11:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=TeP702n8IWys12IMG+Ilqdrsd9xJwB2KEu2IHcdFKdY=;
 b=l/A4KRguty55odKasXCZOSUMrP+ub3MWcXSwZY2Y9DVE5qC1OquUKlCzYKcMS0Ejyj
 DoO4PDm7HjxoZk1fh6CN8HZKflu+OgR9oD0yM+VMdxjG1YQKKaIu0krDLPEZP5AheU9O
 DBVa9xjJ5kwkML2TCmmL8oQpJCOARErJ8MnKMeOq3+fkMsBi2Gfn4SSvMqAK56QZwtz7
 L+Afz2oqGoPJSHiUNZ1XhGPtMGvFBVolAfTrNAwBouYFJUj1esANQrGYYmp+r57t4YcT
 y3ZsmB7sce2ffQGTs2x+2ZOusNegnmyU88VvvNKe8pId40LDNRG06sXksmLFyNMlQi3n
 poCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=TeP702n8IWys12IMG+Ilqdrsd9xJwB2KEu2IHcdFKdY=;
 b=PZ0por3KecPxnIFvgtzHmLCnZa44lGT+2ZCpxDvF6Kc6Bi0J/qZBcovKuugbsvOR2E
 btAf/vJKaN1emqPVEHUPQ/lfoTvZ/MD4ad9ijePcwJHwajuo+CJbjAkqUe4clHFPVnFX
 6bb1oKjz/la4jo/k8pdTQIjjso4/lIa49Csfgsf5QPvKV4HXHVdKBGoutZfWAA/bNRPO
 KSyAv6OENWEqWYeMQBeRahZu7/UkZbAxoF9GS4t78LeFqPzVskxsuaVnYmciejKPDghh
 GxXihRcgF2R1Yj5QX95TLudP4pMPb3BaAInfwWTivYReydwpDxGkJRFCxRGWYSL14ZKm
 f3Ag==
X-Gm-Message-State: AOAM53372mK7me+nvi3vV/nLbIkexd1nAk2/Fo/SU0EGYLPbcUYrUWQY
 Vh8W60AUXYLI4qIFH3QnB6ZSVCtDMID0UUujJrmPHQYGnAb6Pg==
X-Google-Smtp-Source: ABdhPJwMJi3izGQLxH7sN1LKftHX3f6648Iv//rynckUckF28+/6tzA6dL0GcYC3lzSVtvxektCeIUoqAJVnTaNrI9M=
X-Received: by 2002:a25:69d3:0:b0:65c:b6bb:8f35 with SMTP id
 e202-20020a2569d3000000b0065cb6bb8f35mr12577130ybc.338.1654281658376; Fri, 03
 Jun 2022 11:40:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAC9cSOATKiXuaFO8UQZezP7RLebBoo-UWwM-KQJMEwhg_-+VTw@mail.gmail.com>
In-Reply-To: <CAC9cSOATKiXuaFO8UQZezP7RLebBoo-UWwM-KQJMEwhg_-+VTw@mail.gmail.com>
From: Saint Michael <venefax@gmail.com>
Date: Fri, 3 Jun 2022 14:40:47 -0400
Message-ID: <CAC9cSOBv7Zkj0uPqyaBDKC+aiwOzTrbjNGUP41iyKZb9u2i-Lw@mail.gmail.com>
Subject: Re: How to generate the QR Code
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 14 Jun 2022 09:23:24 +0000
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

Dear friends
I have a Mikrotikotic router and configured all that is necessary for
the VPN.  I also configured a windows client for testing. Once it
worked, I downloaded the Wireguard app from the Google Play Store. The
question is, how can I generate the QR Code so all my employees can
use it on their phones?
I could not find the answer.

Philip
