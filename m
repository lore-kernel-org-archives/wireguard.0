Return-Path: <SRS0=/ntC=GS=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD59CC433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 15 Jan 2021 10:32:43 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B769235F9
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 15 Jan 2021 10:32:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B769235F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4acd2f52;
	Fri, 15 Jan 2021 10:32:39 +0000 (UTC)
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 68620e4b
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 15 Jan 2021 10:32:36 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id m10so9849392lji.1
 for <wireguard@lists.zx2c4.com>; Fri, 15 Jan 2021 02:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=JUlrsQAE5d6EE/EQQalYY07cG/WBZ21p1VxQLTK3IDI=;
 b=e1qdWwLRXWFF9vK8zpMFGdmQCbbBtU6OEnl98HSFyw3iKZ2F7jZziW0WV1cd37V1Kp
 f/rrir2u3ZYHWUvB6QUjnJ6JSkmFoASQqpaII7rZc5S3hgoVR6leipXA9am/1TAtraTH
 UuPsgze1OLz7swiVCt71h8ovN8YBWcige/CAQDfQAhPZ/52VDOQxMNKq0LPbODt30PiJ
 852KCPnKMjwmjr6KCMF+ZrcjPbVgQh+TIv2iIcqyhEQ3tkUP3b2cTmOA0EEG8m/oPLle
 tKV+bHDIM4TJPdp7g/MAsihBniLGsdk+knvoVhmEY3bokGHCBXdBdrIkhZIaVSuEw912
 pzeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=JUlrsQAE5d6EE/EQQalYY07cG/WBZ21p1VxQLTK3IDI=;
 b=eosHQVe2AwNFHRpATLWDMhA5PBzYucfzyKpeDXHAgAKm5sFY53NbzKaw/fF6k8Eswu
 oHTJDchVxlLbJios86XQX75iUitGdR4esWem0QSQP6NSwowRCdVUrqRGINsLOWbkZ4TM
 /GGrzf6gA3kRktJBRnI08pcZncEjHqescqNweJDYBGMKxar3Sw7nTS/fr9MF2LJpd0Cf
 +c7Vld4QFQOZU+uk/7lvVVBZXpZAW13Evoq7dPIDpRe7qqvF+0BilmaolNeTD1IefRy2
 9S4nvsP2Zet4icsfeEcQ/niQatrJXpHBVVP+v2T/c2Yc2PbZaTvFA80XwFQod6PY97Kf
 KKvQ==
X-Gm-Message-State: AOAM53359sMGVwXcEPT+i9tAq3fNbEcg0lOFGTnMI/HujQPNeUfoI8qb
 J2zILXLxhD15Wk/1hPwOixuHzYuBgqBaUaG9SuLe3EflkO4=
X-Google-Smtp-Source: ABdhPJxs1FOIOITeWlwjBelCLZ9n7GE6WgSmHT8XBmpw6K8abrdXPSHP0SG9AE2LXlXBvjRqkTL4EZ9C24CPd8AcSd0=
X-Received: by 2002:a2e:361a:: with SMTP id d26mr5098799lja.115.1610706756107; 
 Fri, 15 Jan 2021 02:32:36 -0800 (PST)
MIME-Version: 1.0
References: <9f621ce6-ec3d-0641-c359-756d0ad36f65@gmail.com>
 <6a01b182-a98f-1736-676f-d0811f6de086@gmail.com>
 <CAHmME9ojL5JxWh5Vn_RsBB8baLabhFvotAuSoQ61fJeht=2qEA@mail.gmail.com>
 <2dc629e2-93c9-4ed9-ea57-4318c8b62a73@gmail.com>
 <397bedc7-3913-08bb-a6f3-691d9fab663c@gmail.com>
 <CAN5wt5r9rQpYcCkshBimOARoAxx7T529oUw6RSNnr4q3_y_31g@mail.gmail.com>
In-Reply-To: <CAN5wt5r9rQpYcCkshBimOARoAxx7T529oUw6RSNnr4q3_y_31g@mail.gmail.com>
From: Christopher Ng <facboy@gmail.com>
Date: Fri, 15 Jan 2021 10:32:24 +0000
Message-ID: <CAN5wt5ojzay9uEjubrrivd6vZqOGNJ40M25ELzOYTK42zozijQ@mail.gmail.com>
Subject: Fwd: Problems with Windows client over PulseSecure VPN
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

