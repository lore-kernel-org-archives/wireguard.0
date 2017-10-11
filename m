Return-Path: opensource@vdorst.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f279c8fb
 for <wireguard@lists.zx2c4.com>;
 Wed, 11 Oct 2017 13:00:34 +0000 (UTC)
Received: from smtp02.bhosted.nl (smtp02.bhosted.nl [94.124.121.13])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6764010b
 for <wireguard@lists.zx2c4.com>;
 Wed, 11 Oct 2017 13:00:34 +0000 (UTC)
Date: Wed, 11 Oct 2017 13:30:24 +0000
Message-ID: <20171011133024.Horde.Lj1Pe-ln1REown-ec1q9f92@www.vdorst.com>
From: =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: possible irq lock inversion dependency detected
References: <20171010185133.Horde.g9yJlkVpxW5Gk-qJumftGF_@www.vdorst.com>
 <CAHmME9rtGod=Jw-vGKnUfPwDh+16zP1MjNr57+8k5PUVMhxtYA@mail.gmail.com>
 <20171011124935.Horde.WT_JO7z6wRK6_tlxjtJxnSr@www.vdorst.com>
 <CAHmME9pSeLf7WuWj4mB7qhTstTPEX7cTcwyGL67F8CDSbqjEjw@mail.gmail.com>
In-Reply-To: <CAHmME9pSeLf7WuWj4mB7qhTstTPEX7cTcwyGL67F8CDSbqjEjw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Quoting "Jason A. Donenfeld" <Jason@zx2c4.com>:

> Hi René,
>
> I'm having trouble parsing your message. You wrote:
>
>> So I am not sure if you patch works or not.
>> Because it was not that easy to reproduce the last one.
>
> Do you mean to imply that you could NOT reproduce it with my patch?
> But that you could reproduce it WITHOUT the patch?
>
> Jason

I was trying to reproduce the bug before the patch.
I could not reproduce the first one. Only hitting the second one 3 times.

After the patch I could not reproduce any of them.

Greats,

René
