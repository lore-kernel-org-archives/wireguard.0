Return-Path: <SRS0=1oQw=5P=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF081C43331
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Mar 2020 05:32:24 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64CB620780
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Mar 2020 05:32:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="zMSpg8Fr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64CB620780
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 68a976f5;
	Mon, 30 Mar 2020 05:24:20 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7489650d
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Mar 2020 05:24:10 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5bca364c
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Mar 2020 05:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type:content-transfer-encoding; s=mail; bh=U/6mmiDZZTNt
 05MoUWkyP/2HneY=; b=zMSpg8FrkDEhjqR6qROp/bsl2ormL87OKKnMgk3adg1t
 ZCAcXZkQvDIyl/qwarXj4zKOPn0gpJmQOXrFzHpoi71t9Uw3JzR0OiQLGqSsYMQ0
 KDawnN1ab9m1qwxCLMMUg2j0Z4iavoTWjsagcFZYA8auL53h5kM793afdhEEoF+l
 niKuepPHTbWH7xzZIBjeyWKvUpJIblizaSu0IerZYaJXb1W3ZcEy5lKGlVZKr6xZ
 e9O+73RKDVd8ltqJ26X5yL9CxNlEsKeKuCZEJ2XyxwZiQiC6UpCbOfWN6JEsxMtc
 1XFAWZjat1TSyYkM2kSTpx9oMc9ZUMO9yGverW40Qg==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ff53f19d
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Mar 2020 05:24:10 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id h131so16428795iof.1
 for <wireguard@lists.zx2c4.com>; Sun, 29 Mar 2020 22:32:01 -0700 (PDT)
X-Gm-Message-State: ANhLgQ0vYd+DjiL/BWdXubn3QUt6qST6szT2u7yU1hHyULHfHRpQ4CSX
 HwrjnbprfLKAL/q4tyO1oMezsY02vKIInTXFza8=
X-Google-Smtp-Source: ADFU+vuQsnvZCt7uZPOEboc8pV4rrAV2r9MHBj+HbiSgNQ/IEswbqkUrUzVVNj0z8lIwutSFyi/lz86GJdxAFPMmbyE=
X-Received: by 2002:a02:2a4a:: with SMTP id w71mr9490481jaw.75.1585546320671; 
 Sun, 29 Mar 2020 22:32:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200327170750.5285-1-suyjuris.gi@nicze.de>
In-Reply-To: <20200327170750.5285-1-suyjuris.gi@nicze.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 29 Mar 2020 23:31:49 -0600
X-Gmail-Original-Message-ID: <CAHmME9r4vDKeWCjp2XF3pKaKUDokDphnVoYBqV5YfLd=gTNbPA@mail.gmail.com>
Message-ID: <CAHmME9r4vDKeWCjp2XF3pKaKUDokDphnVoYBqV5YfLd=gTNbPA@mail.gmail.com>
Subject: Re: [PATCH wireguard-windows] Calculate the actual route metric by
 summing interface and route metric.
To: Philipp Czerner <suyjuris.gi@nicze.de>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Simon Rozman <simon@rozman.si>
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

On Sun, Mar 29, 2020 at 8:29 PM Philipp Czerner <suyjuris.gi@nicze.de> wrot=
e:
>
> Signed-off-by: Philipp Czerner <suyjuris.gi@nicze.de>
> ---
> Hi,
>
> I had some issues setting up Wireguard behind another VPN. Curiously, it =
bound the physical interface instead of the other VPN, which was the defaul=
t route. According to MSDN "the actual route metric used to compute the rou=
te preference is the summation of interface metric specified in the Metric =
member of the MIB_IPINTERFACE_ROW structure and the route metric offset spe=
cified in this member" (documentation for MIB_IPFORWARD_ROW2), but the code=
 did not seem to consider this. After I changed the calculation, I got the =
expected behaviour.
>
> Cheers,
> Philipp
>
>  tunnel/defaultroutemonitor.go | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/tunnel/defaultroutemonitor.go b/tunnel/defaultroutemonitor.g=
o
> index c102b64..4b24e8e 100644
> --- a/tunnel/defaultroutemonitor.go
> +++ b/tunnel/defaultroutemonitor.go
> @@ -33,8 +33,14 @@ func bindSocketRoute(family winipcfg.AddressFamily, de=
vice *device.Device, ourLU
>                 if err !=3D nil || ifrow.OperStatus !=3D winipcfg.IfOperS=
tatusUp {
>                         continue
>                 }
> -               if r[i].Metric < lowestMetric {
> -                       lowestMetric =3D r[i].Metric
> +
> +               iface, err :=3D r[i].InterfaceLUID.IPInterface(family)
> +               if err !=3D nil {
> +                       continue
> +               }
> +
> +               if r[i].Metric + iface.Metric < lowestMetric {
> +                       lowestMetric =3D r[i].Metric + iface.Metric;

Nice semicolon ;-).

Thanks a lot for this patch and triaging the issue. Nice to hear that
nested VPNs work. If you don't mind sharing, I'd be interested to
learn what software sets up its routes in this manner.

Anyway, applied here:
https://git.zx2c4.com/wireguard-windows/commit/?id=3D66ad537f4e2144112cb668=
6c4fc4856d70bf6a3d

Jason
