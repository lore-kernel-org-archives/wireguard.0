Return-Path: <SRS0=7A+2=6T=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3471FC3A5A9
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  5 May 2020 01:37:32 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E630206B9
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  5 May 2020 01:37:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="rnZxSy5P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E630206B9
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bbc4d281;
	Tue, 5 May 2020 01:25:01 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 63366927
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 5 May 2020 01:24:58 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 303e5c5c
 for <wireguard@lists.zx2c4.com>; Tue, 5 May 2020 01:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=puDBdJjPe1KRmDAazSGwB7n2L6c=; b=rnZxSy
 5P1s2fZjTbGxm/TteRhJmRVxwlg8NAIRbF56ZlUzSlfLXnD/heB/GuzFhkVSk+jc
 VD8/hytPVEqf6zCFlC6y67nAn47n8vTiNJrAeqHjp6HIJGgZNCnNqevE+47fjiO8
 WC8gHMEw4q01/30fQqNBkCoB6NhrYhXY27sBWjaGQUVCiGw6vPOYj+XwP+8QX8+E
 9w99yHk7Enh67c22Gs4kFxShJR55fhTfsaSnpY0pJUMVFymyRA1lxKOzaGhQtMGZ
 1PFot5ISMRwGzG4r8pvV9GspovgUAHWpPwK8w/avGrqZIbLceKcXNzlOrKOv1qhf
 6Tg7X5aDOYocWdtw==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 151651d1
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 5 May 2020 01:24:58 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id i19so269966ioh.12
 for <wireguard@lists.zx2c4.com>; Mon, 04 May 2020 18:37:27 -0700 (PDT)
X-Gm-Message-State: AGi0PuasqqNcWP2N7zrMqcJIrGkmthboxb9/Z9XCByGeDc+u0k0otzFI
 xEUSxxtiREAs57auVIVhrCfbZyCVtZXY1ee+Bvw=
X-Google-Smtp-Source: APiQypLqInZ9KDfsdCoPKIHN10lf6Ya/2qNqgq/i0pPpbQzX7d6RzsXvHbgzQFh0BDW2YYP8Zl0Ub3tuw6QINDPkpBE=
X-Received: by 2002:a05:6638:4e:: with SMTP id
 a14mr1249092jap.108.1588642646864; 
 Mon, 04 May 2020 18:37:26 -0700 (PDT)
MIME-Version: 1.0
References: <6565463c-0a99-9137-5cc2-714e2fbd6dfc@rub.de>
In-Reply-To: <6565463c-0a99-9137-5cc2-714e2fbd6dfc@rub.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 4 May 2020 19:37:16 -0600
X-Gmail-Original-Message-ID: <CAHmME9qDMiNh90_zA9KsFX-OaHNUHnw5=e65jH3PdXg1n7nyFw@mail.gmail.com>
Message-ID: <CAHmME9qDMiNh90_zA9KsFX-OaHNUHnw5=e65jH3PdXg1n7nyFw@mail.gmail.com>
Subject: Re: Ubuntu kernel >= 5.3.0-52.46 breaks DKMS build for
 wireguard-linux-compat >= 1.0.20200429, patch included
To: Pascal Ernster <pascal.ernster+wireguard@rub.de>
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

Hey Pascal,

Thanks a bunch for the report and patch.

Can you confirm to me whether or not this patch fixes the issue on
both 19.10 and 18.04-hwe?

https://git.zx2c4.com/wireguard-linux-compat/commit/?id=1325bedf8ee3d69ed58460b7a8fee96d949f67da

Thanks,
Jason
