Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e439209c
 for <wireguard@lists.zx2c4.com>; Fri, 1 Dec 2017 20:53:36 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ddbfbeed
 for <wireguard@lists.zx2c4.com>; Fri, 1 Dec 2017 20:53:36 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ca633192
 for <wireguard@lists.zx2c4.com>; Fri, 1 Dec 2017 20:53:36 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id cec5cde6
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 1 Dec 2017 20:53:36 +0000 (UTC)
Received: by mail-ot0-f180.google.com with SMTP id q3so10150028oth.2
 for <wireguard@lists.zx2c4.com>; Fri, 01 Dec 2017 12:59:54 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAKgnZ5wDEwMXA6+WbxrmQocBgPPeHCH-WBdn5kHezzsLPGDdtQ@mail.gmail.com>
References: <CAKgnZ5wDEwMXA6+WbxrmQocBgPPeHCH-WBdn5kHezzsLPGDdtQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 1 Dec 2017 21:59:53 +0100
Message-ID: <CAHmME9qXr5aig-79MjuCbaTUPt2MEh+oAA53gpxOk999CsqKmw@mail.gmail.com>
Subject: Re: WireGuard (Android) Configuration issues, etc.
To: Jordan Johnston <johnstonljordan@gmail.com>
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

Hi Jordan,

Thanks for getting in touch with your detailed email. Responses are
inline below.

> But in the process, I've figured out that wq-quick is NOT
> working properly The wg-quick issue is probably why the
> android WireGuard app isn't working (as I assume it requires wg-quick)... My
> pixel doesn't seem to recognise the wg-quick script being in /system/xbin
> # wg-quick up wg0
> sh: /system/xbin/wg-quick: No such file or directory
> #!/system/xbin/bash
> sh: /system/xbin/wg-quick: Permission denied

Ahhh. wg-quick indeed requires bash, and from what I gather, there
isn't bash on your ROM. You should be able to build that easily from
the AOSP source `mka bash`. This is one of the reasons I first
launched the Android stuff with the local_manifest.xml hack instead of
the standalone tools. I'll have to think about a more general purpose
solution, but for now, I thing the best thing you can do would be to
just add bash. If you're stuck and need help, I can probably build you
a statically linked musl aarch64 bash that will work mostly
everywhere.

Alternatively, maybe there is bash on that phone, but it isn't where I
was expecting. Could you run the commands:

# find / -name bash -or -name env 2>/dev/null

And send me the output?

> That said ~ I'm
> going to have a stab at repackaging the user-space components as a standard
> android flashable zip (as we talked about on XDA, @Jason), start fresh and
> see if I can get it working...

We might wind up wanting that statically compiled bash for the .zip.
Based on your findings above, we can adjust this plan accordingly.
Having the flashable .zip infra seems like a good idea either way.

> All of that aside; I'm wondering if someone could post a working
> config/template for AzireVPN or any other free VPN that supports
> WireGuard???

We don't use this list for commercial providers -- they have their own
private support emails and contact methods -- but I can help you with
the free non-commericial demo server -- demo.wireguard.com.

> (minus any private information, respectfully). I'd just like to
> make sure that I have a working config for WireGuard on Android -> so that
> when I try to test, after re-installing wg-tools ~ that might be one less
> hiccup... I've never used WireGuard, so all very new to me.

Makes sense. It might make the most sense to just head into #wireguard
on Freenode too, where we can troubleshoot basic how-to things in real
time.
>
> PS: @Jason - I'm also going to have a look (later on) and see If i can get
> the WireGuard android app to not "crash on boot" in Oreo ~ using the commits
> for Kernel Aduitor's fixes that I pointed out to you yesterday, when I
> brought up the issue. ttyl

Oh, wonderful! Don't hesitate to send patches to this list for that stuff.

Talk soon,
Jason
