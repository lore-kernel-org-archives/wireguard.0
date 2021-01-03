Return-Path: <SRS0=V5dh=GG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F09F1C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  3 Jan 2021 11:09:11 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4021120771
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  3 Jan 2021 11:09:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4021120771
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9d4d26a5;
	Sun, 3 Jan 2021 10:58:01 +0000 (UTC)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 39d9a73b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 3 Jan 2021 10:57:57 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id h205so57954380lfd.5
 for <wireguard@lists.zx2c4.com>; Sun, 03 Jan 2021 03:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fb52M6dIP0niyVdSNudT7f5oMscfAfYYUzIMCP78NsI=;
 b=pm2oatbPaJZSkFN2f7S76ujUJY0QSHhohscGQoulsZFcvNjp3/q89oZe7NlpYCUOT1
 /adQ+JiCgnAae4WadQi9RvXPvklPfabvqPNILQ1yNWGCGUJAHou2kkKWS5V9Av/9GIoG
 2TYHERO2Hoiq62HQwayowyuIXEMofDw0BFp1qhH26drLwvefpjEdDRYHjcmZwRVgYI35
 TtfLaV3Byz1eaaRNujKABGKmp3tCosUvcJNj4PUu9TFaFLo62TQnmlwV+u7j6gPYl6Rl
 7gn41B5j9lK+pxv4gVeS7XX8Fy+BV5o89sUcuGtHk3/DJS8lK3BD25AWpONXi6uiYCsg
 sQcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fb52M6dIP0niyVdSNudT7f5oMscfAfYYUzIMCP78NsI=;
 b=F07lv44N9Q9BlUxSlr1ZLjZKRYWHc3S6WEd190nVg/nCGCMHdiUi78qF+9vEZMgGi4
 xgLV9+vcfb7309XWbQBSe84PZ3z4Im08EIJyizk8tVcCoMdFpDkYZ9GQlsHjjttiqcZS
 sMzeSNWQt1KVVVZT0aH6vnx9ud2Af2VDMta2B7hzczLwN5/5yXOQ5xD4z6sPON/Iv8A5
 tUUCZ1jmmU1rgJVdKNObggZaiwE2DWrickVFYTeMabBW7JO6n1BlgGP4oWQmQpJk53wG
 i2WnccolEVHJwR6A6J3LVrVJu0SrLRcM3L8Mjxdzr7GNYcTJpkucs3KNki6cuhTiUKxd
 /dOg==
X-Gm-Message-State: AOAM533DxB8fdJurzEBbuZl157qKeZlv8I9Kti1kYWuEh5vUSHEbrDOY
 6NzDsXRxdjX8AWGC6n4KTS062yndX638a0wrkjo=
X-Google-Smtp-Source: ABdhPJz6guPVJXkAkShVirNZqIuRs3EWl+XmbV9eGvTgw05eRVaOGNE1jXhCaZk4zs8yrkT8Y/LB+285Z2STuvyxa14=
X-Received: by 2002:a05:6512:33a4:: with SMTP id
 i4mr33416787lfg.520.1609672116780; 
 Sun, 03 Jan 2021 03:08:36 -0800 (PST)
MIME-Version: 1.0
References: <CAHmME9oMFQtePYt37+4eyOn23mwHwP2UGxQi=SaJk9J3p1zCpw@mail.gmail.com>
 <C7CEJYWC3YU7.2DQYKR91NB6CP@enhorning>
 <8bf9e364f87bd0018dabca03dcc8c19b@mail.gmail.com>
 <CAHmME9pdDDjVWmxGdh42tJy2KbxT7ZSj9PEsjEyHRMwZpora+A@mail.gmail.com>
 <d9dc454a-15fd-a547-8d0f-b7916818c3de@maidenheadbridge.com>
 <CAHmME9q_UbmfVyd9hH5+b1n6pE=mOgZdKMcyF=AFf2Nm0QHumg@mail.gmail.com>
 <3b4f9ec2-2f50-25c9-0e27-7ca0d2f16943@maidenheadbridge.com>
 <CAHmME9pP4u5-HjZcdj0SAymGmoG36kA0sbcvRo7=mr8XZ-RXHA@mail.gmail.com>
 <CABtXGiD7Q4904nit3C=A12AnJh0rmLeW3skhPoWXEYdP2mLTXw@mail.gmail.com>
 <CAHmME9ohy8Tfko=hO3jLDCJ92X6LQmYoCyTmCgH9N0R5EdPw5g@mail.gmail.com>
 <CABtXGiDREy3K00JLQfuCmu3hTrKnorBd0VrL5kKEL4_x3Lc1jA@mail.gmail.com>
 <CAHmME9o6MdOW=ODPH=Ksh5urUJaaE5Y8HPwkdL7F-_3XCa1KJQ@mail.gmail.com>
 <b80d2dd8-0423-20ea-eea4-6d7c45a7ff83@gmail.com>
 <CAHmME9rb0qN3WauaTQAvWb1qezL=eF+WwGEmSAj4Nwxw6-bwiw@mail.gmail.com>
In-Reply-To: <CAHmME9rb0qN3WauaTQAvWb1qezL=eF+WwGEmSAj4Nwxw6-bwiw@mail.gmail.com>
From: Christopher Ng <facboy@gmail.com>
Date: Sun, 3 Jan 2021 11:08:25 +0000
Message-ID: <CAN5wt5rBzhfMJXi6VTX_4f9cWyU7m6C75qT_wgTttDGKTe7_1w@mail.gmail.com>
Subject: Re: Probable Heresy ;-)
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Peter Whisker <peter.whisker@gmail.com>, 
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

bit late to the party on this but OpenVPN themselves recommend you
disable compression.

On Wed, 2 Dec 2020 at 13:40, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Seems like you already answered your own inquiry: compression before
> encryption has a nasty habit of leaking bits.
