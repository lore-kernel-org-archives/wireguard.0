Return-Path: <SRS0=8kJZ=F7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43840C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 27 Dec 2020 17:37:24 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F5BE206DC
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 27 Dec 2020 17:37:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F5BE206DC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0c23d588;
	Sun, 27 Dec 2020 17:27:31 +0000 (UTC)
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e74ace52
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 27 Dec 2020 17:27:28 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id c7so7889455edv.6
 for <wireguard@lists.zx2c4.com>; Sun, 27 Dec 2020 09:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=3It6ADd4Mk8uTOSfGqMrCeIMy5NhqpHaO8YDc+uBAkc=;
 b=P9Scj9A0rXDfMW0Rv9P38v6UVG8bs6S5288znL2Zv9mw2Y0MhbKXh/APdFx9nVPBfT
 UeV86GCgdzPptvbnlIJp7EW9vl61ap87WI0eqnrgqIrBDwP+51ecOwL+osEqXghbF+/L
 Va0PbFI187f7W6JObcDZd9gyKJBo0ggsxmtaFxgxSMrfY2vLjBHjrzblLUf8mkFmjCS2
 jVm0bA/qWOPeuLO71a476wtxcs4EefekVRWd7ymaUCjedKmFncKQAobc5eDs6NK3Lod1
 71FpEMnoxrs/KRrgKseUzrPxwWeVoGgdVzmrrUxAcGF847ePw8Gm6JGphRfZhzoqmh96
 MXuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=3It6ADd4Mk8uTOSfGqMrCeIMy5NhqpHaO8YDc+uBAkc=;
 b=FOkbHMafTewu6+j3cumYVtnnvWEQlQrdXX52nE1Y/LKnuH0QCnRbSQ6b1tienEx5zi
 DZ13ychI0O3fpjr0s3z1ZvZuKwNzwmZXUSbkHS/KQ5OYNIVhi1kEDiXjp0eJxk03Lg3/
 c7tPMut4TBzbjWgrbpfkiTu6asoclY4NVO6FwFYAZquRj/vETpuzFRa5K+ebDRzQUw9U
 ahbj3D0VWQuOQsM8SdYhxH2y2coIv//afGXY87bbnRTCVEx4OXV/8naT+QcIK0Nk+YcS
 YUNwrg1h/m7naof74jorlcQmisN7DuzRArIGUaeICBU3vhAvkSSrG4J02gNkmDIs07Ma
 91mg==
X-Gm-Message-State: AOAM533APreUEpicrwSfa2LK3n9PY+c/J/kMG9CE0zAX91I2yiHxeNkr
 xEi833J4v7qTYEaH2c3t/Bc=
X-Google-Smtp-Source: ABdhPJzetAAfyndNh5mvG4RZ385odCkNZojOh2XV8eEUnAGIDTev538dEs8h//4dTJg+OgkHm8LO2Q==
X-Received: by 2002:a50:d484:: with SMTP id s4mr39150230edi.13.1609090636551; 
 Sun, 27 Dec 2020 09:37:16 -0800 (PST)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 u26sm34950002edo.37.2020.12.27.09.37.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Dec 2020 09:37:15 -0800 (PST)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1ktZyl-0007qg-2E; Sun, 27 Dec 2020 18:37:15 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Rachel Kroll <rachelbythebay@gmail.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: "Wireguard [sic]: great protocol, but skip the Mac app" blog post
References: <CAHmME9qUN7qTRGU3mFTGHZVGPXE-csdojziZQ-kX460W7pssJw@mail.gmail.com>
 <20201226103202.q2netyh65ymfmbel@feather.localdomain>
Date: Sun, 27 Dec 2020 18:37:15 +0100
In-Reply-To: <20201226103202.q2netyh65ymfmbel@feather.localdomain> (Reto's
 message of "Sat, 26 Dec 2020 11:32:02 +0100")
Message-ID: <875z4n9mlw.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
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

>>>>> "Reto" == Reto  <reto@labrat.space> writes:

 > Hi Jason,
 > Please don't let blog posts like this get to you.
 > Following this list, as well as the IRC channel, it's very clear that you care
 > and go over great pains to make wireguard useful to all.

 > Rest assured that a lot of people, including me, are very grateful for all that
 > you do and for your nice work all over the place in the kernel.

Indeed!

Seeing the hoops you go through to support Apple users is quite
impressive, I certainly wouldn't have the patience to put in so much
effort for a silly closed platform like that.

Thanks for Wireguard, and Merry Christmas.

-- 
Bye, Peter Korsgaard
