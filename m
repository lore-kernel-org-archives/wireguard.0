Return-Path: seb@sebastiaan-stoffels.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id de4f68cb
 for <wireguard@lists.zx2c4.com>; Tue, 8 Aug 2017 10:44:15 +0000 (UTC)
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
 [209.85.214.52])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bc09d791
 for <wireguard@lists.zx2c4.com>; Tue, 8 Aug 2017 10:44:15 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id 76so2285974ith.0
 for <wireguard@lists.zx2c4.com>; Tue, 08 Aug 2017 04:06:04 -0700 (PDT)
Return-Path: <seb@sebastiaan-stoffels.com>
Received: from [192.168.1.22]
 (ec2-13-54-152-122.ap-southeast-2.compute.amazonaws.com. [13.54.152.122])
 by smtp.gmail.com with ESMTPSA id n71sm702018itg.7.2017.08.08.04.06.01
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Aug 2017 04:06:02 -0700 (PDT)
Subject: Re: silly (?) questions
To: wireguard@lists.zx2c4.com
References: <20170808072337.153acd3b@msi.defcon1>
From: Sebastiaan Stoffels <seb@sebastiaan-stoffels.com>
Message-ID: <4447c9b3-29c1-b439-3a2f-f9e218e3423e@sebastiaan-stoffels.com>
Date: Tue, 8 Aug 2017 21:05:57 +1000
MIME-Version: 1.0
In-Reply-To: <20170808072337.153acd3b@msi.defcon1>
Content-Type: text/plain; charset=utf-8; format=flowed
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Jean-Yves,

I just got back from Pycon AU and there was a session on Beeware which 
has a great bunch of tools for cross platform GUI development ( 
including Android ). Well worth a look:

https://pybee.org/project/using/android-app/

You could then use the same code to package up an app for other 
platforms. It even does installers and packaging!


Cheers

Seb
( up until now a lurker! )


On 08/08/2017 03:23 PM, Bzzzz wrote:
> Hi mailinglisters,
>
>
> The goal is to build an android app in python (I just discovered
> Kivy, which seems very nice) that Tx/Rx a few bytes and secure all data
> using a WG tunnel.
>
>
> Does WG needs a root access under android to work correctly ?
>
> If yes, is it possible to connect to a WG server directly from a python
> program ?
>
> What python library(ies?) would you recommend ?
>
>
> Thanks in advance & regards.
>
> Jean-Yves
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
