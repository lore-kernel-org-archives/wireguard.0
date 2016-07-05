Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c87450a1
 for <wireguard@lists.zx2c4.com>; Tue, 5 Jul 2016 19:08:18 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3f5ba1d5
 for <wireguard@lists.zx2c4.com>; Tue, 5 Jul 2016 19:08:18 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4f418031
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 5 Jul 2016 19:08:18 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id h129so141120783lfh.1
 for <wireguard@lists.zx2c4.com>; Tue, 05 Jul 2016 12:11:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CANQAqMWY=8WRbz9+bw11oUO2OAi-SFnHv=f+z5jQ0F1MYf5Ruw@mail.gmail.com>
References: <CANQAqMXqQv_MkEsLSuSHNVqHGJuy6yVHhVP4mM6v3x+5iVbVqA@mail.gmail.com>
 <CAHmME9rXYm3yV0j5pW3yH59j-C9S=6X8-6OY+b=dkuRq7Vpzvw@mail.gmail.com>
 <CANQAqMX8Bf9taS+VgRYnGwuOoJcG3PL8PNmyOK66O3pHjP6VBw@mail.gmail.com>
 <CAHmME9rRHgEtsJ8F-4UrzZMwOs43T24Jq+mUHO91-oimQXXjwg@mail.gmail.com>
 <CANQAqMV=QeCG9BPvPpaCAu56a+mNi_7sNvhDL=_i4N7WFY1=Ng@mail.gmail.com>
 <CAHmME9qr2H=4Qdzx9Kz4=op-O-yzum0+hJWvazHZ_K7ex05ncQ@mail.gmail.com>
 <CANQAqMVT1UkM3uNQbHUKKysHv-tix-Ds9+KaRw62HVHUK5XC+Q@mail.gmail.com>
 <CAHmME9rh8wCLV3jaqyDBm8ZDuVUC__XZOuzbX1haonO2C_ZCEQ@mail.gmail.com>
 <CANQAqMWY=8WRbz9+bw11oUO2OAi-SFnHv=f+z5jQ0F1MYf5Ruw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 5 Jul 2016 21:11:43 +0200
Message-ID: <CAHmME9pFhJoW+kFmJE7-acmb2q4=EqN+U+dJQ8GDEvBzN_=dRg@mail.gmail.com>
To: Norman Shulman <norman.shulman@n-dimension.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] WireGuard cryptokey routing
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Tue, Jul 5, 2016 at 9:09 PM, Norman Shulman
<norman.shulman@n-dimension.com> wrote:
> How is this enforced?
Receiving, line 238 here:
https://git.zx2c4.com/WireGuard/tree/src/receive.c#n238
Sending, line 112 here:
https://git.zx2c4.com/WireGuard/tree/src/device.c#n112

> How does this scale?
The same way in which an ethernet network scales? One ethernet device
can have multiple IPs, but separate (unbonded) ethernet devices
generally do not share IPs.
