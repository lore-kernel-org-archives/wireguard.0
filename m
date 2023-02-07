Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CCCAC636D4
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  7 Feb 2023 08:33:01 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 40580f80;
	Tue, 7 Feb 2023 08:30:28 +0000 (UTC)
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [2607:f8b0:4864:20::52d])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1274de85
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 7 Feb 2023 08:30:25 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id v3so9944316pgh.4
 for <wireguard@lists.zx2c4.com>; Tue, 07 Feb 2023 00:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+qsP76wzAVPE1DOhqQOqUAQhUTpx2hZvaChnJdaHBuM=;
 b=fpUatzT5sMYQ3DD5bl7bK7wFKscRfwc+AEJhV0GqTqqzAemfN5XMiyZRJSR2KOyJsY
 YY7rYTBZL7sm9QUt0ox1MJmqBNI5/NnJSwh8+xN6DX6zbcp0kPJg/tfC+KP8P14pLfXt
 CyIRl+O00ruT3ON7hOPDbQ0/7xfrUQTG01+EuTI0T9y3LasuJPS+bJ0fpJ8laCVxWldh
 /z/gI2vi/Xyq1A1XWDg+gjbhoZo6HocL7xg5oPzVt6RioCfvBRtOhDCwmIbXzJCzbnMz
 6s9hyom1rRGlXvYceD/iUEhyn87+EReLqGg7GUA1ud5a26csX95Mbfque648RfJPLCxC
 b8sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+qsP76wzAVPE1DOhqQOqUAQhUTpx2hZvaChnJdaHBuM=;
 b=FLgXJ68Gv+Y6My1GQV+0SIHzRH75zbaPvNmwG7dsfD9ycJLIEA97CmJ4VWAJmbkTaL
 EPGZT1eSG5fr6L62EELMhtJO86S90hul4fX6S1pheDC2TWn2qUO4BU7ztkcb4vRpeFD2
 07DMrQb3vwkUZo9EwULDH1nlRr3Cwt+HqmYLT0TI1hi4t3FX7Q3xehYOshdzi9tybWy6
 1GXAeVwxt6bOosHGjYRDzI/BZjPDjPmmXHJbXMkTJak/Yzey42L3szI/91m9HOZIyHpK
 S34k/xasbG6kSpBRfVgXaLlW3i19iiKLrKdatOZLHp+Xts6QR+tXsKRytzzuNgUC9Cgf
 zcsQ==
X-Gm-Message-State: AO0yUKWdJ6ZCbF0v6UhWKMHB2gy3H49OYGzz9lfO9DOSiK+1VogaJsk4
 ltDht5G0Bcj+CSmBiU6e/rCCpPFKDNchdwUy+5A=
X-Google-Smtp-Source: AK7set+mEJKPzMj8DxIs6LJC71UKgoOkqznRxwc0TGXYubLc5xHl31pyT7qo7GCq6bjvkVoQLIAiP4HVIbt3rsZxAlk=
X-Received: by 2002:a05:6a00:84:b0:593:4d2d:d271 with SMTP id
 c4-20020a056a00008400b005934d2dd271mr556999pfj.49.1675758623634; Tue, 07 Feb
 2023 00:30:23 -0800 (PST)
MIME-Version: 1.0
References: <CANAp0rHRK_p+VEJ=6wEUu63XbwS2n_9zLBeOgcWOEONVB__Xog@mail.gmail.com>
In-Reply-To: <CANAp0rHRK_p+VEJ=6wEUu63XbwS2n_9zLBeOgcWOEONVB__Xog@mail.gmail.com>
From: Janne Johansson <icepic.dz@gmail.com>
Date: Tue, 7 Feb 2023 09:30:12 +0100
Message-ID: <CAA6-MF9e2N195qRCkh0Z90BkecYnWo6kDPkV9PA6bLA8vS1z+Q@mail.gmail.com>
Subject: Re: Encapsulation support in wireguard-go
To: =?UTF-8?Q?Berkant_=C4=B0pek?= <berkant.ipek@gmail.com>
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

Den tis 7 feb. 2023 kl 05:38 skrev Berkant =C4=B0pek <berkant.ipek@gmail.co=
m>:
> Does wireguard-go provide any facility in order to encapsulate and
> decapsulate WireGuard packets as they leave for and arrive from the
> remote peer? Or, am I just better off to use kernel implementation
> with a TUN device to handle en- and decapsulation and relaying?

I think this is what you might be looking for,

https://github.com/WireGuard/wireguard-go/tree/master/tun/netstack/examples

which has the complete endpoint in the server (and client) so that the
respective programs only need to be able to send/receive UDP packets
and will build themselves a wg tunnel and talk http inside it.

--=20
May the most significant bit of your life be positive.
