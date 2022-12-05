Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA9EC4332F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Dec 2022 17:15:50 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ed8c1fef;
	Mon, 5 Dec 2022 17:15:48 +0000 (UTC)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 62f097e7
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 5 Dec 2022 17:15:46 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id x22so62632ejs.11
 for <wireguard@lists.zx2c4.com>; Mon, 05 Dec 2022 09:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YMGRCPfEFbclnUll8KLGsoB68L/AJJnDEUstiScUDbs=;
 b=G23AYJHTOdEw7EppIckMCYG0c08nClsX66VPXk1hdWSM+rU27w3LvqSkJSkcZ4SOPT
 V1cEwxY5DG3BR3XfwQrYKrYn6en3XC3TTKJxrfezIqnwcxitrN9dsSGaErOJIVwQKkMw
 RB1Duvm3xXgs81ubwrnT/jYWvSST47FmIUnQcI4erOovrtBRVLiJNOOMTwlTFwU+VL3t
 zXqFrws9cAN03y6FDSTcfkpnNr7U4bv/WDyvlMV+oX6L0W+Zuu+8562fqgEbuZyahPv7
 oczxi2hz0NRcqCc6GDX/0oVaGY1SZDuEKJI1l28T0wOMziplX5s467SGGD9UqOBdRDsD
 ErQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YMGRCPfEFbclnUll8KLGsoB68L/AJJnDEUstiScUDbs=;
 b=Y7bjSgi2r+BNTkzM0mvWWFPBOMPsvsWJaJz4cAEkGpwzhCyKGkOPUDv5qEEwnKE2hD
 PSCxqo0nQTBzUneCWjZWvwGZ5CqCPfFidZF753iIFLAYfjunjGZ/knMxN90oX3MEE7UD
 o4agc26sIfx/tCejZc+hVE9ubV5CG7mOiywX+5BYft99BevlDSPhns4c9Bn2Wlh912hu
 QrEKxeVDchGoY6CXQ7qNI3/9pZSS4zDrPYFqeqZiKSRuaW8Qq5qYy3MxBM+kyelIuzkA
 SAbFb7eUIifHYcmDDhams3K++0aaSvHRbIRquEOUxD5wRY3s1pEaZafXKyET2uyNXT+R
 j/HQ==
X-Gm-Message-State: ANoB5pknwWm7VLZ7APJYrl1HMyIPF989Bbc9J/L+79NFAU7UJmm1jsxW
 zVJ2jiPcUIDu1kmPbMZZ/1B1cmJhDpuZHBF3N3o=
X-Google-Smtp-Source: AA0mqf7Ch+pTulmhjv9zKGSWtbt18J3zSZcAizV2FN4dVrOm2f14cT2dhEyM/BVlXFPJCXM0jIBn06FBajLwt/NskyM=
X-Received: by 2002:a17:907:1dc6:b0:78d:8533:be13 with SMTP id
 og6-20020a1709071dc600b0078d8533be13mr69114462ejc.716.1670260545596; Mon, 05
 Dec 2022 09:15:45 -0800 (PST)
MIME-Version: 1.0
References: <CABBZOsks3ZnpcURYHSQcaWCe8ETY21zitPY5TvtTaAm38DT5EA@mail.gmail.com>
 <834CB179-958C-4C0E-8B17-9918C8A992FB@mullvad.net>
 <CABBZOs=9VVSDEGPw1eQWmusJotA5toLCn1-uNQeZ+moPthAOxg@mail.gmail.com>
 <CAHmME9pZy+EYQbmrBi_5Ei191zJ_X3imSuZ_U766HhXp39MHbA@mail.gmail.com>
In-Reply-To: <CAHmME9pZy+EYQbmrBi_5Ei191zJ_X3imSuZ_U766HhXp39MHbA@mail.gmail.com>
From: Houman <houmie@gmail.com>
Date: Mon, 5 Dec 2022 17:15:09 +0000
Message-ID: <CABBZOs=yZj7R1oWrj9EUDk8QSGfbhNSjBLmhOtqAPrT5Esrh7A@mail.gmail.com>
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

Hi Jason,

I was wondering if there are still any plans to focus on the Apple
development and bring the repo more up-to-date, please.

Since the latest major development on the Wireguard Linux repo seems
to have finished by 31st October, I was wondering if Apple dev could
be prioritised next, please.

I can see there was an update to the License file a couple of weeks
ago. But the last real commit on Apple repo is from Sep 2021.

Many Thanks,
Houman


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
