Return-Path: tbskyd@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id abdab69c
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Nov 2017 10:59:02 +0000 (UTC)
Received: from mail-wr0-f172.google.com (mail-wr0-f172.google.com
 [209.85.128.172])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ce31570c
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Nov 2017 10:59:02 +0000 (UTC)
Received: by mail-wr0-f172.google.com with SMTP id z18so2991764wrb.8
 for <wireguard@lists.zx2c4.com>; Wed, 29 Nov 2017 03:05:01 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHmME9qeUw5VsaEoAG=i0=5LfOq4aPGi2KjDHKDjAPorXKJgbA@mail.gmail.com>
References: <CAC6SzH+Q-1SRVXOoScGhXWraOLdp9_Rud6cMbQ95a51r=eRWTw@mail.gmail.com>
 <CAHmME9piZhSukf55XY1Un2hO0TZyfHRh+afU8kk6R6yoSA5pQA@mail.gmail.com>
 <CAC6SzHJZj5BOMek4i=1ykepHSzHRDGKYTj-Cfa4veRbsVuj2WA@mail.gmail.com>
 <CAHmME9qeUw5VsaEoAG=i0=5LfOq4aPGi2KjDHKDjAPorXKJgbA@mail.gmail.com>
From: d tbsky <tbskyd@gmail.com>
Date: Wed, 29 Nov 2017 19:05:00 +0800
Message-ID: <CAC6SzHJd8DzMBhuoGG=c8gtKzKd1zFs6wndKF0mEZDQW0aB6aQ@mail.gmail.com>
Subject: Re: multi-home difficulty
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
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

2017-11-23 7:35 GMT+08:00 Jason A. Donenfeld <Jason@zx2c4.com>:
> On Tue, Nov 21, 2017 at 3:35 PM, d tbsky <tbskyd@gmail.com> wrote:
>> thanks for the quick reply. my wireguard configuration is in the
>> previous mail, so I think the linux firewall part is what you want.
>
> Right. So if you can give me minimal instructions on how to set up a
> box that exhibits the buggy behavior you're seeing, I can try to fix
> it.
>
> Jason

Hi jason:

    are you still interested with the problem? today I try to use
multi-home client to connect server. and I found not only server, but
client suffered.
the problem seems at rhel linux kernel side, but I am not sure. since
wireguard was the only victim I met.

   I can create a virtual machine with ssh access  if you want to test
these strange problems.

  btw, is it possible that wireguard bind to specific ip in the
future? I think it will solve all the problems, but maybe you have
technical concerns.

  thanks a lot for your help.

Regards,
tbskyd