---------- Forwarded message ---------
From: Christopher Ng <facboy@gmail.com>
Date: Fri, 15 Jan 2021 at 09:46
Subject: Re: Problems with Windows client over PulseSecure VPN
To: Peter Whisker <peter.whisker@gmail.com>


i fixed this in my local build by disabling the binding in
defaultroutemonitor.go.  tbh i'm not sure what it's for, i found an
old discussion (about linux) about not binding to only one interface,
so i'm not sure why Windows binds to one interface.

diff --git a/tunnel/defaultroutemonitor.go b/tunnel/defaultroutemonitor.go
index 6ee95129..12456332 100644
--- a/tunnel/defaultroutemonitor.go
+++ b/tunnel/defaultroutemonitor.go
@@ -6,12 +6,10 @@
 package tunnel

 import (
-       "log"
        "sync"
        "time"

        "golang.org/x/sys/windows"
-       "golang.zx2c4.com/wireguard/conn"
        "golang.zx2c4.com/wireguard/device"
        "golang.zx2c4.com/wireguard/tun"
        "golang.zx2c4.com/wireguard/windows/tunnel/winipcfg"
@@ -50,18 +48,22 @@ func bindSocketRoute(family
winipcfg.AddressFamily, device *device.Device, ourLU
        }
        *lastLUID = luid
        *lastIndex = index
-       blackhole := blackholeWhenLoop && index == 0
-       bind, _ := device.Bind().(conn.BindSocketToInterface)
-       if bind == nil {
-               return nil
-       }
-       if family == windows.AF_INET {
-               log.Printf("Binding v4 socket to interface %d
(blackhole=%v)", index, blackhole)
-               return bind.BindSocketToInterface4(index, blackhole)
-       } else if family == windows.AF_INET6 {
-               log.Printf("Binding v6 socket to interface %d
(blackhole=%v)", index, blackhole)
-               return bind.BindSocketToInterface6(index, blackhole)
-       }
+       // disable this because if my peers are on different
interfaces...well i don't know how it can work.  i can't
+       // bind the socket to only one of them
+       /*
+               blackhole := blackholeWhenLoop && index == 0
+               bind, _ := device.Bind().(conn.BindSocketToInterface)
+               if bind == nil {
+                       return nil
+               }
+               if family == windows.AF_INET {
+                       log.Printf("Binding v4 socket to interface %d
(blackhole=%v)", index, blackhole)
+                       return bind.BindSocketToInterface4(index, blackhole)
+               } else if family == windows.AF_INET6 {
+                       log.Printf("Binding v6 socket to interface %d
(blackhole=%v)", index, blackhole)
+                       return bind.BindSocketToInterface6(index, blackhole)
+               }
+       */
        return nil
 }

On Wed, 13 Jan 2021 at 17:06, Peter Whisker <peter.whisker@gmail.com> wrote:
>
> Hi
>
> I have managed to work around the issue caused by Wireguard sending
> packets via default route interface even though the route to the peer is
> over a different interface (the issue caused by IP_UNICAST_IF). My
> Wireguard peer is down a corporate Pulse Secure tunnel.
>
> I use a PreUp and PostDown script as follows:
>
> PreUp
> =====
>
> for /f "tokens=3" %%a in ('route print -4 0.0.0.0^| find "0.0.0.0"') do
> if not defined ip set ip=%%a
> route add 0.0.0.0 mask 128.0.0.0 %ip% METRIC 1
> route add 128.0.0.0 mask 128.0.0.0 %ip% METRIC 1
> route delete 0.0.0.0 mask 0.0.0.0
>
> PostDown
> ========
>
> for /f "tokens=3" %%a in ('route print -4 0.0.0.0^| find "0.0.0.0"') do
> if not defined ip set ip=%%a
> route add 0.0.0.0 mask 0.0.0.0 %ip% METRIC 1
> route delete 0.0.0.0 mask 128.0.0.0
> route delete 128.0.0.0 mask 128.0.0.0
>
> This replaces the /0 default route by two /1 routes before bringing up
> the WireGuard interface. Traffic to the peer then gets sent down the
> correct route (why is this different from having a default route?). When
> the WireGuard instance is closed, it recreates the default route and
> removes the two /1 routes.
>
> Is there a way this could be done better in the Wireguard executable (I
> am currently using 0.3.4).
>
> Thanks
>
> Peter
>
> On 26/11/2020 13:11, Jason A. Donenfeld wrote:
> >> Is PulseSecure not setting up a /0 route? If so, then this is a known
> >> issue with the lack of policy routing on Windows.
