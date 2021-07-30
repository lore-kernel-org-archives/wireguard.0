Return-Path: <SRS0=xsnz=MW=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89720C432BE
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 30 Jul 2021 15:58:14 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD02C60EBB
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 30 Jul 2021 15:58:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BD02C60EBB
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 74bff3a1;
	Fri, 30 Jul 2021 15:58:11 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a66028a7
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 30 Jul 2021 15:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1627660684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=niVI0YKrdZdp9+BpBNLyyqMuEv8EDn88Sz/fxNylZbk=;
 b=dLKUmGcy8P1FwGySzsyd8LeaP6H2da+Xb/aMyy5xHzviToIE3VGFdjF8Jp5FUG1KiDkDyk
 GKjklyOOGedqVLpC68vmq6UIUZ+dadZJhbqVMPIVvUx9AiUlOZjNbGH9YTYP8Xf7VOjUTo
 RmPt3UcNxujNMRdHfCCMg7C9uWnpD7Y=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f62ccdfe
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 30 Jul 2021 15:58:04 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id a93so16776972ybi.1
 for <wireguard@lists.zx2c4.com>; Fri, 30 Jul 2021 08:58:03 -0700 (PDT)
X-Gm-Message-State: AOAM532ibT3A2kg7wvOBTiCV8vUyc9uE8ozt5itqlWBf434z60IA++Za
 4/NV+WMPHvnu+j0B6LxH9cqG4hOhnz1EmDnvIpA=
X-Google-Smtp-Source: ABdhPJw74mcmmPNIUasPiFE98SvXSYkUE0N7GrE/gbpAOlhCGPREi5rEwNSxuzA7f1g+0eKfVBc+UgdZM3btSyBaf9A=
X-Received: by 2002:a5b:5c6:: with SMTP id w6mr4008522ybp.279.1627660682894;
 Fri, 30 Jul 2021 08:58:02 -0700 (PDT)
MIME-Version: 1.0
References: <9f621ce6-ec3d-0641-c359-756d0ad36f65@gmail.com>
 <6a01b182-a98f-1736-676f-d0811f6de086@gmail.com>
 <CAHmME9qtPLOTaY3UzyCY1C6guVZXvJjXHeFwT8=94d=Zpjj=Tw@mail.gmail.com>
 <CAHmME9r5kecTj1iBGyqjvNRKsHZPRrXmN+fDXkaX3y==VPoMqA@mail.gmail.com>
 <29f66915-7fe8-94cd-cb17-bfba49072929@gmail.com>
In-Reply-To: <29f66915-7fe8-94cd-cb17-bfba49072929@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 30 Jul 2021 17:57:51 +0200
X-Gmail-Original-Message-ID: <CAHmME9r1zkZ+mXkY+8jTfeVrGPeHZwObrBvcEQM_hEHZvYzPWw@mail.gmail.com>
Message-ID: <CAHmME9r1zkZ+mXkY+8jTfeVrGPeHZwObrBvcEQM_hEHZvYzPWw@mail.gmail.com>
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

On Fri, Jul 30, 2021 at 9:25 AM Peter Whisker <peter.whisker@gmail.com> wrote:
> Does this mean that the driver speed will improve as it will move out of
> user space into the Windows Kernel in a similar way to Linux?

Please save further inquiries about topics unrelated to pulsesecure
until future announcements are made, in an applicable thread.
