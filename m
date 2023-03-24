Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D86FEC6FD1C
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Mar 2023 03:22:03 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a7526784;
	Fri, 24 Mar 2023 03:22:01 +0000 (UTC)
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0e3a29e5
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Mar 2023 03:21:58 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id B2643581E6F;
 Thu, 23 Mar 2023 23:21:57 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 23 Mar 2023 23:21:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lv6.tw; h=cc:cc
 :content-transfer-encoding:content-type:content-type:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm1; t=
 1679628117; x=1679631717; bh=0avluD7bC/TaIS1xePuqbnQTGB8eIl4NWKA
 poyxmo6M=; b=G3Ntb/S1uH+uQpiLfjoB7Vuy2YZxNlttW000YpF0v2jXCfvsaCz
 87tNmi9a0a349e/pOrZVBme5LpaAm80Z1xgikN+HDx9BLtCIb2xlcQMZOaBsRPtO
 uEK0IgvzS1GFV6/Is51BI7wBEpGW4xOteQ4T/4ifq6J5gw7RdR73pxfyKINJDlg8
 Kea8yrSVGGn7FElqLPsCB+frn8THVYkxru6lNQkWaTyu+K2XMtGUbYhH4EhUKH04
 0cx0FHdxy3htSfchys0fL21vJjihG8G06Zlu88Xw+JeiL4oGFmchnw42UQIQNe/+
 CVXkbVJ25aCqBNiurYOOd8OYrZRSpPfhvXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1679628117; x=1679631717; bh=0avluD7bC/TaIS1xePuqbnQTGB8eIl4NWKA
 poyxmo6M=; b=vbNiUbVSxcq2IiEI6e6YPSDGHX9m8+S1AlpHNgqOPxVw6Zy1oAn
 7flFOwXswQKj+mTZ5F+7Q8ntfeLuWylj/kehu6Jmx00Ptqn7IjYO7NXxKlVLvd2V
 YSGyp+D3SmUymFJrXde9BMfVflDTwTy1CHo6JGF6kzW+TOHhlA1fK2/n6I5uwUoH
 6n4GzpebQ7R2bF8Z5ZT1dtI0r8wnnvSBopB2u0gb8F3EQukIhOkYXMEFqDB2pE4y
 If2CiZh7/6BVwQsd0BqBAghpCjv2rt3NLDW0pL3N/Le2IWgaBBXqnk++IJAfRYIt
 4xu8yBW76S5TblMsLe/AujzHQTxIo4YxAjw==
X-ME-Sender: <xms:VBcdZKucg-c1sh2FCDa-CSxmY12XgAEvOqUy952j8zJ86qR8RYMGoQ>
 <xme:VBcdZPdyZdH2Rl_5Fn7C6jauMA5nAR6q-achgv76q6jEU2Y4Xn1aTokQO_e7j96Pb
 aI5SCnuDad_OfvC4jM>
X-ME-Received: <xmr:VBcdZFw1kHIqWgEJ25Uqu8R-5ubP3mNvQQ_ebd8ZPEG3Dxupr7WdFa6ae-hb6TcYMSuIlPYepYKp66BGYdcGkCbN_LhkmopdiTE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeghedgheelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtfeejnecuhfhrohhmpehlshgt
 uceolhhstgeslhhviedrthifqeenucggtffrrghtthgvrhhnpeeftdelhfejiedvfeegte
 ekteefkeehledvvdekieejtdegfeekfeetgeejgefhfeenucffohhmrghinhepiiigvdgt
 gedrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehlshgtsehlvheirdhtfi
X-ME-Proxy: <xmx:VBcdZFPMCpV2SLDqNwcxHjvXk2PnxI9KnL7DWHdjgLX3hf2aQ3JGLg>
 <xmx:VBcdZK9V87uswIwMCj_GIZ_cLvK1JDuzDIZyKCVRry0YISc-vtdymA>
 <xmx:VBcdZNVR0eVj63QklQVAXGR3C78n2y7T2fJyGDB9cK3SHgIo14qNvg>
 <xmx:VRcdZMLJqywTknRbWuvO2uG8b6L_ff-M0eooS-dpzwatSFx3QEij0w>
