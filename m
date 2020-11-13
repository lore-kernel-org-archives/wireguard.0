Return-Path: <SRS0=pWoz=ET=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F2A1C4742C
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 13 Nov 2020 12:04:10 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F8572224C
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 13 Nov 2020 12:04:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=pcfreak.de header.i=@pcfreak.de header.b="Hh0DXVH4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F8572224C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pcfreak.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 33b16b79;
	Fri, 13 Nov 2020 11:59:36 +0000 (UTC)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f97a19e1
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Nov 2020 11:59:33 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id s13so8204427wmh.4
 for <wireguard@lists.zx2c4.com>; Fri, 13 Nov 2020 04:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pcfreak.de; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=ZUl87YvP2dA6l+TFt62lXFMesH1qd++1/+ewjBbTQwg=;
 b=Hh0DXVH4TxLkWO+5/iiiIsrIcagaFPPYe6Cib06BN9+qDSU4waocVEln5or4YMhFB8
 6zMtBRnj32O9A12Qzo/2OAyZ53LO41Ecoxx1yFtbia5jynnl5DsJxe+MnP5hR8CbIsHg
 uYp+hAqPhCoYFAC0NC6xCUwm957dCdQrOCGwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=ZUl87YvP2dA6l+TFt62lXFMesH1qd++1/+ewjBbTQwg=;
 b=i47pvwQBDc3PNCcSrOC3M1zhDgickhv9sAG2XSg29DNNBfhdSVJYTumPV2WPnJhDf9
 vzyEESOfyseDQeLpYxdBmuLo91zUF1UqiE2oXZho8BHkR+ldCbem3zrmkpiOf7Q+Q+Y7
 zrG41wS6x52cmpT/+eQoFiotbxXavSG4LZwdfXgzG4YF70uUrQwe+pV1VM/GADof6YnQ
 ruboXezylWlZnMOHGrHQQjVnPTvH0zPKdRv6DHjSLZM4i7UvY56+caWl9lxSvFAHNsji
 /N5PePfa51QsowzgzYkd9XB+64FlA5I7L0AwbI3u8LsiOlLB4K1R/wXHc0ws5Bu5dTq+
 +hrA==
X-Gm-Message-State: AOAM533AsiN42S1sAGLsCHXxDbXvc9UWGbTH0qZKWC+0dHpM3mxtaR+E
 e7SgDe8xnjV6lRPfrJHoCyNPPuIMiRpdAg==
X-Google-Smtp-Source: ABdhPJx4K3YLTJhxv48vC872myEipUjd/uM1f0jkj5N92+gQZXh1TuHguBaaFD4sUjKmtVOkRjk+dg==
X-Received: by 2002:a7b:ce0e:: with SMTP id m14mr2298949wmc.17.1605269015816; 
 Fri, 13 Nov 2020 04:03:35 -0800 (PST)
Received: from [10.110.180.53] (inetpop1.witron.de. [195.243.201.20])
 by smtp.googlemail.com with ESMTPSA id d63sm9947678wmd.12.2020.11.13.04.03.34
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2020 04:03:35 -0800 (PST)
Subject: Re: Using WireGuard on Windows as non-admin - proper solution?
To: wireguard@lists.zx2c4.com
References: <3415567b-5441-f3b1-7a38-f0bae3a14cfc@werehub.org>
 <CAHmME9p6FoUsFou0LkeUZt4Ba1K4ycuA6f8X4c6Kt8-jzkAH7A@mail.gmail.com>
From: Der PCFreak <mailinglists@pcfreak.de>
Message-ID: <cff0d2ca-3f7c-fc27-f8ad-2b3e68223ed9@pcfreak.de>
Date: Fri, 13 Nov 2020 13:03:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <CAHmME9p6FoUsFou0LkeUZt4Ba1K4ycuA6f8X4c6Kt8-jzkAH7A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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

a long time ago (wow 7 years now) OpenVPN was facing the same problem 
and I had to come up with a solution at this time which I wrote down here:

https://community.openvpn.net/openvpn/wiki/Nonprivileged?__cf_chl_jschl_tk__=39af44f70f734e1518810bfa4f763b5614b5d0cd-1605268198-0-AdWjPrQmfW_DxRRmKq1ebg6_bp-ISgZpLzFFC-FpzH9anyH3NEa1vtRcZAv7sQ_qLE-1pXhvVutaGK0e_jcPKwRb51xZAJrDAX58ap_o39EO-mLClM-PiYlPBmvxS68mJASvxyInfI5IuXaPFl4Rm2VSYNWjiKCIxo-qP2GCZ5h74Z-qxkoGNg96mFsUabWVqrbCaw0GGPahl6iWDZdSETK3_UD_akuSpTVY58AauKyaaT3cGq-A9r-QsLYkJ9Q9fY_gvt03AgobKFi4_E4GMn9Imsc5VYNesNb6JwHJgvTtFP9C_dzN4OD3BZV_egUMVQ

especially the part "New and working solution for Windows 7 (and above)" 
- Sorry, the images are gone since Dropbox killed public folders but I 
still have them
somewhere lying arround.

I used Scheduled Tasks at logon of any user that automatically created 
another !privileged! scheduled task for the nonprivileged user and 
started OpenVPN.
It was a bit of a hack but it worked until first SecurePoint, then 
Sophos and finally OpenVPN.net came up with a client that communicated 
with a service and
did no longer need administrative privileges to bring up a connection.

I think you could reproduce the same with Wireguard using my old scripts 
posted above etc.

Not very nice but as always, time will tell.

Regards

Peter

On 13.11.2020 03:16, Jason A. Donenfeld wrote:
> Hi Viktor,
>
> I am actually interested in solving this. I took an initial stab at it
> here, but I'm not super comfortable with the implementation or the
> security implications:
> https://git.zx2c4.com/wireguard-windows/commit/?h=jd/unprivd-knob
>
> Aside from doing this from within our existing UI, the general
> solution using the service-based building blocks is to simply allow
> users to start and stop services that begin with "WireGuardTunnel$".
> So the flow is something like:
>
> 1. wireguard /installtunnelservice  path\to\sometunnel.conf.
> 2. Change the ACLs on WireGuardTunnel$sometunnel to fit your user.
> 3. Have the user use `net start` and `net stop`, or similar, to
> control whether the service is up or down.
>
> That's not super pretty, but it should work, and it is automatable.
> Meanwhile, I'll keep thinking about various ways to do this in a more
> "first-party" way.
>
> Jason
