Return-Path: <SRS0=BFU5=5G=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29616C4332D
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 21 Mar 2020 14:35:38 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBF7920409
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 21 Mar 2020 14:35:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBF7920409
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=msfjarvis.dev
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c078a7f9;
	Sat, 21 Mar 2020 14:28:25 +0000 (UTC)
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
 [209.85.219.65])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id da698115
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 21 Mar 2020 14:28:23 +0000 (UTC)
Received: by mail-qv1-f65.google.com with SMTP id z13so4730951qvw.3
 for <wireguard@lists.zx2c4.com>; Sat, 21 Mar 2020 07:35:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hmrqDgRqE+Pp2NWvht46UHhjbF78pcwpTodQ/Yg2pVE=;
 b=lA4GehJamzu24F1B5HGSIKyDxLfd5Pge8oqXyqURdlz61qfgLIG8M1mF+1oS2UXrpV
 ZUVOSFQGGFdN82JsWSWlX6HU8aez4EuF92mn+ZuMZwWy/HKLJq2EVTQ/jhmMDdaOreu+
 8gG+Ynq9y3cRGXhjhFAwU4CWOu3P+zoFKf2mal5Djuei8KemIzmPldpux2feATil6KaN
 wwzDP5fDZPnPsHeUc0aihi18/GoyoebZ7XK1q243hFjC++Y31LPlXy2f4H3WnqLWwgDN
 bznIsC3f9jeRhy8F9oVh219ZYkEWEL3G3Xq9idtF3PGxeDv6yqbFgrcJ+LJlKCYy3xg9
 E/wQ==
X-Gm-Message-State: ANhLgQ1zZZwisxaNdbU9a/n5do4cJWj73xGL8cbhL+yPrfpFnTOKiIHy
 2OYrWMAGKfEA5gfbAuXqLkSeC2Q0ttA=
X-Google-Smtp-Source: ADFU+vvpNH04cwhE4mwm+hz90X2msGyiJ7ki7Woz7BsJsH+hM2LF1c1J7UsbkPsLAVq23eZOoYyAzw==
X-Received: by 2002:a05:6214:11ec:: with SMTP id
 e12mr13413352qvu.89.1584801306898; 
 Sat, 21 Mar 2020 07:35:06 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com.
 [209.85.219.178])
 by smtp.gmail.com with ESMTPSA id w132sm6923139qkb.96.2020.03.21.07.35.06
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Mar 2020 07:35:06 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id q11so4238380ybm.6
 for <wireguard@lists.zx2c4.com>; Sat, 21 Mar 2020 07:35:06 -0700 (PDT)
X-Received: by 2002:a25:3ca:: with SMTP id 193mr3539198ybd.80.1584801306135;
 Sat, 21 Mar 2020 07:35:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200321133045.26722-1-tanioka404@gmail.com>
 <CALpmF+EG5-Q8E5FzZcTHcgVJmiB-0b89mtUTB-WMP2u7GchWmQ@mail.gmail.com>
 <CAA2ss9HOCN7NWfgQa4VCef+yrNJFwp60kk73z8LUCdKyB+YKiw@mail.gmail.com>
In-Reply-To: <CAA2ss9HOCN7NWfgQa4VCef+yrNJFwp60kk73z8LUCdKyB+YKiw@mail.gmail.com>
From: Harsh Shandilya <me@msfjarvis.dev>
Date: Sat, 21 Mar 2020 20:04:54 +0530
X-Gmail-Original-Message-ID: <CALpmF+EgnoPHw0PanS+cKf1u0==3Z0FJPphkBQKX_Rq1jNMDQQ@mail.gmail.com>
Message-ID: <CALpmF+EgnoPHw0PanS+cKf1u0==3Z0FJPphkBQKX_Rq1jNMDQQ@mail.gmail.com>
Subject: Re: [PATCH wireguard-android] strings: Update Japanese translation.
To: Eiji Tanioka <tanioka404@gmail.com>
Cc: wireguard@lists.zx2c4.com
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

On Sat, 21 Mar 2020 at 19:29, Eiji Tanioka <tanioka404@gmail.com> wrote:
>
> Thank you for quick response!
>
> # I created crowedin account and join in the wireguard project :)

Thanks for the reminder, strings are now available on Crowdin.
