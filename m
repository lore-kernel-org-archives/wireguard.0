Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E42C001B0
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 23 Jul 2023 15:32:11 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 96b9de8c;
	Sun, 23 Jul 2023 15:32:10 +0000 (UTC)
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [2607:f8b0:4864:20::1133])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a95ae016
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Jul 2023 15:32:08 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-577412111f0so43438587b3.0
 for <wireguard@lists.zx2c4.com>; Sun, 23 Jul 2023 08:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690126327; x=1690731127;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uW1BxCwETSvIeh2Uh+uC4HrVTsZ8ekklY8cNS1nd7jc=;
 b=UqmzQdTjDOTkVBO+7fxfqH4It4WEbwJ6kRVoNqpoIOnmfJ3D/MCLV5MUq0l478WFNl
 wSbrB37pgF/hlpdSkA/DvAEX4WE0d+rPkySwJBGev7e9Hs9fI4mSHeednbuJCoD7vLwp
 8g9MhFRvXkmCgWX6P8dMATEAUOw7wC5NAiqWKxdnNK98TMGcQ0tp+OLEdOdwIifFwTpL
 0GvS14CQuyvWIjdtjOueJFqkkTnwIF/UA3YUuzxQZQHOYsrnpCJfX1RWAjdkbqO4jBPp
 hvCns63h6G33/sGTbzA1AEG0E2jCJxIeY00y1ECsi4lA1xS0+5GYP7tPR5ZjKybumSag
 RbjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690126327; x=1690731127;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uW1BxCwETSvIeh2Uh+uC4HrVTsZ8ekklY8cNS1nd7jc=;
 b=ANuozMbeoc+NcGbDhiaIpDhSUWxDY2cAwXLlYJU6HLv4rjtUkkJfaAVbPfLzh5vkvR
 1EpReFd3fheUQEzR03SyCmJEuIsnlws6g0bPa0/nlduUs0BkJ+ZgrJfBwKSQnQj2wTLp
 GS/pocTWo+wUsuu7vRlS3XPG4n7my5AHWPdqwK3BRblg6zT9DNVTzqWE3+RXh1OvKWXN
 popDwsmcnJ46aYp3o4ZiJawjgTyLuDCiEARI07zgNO3ffVk8wNVoAs7dnwsacWThKM9n
 mxTErHIJloGw0Ybp3wfzwzGg64GVuuyGVBnRS2rEsgTjOK4zuJXEDx31kllihiHhJoUq
 q9rg==
X-Gm-Message-State: ABy/qLaehjnzEL9RNONKgomBYL3JNIaLrY8y+cnsgzVynBuJtd7k6uTn
 UvCxbY2RUMN4qMyg+aoVNtcNxbMCNpQfiiepubg=
X-Google-Smtp-Source: APBJJlFN9wyICPDdHuJgeGxPbrReTA8ffZnnzLNNhHrRPi+XYBZy/P52RONEj4OoSSFB4NyBoNPEjDNMZQlCuQRoHlM=
X-Received: by 2002:a81:5e0b:0:b0:573:a763:5876 with SMTP id
 s11-20020a815e0b000000b00573a7635876mr6045293ywb.51.1690126327516; Sun, 23
 Jul 2023 08:32:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230719091342.789107a9@parrot>
 <CACT4Y+bsdEDukXi02RKWuEa-BYajP=4w5B-7KEUqf--HOVPVjg@mail.gmail.com>
In-Reply-To: <CACT4Y+bsdEDukXi02RKWuEa-BYajP=4w5B-7KEUqf--HOVPVjg@mail.gmail.com>
From: Wang Jian <larkwang@gmail.com>
Date: Sun, 23 Jul 2023 23:31:56 +0800
Message-ID: <CAF75rJA4ev7f9L4qm4LgKAe2xS5vyb7z=vrDq0RN_WXbOX_0kw@mail.gmail.com>
Subject: Re: WireGuard Mailling List
To: Dmitry Vyukov <dvyukov@google.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 =?UTF-8?B?TWFyZWsgS8O8dGhl?= <m.k@mk16.de>
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

Hi,

I don't know the origin of the Wireguard logo, but it seems to be a =E8=9B=
=9F
 (Jiao, pronounced j-ee-au), not a =E9=BE=99 (Long)

The differences between Long (know as Chinese dragon) and Jiao is
* Jiao has 2 small straight horns or no horn at all while Long has 2 bigger
  and forky horns
* Long has beard while Jiao has no beard
* Jiao has snake like tail while Long has fish like tail (with round fin)
* Long has 4 claws while Jiao has only 2 claws (foreclaws), but this featur=
e
  is usually misused.

Generally, Jiao is upgraded/developed snake living in rivers; Long is
upgraded/developed Jiao living in the sea, and Long can fly into the sky.

Of course you can call the logo  wireguard dragon as you wish.

Dmitry Vyukov <dvyukov@google.com> =E4=BA=8E2023=E5=B9=B47=E6=9C=8819=E6=97=
=A5=E5=91=A8=E4=B8=89 15:22=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,
>
> I was asked to forward this to the list because the author has
> problems reaching it.
> It looks legit:
>
> ---------- Forwarded message ---------
> From: Marek K=C3=BCthe <m.k@mk16.de>
>
> Hello,
>
> the WireGuard logo is a Chinese dragon. Does he/she have a name? What
> could you call him/her? The background is that I want to make a mod for
> [UnCiv](https://github.com/yairm210/Unciv) and would like to incorporate
> there various motifs of computer life - among others, the dragon of
> WireGuard. Therefore he/she needs - at least for my purposes - a name.
> What would you call it?
>
> --
> Marek K=C3=BCthe
> m.k@mk16.de
> er/ihm he/him
