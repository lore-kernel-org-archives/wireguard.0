Return-Path: stefanha@gmail.com
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
 [209.85.223.173])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a7062ca2
 for <wireguard@lists.zx2c4.com>; Wed, 7 Dec 2016 08:55:36 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id a124so700445382ioe.2
 for <wireguard@lists.zx2c4.com>; Wed, 07 Dec 2016 01:00:59 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHmME9qm+5xgaVZ+yU7OfvyiTu0dyvgyc6uoARBqA76m0Kih-Q@mail.gmail.com>
References: <CAJSP0QUDhKYC41j0WxJQEX06-szCr8oPWsP3BK75LNvSYviXHA@mail.gmail.com>
 <CAHmME9qE_jSXaUvCw8dCpz4zK8ukEdOVvc=9HhPmxTDTTeLk2A@mail.gmail.com>
 <CAHmME9qm+5xgaVZ+yU7OfvyiTu0dyvgyc6uoARBqA76m0Kih-Q@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 7 Dec 2016 09:00:58 +0000
Message-ID: <CAJSP0QU_oP+oN-uedEZSrw6Rh1mgeNtwbr64i8-HcLiafUMT0Q@mail.gmail.com>
Subject: Re: [WireGuard] Wireguard disk image for QEMU Advent Calendar 2016?
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Tue, Dec 6, 2016 at 10:01 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> Following up, if you'd like to include this in your advent calendar,
> attached is a kernel built from the test suite generator. You can run
> it like this:
>
> qemu-system-x86_64 \
>         -nodefaults \
>         -nographic \
>         -machine q35,accel=kvm \
>         -cpu host \
>         -smp 2 \
>         -m 96M \
>         -object rng-random,id=rng0,filename=/dev/urandom \
>         -device virtio-rng-pci,rng=rng0 \
>         -device virtio-serial,max_ports=2 \
>         -chardev stdio,id=stdio \
>         -device virtconsole,chardev=stdio \
>         -chardev file,id=status,path=/tmp/wireguard-qemu-test-result \
>         -device virtserialport,chardev=status \
>         -monitor none \
>         -kernel ./wireguard-test-4f257956-d81f-43f3-8fd8-1475360f58b8.kernel \
>         -append "console=hvc0"
>
> It should "just work".

Perfect, thanks!  I will submit it to the calendar with credit to you.

Press coverage and discussion is now starting to pick up:
http://www.theregister.co.uk/2016/12/06/2016_qemu_advent_calendar/
https://news.ycombinator.com/item?id=13118291

Thanks!

Stefan
