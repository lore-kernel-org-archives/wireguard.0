Return-Path: <SRS0=FNV9=G3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F37C0C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 24 Jan 2021 16:30:48 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 129AA206BE
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 24 Jan 2021 16:30:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 129AA206BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7d0aec10;
	Sun, 24 Jan 2021 16:24:14 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 252321d4
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Jan 2021 14:01:56 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id j18so1533187wmi.3
 for <wireguard@lists.zx2c4.com>; Thu, 21 Jan 2021 06:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=S2QjNgVRjcdJcJdYaZdu8nlbALIgLUParY4qfPVGYaE=;
 b=i6bPSXvwiJLa2JpT8oC55d90SFia1GrQdfCYRfedJv28DiETOg5ax/JrqF8A6b/aMt
 Lw4uyoahPpfxXdX2t31wAavoDw8fjpOGWITnGha6W7r/+tt+9UpK0RQseeA8iYqmFGks
 lWZZA51DS7FfkBgknB95FHuwVbV6J09YrgwaUQxNI8Uqkli4EpkdPqCm1hV6zEotUX4I
 qI6E70OvZPOmsuBEwkzES+LTR0QsTAKAEPzsjeK9oXTukFCWRV8+VcQkKqWKU1hvD3a4
 WF8UyUEx/hgXtQGc/ofjuBUmktpDkDEbS31tDhzv1RUoYtbis+Io2J5t/t/F6PVf2orj
 TxPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=S2QjNgVRjcdJcJdYaZdu8nlbALIgLUParY4qfPVGYaE=;
 b=IUaU+2mbUSvcnD2psWre8IBOGB5ipLvJ6KcA8BDrfQdCqiP23UWB3NQftyFp9fmNbk
 8G3TdOH5faHS9No2Z/A1OnjgE+rpNxoCQ7lEhHAIVCQ3ApblSK0SB9pdHnBK7bZZ9bH4
 PhbF0o1qsIK3hGSwIcMDXbMJ84wm3P4CE01MGMZF0zM4FMSttWgy5IMOCf5ZbKyn0jZQ
 hKstBUYZJAtRxiYro6U8rlzjQ65T0XxhhuIlfvVZS1mKgfTFTqTCFKp2VN8Y6Stbjmv1
 oXbLEpAWw79KMQ2cSVlNUyI+4/AjA8PUrTjU8a9JhSbg27AM2xEya7L4a6F0Y0ky7HvK
 +SWA==
X-Gm-Message-State: AOAM530ZtYQCyV5f4yJcommMSQNFlaRqlxJz7jP5aNHybVmEIouug56A
 /PPEod7tpXVTFzbqVR1sUbZQVjYZQeI=
X-Google-Smtp-Source: ABdhPJxJpyiTQsNPN+qVWdlhrzaocUIPYhCIkV+LKJWuKCNnj0aRcBcHfkoz6cFk+02JHuL498FVVA==
X-Received: by 2002:a1c:4986:: with SMTP id w128mr3452271wma.89.1611052796589; 
 Tue, 19 Jan 2021 02:39:56 -0800 (PST)
Received: from [192.168.25.202] ([91.110.152.239])
 by smtp.gmail.com with ESMTPSA id p15sm35578148wrt.15.2021.01.19.02.39.55
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jan 2021 02:39:55 -0800 (PST)
Subject: Re: Fwd: Problems with Windows client over PulseSecure VPN
To: wireguard@lists.zx2c4.com
References: <9f621ce6-ec3d-0641-c359-756d0ad36f65@gmail.com>
 <6a01b182-a98f-1736-676f-d0811f6de086@gmail.com>
 <CAHmME9ojL5JxWh5Vn_RsBB8baLabhFvotAuSoQ61fJeht=2qEA@mail.gmail.com>
 <2dc629e2-93c9-4ed9-ea57-4318c8b62a73@gmail.com>
 <397bedc7-3913-08bb-a6f3-691d9fab663c@gmail.com>
 <CAN5wt5r9rQpYcCkshBimOARoAxx7T529oUw6RSNnr4q3_y_31g@mail.gmail.com>
 <CAN5wt5ojzay9uEjubrrivd6vZqOGNJ40M25ELzOYTK42zozijQ@mail.gmail.com>
From: Peter Whisker <peter.whisker@gmail.com>
Message-ID: <1a18b8f5-3c98-24c5-a0ce-90515a8528ae@gmail.com>
Date: Tue, 19 Jan 2021 10:39:55 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CAN5wt5ojzay9uEjubrrivd6vZqOGNJ40M25ELzOYTK42zozijQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Mailman-Approved-At: Sun, 24 Jan 2021 16:24:12 +0000
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

I built Wireguard with the change you made below and confirm it fixes 
the longstanding problem I had - I can now connect to a peer over the 
PulseSecure tunnel and even simultaneously connect to another peer over 
the default route (with the MultipleSimultaneousTunnels=1 registry entry).

