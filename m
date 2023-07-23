Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E83C001DE
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 23 Jul 2023 16:00:13 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 05c1a284;
	Sun, 23 Jul 2023 16:00:11 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1f8b3b81
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Jul 2023 16:00:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9D2A760DD6
 for <wireguard@lists.zx2c4.com>; Sun, 23 Jul 2023 16:00:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B422EC433C8
 for <wireguard@lists.zx2c4.com>; Sun, 23 Jul 2023 16:00:06 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="bSZK+1sq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1690128004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KgbnU3iL3CPm5h4ZrhalBYwV1n1o5h1b7jrh6TPPJJw=;
 b=bSZK+1sqbdagfJFLKmCl5W6wWQnAVsS6nk55Mw2L9i8CoIuAWnJXDYYTJHEbCStko1kjgt
 +08LQNe7LeCGUH8aPimxgqIm++pg8jUSL9VRi/wH/oAgOYwdqkZSB7KETtPNerSaqQb9ML
 ySzyAotfTOqzz0DsLEJHLy/ChPDDhz0=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id bf9052cd
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Jul 2023 16:00:02 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id
 af79cd13be357-766b22593faso252383285a.2
 for <wireguard@lists.zx2c4.com>; Sun, 23 Jul 2023 09:00:02 -0700 (PDT)
X-Gm-Message-State: ABy/qLbZpbiPnacCzndSodXMc42v/eHVCTrqC+N8qD7/Sf06v7yJI39l
 LXl/W4HL28RD4KMDNJ8R0Qv/v48MvxLdUM7dbUg=
X-Google-Smtp-Source: APBJJlGzBl1MvBSjzFdAasq+/YRE4wPmYddikqzHQMGVkcrv5Qn47I8qa1cJpftVlb+z7XwOvxFJoR8X2w3C8q5UFpM=
X-Received: by 2002:a05:620a:3941:b0:767:4715:9588 with SMTP id
 qs1-20020a05620a394100b0076747159588mr5092417qkn.9.1690128001060; Sun, 23 Jul
 2023 09:00:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:35d7:0:b0:78c:c15c:94fd with HTTP; Sun, 23 Jul 2023
 09:00:00 -0700 (PDT)
In-Reply-To: <CAF75rJA4ev7f9L4qm4LgKAe2xS5vyb7z=vrDq0RN_WXbOX_0kw@mail.gmail.com>
References: <20230719091342.789107a9@parrot>
 <CACT4Y+bsdEDukXi02RKWuEa-BYajP=4w5B-7KEUqf--HOVPVjg@mail.gmail.com>
 <CAF75rJA4ev7f9L4qm4LgKAe2xS5vyb7z=vrDq0RN_WXbOX_0kw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 23 Jul 2023 18:00:00 +0200
X-Gmail-Original-Message-ID: <CAHmME9rzmyZzAETFGm7NGZ9FBhgSueskgmUD7Q17SOSe=zXtzA@mail.gmail.com>
Message-ID: <CAHmME9rzmyZzAETFGm7NGZ9FBhgSueskgmUD7Q17SOSe=zXtzA@mail.gmail.com>
Subject: Re: WireGuard Mailling List
To: Wang Jian <larkwang@gmail.com>
Cc: Dmitry Vyukov <dvyukov@google.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>, 
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

On 7/23/23, Wang Jian <larkwang@gmail.com> wrote:
> Hi,
>
> I don't know the origin of the Wireguard logo, but it seems to be a =E8=
=9B=9F
>  (Jiao, pronounced j-ee-au), not a =E9=BE=99 (Long)
>
> The differences between Long (know as Chinese dragon) and Jiao is
> * Jiao has 2 small straight horns or no horn at all while Long has 2 bigg=
er
>   and forky horns
> * Long has beard while Jiao has no beard
> * Jiao has snake like tail while Long has fish like tail (with round fin)
> * Long has 4 claws while Jiao has only 2 claws (foreclaws), but this
> feature
>   is usually misused.
>
> Generally, Jiao is upgraded/developed snake living in rivers; Long is
> upgraded/developed Jiao living in the sea, and Long can fly into the sky.
>
> Of course you can call the logo  wireguard dragon as you wish.

It is absolutely none of those things at all. Please stop speculating
and keep discussions on this here technical.
