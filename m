Return-Path: <SRS0=kaTt=75=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E2D4C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 16 Jun 2020 20:11:55 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10CBA208C3
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 16 Jun 2020 20:11:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="PU7H1Vyo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10CBA208C3
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1edd4de6;
	Tue, 16 Jun 2020 19:53:41 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f03500ff
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 Jun 2020 19:53:37 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fe10621f
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 Jun 2020 19:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=nWXssKiSkkC/qyPrpBqHWDn2MHA=; b=PU7H1V
 yowrWW4XzdMEytjW7AKJcPxJFuxRgPypEJwHfT7ARx2TFZnY2/LiKlJss7m7wWND
 sRl1a/TAdLGK0aMxkIgn0sLpm8ZPttpfNzT8Eij9ov+UxfZMwmbR+ltlmgfI7QhK
 OBuXBr+3j0vXR7jJjk3XskPnrfoKUWXQk+ji9rc/OuOHW1CZ0Legjq3ceMbypUEX
 Tf5tvPW0iuxNesmasIMFN+13F4h1trw1yxYkbwOJEH2CEX4My17ntElM0WHc+uol
 x85GHwsJG3WSRXsP5JPq1XRDdt2n6IpCzLUPN4DhtsG4XYx9kZrhw6Bu3Cel4ZHE
 y6lRzw58CamSE/vQ==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id db10b0dc
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 Jun 2020 19:53:36 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id e11so20307377ilr.4
 for <wireguard@lists.zx2c4.com>; Tue, 16 Jun 2020 13:11:36 -0700 (PDT)
X-Gm-Message-State: AOAM533LKBJwoEOyrATj00SWTE5OtcDd+comZZUldB2vtzCFwwa6d4uo
 6qFm2avZADriSBMDf1D+mntaosUTAuZxedbd9iY=
X-Google-Smtp-Source: ABdhPJyXnwMNKpkCfPgwr6LUlSb0/Lyc0WsYobVgyFCz/DG1r9Cbn8TWaxW4IZxvJGNcL39fXLYYCeiwqa9JS2U3pa8=
X-Received: by 2002:a92:c852:: with SMTP id b18mr5080693ilq.224.1592338295827; 
 Tue, 16 Jun 2020 13:11:35 -0700 (PDT)
MIME-Version: 1.0
References: <f27176e3fc6ede8d04682a9b504df177@rfraile.eu>
 <CAHmME9ovg+BBhVkKoNDd2LD-C9ChuBW5VXgj4n4V-Cp_-g0uiw@mail.gmail.com>
 <CAPqQDTAgsbLq3rdnXJHooxbMtWY5JADfTPUO_jo6MdxvTuGqrQ@mail.gmail.com>
 <CAHmME9qDF+-4Ct08oua4yGF8y1-__Was8ik7F56vmYmiE7YhVQ@mail.gmail.com>
 <aaddabc6-33bc-9947-134b-16d9ba542673@anatoli.ws>
In-Reply-To: <aaddabc6-33bc-9947-134b-16d9ba542673@anatoli.ws>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 16 Jun 2020 14:11:24 -0600
X-Gmail-Original-Message-ID: <CAHmME9rBykioLWjmL5YtmMyU7TfhopL405ubyVZm2bNhPggcAg@mail.gmail.com>
Message-ID: <CAHmME9rBykioLWjmL5YtmMyU7TfhopL405ubyVZm2bNhPggcAg@mail.gmail.com>
Subject: Re: Search Domain/DNS Suffix
To: Anatoli <me@anatoli.ws>
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

On Tue, Jun 16, 2020 at 1:48 PM Anatoli <me@anatoli.ws> wrote:
>
> Hi All,
>
> > This is why I wrote in the release notes, "This new feature will be
> > rolling out across our various GUI clients in the next week or so."
>
> Does that also include the iOS client? More than a month has passed and
> I know AppStore sometimes introduces a significant delay, so just wanted
> to confirm if this is the case or the iOS client won't get this feature
> soon?

iOS/macOS will get the feature.
