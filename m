Return-Path: bruno@streamfeed.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 755c7cd3
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 18:30:15 +0000 (UTC)
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
 [209.85.220.171])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fae56020
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 18:30:15 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id f9so4598615qkm.12
 for <wireguard@lists.zx2c4.com>; Sat, 14 Apr 2018 11:44:34 -0700 (PDT)
Return-Path: <bruno@streamfeed.com>
Subject: Re: Policy-based routing
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <a81edfe2-2a49-c49a-ea7c-65e60639ecfe@streamfeed.com>
 <CAHmME9r-ZHkhKjw+JTkF++t+9TBEnSv6AKF=FitQkg4V+a14dw@mail.gmail.com>
From: Bruno <bruno@streamfeed.com>
Message-ID: <8108c2eb-e407-9d6d-4c0c-d26eb7a2bc93@streamfeed.com>
Date: Sat, 14 Apr 2018 15:44:28 -0300
MIME-Version: 1.0
In-Reply-To: <CAHmME9r-ZHkhKjw+JTkF++t+9TBEnSv6AKF=FitQkg4V+a14dw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Jason,

Thanks for your input. I agree with you.

But I could have the peers based on table routing and marking packets, 
were all the traffic (0.0.0.0/0) would be routed based on the prior 
conditions (tables and marking).

I'm doing one interface per peer right now, but I thought it could be 
possible to achieve the same results with just one interface.

Bruno



On 04/13/2018 11:09 PM, Jason A. Donenfeld wrote:
> Hi Bruno,
>
> You can't set multiple peers to use 0.0.0.0/0 at the same time on the
> same interface. How would it be able to choose which peer to send
> traffic to then? Instead, if you want some kind of redundancy or
> bonding, you can try using multiple interfaces, and then use whatever
> traditional routing or load balancing tools that you ordinarily would.
>
> Jason
