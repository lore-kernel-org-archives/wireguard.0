Return-Path: <SRS0=K437=FV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40B5CC4361B
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 17 Dec 2020 22:35:48 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00BE2238A0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 17 Dec 2020 22:35:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00BE2238A0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=capeyron.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7f0d17e5;
	Thu, 17 Dec 2020 22:26:45 +0000 (UTC)
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [2607:f8b0:4864:20::f29])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 56ec860e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 17 Dec 2020 22:26:22 +0000 (UTC)
Received: by mail-qv1-xf29.google.com with SMTP id et9so19859qvb.10
 for <wireguard@lists.zx2c4.com>; Thu, 17 Dec 2020 14:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=capeyron.fr; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2xCtiJ5EZuEQgQwJMvVBzblvGjGiL92Pwa1UVgyYIDI=;
 b=EawEi4yYy20BMTshZvVpIkC2E333Sg14rIMWnE/5WUWjKQYAQgEkDsLnzKdoI+KxlL
 x0OiYt5TlAK7PxP7+z+43DPOk8RO2ObpsBc0BFD2YeuvSPUANRENqouohVnVav6hI3Qa
 s2+asSv4o5LFUXk0Q+LEGn6XttDUwribvCTIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2xCtiJ5EZuEQgQwJMvVBzblvGjGiL92Pwa1UVgyYIDI=;
 b=shQCug9D6SwPLmMFmy+YA+H4EXJSB/EQ9RaR8/HHBD077YMsjxvxlQp6VqJ+dYFMNX
 BPsyDufm6XWXtZ6iyR9WELfYPNfQnLspQVH6PmVmyQcA/9MpyiPN+cBoZMCJE5Qy9FuU
 OBmIdvfgGGdyGhvhVIWeshaTYYSGkSusg/cWbyvK4ngxatqavSU/4jBqJZskUyXtsKJS
 FY6AbBqOPSk2L9rpd5X/1nG2lZaxN9VgXAbQLJocAvZpUzkEkXplREf59sMEX3LxQd9z
 OtZioNAkh9Uq9E4hrRhwWc5z7QftSk1DWCECsBKaGASyfBaYg7PrmurF2KJ8CDKQMNJ6
 jMlw==
X-Gm-Message-State: AOAM53314oK8QgyOFrQ1o3GWqlGFQ3qC7JiqOLrG9dIqOUyGRgCfJVgT
 P07LHBttbEmh6SfEwQWyzNfcE+iHo5Jzwhp7Lf3MGSoUXsyFtQ==
X-Google-Smtp-Source: ABdhPJxLlx/+crEbOa1gSO6magZn6smWrOegZ0ZqXIu3OKBaWOCch9fMRIcZ2bfcmYFiDyK7G8B5wfzWRsDTaJYL83s=
X-Received: by 2002:a0c:9e5a:: with SMTP id z26mr1705834qve.2.1608244496455;
 Thu, 17 Dec 2020 14:34:56 -0800 (PST)
MIME-Version: 1.0
References: <A9F23E70-C8AA-4C54-99E4-63E2E40FE0FA@glenn.id.au>
 <CAHmME9pzNQeEdDnvu8mXFnYHgNibuqSLi5viAtYjDrF0wbEMoQ@mail.gmail.com>
 <CAHmME9qCRWXMVjuz6g6M0wMvhj9v90sTkHNOFCr+Jht-rUNFoQ@mail.gmail.com>
In-Reply-To: <CAHmME9qCRWXMVjuz6g6M0wMvhj9v90sTkHNOFCr+Jht-rUNFoQ@mail.gmail.com>
From: Nicolas CAPEYRON <nicolas@capeyron.fr>
Date: Thu, 17 Dec 2020 23:34:45 +0100
Message-ID: <CAAhtBmPe58GJX1s2c+9fNvNEbzsfcYOp2Dm63UjGh1QRSfXU2Q@mail.gmail.com>
Subject: Re: WireGuard on macOS stopped working after 1.0.10 update
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 17 Dec 2020 23:26:43 +0100
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

It's OK for me

Thank you very much
--=20
Nicolas CAPEYRON
Conseil en h=C3=A9bergement, architecture infra web
06 26 12 27 17 - https://www.sysadminbadass.com

--=20
Nicolas CAPEYRON
Conseil en h=C3=A9bergement, architecture infra web
06 26 12 27 17 - https://www.sysadminbadass.com


Le jeu. 17 d=C3=A9c. 2020 =C3=A0 23:06, Jason A. Donenfeld <Jason@zx2c4.com=
> a =C3=A9crit :
>
> Hi list,
>
> To provide an update on this issue:
>
> On Thu, Dec 17, 2020 at 2:43 AM Jason A. Donenfeld <Jason@zx2c4.com> wrot=
e:
> > I'm really very sorry about this regression. I fixed it earlier today
> > already here: https://git.zx2c4.com/wireguard-apple/commit/?id=3D20bdf4=
6792905de8862ae7641e50e0f9f99ec946
> > but now we're stuck having to wait for Apple's review of the fix. This
> > is as frustrating for me as it is for you.
>
> The macOS update went through, and version 1.0.11 is now available
> from the App Store. In my tests, this fixes the issue, but some
> confirmation from list subscribers is always helpful.
>
> However, they rejected the iOS update, due to the link in the version
> info window to https://www.wireguard.com/donations/ that we've had on
> there for two years. You can see their rejection here:
> https://data.zx2c4.com/apple-asks-me-to-remove-donation-link-from-app.png
> https://data.zx2c4.com/the-screenshot-that-apple-provided.png
>
> Not wanting to hold up getting this fix deployed, I quickly removed
> the link and resubmitted to the App Store:
> https://git.zx2c4.com/wireguard-apple/commit/?id=3Da4fc0f64b8bca8afae5aba=
b37b81ba0b45836975
>
> So now the process of getting that fix deployed on iOS starts from the
> beginning again. It could take another 24 hours. It could take a full
> month. The process is opaque, and try as I may, I don't know what else
> I can do to get the fix out faster.
>
> And again, I'm really very sorry about the regression in the code, and
> that we didn't catch it earlier. I hope the update gets deployed to
> you all sooner rather than later.
>
> Jason
