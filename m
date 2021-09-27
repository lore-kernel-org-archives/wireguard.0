Return-Path: <SRS0=S6z6=OR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81C36C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 27 Sep 2021 13:01:48 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6744B60F91
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 27 Sep 2021 13:01:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6744B60F91
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dd80f498;
	Mon, 27 Sep 2021 13:01:45 +0000 (UTC)
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [2607:f8b0:4864:20::f32])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 48cec823
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Sep 2021 13:01:41 +0000 (UTC)
Received: by mail-qv1-xf32.google.com with SMTP id r18so11033614qvy.8
 for <wireguard@lists.zx2c4.com>; Mon, 27 Sep 2021 06:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=a4PlPFaWC2iA5+dbwzfXSUWUBC8mdnxqRDvmzmfIfFA=;
 b=UE8DP3P9lAJW0WdXoxLHrbH6eFKq4bC66faPXn4fuwtn34hYtIsuJJavBu5G70+m59
 esogyLWaO75sIB2lB4EOJf+NB+hOEmAn9fgQBHiLIXoJtnlQ1ih0xeSmTLLLMHhW2jBF
 A9F/R2r6aLZuzFE6bVnozj8ou9mbqu7IlTWxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=a4PlPFaWC2iA5+dbwzfXSUWUBC8mdnxqRDvmzmfIfFA=;
 b=I0kcIqS4J6GYPnma74gNpe3pn0InD3iBStYtMPXhHyA2RThfXYduhcUuuL/U5PPbzm
 MLGxHMYP/S3mU5OPcmiW//Gibexz8m2a+hH2rlkt2lIQ9LwlcOZzu0u16t/iWKP4LPly
 SSWSAWWowbMUlX7Jy+vU3QBa8Ho3WrvYrXGuPTBxah1dj3Es3wJ9r0Oj6NK++/c68zbX
 Q/E4BikAyM5rRB3ltVHo3a76PJwat9a1qv9vtQBxlTTKRFBJGYCMIgo4PX7kjJy7B/jE
 50FiGyBDN8MBHoyZ1ssReb2oAzKH8NDWF5SaG1cvCgjRNDHS88LvebT+zaGh41prPs93
 M0mQ==
X-Gm-Message-State: AOAM53051j368V/YoG9XveuSZ4IBXtrK0NynDLCtb4CC64mfi6iUnaB7
 jFhXQSsXlFUD87SHcZtnFGQiKw==
X-Google-Smtp-Source: ABdhPJzWMLaoKVE+IYLz/kD2q8UwvrhbuviVzZs0ZKRlgbgFKUoGwshVDKThM6JhRHmhRBrOhw2aTA==
X-Received: by 2002:a0c:e548:: with SMTP id n8mr23204587qvm.32.1632747699944; 
 Mon, 27 Sep 2021 06:01:39 -0700 (PDT)
Received: from meerkat.local
 (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
 by smtp.gmail.com with ESMTPSA id 18sm3283061qtz.49.2021.09.27.06.01.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 06:01:39 -0700 (PDT)
Date: Mon, 27 Sep 2021 09:01:38 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Bruno Wolff III <bruno@wolff.to>
Cc: Roman Mamedov <rm@romanrm.net>,
 Nico Schottelius <nico.schottelius@ungleich.ch>,
 el3xyz <el3xyz@protonmail.com>, wireguard@lists.zx2c4.com
Subject: Re: WireGuard with obfuscation support
Message-ID: <20210927130138.54zkvlokogcu6o3q@meerkat.local>
References: <XhEJRjPvvlk57PFUWApI0RPX2-dCuDbQ9RYxw9Y5GxzMs8YEpwVc4U-fR3avC-NT1X2UlBNQerMkOxgqrue_EEOtyZR18V329KuKev_i3aE=@protonmail.com>
 <877df2d5px.fsf@ungleich.ch> <20210927071130.GA13681@wolff.to>
 <20210927123439.7a551913@nvm> <20210927091435.GA10234@wolff.to>
 <20210927143628.36c2ceab@nvm> <20210927102157.GA23755@wolff.to>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210927102157.GA23755@wolff.to>
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

On Mon, Sep 27, 2021 at 05:21:57AM -0500, Bruno Wolff III wrote:
> > With obfuscation there would be UDP packets of random junk, and it would be a
> > much harder job to come up with a rule to drop those without affecting
> > anything else.
> 
> If your ISP is blocking your Wireguard traffic call them up and complain.

There have been times when I found myself briefly at a location that didn't
allow wireguard traffic, like an airport or a public library. Complaining
wouldn't have been a useful course of action to take, since I needed a
solution at that particular time and place.

-K
