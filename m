Return-Path: eric@ericlight.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 079d5cdc
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jan 2018 21:07:00 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 745a456c
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jan 2018 21:06:59 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id C4B4F20A8B
 for <wireguard@lists.zx2c4.com>; Thu, 18 Jan 2018 16:10:29 -0500 (EST)
Message-Id: <1516309829.3149945.1240291760.7ADD3DD5@webmail.messagingengine.com>
From: Eric Light <eric@ericlight.com>
To: wireguard@lists.zx2c4.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Date: Fri, 19 Jan 2018 10:10:29 +1300
In-Reply-To: <CAHmME9rL9Koi2-vctwmTjCf2DCMCTEOcueJJNLsprO03-3gwMQ@mail.gmail.com>
Subject: Re: passtos patch
References: <4dc5f671-790e-88df-5483-ee00716d570e@zenit.ru>
 <CAHmME9rL9Koi2-vctwmTjCf2DCMCTEOcueJJNLsprO03-3gwMQ@mail.gmail.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi all,

Wearing my 'Wireguard enthusiast who doesn't know *that* much about crypto, and only uses WG as an end-user'  hat:

It sounds to me like additional complexity, additional code, and additional information leakage, for what seems to be a relatively uncommon scenario, which by the sounds of things could be addressed with fwmark.

Are any of those observations incorrect?

E

--------------------------------------------
Q: Why is this email five sentences or less?
A: http://five.sentenc.es

On Fri, 19 Jan 2018, at 05:11, Jason A. Donenfeld wrote:
> Not sure the infoleak is worth it.
> 
> List: thoughts?
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
