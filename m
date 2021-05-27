Return-Path: <SRS0=m5DG=KW=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E212C4707F
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 27 May 2021 09:24:45 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8374613EC
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 27 May 2021 09:24:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8374613EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d6101de0;
	Thu, 27 May 2021 09:22:27 +0000 (UTC)
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 80e8b3ab
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 May 2021 09:22:25 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id e12so479810ejt.3
 for <wireguard@lists.zx2c4.com>; Thu, 27 May 2021 02:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pEMMFzHcb33SgCbZVrTDwRMX0x3ahqizemAotew7xR4=;
 b=CDiPoDpmNO3t1B/GMhjmcFvM+wpdIrF4WPGz16HDS8hbZ93oYvfPpP5DER3qhcqbpA
 YtJm++LvT/hNl1kF+U+/6RjkMnBuDDjW4TiYMq0o3BrYxh8WF3/xCajJNbOlhh9bi8Bl
 0goJ0PHcPT3ZLEabDDNRYWQIQgB0wnFMKtZU3gf8cJfe0vdEDRybExDh6+8tkdR9+ej7
 /Si59XdVzpRDdARownKjS2RgMbG93qrT1v++HNcuRPtT9UVP/z0VY9pXySkZFt3SGI4B
 AE9OKOq0aaAfZqvO4cWB5LotxDixYxvPYiqyOXEq8psMx6NDkg6Mk+R1SRtMBCtAYh+L
 5y7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pEMMFzHcb33SgCbZVrTDwRMX0x3ahqizemAotew7xR4=;
 b=PD/3MveC8H9ROotmtG8sLzVevoGvfykbFZQdlK7imIMNvJWok9+jh3kx7MRrj4KT00
 EAsGL0zYqcwlCZVfkGqT7Ycnf1V0v124c/dpNGg/f8aLHDGkLvI0ZFXfHcaiA9RDqNN/
 3oc6/Nk34ZjgsLdswofzHrJygbffq2D/8601RJorDzNKeJzQN08M7yejS8/ZxOwq9fE5
 6IdANIIai/D0iwoGQ2gsj7tJq9mbIus/llLD0vcoxqTpEG4UlLX9a+QFe+J7QGwEffpM
 OxHjNzhNtN/f9Pv+Jlvfm1Cprs6Lx8vgBph+bs8wKp9L5x21OWLFKZmUyqQpJlD9395P
 m2zQ==
X-Gm-Message-State: AOAM530IxuB6UwgJu7HHPUhYp4LmU4BjdyngTVo2P5Cmz/7Gt+wz1adQ
 6FXRBLK9k98Y9Z5crFs13M9RS6VSy2Q=
X-Google-Smtp-Source: ABdhPJwOa6khrBpD8g15zbG6nxCJneapcWVsxm81XWaJk4X6I/13YoeZX9mOmD1bwowgdQ/JU7UK2w==
X-Received: by 2002:a17:907:ea0:: with SMTP id
 ho32mr2748790ejc.396.1622107345467; 
 Thu, 27 May 2021 02:22:25 -0700 (PDT)
Received: from ?IPv6:2a02:810d:d40:2317:2ef0:5dff:fe0a:a2d5?
 ([2a02:810d:d40:2317:2ef0:5dff:fe0a:a2d5])
 by smtp.gmail.com with ESMTPSA id l8sm782772edt.69.2021.05.27.02.22.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 May 2021 02:22:25 -0700 (PDT)
Subject: Re: wireguard windows socket binds to device
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <bd20cfa0-9cc4-83fb-ec53-e2e84923c485@gmail.com>
 <CAHmME9qBwT1HAz389nvAHWUFa1rWEC3thA+vMcGjQ_=vg3AsTg@mail.gmail.com>
From: Andre Naujoks <nautsch2@gmail.com>
Message-ID: <c002e093-8699-621d-35b0-28c1439836ee@gmail.com>
Date: Thu, 27 May 2021 11:22:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <CAHmME9qBwT1HAz389nvAHWUFa1rWEC3thA+vMcGjQ_=vg3AsTg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Am 26.05.21 um 16:37 schrieb Jason A. Donenfeld:
> This might help:
> https://lists.zx2c4.com/pipermail/wireguard/2021-March/006442.html
> 

Hi.

Thanks for the answer.

The registry keys were not present, so I added them manually. That and 
the PostUp script seem to have done the trick.

For now, I see this as a viable workaround. Thank you for that.

I still see this as a bug though. I read the reasoning behind it in the 
other mail 
(https://lore.kernel.org/wireguard/CAHmME9rXV2_YG3fGMErDeTjfHeNKhDC2cCYA6Kw93n9A328QpQ@mail.gmail.com/).

Maybe only use the IP_UNICAST_IF to the default route if AllowedIPs is 
0.0.0.0/0 and/or ::/0? For all other cases it seems unnecessary (errors 
in those cases would be configuration problems on the users side) and in 
some cases (i.e. mine, the non-default-route case) just wrong.

Thanks again and best Regards
   Andre
