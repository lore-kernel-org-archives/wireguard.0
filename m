Return-Path: steffan@karger.me
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2f197bbf
 for <wireguard@lists.zx2c4.com>; Tue, 6 Mar 2018 12:23:38 +0000 (UTC)
Received: from mail-qt0-f176.google.com (mail-qt0-f176.google.com
 [209.85.216.176])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 97adb50f
 for <wireguard@lists.zx2c4.com>; Tue, 6 Mar 2018 12:23:37 +0000 (UTC)
Received: by mail-qt0-f176.google.com with SMTP id c7so24305560qtn.3
 for <wireguard@lists.zx2c4.com>; Tue, 06 Mar 2018 04:32:59 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHT-BTRX+bgN8m7V95QqnKOD8g6vp3-+h_JozG5motqS0MLiZQ@mail.gmail.com>
References: <CAHT-BTRX+bgN8m7V95QqnKOD8g6vp3-+h_JozG5motqS0MLiZQ@mail.gmail.com>
From: Steffan Karger <steffan@karger.me>
Date: Tue, 6 Mar 2018 13:32:39 +0100
Message-ID: <CAA1Abx+GY1ioJ8Hnwp7Fezx6bqmukv5sw32owFcG2-zGSuhMAg@mail.gmail.com>
Subject: Re: Tunsafe Windows client for wireguard (not opensource yet they say
To: Ludvig Strigeus <strigeus@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Ludvig,

On 6 March 2018 at 02:44, Ludvig Strigeus <strigeus@gmail.com> wrote:
> Jason A. Donenfeld wrote:
>> This isn't the source code of tunsafe. This is the source code of the >
>> OpenVPN Windows tuntap kernel driver, which has been hacked up in > various
>> ways for tunsafe. That's a super scary driver, by the way.
>
> Incorrect. The driver files are not modified at all. They still
> carry OpenVPN's codesigning signature. You can see this on the
> driver install prompt:
> https://tunsafe.com/img/quickstart-driver-confirm.png
>
> I agree that the driver is scary, I think I even found some
> potential OOB memory accesses in it from a quick glance. However,
> this is the best driver the community has at this point in time,
> and even your own userspace implementations of WG use it. I'd
> be happy to improve it but then I need an expensive driver
> codesigning certificate in order to load it into the kernel.

Please report any issues you find in the tap-windows driver to
security@openvpn.net, so those can be fixed and many more people can
profit from your work.

In the same train of thought: you don't need a code signing
certificate to improve the driver, you are more than welcome to work
with the openvpn community to improve it (I expect, I don't actually
work on tap-windows myself). Just send your patches to
openvpn-devel@lists.sourceforge.net, or discuss your plans beforehand
on the list if you want confirmation that your plans are okay with the
community.  Then wait for the next OpenVPN release to get your signed
binary :)

-Steffan
