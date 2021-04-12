Return-Path: <SRS0=b8ma=JJ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36204C43461
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 12 Apr 2021 07:45:43 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3094B6121D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 12 Apr 2021 07:45:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3094B6121D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0ed48986;
	Mon, 12 Apr 2021 07:45:40 +0000 (UTC)
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 68bca19f
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Apr 2021 07:45:38 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id b9so11833893wrs.1
 for <wireguard@lists.zx2c4.com>; Mon, 12 Apr 2021 00:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=CpEXHlDCP78SFgNhsUTKgepDWKrmz/nh29oEuK6vQ7Y=;
 b=bbLu7v9Ob3wTEpUfYMTajCJnvPH+nPCl0MS8g4AaTTeLMGQcf6dxHAtvvoNFKLs7nb
 OqgNo8FENzgGg6J8QB0Q6gjPzR6pblZLnV5cF7NAcVOduKL8vNpc/D5mU7sKhpLgTrCQ
 fjFJIfP9dJDp7S10LvQcJw6r0DZGOZJLPvZVJUW0OIG5nFqfkafcOTXIDoecHcUwAW95
 HtY81Un1yc/juUnKm1zTILNyD1RmhgsePgjKv3kZz3bNazUnCHPd9YzMF5jE2vQMW35z
 XjiGzyaPo66++vntsXGSThUA9Fr3bRoZ72ObWLF6PBRxM7cJyHA4LId27t8FLdBo/ZZd
 lxUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=CpEXHlDCP78SFgNhsUTKgepDWKrmz/nh29oEuK6vQ7Y=;
 b=IKySyV1lXC1PYHiPylEBQxtnJZEWCWpb6A7J8T7YvKuIhUlRj/G0S2bpVXbd0/8ZRb
 xHiFN3KsYpQlANKxza3jQLg5Qi8sYwTXQUP5EXw3qMhye58O2i91qO2sGbLSnuhYvxif
 wlbgSrEVA+wptGxSXEATxYBnNng+3ZBVtf1lZl62cVRY0YeP8TWpesS6WCL3/CagqrFb
 g2e12Md0LqcanYRQE6u0eTaw86VV32+dmHhjT9zOQGyu02mVHCS+OgqbYDSG5hds4WGw
 eUe6PUh2tK0EQVsYFVLhlbUvub4dW50ix0jv7afHBUw18u/EKLeDzFYD01yQmCdFYasM
 IWsA==
X-Gm-Message-State: AOAM533zFFkNK8I8I2kmv8JIPFOP9h5K04JPtTXO4/yorGTji3JlK2Vj
 1AjPsWVERn/WeDo+K9nXIkh/rVHJzN0=
X-Google-Smtp-Source: ABdhPJxR/V5uMmHn7ZnoG64QV/GXBTqztZ1ZtYNmw3i2tUPlA0nMaP98egJJP81tw1Tb6T12NEPlKw==
X-Received: by 2002:a5d:5308:: with SMTP id e8mr15449519wrv.41.1618213538202; 
 Mon, 12 Apr 2021 00:45:38 -0700 (PDT)
Received: from [192.168.25.202] ([91.110.152.181])
 by smtp.gmail.com with ESMTPSA id u3sm11132300wmg.48.2021.04.12.00.45.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Apr 2021 00:45:37 -0700 (PDT)
Subject: Re: WireGuard for Windows crash "panic: ring is full" since release
 of 0.3.10
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <CALaUSusmdvz2XAT6c24023dZroTwVPKr0k7S+y6YVAXW1-ubJw@mail.gmail.com>
 <CAHmME9qYHttPgwranGbUS4ijQOde96Je-f2VAM94LMvsNqSfVw@mail.gmail.com>
 <CALaUSutUZSCEdLjkire-cJAymWU34r57yB=rJvYoUO+AdxF9wQ@mail.gmail.com>
 <CAHmME9rPV3r9iTBR97e-5D97ffUqqt_30PXkszBssAuO2azNmg@mail.gmail.com>
 <CAHmME9o_yJkAtoVQ58WBYDJwuD2Q3QntaYaGpOA63VFG8CO9fA@mail.gmail.com>
