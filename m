Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2986C6FD1D
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 23 Mar 2023 09:01:56 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6db55b3c;
	Thu, 23 Mar 2023 09:01:54 +0000 (UTC)
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 98c6dbb3
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Mar 2023 09:01:52 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 0A87C2B06689;
 Thu, 23 Mar 2023 05:01:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 23 Mar 2023 05:01:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lv6.tw; h=cc:cc
 :content-transfer-encoding:content-type:content-type:date:date
 :from:from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1679562109; x=1679565709; bh=vV
 t6J0m0Ioj2/SAFplMswEnZnuDJMznKHesKUw8PIAg=; b=S9lriLejI48XrtiYlb
 2gjl/82n6kAPUIG8vpdpb5ugMMcCFdKiVAnP9/V46OFiX1GZ3n+ZS9eaQo4lbM9R
 TifpCcABE9lu1lbh4+jpNaE3F08NLp1S5qqOloQfZ3r7tuI8nD35SLw+wmLK8UnZ
 7nBx4yQihY/WpZMnRxZCdpvcdSsxmy5uF7PxO7EDkb/oV4MA31y8BCZ++lD0Tbco
 arWTPLDgmYVCPUCneNkJ5UmTlyedP+Hnvpkl3s1KJGD4+9Se51NjipHC5eZ0MTxX
 4/Am2UPmbanwPwLQuz6pVR5r+Dh3d6f+BXyVfIVFIUl4PAONL06lQ20HvWFy6ukH
 BXEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; t=1679562109; x=1679565709; bh=v
 Vt6J0m0Ioj2/SAFplMswEnZnuDJMznKHesKUw8PIAg=; b=tFn2LNIwc8MEgIz+7
 P45dbeGO8XLYOsb7TuXOm9jLNMU65PJBHU6g9tHZ90T2OfCYaIDqzH5kP3qlWO8j
 r/kelqAd9BkkFd3mboeR6eHGo5oOHDrHPrsjEav+hkhLH7njc2nV0HYbWjk7xikd
 0Y6DeG9bedh5GMp8hJWYeJiVXCVzgHNUlVxbbQNIRGH1SV/K1lNUq87s/Iq1JIZL
 zOBGnUHWBAgaCCoqCelYyBccNooWKFi56nHMEJ1VoefmNm2l/+pHV08TJ24L1hbM
 JonpJid18NEHMY5OiNCbeViISkFC4r+7hnSqfSlz4PornibHAAZqL2y+BmsBbbd/
 HpVsw==
X-ME-Sender: <xms:fBUcZBQlHJU7SFyGX4SEOACutX65b61CM2aQGXAONGX__l8lD9Z3pg>
 <xme:fBUcZKzdsZRoGzbG-8DPiYqqG7i2DAsrh-LyroxjnwW2lRuieHcdzoguHTB92uGPI
 L8QtwS1FdLii7WyveQ>
X-ME-Received: <xmr:fBUcZG1C1JYVpV7IyFlpctDATxYskcRyiq6bcjuN1o4mYKC2Ci9t4MfK6LWc-IHbrfrSiP5pnouTiJfnGe69IFLViNo9IUGNQB8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdegfedguddviecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepkfffgggfhfevvffutgfgsehtje
 ertddtfeejnecuhfhrohhmpehlshgtuceolhhstgeslhhviedrthifqeenucggtffrrght
 thgvrhhnpeeigedvfeeiheettdeuuefgffejleeuudeugedtleehhedvtdehheetkefhfe
 eitdenucffohhmrghinhepiiigvdgtgedrtghomhenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehlshgtsehlvheirdhtfi
X-ME-Proxy: <xmx:fBUcZJCibfPmEO52Ew3iKh1yOsBLu2kgWjvYo3rlBzGu4mOwfzoWXg>
 <xmx:fBUcZKhbvx6qWMqsKYaqAscSKDJNVy3-pVxUoNmECmwnDMgfOD4dew>
 <xmx:fBUcZNqSmbP1g5j1YOdAYfgiiOP7a3-l8BSmPEKPMgVxr8pbI9gdXw>
 <xmx:fRUcZNs1qyTIwmjwmMWXYjXcaMurU1krRANrriAcj8ZvuvjMJpqWF66_E_g>
Feedback-ID: i36d94643:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Mar 2023 05:01:47 -0400 (EDT)
Message-ID: <ac87f86f-6837-4e0e-ec34-1df35f52540e@lv6.tw>
Date: Thu, 23 Mar 2023 17:01:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
From: lsc <lsc@lv6.tw>
Cc: jordan@tailscale.com, james@tailscale.com, Jason@zx2c4.com
To: wireguard@lists.zx2c4.com
Subject: wireguard-go: data race introduced in recent commit 9e2f386
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Not sure if this is the correct place for bug reports, hope it's okay :)

