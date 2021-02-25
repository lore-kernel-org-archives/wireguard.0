Return-Path: <SRS0=9XF/=H3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A799EC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 25 Feb 2021 14:40:43 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B41F664DE3
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 25 Feb 2021 14:40:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B41F664DE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 28237a97;
	Thu, 25 Feb 2021 14:38:20 +0000 (UTC)
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [2607:f8b0:4864:20::1035])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 13e7cb99
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 25 Feb 2021 14:38:19 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id b15so3628645pjb.0
 for <wireguard@lists.zx2c4.com>; Thu, 25 Feb 2021 06:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AcrxzF+eRm1wGT5Q7fO9TZYcUPeR65TNF4NURCpqqqc=;
 b=eB/k8UFtYKjKoE2Gcyw8Fnvb9TS5oCxmSMPpDG6SHcTLmIRPS1LVxkcUA2+qZkQCg7
 UetemjtIQbmr0mu7InMho8AtNeXMJE8kWbBFfwwc9dFOIe/f6vjeL57a6/u+Fx7a37C/
 FcOTJ7/uGEK0s+mENcYgrjK398q3feG6XSFrnuLeDFyILNI+hFNM+eQZ+ZrmWim01yru
 fD8ZIVsZQrW7PlztUO7VFrEl2HXOw8Ur83oN1B6XzesbcduqM6InJ0WJTTeF/rbcatNO
 EkWF492fWq+CoeCtFvyzCGx/cR4WuDGwUZG6zaqbgTU01jfYZmv+1GN2sD60TL3w66Bj
 czGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AcrxzF+eRm1wGT5Q7fO9TZYcUPeR65TNF4NURCpqqqc=;
 b=djidDHgqU9dOQAwpt3ULXW4nSUxN80E1AiSOa85uM8xm273T0wdmBjf51wosPpKw7R
 qJRy6kBP5OUiHQLQxGL+imgwEvjSiSfrBiIUvuVLsBvSopxza3OOE35j3miMouZ9lsG1
 t0pz/ZJqwCug1RPLqIRply7UqUIvgdXfxI2KOBaCYMh6BeUl0YU3pxFUzEedXBewPQQ1
 qe7+N4dVTajmubi60DoTDf+1Ba0mvanHKHjC2ofcYN07hhtPQ43xGPGYjg0XbpOzsJkE
 RS2cCS+T4yWTcdShHwTT1y/7LPJCELRLtOf71INpBqClo/UE1SR6e7shLfQ/J9WsVHSH
 Y0dQ==
X-Gm-Message-State: AOAM530Y0LFEj9UKEr/Mx2kZJY73OTFklLjEPg3b20DktdQSp08jc8u9
 Yz8VVFHasXgEWZq2cJzsRAasJ0nONisRyR1iHGU=
X-Google-Smtp-Source: ABdhPJwcCsrQU9M+kGS+7N8rwhQklOoAUbm/5DeGW82L5wpvon7L9oDLHnr23LbOxxAgbF/vQiCyG93qfs9V5gHjMBU=
X-Received: by 2002:a17:90a:8906:: with SMTP id
 u6mr3596930pjn.223.1614263897571; 
 Thu, 25 Feb 2021 06:38:17 -0800 (PST)
MIME-Version: 1.0
References: <CAEK8JBCS9gUXFRFpBS5pns_BZ_fKWHPV3+VrxtqEpt4kA0m1Vw@mail.gmail.com>
 <CAHmME9oj6v43HtVHFh7fwUT4WO7bpDsAMq-9eLREWStoEJcJRA@mail.gmail.com>
 <CAEK8JBCg94R_AgrS6ek7DEUjEiCGFE4M3utipCRDLj5VUQa0vA@mail.gmail.com>
 <CAHmME9rKdyBq-Ky1jwnUuE4vzbqES2H_J=QnnfB45ifQ0mjTGw@mail.gmail.com>
In-Reply-To: <CAHmME9rKdyBq-Ky1jwnUuE4vzbqES2H_J=QnnfB45ifQ0mjTGw@mail.gmail.com>
From: Feng Li <lifeng1519@gmail.com>
Date: Thu, 25 Feb 2021 22:37:51 +0800
Message-ID: <CAEK8JBD1xt8nK6UJySmUMtG4F9tt_Te4-dXMw8uoKzTxxAOOWg@mail.gmail.com>
Subject: Re: Windows 10 has poor bandwidth when using wireguard
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
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

Great, Amazing!
thanks!

On Thu, Feb 25, 2021 at 10:35 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Hi Feng,
>
> Great to hear!
>
> You wrote:
> > In the LAN environment, the download speed is 40MB/s through WIFI to access the peer.
> > When the wireguard starts, the speed is down to 8MB/s.
> And now:
> > The speed is up to 25MB/s, 2x faster than the previous version.
>
> So new speed is 3.125x old speed.
>
> I'll keep thinking about the problem space and try to get us up to the
> full 40MB/s.
>
> Jason
