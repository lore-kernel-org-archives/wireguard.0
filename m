Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a7ed0afe
 for <wireguard@lists.zx2c4.com>; Tue, 1 Nov 2016 21:00:02 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eba52b67
 for <wireguard@lists.zx2c4.com>; Tue, 1 Nov 2016 21:00:02 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id dedb422c
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 1 Nov 2016 21:00:02 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id c13so28967294lfg.0
 for <wireguard@lists.zx2c4.com>; Tue, 01 Nov 2016 14:01:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <8D9A34EE-331B-4704-8558-DF83F0DCE7EE@danrl.com>
References: <25C77A0A-9EAB-4B87-AF85-D590F972F332@danrl.com>
 <CAHmME9p8bYDF9StPW8EHNXGEguK=Fomb9CE6yd9h0gZwWo=5pg@mail.gmail.com>
 <8D9A34EE-331B-4704-8558-DF83F0DCE7EE@danrl.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 1 Nov 2016 22:01:01 +0100
Message-ID: <CAHmME9pQT_3crtMRU6ziLXNRk4JEL4H3mj0bg1PACpvexfCwbA@mail.gmail.com>
To: =?UTF-8?Q?Dan_L=C3=BCdtke?= <mail@danrl.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Wireguard on OpenWRT/LEDE (here: Luci)
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Tue, Nov 1, 2016 at 9:57 PM, Dan L=C3=BCdtke <mail@danrl.com> wrote:
>> 11. The existing logic for adding a device is to add it if it doesn't
>> exist, and otherwise to flush the addresses. Is it a good idea to
>> flush the routes too? Or simply delete and re-add? Or is a simple
>> flush of the addresses standard LEDE behavior? I'll defer to Baptiste
>> (CC'd) on this.
>
> Not sure either.

In your latest commit, it looks like you've just added flushing of the
routes too. If you're headed down this track, just do it properly by:

- if ! ip link show dev "${iface}" >/dev/null 2>&1; then
-  ip link add dev "${iface}" type wireguard
- else
-  ip address flush dev "${iface}"
-  ip route flush dev "${iface}"
- fi
+ ip link del dev "${iface}" 2>/dev/null
+ ip link add dev "${iface}" type wireguard
