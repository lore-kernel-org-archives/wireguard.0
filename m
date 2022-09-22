Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7507C6FA8B
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 22 Sep 2022 09:55:15 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 8ab52428;
	Thu, 22 Sep 2022 09:40:28 +0000 (UTC)
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [2001:4860:4864:20::2c])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 33c04377
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 22 Sep 2022 09:40:27 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-1278a61bd57so13043028fac.7
 for <wireguard@lists.zx2c4.com>; Thu, 22 Sep 2022 02:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=bLL/KIbwKb11sX1y5Ia/HHsZZPa62giiSMLhN2bWh4k=;
 b=OWYHxyHbp7Rs2aCsjul5r90K6gXbJ5mWuonpO9ZyaWA6j+tH5UVpg3Z8BXCP7otCud
 tSIeF9GI5MD96zHT3y3VJcyZ0fwejx62Ltum2gS9BbamT/lrmprdzh/2OQN+2/CGwINb
 WwL4wPULlw21Ws3yG4boT3+TC2BzhkL3Ucn3ZzsGXxNwdQlysJdLIGLCVyidMu5SYMUm
 Lw3H2qjqVCoDNfqK2YdVHP7a3TSgtTsjMk76joZe4q42YyVTeWDm6Eau/NMd2UUe6kd/
 OiduKgDX4pQ12XH/c+pzV7c7DHG2xqaelXs3oABxobSwA3dayhNYLIo9JYQxnXPD3L8l
 0QQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=bLL/KIbwKb11sX1y5Ia/HHsZZPa62giiSMLhN2bWh4k=;
 b=B5GVwn5sVyJxaYmFRGA1Aq9Od6g3RGRHLhGaWeEL/438D5fjWl1kwAH4g4kUdOJGnz
 aahehseAJ5BhRyq0HiNJcdPCylchAt0ksIW0LCW6H3b7mReLxBPRS3I0rEpNrVAuuuOm
 FGg6HtzjEaX2J+Ewt129ooLo4L4x4tJiDclgu1BYdKTpcES6KAAzhjwzJWrOjXUB8t9T
 CKx5ldcpbY9+vrRF+lGM/f8G/g22FeMwWX2EYZOQ7oNYbSOn9Lfhvvq+rGQnAiOiFH7G
 a4bk6QyqorlPQ6S5HwugqalwLXZ5KnzCrQyICJKy8LaT/r+d9tucxAqYjv2gyH8a8kK7
 iC9g==
X-Gm-Message-State: ACrzQf07Dr9nX+LS7KHHEF+bxcCsDC2KrNf/+DhuXsjC3fdLA/lBijXe
 0BSwd6R55QD8YczgOzSgB55hZP07fUvgCku4kV1091rj6XuYQw==
X-Google-Smtp-Source: AMsMyM6m4yWzzCaW7ItvJYka/ylSJx1gT7B6CnkRTl/AQntrH2M59wro6OFs7dBS/F7T+TtG659RxEfyU26uaYlz2t0=
X-Received: by 2002:a05:6870:7390:b0:12b:e164:1249 with SMTP id
 z16-20020a056870739000b0012be1641249mr1431249oam.179.1663839625870; Thu, 22
 Sep 2022 02:40:25 -0700 (PDT)
MIME-Version: 1.0
References: <CABBZOsks3ZnpcURYHSQcaWCe8ETY21zitPY5TvtTaAm38DT5EA@mail.gmail.com>
 <834CB179-958C-4C0E-8B17-9918C8A992FB@mullvad.net>
 <CABBZOs=9VVSDEGPw1eQWmusJotA5toLCn1-uNQeZ+moPthAOxg@mail.gmail.com>
 <CAHmME9pZy+EYQbmrBi_5Ei191zJ_X3imSuZ_U766HhXp39MHbA@mail.gmail.com>
In-Reply-To: <CAHmME9pZy+EYQbmrBi_5Ei191zJ_X3imSuZ_U766HhXp39MHbA@mail.gmail.com>
From: Houman <houmie@gmail.com>
Date: Thu, 22 Sep 2022 10:39:49 +0100
Message-ID: <CABBZOskivNaYOWM3tZKhFnELApoP-FQ+CEioe59J2=4RbnSAOw@mail.gmail.com>
Subject: Re: Wireguard iOS crashes after upgrading to XCode 14
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Andrej Mihajlov <and@mullvad.net>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Sounds good, thanks, Jason.

On Thu, 22 Sept 2022 at 10:38, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> On 9/22/22, Houman <houmie@gmail.com> wrote:
> > Hi Andrej,
> >
> > It works, well done!
> >
> > A strange thing though, before your patch I was still able to connect
> > to the VPN server, if I changed the schema to Release instead of
> > Debug.  Now with your patch it also works under Debug schema, which is
> > fantastic.
> > What could be the technical reason that it still worked under Release?
> >
> > And what will happen now, are you able to actually get this patch
> > released on the official repo? The repo hasn't been updated for a
> > year.  :-)
> >
>
> Yeah, I'll circle back Apple development at some point. No worries.
>
> Jason
