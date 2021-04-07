Return-Path: <SRS0=07kU=JH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EBACC433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 10 Apr 2021 14:30:20 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D46B5610A3
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 10 Apr 2021 14:30:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D46B5610A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 35c8e100;
	Sat, 10 Apr 2021 14:27:27 +0000 (UTC)
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [2607:f8b0:4864:20::32f])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2b1375d6
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 7 Apr 2021 23:01:23 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 s16-20020a0568301490b02901b83efc84a0so422854otq.10
 for <wireguard@lists.zx2c4.com>; Wed, 07 Apr 2021 16:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q3jo5ftFv6PHObHsIjq/gKDK9GPmp2jzAdoR/9Rqcuo=;
 b=GG/XGszTMWnhSlU8W5DWAYGD7qi8nMq7wCkKrVJ6NSLik+6qKBLHCaEPdXsIQSeEkF
 XL3Af9buM/YNuL1RUoXai/y4+poGT+TEJLwQ3v8DKnqN5ZaVRvX7cPlU/269l1fxZ8/d
 +9meJAAFKw9/OHuzFun8axZDU6Rp7XbWIVPsG1RT6uRWUWrxXOUFGrhOEx1NkdhTz0Zp
 XRAfXXsPacwLHNQNCjagPkhfzvX4q4YyylhV74UE0nKQmXPuaWMoQIkDJnLzMPhE0rws
 fCC49g6QfglteDKxuF3Y1R+sotGXZWI4mZELJXiraJ7WPIO5G73wy2wC84/qo8PZkqu7
 zNhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q3jo5ftFv6PHObHsIjq/gKDK9GPmp2jzAdoR/9Rqcuo=;
 b=DecRa8ffUv0pyxDvmN4Hfspoc5R0JEtz553oKjAo00jjqiioh2WRySstvWVSlwDGZN
 DzZVsHuYfNsaJVxBkoa/sxL01s8H5e2CpaCdZnWHoL5ie4iJT4X/0P/xayRjE9nYyzqj
 eTnYZYS2QWewCERoCj/4x07EEzffEIPHf3kd8N/CzPbjDYbDEEssaZMyykpljp6F7MT8
 sjR6Lsu4A3IJG9pT3l8QUR7N1QPLrWrIDAKbgCQKcpJUU9DaQgihiKSam/rjL5WgQ/wR
 V/gnwRWIZbUAxAH9bOYJViiANkfegwLXObk/XleoUtYxP2lrknrN880WpFgZb9IvM5vP
 jzjA==
X-Gm-Message-State: AOAM533IRq+CV71tdkqK3dOAWGRCZc8nrazXtay8M+12I3S/MyAsSPjt
 TbE/tLuRkZNvwd0tmKoXQ8y/5VAGIxOkte4kNcI=
X-Google-Smtp-Source: ABdhPJyCxlgDwbUF5nD8FyfPJDSEAIc6ENLPGcJ+xaUtCS9z3qPQ0MeK9jjXt8E6Wd9SWZQu8ssPcLVHQgiWZXrTzr4=
X-Received: by 2002:a9d:6e09:: with SMTP id e9mr4959507otr.195.1617836482081; 
 Wed, 07 Apr 2021 16:01:22 -0700 (PDT)
MIME-Version: 1.0
References: <e166447dac58ecaa73bf3f6a2b9bece6a01bf5cd.camel@infradead.org>
 <CAHmME9q-qw=sCxz6Fije+ENQTY2-GdS4bZLSakuh+6Eze4LR3w@mail.gmail.com>
In-Reply-To: <CAHmME9q-qw=sCxz6Fije+ENQTY2-GdS4bZLSakuh+6Eze4LR3w@mail.gmail.com>
From: Daniel Lenski <dlenski@gmail.com>
Date: Wed, 7 Apr 2021 16:00:46 -0700
Message-ID: <CAOw_LSEasJuHDPXGkVQnYh_aHd+nOY53D0LRUXuH+pN45ynz2w@mail.gmail.com>
Subject: Re: Duplicate IP address, and permissions problems on Windows
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 10 Apr 2021 14:27:25 +0000
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

On Tue, Apr 6, 2021 at 5:17 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> It's pretty typical behavior on Windows for IP addresses to be
> exclusive per interface. WireGuard for Windows does something similar:
> https://git.zx2c4.com/wireguard-windows/tree/tunnel/addressconfig.go#n22

Thank you! That's very interesting.

Following David's initial implementation, I wrote something for
OpenConnect that's pretty much the same as yours:
https://gitlab.com/openconnect/openconnect/-/compare/5e6e9b850756157164f83cd4fedafb747fbbd50f...0bca5b32ac478b5d03b6e88f96bf29c6556610a5

1. Uses GetAdaptersAddresses to list all the addresses
2. If/when it finds a clashing address, it uses
GetUnicastIpAddressTable to determine the up/down state of the other
interface
3. Only delete the address from the other interface if it's non-UP.

I was also annoyed that the GetAdaptersAddresses return structure
doesn't provide the adapter state, and that I had to go for this
convoluted O(n^2) design.

I guess this reassures me that there isn't an obviously-better way to do it.

Dan
