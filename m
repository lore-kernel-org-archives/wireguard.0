Return-Path: <SRS0=EM+o=NB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C199C4338F
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Aug 2021 00:11:47 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FE8060E9B
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Aug 2021 00:11:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4FE8060E9B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=trevp.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a08556f9;
	Tue, 10 Aug 2021 00:10:13 +0000 (UTC)
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [2607:f8b0:4864:20::22f])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b769b29e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Aug 2021 00:10:10 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id s13so16936905oie.10
 for <wireguard@lists.zx2c4.com>; Mon, 09 Aug 2021 17:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=trevp-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=U4E8uiziDvHEgDpZcTN4kcItsY26RKOD+9IXZLXmNGg=;
 b=AvE3DUZVDoJDG7KiRNLD2fV9/KTfNy6JEPSmBOGpYa4mpsi/+Y4ozjZjc+oZ6tEXQt
 zyl7Wv2sAeeoHrldJKj57K8t2cebp0snQvsnt7JMMDU8FM3dW5aMGAVEt87fv7xhCgE+
 sfqXKLMg3RfUXkVJQQ7lgw7ayWkbgqZwq9tZEURfR8v98KukKd2h62BPxg91WRlGJJxu
 4VaJDURUooVDINct3VjojezqiSObWVdHgfMyWJ9rNoUZhH9yDxBvKPYPCXdxolYbvUG+
 gpc3iog5fEvE51bZhkEu13ignUW+DK6PrDGehRmkULr+RFtKvFLfDtsaWGBnYYJUgzJm
 B18w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=U4E8uiziDvHEgDpZcTN4kcItsY26RKOD+9IXZLXmNGg=;
 b=uL/BKfU+JbZEVQCHp6r1Nqh+vm8S7X0vuITZyiv694reDYuzRl7glqFJDXFfhdakMS
 tYdSeh5c8bHpxtf7EcynRMIjZhTU8SaDme5M5QasfiJkhf3U32GoO/3CLTypXT17mK8W
 iRsNWieTBPyj5bWLgDiyN14zVZuovF5bdIDv6HbJJXzLkBzbKuyi8l7E0HvPYE3gM6bE
 y9Sja+B0J3G6diH53nKovvRRyM1bAnl3YnI5EK/ii+A6BxS6G6zTvo/4QJcDRVFaEGhy
 EVVbA3vyb1QYGLEpJNnUNcNm7aYq7aoS+3gVk5D+XnUbO8260e3PK9CSpEhm+rYdSvdV
 /Hog==
X-Gm-Message-State: AOAM5334L1o/o8ffeq5qpCvsirIZuLzuIKJzImo3DYaJZz3lLBGtd88i
 sL3fh8/uwjvPqSxo8z/dytF6Lhioyyvd93eH7MSsMmGZhvNEMP/e
X-Google-Smtp-Source: ABdhPJzzTQwA9Bm6+KlQ99RRJxpLn9lDe2lGK5hTEyXxu7NUNyPlMFcmwWXjMfBx1qvOwwFgDPQNvGzVF/BFRXWOPaU=
X-Received: by 2002:a05:6808:2109:: with SMTP id
 r9mr1318275oiw.101.1628554209034; 
 Mon, 09 Aug 2021 17:10:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAHmME9q_9frZ+EQ4_sq_aEoFn3sU01LcW25RysWj0mas4po47Q@mail.gmail.com>
 <6cd87006-902a-3411-4928-67ec5d1f77e2@cupdev.net>
In-Reply-To: <6cd87006-902a-3411-4928-67ec5d1f77e2@cupdev.net>
From: Trevor Perrin <trevp@trevp.net>
Date: Mon, 9 Aug 2021 17:09:58 -0700
Message-ID: <CAGZ8ZG1wU=A4Yu0v7938pRL2d1p+Gj_Mh8+9=sdA-ScHZiYVTQ@mail.gmail.com>
Subject: Re: another thread on montonic counter alternatives
To: Karolin Varner <karo@cupdev.net>
Cc: wireguard@lists.zx2c4.com, noise <noise@moderncrypto.org>, labo@labo.rs
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

On Sun, Aug 8, 2021 at 5:04 PM Karolin Varner <karo@cupdev.net> wrote:
>
> 2) Fall back to an interactive handshake using cookies. Define a protocol=
 version two, mandate that in V2 the cookie must be mixed into the handshak=
e hash. Assign a cookie in case of timestamp failure.

That could be deployed in a backwards-compatible way, I think?  If the
client's V1 handshake is rejected due to an old timestamp, the client
is given the cookie which enables it to do the V2 handshake?


> Jason pointed out, that it would be preferable to use a Noise-XK handshak=
e which is a standard fully-interactive handshake but 1.5-RTT. I was assumi=
ng 1-RTT-ness was a necessity.
> Of course, coming up with a new handshake is=E2=80=A6generally foolish an=
d even though both my proposal technially fit into the noise-IK pattern, no=
ise-XK certainly is more trustworthy.

I thought the goal of IK here was: server only stores state if client
is authenticated.  And the goal of timestamp was: replayed messages
can't invalidate an existing session state.

If those are still the requirements I'm not sure that XK meets them.
XK has better identity hiding (only reveals the client's identity
after forward-secrecy is negotiated), but that trades off against the
requirement that unauthenticated clients can't cause servers to store
state.  (Unless you put the state in a cookie, I suppose - which you
also suggested...)

Trevor