From: Peter Whisker <peter.whisker@gmail.com>
Message-ID: <3e55e6c9-6446-3e8f-20bd-87986ad5f4ac@gmail.com>
Date: Mon, 12 Apr 2021 08:45:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <CAHmME9o_yJkAtoVQ58WBYDJwuD2Q3QntaYaGpOA63VFG8CO9fA@mail.gmail.com>
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

Hi

Since the recent upgrade to 0.3.10 It now crashes bringing up my tunnels 
- all was well with 0.3.9.

Peter

2021-04-12 08:41:07.187: [TUN] [lhirisseccom01] Setting interface 
configuration
2021-04-12 08:41:07.187: [TUN] [lhirisseccom01] Routine: event worker - 
started
2021-04-12 08:41:07.188: [TUN] [lhirisseccom01] UAPI: Updating private key
2021-04-12 08:41:07.188: [TUN] [lhirisseccom01] UAPI: Removing all peers
2021-04-12 08:41:07.188: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - UAPI: 
Created
2021-04-12 08:41:07.188: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - UAPI: 
Updating preshared key
2021-04-12 08:41:07.188: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - UAPI: 
Updating endpoint
2021-04-12 08:41:07.188: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - UAPI: 
Updating persistent keepalive interval
2021-04-12 08:41:07.188: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - UAPI: 
Removing all allowedips
2021-04-12 08:41:07.188: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - UAPI: 
Adding allowedip
2021-04-12 08:41:07.188: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - UAPI: 
Adding allowedip
2021-04-12 08:41:07.188: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - UAPI: 
Adding allowedip
2021-04-12 08:41:07.188: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - UAPI: 
Adding allowedip
2021-04-12 08:41:07.188: [TUN] [lhirisseccom01] Bringing peers up
2021-04-12 08:41:07.190: [TUN] [lhirisseccom01] UDP bind has been updated
2021-04-12 08:41:07.190: [TUN] [lhirisseccom01] Routine: receive 
incoming 0x292980 - started
2021-04-12 08:41:07.190: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Starting...
2021-04-12 08:41:07.190: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Sending keepalive packet
2021-04-12 08:41:07.190: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Sending handshake initiation
2021-04-12 08:41:07.190: [TUN] [lhirisseccom01] Routine: receive 
incoming 0x292a60 - started
2021-04-12 08:41:07.190: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Routine: sequential sender - started
2021-04-12 08:41:07.190: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Routine: sequential receiver - started
2021-04-12 08:41:07.190: [TUN] [lhirisseccom01] Interface state was 
Down, requested Up, now Up
2021-04-12 08:41:07.191: [TUN] [lhirisseccom01] Monitoring default v6 routes
2021-04-12 08:41:07.191: [TUN] [lhirisseccom01] Binding v6 socket to 
interface 0 (blackhole=false)
2021-04-12 08:41:07.191: [TUN] [lhirisseccom01] Setting device v6 addresses
2021-04-12 08:41:07.202: [TUN] [lhirisseccom01] Monitoring default v4 routes
2021-04-12 08:41:07.210: [TUN] [lhirisseccom01] Binding v4 socket to 
interface 10 (blackhole=false)
2021-04-12 08:41:07.212: [TUN] [lhirisseccom01] Setting device v4 addresses
2021-04-12 08:41:07.212: [TUN] [lhirisseccom01] Listening for UAPI requests
2021-04-12 08:41:07.212: [TUN] [lhirisseccom01] Executing: `wg set 
%WIREGUARD_TUNNEL_NAME% listen-port 0`
2021-04-12 08:41:07.229: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Received handshake response
2021-04-12 08:41:07.404: [TUN] [lhirisseccom01] UAPI: Updating listen port
2021-04-12 08:41:07.404: [TUN] [lhirisseccom01] Routine: receive 
incoming 0x292980 - stopped
2021-04-12 08:41:07.404: [TUN] [lhirisseccom01] Routine: receive 
incoming 0x292a60 - stopped
2021-04-12 08:41:07.407: [TUN] [lhirisseccom01] cmd> Unable to modify 
interface: Unknown error
2021-04-12 08:41:07.410: [TUN] panic: ring is full
2021-04-12 08:41:07.410: [TUN] goroutine 134 [running]:
2021-04-12 08:41:07.410: [TUN] 
golang.zx2c4.com/wireguard/conn.(*ringBuffer).Push(...)
2021-04-12 08:41:07.410: [TUN] 
golang.zx2c4.com/wireguard@v0.0.0-20210409202608-75526d60714c/conn/bind_windows.go:46
2021-04-12 08:41:07.410: [TUN] 
golang.zx2c4.com/wireguard/conn.(*afWinRingBind).InsertReceiveRequest(0xc000220000, 
0x0, 0x0)
2021-04-12 08:41:07.410: [TUN] 
golang.zx2c4.com/wireguard@v0.0.0-20210409202608-75526d60714c/conn/bind_windows.go:327 
+0x7e
2021-04-12 08:41:07.410: [TUN] 
golang.zx2c4.com/wireguard/conn.(*WinRingBind).Open(0xc000220000, 0x0, 
0x0, 0x0, 0x0, 0xc00021dbf7, 0x0, 0x0)
2021-04-12 08:41:07.410: [TUN] 
golang.zx2c4.com/wireguard@v0.0.0-20210409202608-75526d60714c/conn/bind_windows.go:291 
+0x265
2021-04-12 08:41:07.410: [TUN] 
golang.zx2c4.com/wireguard/device.(*Device).BindUpdate(0xc000222000, 
0x0, 0x0)
2021-04-12 08:41:07.410: [TUN] 
golang.zx2c4.com/wireguard@v0.0.0-20210409202608-75526d60714c/device/device.go:470 
+0x104
2021-04-12 08:41:07.410: [TUN] 
golang.zx2c4.com/wireguard/device.(*Device).handleDeviceLine(0xc000222000, 
0xc000324030, 0xb, 0xc00032403c, 0x1, 0x1, 0xc0003140a0)
2021-04-12 08:41:07.410: [TUN] 
golang.zx2c4.com/wireguard@v0.0.0-20210409202608-75526d60714c/device/uapi.go:223 
+0x7a5
2021-04-12 08:41:07.410: [TUN] 
golang.zx2c4.com/wireguard/device.(*Device).IpcSetOperation(0xc000222000, 
0x52ee60, 0xc0003042a0, 0x0, 0x0)
2021-04-12 08:41:07.410: [TUN] 
golang.zx2c4.com/wireguard@v0.0.0-20210409202608-75526d60714c/device/uapi.go:183 
+0x279
2021-04-12 08:41:07.410: [TUN] 
golang.zx2c4.com/wireguard/device.(*Device).IpcHandle(0xc000222000, 
0x537840, 0xc0004b4078)
2021-04-12 08:41:07.410: [TUN] 
golang.zx2c4.com/wireguard@v0.0.0-20210409202608-75526d60714c/device/uapi.go:426 
+0x165
2021-04-12 08:41:07.410: [TUN] created by 
golang.zx2c4.com/wireguard/windows/tunnel.(*tunnelService).Execute.func2
2021-04-12 08:41:07.410: [TUN] 
golang.zx2c4.com/wireguard/windows/tunnel/service.go:226 +0x7b
2021-04-12 08:41:07.467: [MGR] [lhirisseccom01] Tunnel service tracker 
finished
2021-04-12 08:41:16.327: [MGR] [Wintun] IsPoolMember: Reading pool 
devpkey failed, falling back: Element not found. (Code 0x00000490)
2021-04-12 08:41:16.338: [MGR] Removing Wintun interface 
‘lhirisseccom01’ because no service for it exists

On 09/04/2021 23:47, Jason A. Donenfeld wrote:
> The fix has been released in 0.3.10.
>
> Jason
