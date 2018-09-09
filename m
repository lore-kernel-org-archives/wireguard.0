Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6861322b
 for <wireguard@lists.zx2c4.com>; Sun, 9 Sep 2018 22:27:17 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5e8299bb
 for <wireguard@lists.zx2c4.com>; Sun, 9 Sep 2018 22:27:17 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5d1e8fd1
 for <wireguard@lists.zx2c4.com>; Sun, 9 Sep 2018 22:11:28 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6c489080
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 9 Sep 2018 22:11:26 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id 13-v6so36775382ois.1
 for <wireguard@lists.zx2c4.com>; Sun, 09 Sep 2018 15:27:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAHijbEWf1S0Tc+zxZBvmJ0xe5iBU00pOxikejetF8x33Qh=GcQ@mail.gmail.com>
 <CAHmME9rB71UbcY-kLkJO0yOVQ-s31E_S9yCKdZTh6F9-PScN5A@mail.gmail.com>
 <CAHijbEX8cRGA3_NFdRqFCraLns_UhaSbX0yFJTax8bsFvAP9XQ@mail.gmail.com>
In-Reply-To: <CAHijbEX8cRGA3_NFdRqFCraLns_UhaSbX0yFJTax8bsFvAP9XQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 9 Sep 2018 16:27:43 -0600
Message-ID: <CAHmME9qYX8AEtOWo-u2E90mnKy+HeT-cb8KH8b9q3GUsmjxzDg@mail.gmail.com>
Subject: Re: Setting the transit namespace at runtime
To: Julian Orth <ju.orth@gmail.com>
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

Hi Julian,

On Fri, Sep 7, 2018 at 1:06 PM Julian Orth <ju.orth@gmail.com> wrote:
> > I'd thought of this early on, but failed to come up with what seemed
> > like an actually realistic use case for it.
>
> How about creating Wireguard devices as a user that has no
> privileges/capabilites in the init namespace?
>
> $ unshare -r -U -m
> $ mount --bind /proc/self/ns/net init-ns
> $ unshare -n
> $ ./setup-wg0.sh
> $ wg set wg0 transit-net init-ns

That looks to me like a security vulnerability. User namespace sets
listen-port to < 1024, and then moves it into the target namespace,
and bam, controls subverted.

It might be wise, then, to include with this a capability check
relative to the destination socket namespace, but that needs a check
on both ends -- when you change the socket namespace and when you
change the listen port, to make sure they correspond. However, if
you're restricting setting the namespace and the listen port to
cap_net_admin, then the above is no longer a good reason for this
patchset, thereby begging my initial question.

I saw you posted patches to the mailing list. I'll review these soon
on my way back home on the flight tomorrow. In the mean time, if you
send me your SSH public key (perhaps privately), we can add you to the
WireGuard git repository, so that you can push to branches that begin
with "jo/".

Jason
