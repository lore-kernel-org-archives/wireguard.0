Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 61d53fc4
 for <wireguard@lists.zx2c4.com>;
 Tue, 29 May 2018 12:36:46 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 86c1feac
 for <wireguard@lists.zx2c4.com>;
 Tue, 29 May 2018 12:36:46 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7aecc57c
 for <wireguard@lists.zx2c4.com>;
 Tue, 29 May 2018 12:35:32 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 08e11921
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 29 May 2018 12:35:31 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id b130-v6so12843519oif.12
 for <wireguard@lists.zx2c4.com>; Tue, 29 May 2018 05:38:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9o3M+06Q1NDuhAD-oNwfwxuDU3G8eCwgsn4Gu0jjzZpMg@mail.gmail.com>
References: <CAN-r--kLC4bAG0oAGp0gDO7Q2Ro0X9J5L-HY3sXaRz-zeZDR6Q@mail.gmail.com>
 <CAHmME9ogDQv-TxNz+2jwbw=d4s2Vq1LdZgin4_=dL5D_SRy2_Q@mail.gmail.com>
 <CAN-r--=Of+ca1+otqwZM-q4RrGGfNyqZAEazVsoXDzjvDd5sQQ@mail.gmail.com>
 <CAHmME9o3M+06Q1NDuhAD-oNwfwxuDU3G8eCwgsn4Gu0jjzZpMg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 29 May 2018 14:38:42 +0200
Message-ID: <CAHmME9oyNvnU4-2tZ9u7zp21_HigWH5_MFbu=Gb=jPe48kxpLA@mail.gmail.com>
Subject: Re: Wireguard & hw flow offload incompatibility
To: Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="UTF-8"
Cc: Jaap Buurman <jaapbuurman@gmail.com>, openwrt-devel@lists.openwrt.org,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey Felix,

Per the below thread, I've been digging around trying to see what's
going on. Apparently packets are hitting a virtual network interface's
ndo_start_xmit with no dst when hardware offloading enabled. I assume
that the path is something along the lines of a packet coming in on
one of these hardware accelerated NICs and then being forwarded to the
wireguard interface, which expects the dst. I found your
ndo_flow_offload patchset, and I suspect that might have something to
do with this. Any insights on dsts disappearing in skbs?

Thanks,
Jason

On Tue, May 29, 2018 at 2:14 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote=
:
> Hi Jaap,
>
> Thanks for the clarification. I downloaded the binary for that
> hardware and triaged where the bug occurs [1]. This patch [2] should
> probably fix it, but I'm rather surprised to see situations in which a
> skb is missing a dst entry in ndo_start_xmit; this might point to
> deeper kernel bugs in this hardware offloading feature, or some
> alternative mechanism for routing being used when hardware offloading
> is on. So I'm hesitant to merge this just yet, because perhaps this is
> better handled in the compat layer, if it is in fact vendor silliness.
> Do you have a link to the kernel source of these boxes? I'd like to
> see what exactly the vendor is doing. And if you could try [2] and see
> if that still crashes, this would be most appreciated.
>
> Thanks,
> Jason
>
> [1] https://data.zx2c4.com/openwrt-mips-offloading-bug.png
> [2] https://=D7=90.cc/Am4tZ0n8
>
> On Tue, May 29, 2018 at 1:59 PM, Jaap Buurman <jaapbuurman@gmail.com> wro=
te:
>> Dear Jason,
>>
>> This isn't a regression. This is simply the first time this has been
>> observed. (hw) flow offload is a new feature, and hence this
>> interaction with wireguard is also new.
>>
>> Yours sincerely,
>>
>> Jaap
>>
>> On Tue, May 29, 2018 at 1:54 PM, Jason A. Donenfeld <Jason@zx2c4.com> wr=
ote:
>>> Hi Jaap,
>>>
>>> Thanks for the report. Is this a _new_ bug in _new_ version of
>>> WireGuard that wasn't there before. Or is this the first time you've
>>> observed this?
>>>
>>> Thanks,
>>> Jason
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Original Mail =3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>
>> Dear all,
>>
>> When running a wireguard interface on the latest Lede master branch,
>> the router will crash as soon as traffic hits the wireguard interface
>> while (hw) flow offloading is enabled. I am not sure whether this is a
>> bug with wireguard, hw flow offload, both or neither, so I am
>> reporting the bug to both mailinglists. A more detailed description
>> plus a properly formatted stack trace can be found on Lede's bug
>> tracker: https://bugs.openwrt.org/index.php?do=3Ddetails&task_id=3D1539
>>
>> If you require any additional information, please do not hesitate to
>> contact me. Thank you very much in advance.
>>
>> Yours sincerely,
>>
>> Jaap Buurman
