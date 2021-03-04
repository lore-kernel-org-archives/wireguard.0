Return-Path: <SRS0=j5R+=IC=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E34FC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  4 Mar 2021 09:11:18 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF7C464F02
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  4 Mar 2021 09:11:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF7C464F02
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 17669578;
	Thu, 4 Mar 2021 09:11:15 +0000 (UTC)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 04f6f746
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 4 Mar 2021 09:11:14 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id h98so26728167wrh.11
 for <wireguard@lists.zx2c4.com>; Thu, 04 Mar 2021 01:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=2UzB7cxoUT6BbJvbHRFns3IAar3mfpquJMb5S/geZGg=;
 b=n8LSd2FHUG/YGdR8tPyKFtO1SJN1LyVePFxrtgKl3LQrWWTuUtgSxPrHpbYupuMFao
 bEMoEcYhBANsC7+a4fCj9PMODknJJp/Moc5XWLVF+mKqttHyE45uG6CYZo3AEvjq2ZZQ
 4D7SWkC7fg06w8x/Ig/SAUTv4SaswbAwW6KRbrlNkEVNq7N1TPA/6fPNH9FH1dT7X23g
 eZD5gBoxBqmK4Mx5M6VXymCVBv2V4n3jYXoA0foIJlpqtwRvPWk5YVv0nGG0B+XKwOBP
 cEh3OG0bd6J/oE9DZ2q9UCDl4s8Ss3rgODeKAq0v2aR67g4Cdpb5P4yiYLuiGHphVpMI
 1wSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=2UzB7cxoUT6BbJvbHRFns3IAar3mfpquJMb5S/geZGg=;
 b=RUQ7Po5wF0y7wxSgbgcCCVoJiJky1XtjmOY/bAZ8jCn+AZIO6Zd+QJSNCcNQuzAsF6
 hv43+1+J+qVZJzgyaaywuDrp8Xsenij+2Q3fQmYf2p8JE9ZU66Qx8xsBL7RRcK/EiE1n
 Ub61ApGZP4mhi2fJdAzv+61i2/yOMujfkOuAsrsoNXaNWU2SMrF7eLesxOZbHorcoMJv
 W0OIT0krx2OI88QalTFW4fh7d8m4tRRrb7RT86MO2ZY8oIEHWNRYrZmzorUZCW7qGoEt
 wh/etVx5Co2UWVFC8ogoqdtxmuiOwYSIoqEL5uu0YYrZkLTDuPDx5D2NdkSjyTux/Q0V
 A1/g==
X-Gm-Message-State: AOAM532ffI7hHub6Jrkh5gnMAF6dnOqE08pVzw9FeecGSfwO4oYVALoT
 mOqYhAawFJk+HPiZPswqet/g32GlBfs=
X-Google-Smtp-Source: ABdhPJwSaLNcdvSZKh762uR11JbCqq6CMFpBQsVTH3eTafA+eYo/fj1YS3Lq1KKhMMwBJNVD3bWjng==
X-Received: by 2002:adf:fecc:: with SMTP id q12mr2804494wrs.317.1614849074307; 
 Thu, 04 Mar 2021 01:11:14 -0800 (PST)
Received: from [192.168.25.202] ([95.151.188.4])
 by smtp.gmail.com with ESMTPSA id u142sm8884681wmu.3.2021.03.04.01.11.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 01:11:13 -0800 (PST)
Subject: Re: Problems with Windows client over PulseSecure VPN
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <9f621ce6-ec3d-0641-c359-756d0ad36f65@gmail.com>
 <6a01b182-a98f-1736-676f-d0811f6de086@gmail.com>
 <CAHmME9qtPLOTaY3UzyCY1C6guVZXvJjXHeFwT8=94d=Zpjj=Tw@mail.gmail.com>
From: Peter Whisker <peter.whisker@gmail.com>
Message-ID: <8a1d3115-0726-9dc1-ab84-f98142a908ce@gmail.com>
Date: Thu, 4 Mar 2021 09:11:12 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAHmME9qtPLOTaY3UzyCY1C6guVZXvJjXHeFwT8=94d=Zpjj=Tw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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

Hi Jason

Yes, that PostUp line does solve the problem. Thanks! Four tunnels up 
and working with two of them via the PulseSecure VPN. :)

Can I ask why you have the section bind code in there when it seems to 
work fine without it?

Regards

Peter

On 03/03/2021 10:54, Jason A. Donenfeld wrote:
> Hey Peter,
>
> I had a strange idea for how to fix this without requiring
> recompilation or removal of that code.
>
> 1) Enable DangerousScriptExecution:
> https://git.zx2c4.com/wireguard-windows/about/docs/adminregistry.md#hklmsoftwarewireguarddangerousscriptexecution
>
> 2) Add a PostUp line to your [Interface] section:
>
> PostUp = wg set %WIREGUARD_TUNNEL_NAME% listen-port 0
>
> 3) Try it and tell me if it works?
>
> Regards,
> Jason
