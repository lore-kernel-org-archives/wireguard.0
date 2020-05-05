Return-Path: <SRS0=yJRU=6U=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8AF1C28CBC
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  6 May 2020 10:49:47 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EC88206B8
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  6 May 2020 10:49:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HhAYlV3q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EC88206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aec75c1f;
	Wed, 6 May 2020 10:36:22 +0000 (UTC)
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0ba15dcf
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 5 May 2020 00:41:03 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id l18so665103wrn.6
 for <wireguard@lists.zx2c4.com>; Mon, 04 May 2020 17:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:disposition-notification-to
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=+kFaEOJaXJCDA/m1/p0q6Txr2ZPeh6wTsaQkFidd6U8=;
 b=HhAYlV3qhPINuxvjUs266+osN8JiyJUlRCrrSmCveBd/ZkIgI/iwi260vM5hfUOx+k
 MhvYWKNqPD5196YLUV1SSd+E4xI8k8FAyf8bCH9h6CCdzVbTNrI21HZqUr5HyW7Kqvdl
 KMyRn7Ar3CgyLJRMBpCgBRyLDL9DUHzPxPwEtV7depB2Dqo+qsyGYKWrh34ZgTU+h56Y
 kyTa9fzbAkQiWLNTjtpjeGJs7fO+TbvdroqDI2OG6QLO6VsDa0Xq5o9HF+6WAviOwdTD
 pQzSknG5fHy0C13/0pGiFcaRSs+F3N/F/t/laYv45qBw/PJlFeso5+qQeb34fkNokrae
 RUcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id
 :disposition-notification-to:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=+kFaEOJaXJCDA/m1/p0q6Txr2ZPeh6wTsaQkFidd6U8=;
 b=prgbRTGhxJSYnk1BJbCKkp0xluo9/DT34mX/eCXOX7ff75xtPcgNu6zeiRPJV2wC0L
 7br8xqf2zGIW2pZvLF+aG6kwgSyoKPLb7RTFyH+cSqbQn2yJuAAcSi6uA3YRZwyfE/hv
 fDE9s2oG1rEtQU2qtR08b4Fs8AsVHe0my1O/9ARwfk3aSly2/JuhSbrHRPujOhG9y3zO
 qmoEyIA+BP0psDOAraIgmCQ1RzugVGdP3L1MFJThgPgyI5/9H+3LHoYzMif0dnfENHSm
 X8o1PeO+7PlY7+swbFVksx9x5DdyU4ACBZPYix0H5o4Um+LZcb5+m/AkPLdtlD7BqjDE
 24vQ==
X-Gm-Message-State: AGi0PuaErlMyK651MMeGExuJoG9ud1MbpJlpcF0az4LBbcvfqhh8qkgT
 u2tf4RS18+5kJCsKQB9WSKLJHaq1rVY=
X-Google-Smtp-Source: APiQypItyrVK07wqFL12MrT1zx1FOWMxpXaF5KvH52jhmOigvAqONSiHO71Q4cVjQQSLsHKu+RHFLA==
X-Received: by 2002:adf:ee03:: with SMTP id y3mr565683wrn.190.1588640009801;
 Mon, 04 May 2020 17:53:29 -0700 (PDT)
Received: from ?IPv6:2a02:8010:66b7:dddd:5c03:aaf0:6fab:e1ce?
 ([2a02:8010:66b7:dddd:5c03:aaf0:6fab:e1ce])
 by smtp.gmail.com with ESMTPSA id d27sm375474wra.30.2020.05.04.17.53.28
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2020 17:53:29 -0700 (PDT)
Subject: Re: [ANNOUNCE] WireGuard for Ubiquiti devices/EdgeOS has returned
To: wireguard@lists.zx2c4.com
References: <CAHmME9oWPDuR4OAeHH7Fcau26bLKA0grVgbEzTQ3pF96AzUjqg@mail.gmail.com>
From: Brian Gregory <bdgregory@gmail.com>
Message-ID: <1d376e66-43c7-01ca-c2c6-1bf0e11e5658@gmail.com>
Date: Tue, 5 May 2020 01:53:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9oWPDuR4OAeHH7Fcau26bLKA0grVgbEzTQ3pF96AzUjqg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Mailman-Approved-At: Wed, 06 May 2020 12:36:21 +0200
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

This is excellent news.

Thank you.

Brian Gregory.
bdgregory@gmail.com
www.Brian-Gregory.me.uk
(Home)

On 04/05/2020 20:16, Jason A. Donenfeld wrote:
> Hi all,
>
> After a period of darkness, our builds of WireGuard for EdgeOS and
> Ubiquiti devices have returned, thanks to Pascal Vorwerk stepping up
> to takeover maintenance and CI. We've also moved this from Nils'
> personal github account into the WireGuard organization. You can get
> started here:
>
> https://github.com/WireGuard/wireguard-vyatta-ubnt/blob/master/README.md
> https://github.com/WireGuard/wireguard-vyatta-ubnt/releases
> https://www.wireguard.com/install/#edgeos-module-tools
>
> We also expect and hope that Ubiquiti will be shipping WireGuard
> built-in in the mid-term future, which will be an exciting
> development. Until then, here's how to get things running. The .deb
> available on that site should have full Vyatta integration, which
> hopefully will provide some basis for Ubiquiti's own integration work.
>
> Please direct any questions toward Pascal, as he'll be maintaining this.
>
> Enjoy,
> Jason