Feedback-ID: i36d94643:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Mar 2023 23:21:54 -0400 (EDT)
Message-ID: <18b4903b-0835-ac5e-49ca-ae6bea08a268@lv6.tw>
Date: Fri, 24 Mar 2023 11:21:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: wireguard-go: data race introduced in recent commit 9e2f386
Content-Language: en-US
To: Jordan Whited <jordan@tailscale.com>
Cc: wireguard@lists.zx2c4.com, james@tailscale.com, Jason@zx2c4.com
References: <ac87f86f-6837-4e0e-ec34-1df35f52540e@lv6.tw>
 <CABprzAaZC86FosOK7A__LB7LzULLYv=-y539y5VHacttYJwSmg@mail.gmail.com>
From: lsc <lsc@lv6.tw>
In-Reply-To: <CABprzAaZC86FosOK7A__LB7LzULLYv=-y539y5VHacttYJwSmg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Sure, here's the trace:

--
DEBUG: (wg1) 2023/03/22 23:46:39 peer(Suxf…6dEI) - Routine: sequential sender - stopped
panic: As4 called on IP zero value

goroutine 70 [running]:
net/netip.Addr.As4({{0xc0048b1200?, 0xc00058bb28?}, 0x0?})
        /opt/go1.20.2.linux-arm64/src/net/netip/netip.go:690 +0x174
golang.zx2c4.com/wireguard/conn.setSrcControl(0xc00931b018, 0xc006301640)
        /home/lsc36/wireguard-go/conn/sticky_linux.go:95 +0x280
golang.zx2c4.com/wireguard/conn.(*StdNetBind).send4(0xc0003b6000, 0xffffa9d04200?, 0xc0000b8230, {0x24e6e8?, 0xc006301640?}, {0xc000533800, 0x1, 0xba250?})
        /home/lsc36/wireguard-go/conn/bind_std.go:346 +0x178
golang.zx2c4.com/wireguard/conn.(*StdNetBind).Send(0xc0003b6000, {0xc000533800, 0x1, 0x80}, {0x24e6e8, 0xc006301640})
        /home/lsc36/wireguard-go/conn/bind_std.go:332 +0x1d8
golang.zx2c4.com/wireguard/device.(*Peer).SendBuffers(0xc0000be380, {0xc000533800?, 0x1, 0x80})
        /home/lsc36/wireguard-go/device/peer.go:126 +0x190
golang.zx2c4.com/wireguard/device.(*Peer).RoutineSequentialSender(0xc0000be380, 0x80)
        /home/lsc36/wireguard-go/device/send.go:519 +0x45c
created by golang.zx2c4.com/wireguard/device.(*Peer).Start
        /home/lsc36/wireguard-go/device/peer.go:198 +0x304
--

The offending call `ep.SrcIP().As4()` (sticky_linux.go:95) is only
reached when `ep.SrcIP().Is4() && ep.SrcIP().IsValid()` is true, yet it
panicked saying it was being called against a zero value. That's why I
suspected it's a data race in the first place.

