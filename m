Return-Path: jaapbuurman@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3d224daa
 for <wireguard@lists.zx2c4.com>;
 Tue, 29 May 2018 13:24:38 +0000 (UTC)
Received: from mail-io0-x243.google.com (mail-io0-x243.google.com
 [IPv6:2607:f8b0:4001:c06::243])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6d08ba1f
 for <wireguard@lists.zx2c4.com>;
 Tue, 29 May 2018 13:24:37 +0000 (UTC)
Received: by mail-io0-x243.google.com with SMTP id o185-v6so17569291iod.0
 for <wireguard@lists.zx2c4.com>; Tue, 29 May 2018 06:26:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9oyNvnU4-2tZ9u7zp21_HigWH5_MFbu=Gb=jPe48kxpLA@mail.gmail.com>
References: <CAN-r--kLC4bAG0oAGp0gDO7Q2Ro0X9J5L-HY3sXaRz-zeZDR6Q@mail.gmail.com>
 <CAHmME9ogDQv-TxNz+2jwbw=d4s2Vq1LdZgin4_=dL5D_SRy2_Q@mail.gmail.com>
 <CAN-r--=Of+ca1+otqwZM-q4RrGGfNyqZAEazVsoXDzjvDd5sQQ@mail.gmail.com>
 <CAHmME9o3M+06Q1NDuhAD-oNwfwxuDU3G8eCwgsn4Gu0jjzZpMg@mail.gmail.com>
 <CAHmME9oyNvnU4-2tZ9u7zp21_HigWH5_MFbu=Gb=jPe48kxpLA@mail.gmail.com>
From: Jaap Buurman <jaapbuurman@gmail.com>
Date: Tue, 29 May 2018 15:26:34 +0200
Message-ID: <CAN-r--mgDxq7wo9Uc-4DKcK97v_vbbmyQqhcA1Lxg8rWhUzG+Q@mail.gmail.com>
Subject: Re: Wireguard & hw flow offload incompatibility
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Cc: OpenWrt Development List <openwrt-devel@lists.openwrt.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Felix Fietkau <nbd@nbd.name>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Dear Jason,

The initial technical explanation unfortunately went over my head,
since I am not that technical myself. But I will do my best to provide
the required information. First of all, sorry for the confusion that I
may have caused, but this happens with both the hardware version of
the flow offload implementation and the software version, so it
doesn't seem to be caused by any vendor specific (hardware) logic. So
it is probably easier to focus on the software version for now. Also,
in case that wasn't fully clear, both the flow offloading feature and
the wireguard interface are both running on the router itself.

What exactly do you mean with the kernel source of these boxes? As far
as I understand, Lede/OpenWRT uses the upstream 4.14 kernel in this
build (4.14.43 in the one I am running atm) with Lede/OpenWRT specific
patches. The patches that enable flow offloading support for the 4.14
kernel can be found in these 2 folders:
https://github.com/openwrt/openwrt/tree/openwrt-18.06/target/linux/generic/=
backport-4.14
https://github.com/openwrt/openwrt/tree/openwrt-18.06/target/linux/generic/=
pending-4.14

One important thing is that the upstream flow offloading code uses
nftables, while Lede/OpenWRT uses iptables. Hence flow offload support
has been backported to iptables, which also might be a contribution to
this bug.

I'm not even sure what dst entries are exactly, but I found one patch
that is supposed to fix dst entries. Perhaps it is incomplete or
contains a bug?:
https://github.com/openwrt/openwrt/commit/c89e338fe68fd5af61b80ef37c55a6577=
21c6542

I will try to cross-compile wireguard with your suggested patch
tomorrow or the day after tomorrow depending on my time schedule. I
will report back whether it solves this issue. Thank you very much.

Yours sincerely,

Jaap Buurman

On Tue, May 29, 2018 at 2:38 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote=
:
> Hey Felix,
>
> Per the below thread, I've been digging around trying to see what's
> going on. Apparently packets are hitting a virtual network interface's
> ndo_start_xmit with no dst when hardware offloading enabled. I assume
> that the path is something along the lines of a packet coming in on
> one of these hardware accelerated NICs and then being forwarded to the
> wireguard interface, which expects the dst. I found your
> ndo_flow_offload patchset, and I suspect that might have something to
> do with this. Any insights on dsts disappearing in skbs?
>
> Thanks,
> Jason
>
> On Tue, May 29, 2018 at 2:14 PM, Jason A. Donenfeld <Jason@zx2c4.com> wro=
te:
>> Hi Jaap,
>>
>> Thanks for the clarification. I downloaded the binary for that
>> hardware and triaged where the bug occurs [1]. This patch [2] should
>> probably fix it, but I'm rather surprised to see situations in which a
>> skb is missing a dst entry in ndo_start_xmit; this might point to
>> deeper kernel bugs in this hardware offloading feature, or some
>> alternative mechanism for routing being used when hardware offloading
>> is on. So I'm hesitant to merge this just yet, because perhaps this is
>> better handled in the compat layer, if it is in fact vendor silliness.
>> Do you have a link to the kernel source of these boxes? I'd like to
>> see what exactly the vendor is doing. And if you could try [2] and see
>> if that still crashes, this would be most appreciated.
>>
>> Thanks,
>> Jason
>>
>> [1] https://data.zx2c4.com/openwrt-mips-offloading-bug.png
>> [2] https://=D7=90.cc/Am4tZ0n8
>>
>> On Tue, May 29, 2018 at 1:59 PM, Jaap Buurman <jaapbuurman@gmail.com> wr=
ote:
>>> Dear Jason,
>>>
>>> This isn't a regression. This is simply the first time this has been
>>> observed. (hw) flow offload is a new feature, and hence this
>>> interaction with wireguard is also new.
>>>
>>> Yours sincerely,
>>>
>>> Jaap
>>>
>>> On Tue, May 29, 2018 at 1:54 PM, Jason A. Donenfeld <Jason@zx2c4.com> w=
rote:
>>>> Hi Jaap,
>>>>
>>>> Thanks for the report. Is this a _new_ bug in _new_ version of
>>>> WireGuard that wasn't there before. Or is this the first time you've
>>>> observed this?
>>>>
>>>> Thanks,
>>>> Jason
>>
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Original Mail =3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>>
>>> Dear all,
>>>
>>> When running a wireguard interface on the latest Lede master branch,
>>> the router will crash as soon as traffic hits the wireguard interface
>>> while (hw) flow offloading is enabled. I am not sure whether this is a
>>> bug with wireguard, hw flow offload, both or neither, so I am
>>> reporting the bug to both mailinglists. A more detailed description
>>> plus a properly formatted stack trace can be found on Lede's bug
>>> tracker: https://bugs.openwrt.org/index.php?do=3Ddetails&task_id=3D1539
>>>
>>> If you require any additional information, please do not hesitate to
>>> contact me. Thank you very much in advance.
>>>
>>> Yours sincerely,
>>>
>>> Jaap Buurman
