Return-Path: <SRS0=ccJ7=5E=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85067C4332D
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 19 Mar 2020 03:49:07 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED19320732
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 19 Mar 2020 03:49:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED19320732
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=msfjarvis.dev
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1dd956dc;
	Thu, 19 Mar 2020 03:42:24 +0000 (UTC)
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
 [209.85.219.67])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e87a7247
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 19 Mar 2020 03:42:21 +0000 (UTC)
Received: by mail-qv1-f67.google.com with SMTP id a10so303705qvq.8
 for <wireguard@lists.zx2c4.com>; Wed, 18 Mar 2020 20:48:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i2uUfJ1pXc6IpBQOTZsYgIFfvj3uT/gvko/2gN5IZTE=;
 b=G2n7eqaTGrQbOODv33V1RXVckJDNdw+joIFn6OUunQ7ZdFjhDpPfoEdpQzzlP/adNf
 6VdRO4KI/t8TY9z5XHYrY1USIl0aTMhaK3aiMaxFQBQ71k5v61h2w2rWwQFZMsPVR4Bj
 CkRJFh4P0slnrUlw2w4x33/HokZoYWXMfMXxFO5uubXQqkNS+XOmAe6ZNgYd4hmZZ9aF
 giJt+cLKe3sLS2sbyq1QWALDbQZezTW70Y7S5HMcKulM2Uc70MDkhDndNHLz/6DLboF/
 2O4MgMC10eFCwnJOa2WpShMs8/ZnOMHR52w/6l73nPwJr/rFY07DBBYbWGXH+vpxyYZ2
 etIA==
X-Gm-Message-State: ANhLgQ3S2GKiP3g8if0AGpBnGS8ctVbfs1vwNqPWu8h5JykT047ZLrTR
 SPYI2KnV17TkZQDJ2W/Q4IBQr/e//bI=
X-Google-Smtp-Source: ADFU+vv+Cp+GmJRDFVZGTev4jW/pbMxPRyDH2kiaac6XoYaAX6TAXjhXZZQCS12pET3Gg2Yt30YRnA==
X-Received: by 2002:a0c:bd99:: with SMTP id n25mr1116559qvg.149.1584589726099; 
 Wed, 18 Mar 2020 20:48:46 -0700 (PDT)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com.
 [209.85.222.181])
 by smtp.gmail.com with ESMTPSA id h20sm735481qka.78.2020.03.18.20.48.45
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Mar 2020 20:48:45 -0700 (PDT)
Received: by mail-qk1-f181.google.com with SMTP id s11so1101736qks.8
 for <wireguard@lists.zx2c4.com>; Wed, 18 Mar 2020 20:48:45 -0700 (PDT)
X-Received: by 2002:a25:d1c2:: with SMTP id i185mr1607961ybg.80.1584589725348; 
 Wed, 18 Mar 2020 20:48:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200318234214.5048-1-tanioka404@gmail.com>
In-Reply-To: <20200318234214.5048-1-tanioka404@gmail.com>
From: Harsh Shandilya <me@msfjarvis.dev>
Date: Thu, 19 Mar 2020 09:18:34 +0530
X-Gmail-Original-Message-ID: <CALpmF+HqACr03Zz+-160iNXFQcP1YzFUHRGWTQSatzmbv6uRzg@mail.gmail.com>
Message-ID: <CALpmF+HqACr03Zz+-160iNXFQcP1YzFUHRGWTQSatzmbv6uRzg@mail.gmail.com>
Subject: Re: [PATCH wireguard-android] strings: Update Japanese Translation,
 corresponds to commit 724884e.
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

On Thu, 19 Mar 2020 at 05:14, Eiji Tanioka <tanioka404@gmail.com> wrote:
>
> Signed-off-by: Eiji Tanioka <tanioka404@gmail.com>
> ---
>  ui/src/main/res/values-ja/strings.xml | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks. In the coming days we'll be making the translations
available on Crowdin so if you find that more preferable, the option
will be available. The project link is
https://crowdin.com/project/wireguard.
