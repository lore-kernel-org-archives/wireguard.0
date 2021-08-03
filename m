Return-Path: <SRS0=PVHX=M2=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F992C4338F
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  3 Aug 2021 11:00:31 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2484060FC2
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  3 Aug 2021 11:00:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2484060FC2
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3cdcd4da;
	Tue, 3 Aug 2021 10:57:57 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6572595e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 3 Aug 2021 10:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1627988270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i/jULzUwA1QKZQUiGEEuNcq6Gv1XmB0vOGhHNqjbLuc=;
 b=eUIu0CR4PAQRRe5KY+VSEoL8hl/SjmuGR36b5vWsCxdYWFvbf0WLAIFY8Q2UNNcWSA/vQM
 MxbYkm6uZdF1ytLEHGwaL0U0zev2eNPnQ72DFUiDo+zih770CCGIK4RO6OdwtA6vDhLkLn
 s/BPmVrcuqBflLfDhbz/EHbpb21kXso=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 81df5a53
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 3 Aug 2021 10:57:50 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id w17so33149333ybl.11
 for <wireguard@lists.zx2c4.com>; Tue, 03 Aug 2021 03:57:49 -0700 (PDT)
X-Gm-Message-State: AOAM5318dGVzeTy3ROC1N1qEkZQpU/LiNdjPdAUaD9uj+iksQqgmLUI1
 ZtMwrL/xtKqSSKMA3vanK62H7hbl8l+iGOMdVKY=
X-Google-Smtp-Source: ABdhPJz3cm38JRLABUqhcXbg/8jEPdmVMZ8nNtWim7gKjk1KS5g4rcr4+UBzaz75xbPv2TKmZcJYGDMe9jYUQiBs/DY=
X-Received: by 2002:a25:34c1:: with SMTP id
 b184mr18744233yba.279.1627988269051; 
 Tue, 03 Aug 2021 03:57:49 -0700 (PDT)
MIME-Version: 1.0
References: <9f621ce6-ec3d-0641-c359-756d0ad36f65@gmail.com>
 <6a01b182-a98f-1736-676f-d0811f6de086@gmail.com>
 <CAHmME9qtPLOTaY3UzyCY1C6guVZXvJjXHeFwT8=94d=Zpjj=Tw@mail.gmail.com>
 <CAHmME9r5kecTj1iBGyqjvNRKsHZPRrXmN+fDXkaX3y==VPoMqA@mail.gmail.com>
 <4ff6b3ed-66c0-82d4-1641-44849ca390ef@gmail.com>
In-Reply-To: <4ff6b3ed-66c0-82d4-1641-44849ca390ef@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 3 Aug 2021 12:57:37 +0200
X-Gmail-Original-Message-ID: <CAHmME9r_rbuExicpefBkwHH9HGWC8iNx05-+=gLFtAv_VV+N6Q@mail.gmail.com>
Message-ID: <CAHmME9r_rbuExicpefBkwHH9HGWC8iNx05-+=gLFtAv_VV+N6Q@mail.gmail.com>
Subject: Re: Problems with Windows client over PulseSecure VPN
To: Peter Whisker <peter.whisker@gmail.com>
Cc: Heiko Kendziorra <kendziorra@dresearch-fe.de>,
 Christopher Ng <facboy@gmail.com>, 
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

Hi Peter,

Thanks for the report. This is due to an embarrassing mistake on my
part, fixed here:
https://git.zx2c4.com/wireguard-nt/commit/?id=9da6a84089d01ddee0018198eea0ab271916d934
. But hey, that's what experimental registry flags are for, right? ;-)

I'll email you offlist with a testing build and some instructions in
case you're eager to see this work before the next release.

Jason
