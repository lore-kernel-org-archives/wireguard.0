Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c42f69e4
 for <wireguard@lists.zx2c4.com>; Sat, 2 Dec 2017 00:11:43 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 215f72b6
 for <wireguard@lists.zx2c4.com>; Sat, 2 Dec 2017 00:11:43 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5c0cfa53
 for <wireguard@lists.zx2c4.com>; Sat, 2 Dec 2017 00:11:43 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ee13351e
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 2 Dec 2017 00:11:43 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id 184so8324603oii.2
 for <wireguard@lists.zx2c4.com>; Fri, 01 Dec 2017 16:18:02 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAKgnZ5zFXRVMnyG1MCGuNXkVmH3Lnp_oWK2KkMikoeWpUK+1wQ@mail.gmail.com>
References: <CAKgnZ5wDEwMXA6+WbxrmQocBgPPeHCH-WBdn5kHezzsLPGDdtQ@mail.gmail.com>
 <CAHmME9qXr5aig-79MjuCbaTUPt2MEh+oAA53gpxOk999CsqKmw@mail.gmail.com>
 <CAHmME9o9pQdRdQ=7MqLYe1Yg8vxZNzAHd0ouRSq1Pwb9YYaHdg@mail.gmail.com>
 <CAKgnZ5zFXRVMnyG1MCGuNXkVmH3Lnp_oWK2KkMikoeWpUK+1wQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 2 Dec 2017 01:18:01 +0100
Message-ID: <CAHmME9pZQ50X53W5KhGig05E=HeaSyks0NoDx0mK4hMJg1KEQw@mail.gmail.com>
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

On Sat, Dec 2, 2017 at 1:00 AM, Jordan Johnston
<johnstonljordan@gmail.com> wrote:
> I'd like to have a stab at building Bash. But I don't have AOSP on my
> Archlinux box (I only build the kernel, plus apps in android studio).
> So that may be an issue, but I can have a look at how AOSP builds bash (so
> far, I can't even find the source code for AOSP/bash online though).
>
> however, I do like your idea; you could save me a step and provide me with
> bash, if it's not too much trouble for you. Although, shouldn't bash be
> built against bionic libc not musl?

Beware of accepting strange binaries from strange people on strange
mailing lists of strange projects, but here's a statically compiled
bash 4.4.12 for aarch64:

https://data.zx2c4.com/bash-4.4.12-aarch64-static-musl-1.1.16.tar.xz