I found my wireguard-go server (built from current ToT 1417a47) always 
panicking when I ran speedtest on a client via the server. I rebuilt the 
server with data race detector (`go build -race`) and got the following 
trace:

==================
WARNING: DATA RACE
Read at 0x00c00043b2f8 by goroutine 49:
   golang.zx2c4.com/wireguard/conn.setSrcControl()
       /home/lsc36/wireguard-go/conn/sticky_linux.go:76 +0x8c
   golang.zx2c4.com/wireguard/conn.(*StdNetBind).send4()
       /home/lsc36/wireguard-go/conn/bind_std.go:346 +0x174
   golang.zx2c4.com/wireguard/conn.(*StdNetBind).Send()
       /home/lsc36/wireguard-go/conn/bind_std.go:332 +0x1d4
   golang.zx2c4.com/wireguard/device.(*Peer).SendBuffers()
       /home/lsc36/wireguard-go/device/peer.go:126 +0x18c
   golang.zx2c4.com/wireguard/device.(*Peer).RoutineSequentialSender()
       /home/lsc36/wireguard-go/device/send.go:519 +0x458
   golang.zx2c4.com/wireguard/device.(*Peer).Start.func2()
       /home/lsc36/wireguard-go/device/peer.go:198 +0x40

Previous write at 0x00c00043b2f8 by goroutine 47:
   golang.zx2c4.com/wireguard/conn.(*StdNetEndpoint).ClearSrc()
       /home/lsc36/wireguard-go/conn/bind_std.go:100 +0x48
   golang.zx2c4.com/wireguard/conn.getSrcFromControl()
       /home/lsc36/wireguard-go/conn/sticky_linux.go:18 +0x3c
   golang.zx2c4.com/wireguard/conn.(*StdNetBind).makeReceiveIPv4.func1()
       /home/lsc36/wireguard-go/conn/bind_std.go:232 +0x350
   golang.zx2c4.com/wireguard/device.(*Device).RoutineReceiveIncoming()
       /home/lsc36/wireguard-go/device/receive.go:107 +0x3ac
   golang.zx2c4.com/wireguard/device.(*Device).BindUpdate.func3()
       /home/lsc36/wireguard-go/device/device.go:530 +0x4c

Goroutine 49 (running) created at:
   golang.zx2c4.com/wireguard/device.(*Peer).Start()
       /home/lsc36/wireguard-go/device/peer.go:198 +0x300
   golang.zx2c4.com/wireguard/device.(*ipcSetPeer).handlePostConfig()
       /home/lsc36/wireguard-go/device/uapi.go:268 +0x164
   golang.zx2c4.com/wireguard/device.(*Device).IpcSetOperation()
       /home/lsc36/wireguard-go/device/uapi.go:160 +0x35c
   golang.zx2c4.com/wireguard/device.(*Device).IpcHandle()
       /home/lsc36/wireguard-go/device/uapi.go:428 +0x248
   main.main.func4.1()
       /home/lsc36/wireguard-go/main.go:245 +0x4c

Goroutine 47 (running) created at:
   golang.zx2c4.com/wireguard/device.(*Device).BindUpdate()
       /home/lsc36/wireguard-go/device/device.go:530 +0x4b8
   golang.zx2c4.com/wireguard/device.(*Device).handleDeviceLine()
       /home/lsc36/wireguard-go/device/uapi.go:223 +0x45c
   golang.zx2c4.com/wireguard/device.(*Device).IpcSetOperation()
       /home/lsc36/wireguard-go/device/uapi.go:183 +0x210
   golang.zx2c4.com/wireguard/device.(*Device).IpcHandle()
       /home/lsc36/wireguard-go/device/uapi.go:428 +0x248
   main.main.func4.1()
       /home/lsc36/wireguard-go/main.go:245 +0x4c
==================

The bug looks introduced by a recent commit 9e2f386 "conn, device, tun: 
implement vectorized I/O on Linux". Without much knowledge to the 
codebase, it seems to me that Endpoint is supposed to be guarded by the 
RWMutex embedded in Peer, yet the change introduced a write without 
locking the mutex (`ep.ClearSrc()` called from sticky_linux.go:18).

In addition, I found it weird that Endpoint objects are reused via 
`endpointPool`. The docstring suggests "Endpoints are immutable, so we 
can re-use them" but that doesn't seem true.

Added authors/reviewers of 9e2f386 to cc. Would you take a look?

Regards,
SC

