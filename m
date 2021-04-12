Return-Path: <SRS0=b8ma=JJ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A49DC433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 12 Apr 2021 07:56:11 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AAE66120B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 12 Apr 2021 07:56:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4AAE66120B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b7a4920f;
	Mon, 12 Apr 2021 07:56:08 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 71490134
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Apr 2021 07:56:06 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 o20-20020a05600c4fd4b0290114265518afso6297063wmq.4
 for <wireguard@lists.zx2c4.com>; Mon, 12 Apr 2021 00:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=vwjfslJl7F4mlCi+pGspngZ82Ua+C3ewgyZA7BrWxW0=;
 b=q9DyN/p4O7FtA1haVYzayP96gD8Z79oQK640lm4oUPX7Vb+GLj09ol4m/om0RUEEW8
 4JZ+Zj8d3jY3PwACvzclzWPu4Nxs3GXf9TCemqZd/510FFFkmEXcc+lED3IQCh4kTF4R
 hfJ5aEpjb+BSicb2eeLPY0c6WCLXPBHG6xSnZwUtOJjx/v421Y30wSExFyeKEH0QooRX
 DrbtUek5B3zypCw1GKZ0FyX88zGArHYUsd9c/fy0h3eXd3DSIQ7qaL0o8uhBZh+0bFFp
 IOW105rGmPKtDF4b1SOQ7oRi+6rNSQcQ+o0ECoh7tn4kt6AG78M013eeqNG2ZjrSaNx/
 kt/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=vwjfslJl7F4mlCi+pGspngZ82Ua+C3ewgyZA7BrWxW0=;
 b=cF6Q+cVfLCMzcMsJurhguB12qDHPm/zp7af414e82L2rPGCMmE42KanBJ9UkMegH3U
 HeSYTT7ZMReQ+SzZSivyKOef3gkGyjSjFMEH2Dq9sxilPV4zVidoHUsS+evUIEDyktjS
 Le8HOBfdHq7lgxsAcST1HndtVtxGGbubJgSaYZsuiliKKh0CVnCTOKn2Kz8sCsHqO1k8
 hxnAAuwzJ+dyINFWJXQQHfOjhgveLmrx8Cm2uEubMxIuDuOVcbj1e4ItaRZ7z38ECDSP
 QvFRrjecMtysDvtkBtgmUsIHsV6yE9VgQkklFF+1mteyN56Wt6dEJOE1OMcDqZqCw3fM
 agew==
X-Gm-Message-State: AOAM530bEg4ibXAIqikxGxLwAVlSkJtTh7fOk4Ki44MMU4qh+tGOjnJY
 9SZAFM/eH1UxtaDuiVuTNoTpOAdLNUs=
X-Google-Smtp-Source: ABdhPJzoA4ex/kFL6AFAozZ9sUOsaw/SO8c38SE8QwVKucGFUW9HlYtxml7aJErUoN69pH+k2PZ2qg==
X-Received: by 2002:a1c:2b03:: with SMTP id r3mr24479296wmr.173.1618214166003; 
 Mon, 12 Apr 2021 00:56:06 -0700 (PDT)
Received: from [192.168.25.202] ([91.110.152.181])
 by smtp.gmail.com with ESMTPSA id x2sm6827624wrg.31.2021.04.12.00.56.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Apr 2021 00:56:05 -0700 (PDT)
Subject: Re: WireGuard for Windows crash "panic: ring is full" since release
 of 0.3.10
From: Peter Whisker <peter.whisker@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <CALaUSusmdvz2XAT6c24023dZroTwVPKr0k7S+y6YVAXW1-ubJw@mail.gmail.com>
 <CAHmME9qYHttPgwranGbUS4ijQOde96Je-f2VAM94LMvsNqSfVw@mail.gmail.com>
 <CALaUSutUZSCEdLjkire-cJAymWU34r57yB=rJvYoUO+AdxF9wQ@mail.gmail.com>
 <CAHmME9rPV3r9iTBR97e-5D97ffUqqt_30PXkszBssAuO2azNmg@mail.gmail.com>
 <CAHmME9o_yJkAtoVQ58WBYDJwuD2Q3QntaYaGpOA63VFG8CO9fA@mail.gmail.com>
 <3e55e6c9-6446-3e8f-20bd-87986ad5f4ac@gmail.com>
