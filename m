Return-Path: me.kalin@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ad1923d7
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jan 2018 11:53:49 +0000 (UTC)
Received: from mail-ot0-f172.google.com (mail-ot0-f172.google.com
 [74.125.82.172])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a273c3be
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jan 2018 11:53:49 +0000 (UTC)
Received: by mail-ot0-f172.google.com with SMTP id x15so19837259ote.0
 for <wireguard@lists.zx2c4.com>; Thu, 18 Jan 2018 03:57:16 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <4dc5f671-790e-88df-5483-ee00716d570e@zenit.ru>
References: <4dc5f671-790e-88df-5483-ee00716d570e@zenit.ru>
From: Kalin KOZHUHAROV <me.kalin@gmail.com>
Date: Thu, 18 Jan 2018 12:56:55 +0100
Message-ID: <CAKXLc7cAs1fQ49F1ez_--ednQM6=voJEfPGmapBX8wS=XPGvEQ@mail.gmail.com>
Subject: Re: passtos patch
To: Vadim Zotov <z@zenit.ru>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Thu, Jan 18, 2018 at 12:30 PM, Vadim Zotov <z@zenit.ru> wrote:
> in some circumstances it is important to set the TOS field in tunnel packet equivalent to payload packet TOS.
> for example, our provider supports three different SLAs, depending on packet TOS field, with different jitter,
> packet loss and service availability. In current release wireguard always set tos to 0.
>
Yep, I completely agree to "in some circumstances" :-D

I am not sure how copying the TOS field can be exploited, I guess it
is one of those things "potential hazard, use KISS, avoid till needed
AND assessment can be made"...
Copying the field straight (in plain-text in a way), will provide some
see-through-the-tunnel, which WG is designed NOT to allow, AFAIK.

There are no optional parameters/options in wireguard (well, except
fwmark), but I guess that one should be implemented as an option, at
least at first.
But again, that contradict KISS principle...

Since this is not a common scenario, IMHO, and there are only a
handful TOS worth doing something, a workaround would be to bunch a
few wg tunnels (even bridge them at both ends?), use fwmark and mangle
the TOS with iptables/ift...
Just a suggestion, not tried obviously.

Regards,
Kalin.
