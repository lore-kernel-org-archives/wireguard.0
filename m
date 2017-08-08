Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0d2c5819
 for <wireguard@lists.zx2c4.com>; Tue, 8 Aug 2017 22:59:55 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4a21c1bc
 for <wireguard@lists.zx2c4.com>; Tue, 8 Aug 2017 22:59:55 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5a251c3d
 for <wireguard@lists.zx2c4.com>; Tue, 8 Aug 2017 23:18:59 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 1e130c14
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 8 Aug 2017 23:18:58 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id g71so19277159ioe.5
 for <wireguard@lists.zx2c4.com>; Tue, 08 Aug 2017 16:21:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAJkVDg1O8SXWtR1cazOMQX6U-sxRVh57MNfTdNGBLpCUdOPnog@mail.gmail.com>
References: <CAJkVDg1O8SXWtR1cazOMQX6U-sxRVh57MNfTdNGBLpCUdOPnog@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 9 Aug 2017 01:21:47 +0200
Message-ID: <CAHmME9pxbEH67swY+k-2bSar1e95rfMCQoxkzYAzSfbsA8JGcw@mail.gmail.com>
Subject: Re: trouble installing on Fedora and CentOS
To: Joe Doss <joe@solidadmin.com>
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

Hi Joe,

Could you look into Adam's issue with your package?

Adam,

Can you provide the full output of whatever is behind "warning:
%post(wireguard-dkms-1:0.0.20170629-2.fc25.noarch) scriptlet failed,
exit status 1"? Is there a debug switch to get more verbose logs?

Why not install this directly from copr? Additionally, why are you
installing 0629? That package is very old.

https://copr.fedorainfracloud.org/coprs/jdoss/wireguard/

Jason



On Tue, Aug 8, 2017 at 9:58 PM, adam souzis <adam@souzis.com> wrote:
>
> I've been impressed with Wireguard, its design has helped simplify the im=
plementation of a distributed sandbox app I am building quite a bit. But I =
have had mixed results getting it running on different distributions.
>
> The good news is that I can report that I was able to build, install and =
run Wireguard on CoreOs.
>
> The bad news is I was unable to get Wireguard working on either CentOS 7,=
 Fedora 26 or Fedora 25 (running these on AWS), it doesn't appear to be ins=
talling the kernel module properly.
>
> Here's what I see when install the RPM:
>
> + dkms add -m wireguard -v 0.0.20170629 -q --rpm_safe_upgrade
>
> + dkms build -m wireguard -v 0.0.20170629 -q
>
> + dkms install -m wireguard -v 0.0.20170629 -q
>
> D: %post(wireguard-dkms-1:0.0.20170629-2.fc25.noarch): waitpid(14760) rc =
14760 status 100
>
> warning: %post(wireguard-dkms-1:0.0.20170629-2.fc25.noarch) scriptlet fai=
led, exit status 1
>
> Non-fatal POSTIN scriptlet failure in rpm package wireguard-dkms
>
>
> Looks like it might have worked:
>
> [fedora@ip-1~]$ sudo dkms status
>
> wireguard, 0.0.20170629: added
>
> BUT:
>
> [fedora@ip-1 ~]$ sudo ip link add dev wg0 type wireguard
>
> RTNETLINK answers: Operation not supported
>
> I tried this on the latest version of the RPM and this earlier version. I=
 also tried compiling it from source on Fedora but make failed early on.
>
> I disabled selinux, verified the kernel config is good and manually enabl=
ed udp_tunnel for good measure. Any other suggestions? (I did see an earlie=
r post here recommending using kernel-ml for centos 7 but I need to use the=
 Atomic Host variant and swapping out the kernel on that is non-trivial. I =
was hoping using a recent Fedora would solve the kernel compatibility issue=
s.)
>
> thank you!
> Adam
> =E1=90=A7
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>