Message-ID: <bbb619a3-b7aa-a80a-4e17-bf197d1e99f1@gmail.com>
Date: Mon, 12 Apr 2021 08:56:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <3e55e6c9-6446-3e8f-20bd-87986ad5f4ac@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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

It seems to be your suggested workaround for using Wireguard via a split 
tunnel:

PostUp = wg set %WIREGUARD_TUNNEL_NAME% listen-port 0

which is causing the crash. It was great that this worked in earlier 
versions but I'm now back to square one.

Peter

On 12/04/2021 08:45, Peter Whisker wrote:
> Hi
>
> Since the recent upgrade to 0.3.10 It now crashes bringing up my 
> tunnels - all was well with 0.3.9.
>
> Peter
>
> 2021-04-12 08:41:07.187: [TUN] [lhirisseccom01] Setting interface 
> configuration
> 2021-04-12 08:41:07.187: [TUN] [lhirisseccom01] Routine: event worker 
> - started
> 2021-04-12 08:41:07.188: [TUN] [lhirisseccom01] UAPI: Updating private 
> key
> 2021-04-12 08:41:07.188: [TUN] [lhirisseccom01] UAPI: Removing all peers
> 2021-04-12 08:41:07.188: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
> UAPI: Created
> 2021-04-12 08:41:07.188: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
> UAPI: Updating preshared key
> 2021-04-12 08:41:07.188: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
> UAPI: Updating endpoint
> 2021-04-12 08:41:07.188: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
> UAPI: Updating persistent keepalive interval
> 2021-04-12 08:41:07.188: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
> UAPI: Removing all allowedips
> 2021-04-12 08:41:07.188: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
> UAPI: Adding allowedip
> 2021-04-12 08:41:07.188: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
> UAPI: Adding allowedip
> 2021-04-12 08:41:07.188: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
> UAPI: Adding allowedip
> 2021-04-12 08:41:07.188: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
> UAPI: Adding allowedip
> 2021-04-12 08:41:07.188: [TUN] [lhirisseccom01] Bringing peers up
> 2021-04-12 08:41:07.190: [TUN] [lhirisseccom01] UDP bind has been updated
> 2021-04-12 08:41:07.190: [TUN] [lhirisseccom01] Routine: receive 
> incoming 0x292980 - started
> 2021-04-12 08:41:07.190: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
> Starting...
> 2021-04-12 08:41:07.190: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
> Sending keepalive packet
> 2021-04-12 08:41:07.190: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
> Sending handshake initiation
> 2021-04-12 08:41:07.190: [TUN] [lhirisseccom01] Routine: receive 
> incoming 0x292a60 - started
> 2021-04-12 08:41:07.190: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
> Routine: sequential sender - started
> 2021-04-12 08:41:07.190: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
> Routine: sequential receiver - started
> 2021-04-12 08:41:07.190: [TUN] [lhirisseccom01] Interface state was 
> Down, requested Up, now Up
> 2021-04-12 08:41:07.191: [TUN] [lhirisseccom01] Monitoring default v6 
> routes
> 2021-04-12 08:41:07.191: [TUN] [lhirisseccom01] Binding v6 socket to 
> interface 0 (blackhole=false)
> 2021-04-12 08:41:07.191: [TUN] [lhirisseccom01] Setting device v6 
> addresses
> 2021-04-12 08:41:07.202: [TUN] [lhirisseccom01] Monitoring default v4 
> routes
> 2021-04-12 08:41:07.210: [TUN] [lhirisseccom01] Binding v4 socket to 
> interface 10 (blackhole=false)
> 2021-04-12 08:41:07.212: [TUN] [lhirisseccom01] Setting device v4 
> addresses
> 2021-04-12 08:41:07.212: [TUN] [lhirisseccom01] Listening for UAPI 
> requests
> 2021-04-12 08:41:07.212: [TUN] [lhirisseccom01] Executing: `wg set 
> %WIREGUARD_TUNNEL_NAME% listen-port 0`
> 2021-04-12 08:41:07.229: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
> Received handshake response
> 2021-04-12 08:41:07.404: [TUN] [lhirisseccom01] UAPI: Updating listen 
> port
> 2021-04-12 08:41:07.404: [TUN] [lhirisseccom01] Routine: receive 
> incoming 0x292980 - stopped
> 2021-04-12 08:41:07.404: [TUN] [lhirisseccom01] Routine: receive 
> incoming 0x292a60 - stopped
> 2021-04-12 08:41:07.407: [TUN] [lhirisseccom01] cmd> Unable to modify 
> interface: Unknown error
> 2021-04-12 08:41:07.410: [TUN] panic: ring is full
> 2021-04-12 08:41:07.410: [TUN] goroutine 134 [running]:
> 2021-04-12 08:41:07.410: [TUN] 
> golang.zx2c4.com/wireguard/conn.(*ringBuffer).Push(...)
> 2021-04-12 08:41:07.410: [TUN] 
> golang.zx2c4.com/wireguard@v0.0.0-20210409202608-75526d60714c/conn/bind_windows.go:46
> 2021-04-12 08:41:07.410: [TUN] 
> golang.zx2c4.com/wireguard/conn.(*afWinRingBind).InsertReceiveRequest(0xc000220000, 
> 0x0, 0x0)
> 2021-04-12 08:41:07.410: [TUN] 
> golang.zx2c4.com/wireguard@v0.0.0-20210409202608-75526d60714c/conn/bind_windows.go:327 
> +0x7e
> 2021-04-12 08:41:07.410: [TUN] 
> golang.zx2c4.com/wireguard/conn.(*WinRingBind).Open(0xc000220000, 0x0, 
> 0x0, 0x0, 0x0, 0xc00021dbf7, 0x0, 0x0)
> 2021-04-12 08:41:07.410: [TUN] 
> golang.zx2c4.com/wireguard@v0.0.0-20210409202608-75526d60714c/conn/bind_windows.go:291 
> +0x265
> 2021-04-12 08:41:07.410: [TUN] 
> golang.zx2c4.com/wireguard/device.(*Device).BindUpdate(0xc000222000, 
> 0x0, 0x0)
> 2021-04-12 08:41:07.410: [TUN] 
> golang.zx2c4.com/wireguard@v0.0.0-20210409202608-75526d60714c/device/device.go:470 
> +0x104
> 2021-04-12 08:41:07.410: [TUN] 
> golang.zx2c4.com/wireguard/device.(*Device).handleDeviceLine(0xc000222000, 
> 0xc000324030, 0xb, 0xc00032403c, 0x1, 0x1, 0xc0003140a0)
> 2021-04-12 08:41:07.410: [TUN] 
> golang.zx2c4.com/wireguard@v0.0.0-20210409202608-75526d60714c/device/uapi.go:223 
> +0x7a5
> 2021-04-12 08:41:07.410: [TUN] 
> golang.zx2c4.com/wireguard/device.(*Device).IpcSetOperation(0xc000222000, 
> 0x52ee60, 0xc0003042a0, 0x0, 0x0)
> 2021-04-12 08:41:07.410: [TUN] 
> golang.zx2c4.com/wireguard@v0.0.0-20210409202608-75526d60714c/device/uapi.go:183 
> +0x279
> 2021-04-12 08:41:07.410: [TUN] 
> golang.zx2c4.com/wireguard/device.(*Device).IpcHandle(0xc000222000, 
> 0x537840, 0xc0004b4078)
> 2021-04-12 08:41:07.410: [TUN] 
> golang.zx2c4.com/wireguard@v0.0.0-20210409202608-75526d60714c/device/uapi.go:426 
> +0x165
> 2021-04-12 08:41:07.410: [TUN] created by 
> golang.zx2c4.com/wireguard/windows/tunnel.(*tunnelService).Execute.func2
> 2021-04-12 08:41:07.410: [TUN] 
> golang.zx2c4.com/wireguard/windows/tunnel/service.go:226 +0x7b
> 2021-04-12 08:41:07.467: [MGR] [lhirisseccom01] Tunnel service tracker 
> finished
> 2021-04-12 08:41:16.327: [MGR] [Wintun] IsPoolMember: Reading pool 
> devpkey failed, falling back: Element not found. (Code 0x00000490)
> 2021-04-12 08:41:16.338: [MGR] Removing Wintun interface 
> ‘lhirisseccom01’ because no service for it exists
>
> On 09/04/2021 23:47, Jason A. Donenfeld wrote:
>> The fix has been released in 0.3.10.
>>
>> Jason