On 3/24/23 01:00, Jordan Whited wrote:
> SC, thank you for reporting. Do you happen to have a stack trace from
> one of the panics?
> 
> On Thu, Mar 23, 2023 at 2:01 AM lsc <lsc@lv6.tw> wrote:
>>
>> Hi,
>>
>> Not sure if this is the correct place for bug reports, hope it's okay :)
>>
>> I found my wireguard-go server (built from current ToT 1417a47) always
>> panicking when I ran speedtest on a client via the server. I rebuilt the
>> server with data race detector (`go build -race`) and got the following
>> trace:
>>
>> ==================
>> WARNING: DATA RACE
>> Read at 0x00c00043b2f8 by goroutine 49:
>>    golang.zx2c4.com/wireguard/conn.setSrcControl()
>>        /home/lsc36/wireguard-go/conn/sticky_linux.go:76 +0x8c
>>    golang.zx2c4.com/wireguard/conn.(*StdNetBind).send4()
>>        /home/lsc36/wireguard-go/conn/bind_std.go:346 +0x174
>>    golang.zx2c4.com/wireguard/conn.(*StdNetBind).Send()
>>        /home/lsc36/wireguard-go/conn/bind_std.go:332 +0x1d4
>>    golang.zx2c4.com/wireguard/device.(*Peer).SendBuffers()
>>        /home/lsc36/wireguard-go/device/peer.go:126 +0x18c
>>    golang.zx2c4.com/wireguard/device.(*Peer).RoutineSequentialSender()
>>        /home/lsc36/wireguard-go/device/send.go:519 +0x458
>>    golang.zx2c4.com/wireguard/device.(*Peer).Start.func2()
>>        /home/lsc36/wireguard-go/device/peer.go:198 +0x40
>>
>> Previous write at 0x00c00043b2f8 by goroutine 47:
>>    golang.zx2c4.com/wireguard/conn.(*StdNetEndpoint).ClearSrc()
>>        /home/lsc36/wireguard-go/conn/bind_std.go:100 +0x48
>>    golang.zx2c4.com/wireguard/conn.getSrcFromControl()
>>        /home/lsc36/wireguard-go/conn/sticky_linux.go:18 +0x3c
>>    golang.zx2c4.com/wireguard/conn.(*StdNetBind).makeReceiveIPv4.func1()
>>        /home/lsc36/wireguard-go/conn/bind_std.go:232 +0x350
>>    golang.zx2c4.com/wireguard/device.(*Device).RoutineReceiveIncoming()
>>        /home/lsc36/wireguard-go/device/receive.go:107 +0x3ac
>>    golang.zx2c4.com/wireguard/device.(*Device).BindUpdate.func3()
>>        /home/lsc36/wireguard-go/device/device.go:530 +0x4c
>>
>> Goroutine 49 (running) created at:
>>    golang.zx2c4.com/wireguard/device.(*Peer).Start()
>>        /home/lsc36/wireguard-go/device/peer.go:198 +0x300
>>    golang.zx2c4.com/wireguard/device.(*ipcSetPeer).handlePostConfig()
>>        /home/lsc36/wireguard-go/device/uapi.go:268 +0x164
>>    golang.zx2c4.com/wireguard/device.(*Device).IpcSetOperation()
>>        /home/lsc36/wireguard-go/device/uapi.go:160 +0x35c
>>    golang.zx2c4.com/wireguard/device.(*Device).IpcHandle()
>>        /home/lsc36/wireguard-go/device/uapi.go:428 +0x248
>>    main.main.func4.1()
>>        /home/lsc36/wireguard-go/main.go:245 +0x4c
>>
>> Goroutine 47 (running) created at:
>>    golang.zx2c4.com/wireguard/device.(*Device).BindUpdate()
>>        /home/lsc36/wireguard-go/device/device.go:530 +0x4b8
>>    golang.zx2c4.com/wireguard/device.(*Device).handleDeviceLine()
>>        /home/lsc36/wireguard-go/device/uapi.go:223 +0x45c
>>    golang.zx2c4.com/wireguard/device.(*Device).IpcSetOperation()
>>        /home/lsc36/wireguard-go/device/uapi.go:183 +0x210
>>    golang.zx2c4.com/wireguard/device.(*Device).IpcHandle()
>>        /home/lsc36/wireguard-go/device/uapi.go:428 +0x248
>>    main.main.func4.1()
>>        /home/lsc36/wireguard-go/main.go:245 +0x4c
>> ==================
>>
>> The bug looks introduced by a recent commit 9e2f386 "conn, device, tun:
>> implement vectorized I/O on Linux". Without much knowledge to the
>> codebase, it seems to me that Endpoint is supposed to be guarded by the
>> RWMutex embedded in Peer, yet the change introduced a write without
>> locking the mutex (`ep.ClearSrc()` called from sticky_linux.go:18).
>>
>> In addition, I found it weird that Endpoint objects are reused via
>> `endpointPool`. The docstring suggests "Endpoints are immutable, so we
>> can re-use them" but that doesn't seem true.
>>
>> Added authors/reviewers of 9e2f386 to cc. Would you take a look?
>>
>> Regards,
>> SC
>>

