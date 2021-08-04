Return-Path: <SRS0=O1+2=M3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91599C4338F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  4 Aug 2021 10:02:15 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B23FE601FC
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  4 Aug 2021 10:02:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B23FE601FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id be7a913e;
	Wed, 4 Aug 2021 10:02:12 +0000 (UTC)
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0949432a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 4 Aug 2021 10:02:09 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id n12so1576672wrr.2
 for <wireguard@lists.zx2c4.com>; Wed, 04 Aug 2021 03:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=efFuIDnnswzcH+Zuh6SnR7Q343FT/s05PABMzndGb4s=;
 b=g2+wH3K/vWicilRmHNbRGdy8yYQkvBPBxGMzoTZGbWb+PTilvnq9t4TZ1rLakwLY/5
 Eevhi0ef8oIg/84Sbf9ElaptuxiqKFPAXJ0/4DV2WT9brfj+2wQKS+7VTgYlOxTZcl71
 EPzzDUJcNY7xYy94prXJy3yxs4d46Ek3VI1zh3UWQmRmz0hYpJsz1qz+TXpOvAVRyr4t
 dH+ukyou647TAkqmko6sFPCTzk6G4MXDDP7y4GmIe073E2+Q9ddTuYOe5EJb84O07ODb
 fe87wzMbJCnAi3rz8GwzEZcXu1OPWJSwL0LFfjd14wJ2lqlLwW09932mUSs52B86IpQy
 pJHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=efFuIDnnswzcH+Zuh6SnR7Q343FT/s05PABMzndGb4s=;
 b=Tyw1kRLqkWTsCaWJtvEjYYOR9Yg0625SetbiWYruP/loEQiSd37ZQrhKK6N8QsU3p9
 g0JO3M/fJmDnUaXF+7xesfzEsXNN/uNOoEne0gsFBH7b6f3U1EwrXGjbW1Oi5Ew9MhlU
 a9F1I/6XDfE9HPTLo4mJQj+/cRjQO0ws4oRXUHXLA9KSdnaHiAtnCizU6vP5kxb28Rj1
 rjlgkKV6QRFrQVoY1/i/Yvpyb2SYjZk/yEVnzxf2FgMEbcFHhSmd5hzp8BI7ks556pzi
 0BQW0hxRBDHjNgv8tRqq/1Y2dEg10gd9XHVxlieoafvIEr0f7e6aSQVVdlc48PeZpB/z
 yj2w==
X-Gm-Message-State: AOAM532zf9uS03x62wH0YBMF8eZfn4IELjHjfMJvdCN6iQXvEcN9etK5
 FZkSDtUV/aU1uEab9yZvPF2zO2JeHS8=
X-Google-Smtp-Source: ABdhPJyw+HHXaMgkraYbjSyJw3bHo9qr+mDlUsmTdc39DA0XrSTbLWrD8c1O8kl3CcsipzxLR+bkew==
X-Received: by 2002:adf:fc8b:: with SMTP id g11mr27786246wrr.224.1628071328947; 
 Wed, 04 Aug 2021 03:02:08 -0700 (PDT)
Received: from [192.168.25.202] ([31.127.152.180])
 by smtp.gmail.com with ESMTPSA id j5sm1906973wrs.22.2021.08.04.03.02.07
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Aug 2021 03:02:08 -0700 (PDT)
Subject: Re: WireGuardNT BSOD Windows 10 21H1 Mullvad
To: wireguard@lists.zx2c4.com
References: <CAB5RCdEyyeGdeBrviTTjF3EyrfNWrCsUXqFbW+RUgqjKeDUrNQ@mail.gmail.com>
From: Peter Whisker <peter.whisker@gmail.com>
Message-ID: <8282408d-8910-3e8d-2274-ac438380d90b@gmail.com>
Date: Wed, 4 Aug 2021 11:02:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAB5RCdEyyeGdeBrviTTjF3EyrfNWrCsUXqFbW+RUgqjKeDUrNQ@mail.gmail.com>
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

Hi

Yes, I saw similar BSOD on a workstation I run yesterday but as it is 
remote it's a nuisance if I have to go and restart it in safe mode to 
disable the kernel flag. I may get to re-try it later in the week.

However my work laptop has been rock solid with the WireguardNT driver 
and now works both directly and also through a PulseSecure tunnel, 
running a total of three tunnels and six peers simultaneously. :)

Peter

On 03/08/2021 11:20, Andre Christanto wrote:
> Hi all,
>
> Thank you very much for developing WireGuard. I have been using it
> daily for all my VPN needs.
> This is my first time using mailing list, so please give me feedback
> if I'm using this wrong.
>
> Today after I received notification that an update was available, I
> immediately update my WireGuard installation and while waiting for the
> installation to complete, I enabled the ExperimentalKernelDriver flag.
> After the update was completed and WireGuard automatically reconnected
> my VPN connection, my Windows almost immediately got BSOD (~2-3s after
> VPN connected notification) and keep getting it after restarts (I set
> my account to auto-login). Thinking that maybe I shouldn't enable the
> flag immediately after an update, I disabled the flag through Safe
> Mode. But after a restart and enablement of the flag, I still got BSOD
> after WireGuard was connected. In the end, I decided to disable
> WireGuardNT for now and report this feedback.
>
> I am using WireGuard on my Windows 10 x64 21H1 installation. My VPN
> provider is Mullvad and I am connected through wireless (Wi-Fi 5)
> connection using Intel 9260 network card. I also attached WireGuard's
> log to this email.
> Please let me know if you need more information.
>
> Thank you very much for the support!
>
> Best regards,
> Andre Christanto