Is there a reason this fix can not be adopted?

Peter

On 15/01/2021 10:32, Christopher Ng wrote:
> ---------- Forwarded message ---------
> From: Christopher Ng <facboy@gmail.com>
> Date: Fri, 15 Jan 2021 at 09:46
> Subject: Re: Problems with Windows client over PulseSecure VPN
> To: Peter Whisker <peter.whisker@gmail.com>
>
>
> i fixed this in my local build by disabling the binding in
> defaultroutemonitor.go.  tbh i'm not sure what it's for, i found an
> old discussion (about linux) about not binding to only one interface,
> so i'm not sure why Windows binds to one interface.
>
> diff --git a/tunnel/defaultroutemonitor.go b/tunnel/defaultroutemonitor.go
> index 6ee95129..12456332 100644
> --- a/tunnel/defaultroutemonitor.go
> +++ b/tunnel/defaultroutemonitor.go
> @@ -6,12 +6,10 @@
>   package tunnel
>
>   import (
> -       "log"
>          "sync"
>          "time"
>
>          "golang.org/x/sys/windows"
> -       "golang.zx2c4.com/wireguard/conn"
>          "golang.zx2c4.com/wireguard/device"
>          "golang.zx2c4.com/wireguard/tun"
>          "golang.zx2c4.com/wireguard/windows/tunnel/winipcfg"
> @@ -50,18 +48,22 @@ func bindSocketRoute(family
> winipcfg.AddressFamily, device *device.Device, ourLU
>          }
>          *lastLUID = luid
>          *lastIndex = index
> -       blackhole := blackholeWhenLoop && index == 0
> -       bind, _ := device.Bind().(conn.BindSocketToInterface)
> -       if bind == nil {
> -               return nil
> -       }
> -       if family == windows.AF_INET {
> -               log.Printf("Binding v4 socket to interface %d
> (blackhole=%v)", index, blackhole)
> -               return bind.BindSocketToInterface4(index, blackhole)
> -       } else if family == windows.AF_INET6 {
> -               log.Printf("Binding v6 socket to interface %d
> (blackhole=%v)", index, blackhole)
> -               return bind.BindSocketToInterface6(index, blackhole)
> -       }
> +       // disable this because if my peers are on different
> interfaces...well i don't know how it can work.  i can't
> +       // bind the socket to only one of them
> +       /*
> +               blackhole := blackholeWhenLoop && index == 0
> +               bind, _ := device.Bind().(conn.BindSocketToInterface)
> +               if bind == nil {
> +                       return nil
> +               }
> +               if family == windows.AF_INET {
> +                       log.Printf("Binding v4 socket to interface %d
> (blackhole=%v)", index, blackhole)
> +                       return bind.BindSocketToInterface4(index, blackhole)
> +               } else if family == windows.AF_INET6 {
> +                       log.Printf("Binding v6 socket to interface %d
> (blackhole=%v)", index, blackhole)
> +                       return bind.BindSocketToInterface6(index, blackhole)
> +               }
> +       */
>          return nil
>   }
>
> On Wed, 13 Jan 2021 at 17:06, Peter Whisker <peter.whisker@gmail.com> wrote:
>> Hi
>>
>> I have managed to work around the issue caused by Wireguard sending
>> packets via default route interface even though the route to the peer is
>> over a different interface (the issue caused by IP_UNICAST_IF). My
>> Wireguard peer is down a corporate Pulse Secure tunnel.
>>
>> I use a PreUp and PostDown script as follows:
>>
>> PreUp
>> =====
>>
>> for /f "tokens=3" %%a in ('route print -4 0.0.0.0^| find "0.0.0.0"') do
>> if not defined ip set ip=%%a
>> route add 0.0.0.0 mask 128.0.0.0 %ip% METRIC 1
>> route add 128.0.0.0 mask 128.0.0.0 %ip% METRIC 1
>> route delete 0.0.0.0 mask 0.0.0.0
>>
>> PostDown
>> ========
>>
>> for /f "tokens=3" %%a in ('route print -4 0.0.0.0^| find "0.0.0.0"') do
>> if not defined ip set ip=%%a
>> route add 0.0.0.0 mask 0.0.0.0 %ip% METRIC 1
>> route delete 0.0.0.0 mask 128.0.0.0
>> route delete 128.0.0.0 mask 128.0.0.0
>>
>> This replaces the /0 default route by two /1 routes before bringing up
>> the WireGuard interface. Traffic to the peer then gets sent down the
>> correct route (why is this different from having a default route?). When
>> the WireGuard instance is closed, it recreates the default route and
>> removes the two /1 routes.
>>
>> Is there a way this could be done better in the Wireguard executable (I
>> am currently using 0.3.4).
>>
>> Thanks
>>
>> Peter
>>
>> On 26/11/2020 13:11, Jason A. Donenfeld wrote:
>>>> Is PulseSecure not setting up a /0 route? If so, then this is a known
>>>> issue with the lack of policy routing on Windows.
