Return-Path: tbskyd@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 92e6c4dd
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Nov 2017 14:03:00 +0000 (UTC)
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c59475a9
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Nov 2017 14:03:00 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id 9so6502700wme.4
 for <wireguard@lists.zx2c4.com>; Wed, 29 Nov 2017 06:09:00 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171129135124.GA29970@zx2c4.com>
References: <CAC6SzH+Q-1SRVXOoScGhXWraOLdp9_Rud6cMbQ95a51r=eRWTw@mail.gmail.com>
 <CAHmME9piZhSukf55XY1Un2hO0TZyfHRh+afU8kk6R6yoSA5pQA@mail.gmail.com>
 <CAC6SzHJZj5BOMek4i=1ykepHSzHRDGKYTj-Cfa4veRbsVuj2WA@mail.gmail.com>
 <CAHmME9qeUw5VsaEoAG=i0=5LfOq4aPGi2KjDHKDjAPorXKJgbA@mail.gmail.com>
 <CAC6SzHJd8DzMBhuoGG=c8gtKzKd1zFs6wndKF0mEZDQW0aB6aQ@mail.gmail.com>
 <20171129135124.GA29970@zx2c4.com>
From: d tbsky <tbskyd@gmail.com>
Date: Wed, 29 Nov 2017 22:08:59 +0800
Message-ID: <CAC6SzH+yoUtuim6oHypPXmef-oh2rQZTdQXDuN5YAGteXHN7rQ@mail.gmail.com>
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

2017-11-29 21:51 GMT+08:00 Jason A. Donenfeld <Jason@zx2c4.com>:
> Hi,
>
> I made a small script in order to reproduce this issue, but I was not
> able to replicate the results. Would you spend some time with the below
> code tweaking it so that it exhibits the broken behavior you're seeing?
>
> Jason

Hi jason:

    may I ask what kernel/distribution are you using? since under my
testing, just add an unused nic shows the problem, so I think it's
some kind of racing or conflict. or simply RHEL7.4 kernel bug maybe.
I don't know how to modify the script to reveal the problem in your
environment. I will try to install mainline kernel to see if the
problem is the same. or I can build an RHEL 7.4 vm  and let you ssh in
for testing  if you don' t mind.

Regards,
tbskyd
