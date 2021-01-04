Return-Path: <SRS0=t67z=GH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B1B1C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 Jan 2021 13:40:08 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FA3A207B1
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 Jan 2021 13:40:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FA3A207B1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 10d1b84c;
	Mon, 4 Jan 2021 13:28:12 +0000 (UTC)
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f6cd26f2
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 4 Jan 2021 13:28:10 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id c7so27361171edv.6
 for <wireguard@lists.zx2c4.com>; Mon, 04 Jan 2021 05:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Nrav1kR773dg/LaP1RkWLKUuQ81XJzhtYOxzGdoCS/g=;
 b=brywKm+rEcUJPwGhqmrn4N0PTrwnXNOwGDmUOlygK+yr+IPHp67FtozZImbO7FoPh5
 fXOpnAIXRnJQnSuza6Ao8RFa5vKCxkH/mvWE8ie8O0kyqMvcIP/Bg4vhBFFp1K1IGMwW
 +jzp0X6U6TYI56kCP+7z8Y+eQUo8z7Md0QvX1sXgkwvT0feG8yc8ereksDXM6GRopufr
 EglDD6mvu++iOyyazQ5OrdaDMyPBJvSkRtl45aBaG9pWeqAoxLw0lCkP0NvgGljXV9+Y
 eaGZR0dWGsAMjB3vEeSVzQKLTcySCI9Df++FWJJnlxU2UH7XgqKctALkWQHJ/bgHZxcP
 qEpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Nrav1kR773dg/LaP1RkWLKUuQ81XJzhtYOxzGdoCS/g=;
 b=f8uHdCJXcSn7E4VXq2gllk9G6cS5uDCvt3nweqhQroFArhvB0H0kLxmsy2XKPWWRL+
 s6yURIdIexiDfkPTN+CWNP6oX/q4Ik5Pwbk4FE3DHQ3IAK8BvS/2hSWS2qbpltek6EyV
 8oUG4BZkHy6lsUzI5d481gKBvDCXliHBm+BFfM9T57oYuSQIHS27G2kNyvtBOxxZLllU
 AE3RjZ+nNVEhySMdbvA7ULORv4Ksk9fQHa/PBYVVnfLIEHwZqbGKhLWvlk90YomU3AO3
 NJIUHPfdvyWoPXebWmbuvKhLQURmhTX8U6iE7CdZBk26aOhvb0ljhWmeexPOHp7iw5QX
 Of2g==
X-Gm-Message-State: AOAM533YIZZsKO+TsVW4KQpMlu+rJ7DUcXk53r9O+HSuB+xIgZvZFOwm
 3+wUchHEoHSZkfz8Ha8selDhqGkfjo0eduOxPXXPtDcB8xY=
X-Google-Smtp-Source: ABdhPJw7OOV+/KhAJOX25HeO+CeFSBu/lxloHQMtgyrPSsd4aYhqvtbCEKt7eh8h868ZN+bsWkTfjEZ+pu/G8eXp4NI=
X-Received: by 2002:a05:6402:318f:: with SMTP id
 di15mr71171950edb.237.1609767539244; 
 Mon, 04 Jan 2021 05:38:59 -0800 (PST)
MIME-Version: 1.0
References: <20210103215441.GA24251@server>
In-Reply-To: <20210103215441.GA24251@server>
From: Henning Reich <henning.reich@gmail.com>
Date: Mon, 4 Jan 2021 14:38:23 +0100
Message-ID: <CAOAVeL3EodpJ9YS5TsPgq0vPhCGX-W1eueASTV+SPZ9NJA0TKQ@mail.gmail.com>
Subject: Re: WG default routing
To: Chris Osicki <wg@osk.ch>
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

Hi,
you can control the traffic is routed with the AllowedIPs option. If
you use 0.0.0.0/0, all traffic is routed through the wireguard tunnel.
If you just allow for example 10.10.10.10/32 only 10.10.10.10 is
allowed. 10.10.0.0/16,192.168.1.0/24 will allow
10.10.0.0-10.10.254.254 and 192.168.1.0-192.168.1.254 and so on...

I use
[Peer]
PublicKey = xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
AllowedIPs = 172.16.16.0/24,10.10.0.0/16,10.0.0.0/16
Endpoint = 123.123.123.123:12346
PersistentKeepalive=30

Am Mo., 4. Jan. 2021 um 13:40 Uhr schrieb Chris Osicki <wg@osk.ch>:
>
> Hi
>
> I am quite new to wireguard, moving after years of OpenVPN, and found it simple and _really good_.
> One thing, however, makes me wonder. Why WG tries always to take over all my routing?
> My first try was with wg-quick, and noticed all my traffic went through the WG-VPN connection.
> It escapes me why. What is the idea behind this policy?
>
> On my Linux boxes it's not a problem, I don't have to use wg-quick and with few lines of bash in a script I have what I need. I have root.
> On my Android devices I don't have root, and I cannot change anything in routing etc.
> Why don't you provide an option to specify which net to route which way?
>
> Regards,
> Chris
