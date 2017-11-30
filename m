Return-Path: tbskyd@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fa5e196a
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Nov 2017 06:24:40 +0000 (UTC)
Received: from mail-wr0-f171.google.com (mail-wr0-f171.google.com
 [209.85.128.171])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c3d4eb2e
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Nov 2017 06:24:40 +0000 (UTC)
Received: by mail-wr0-f171.google.com with SMTP id k61so5542912wrc.4
 for <wireguard@lists.zx2c4.com>; Wed, 29 Nov 2017 22:30:46 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAC6SzH+AmT2zfnXBznmY=wMyO7EyHF9DD8BX=2Vpm-qKWnuGzA@mail.gmail.com>
References: <CAC6SzH+Q-1SRVXOoScGhXWraOLdp9_Rud6cMbQ95a51r=eRWTw@mail.gmail.com>
 <CAHmME9piZhSukf55XY1Un2hO0TZyfHRh+afU8kk6R6yoSA5pQA@mail.gmail.com>
 <CAC6SzHJZj5BOMek4i=1ykepHSzHRDGKYTj-Cfa4veRbsVuj2WA@mail.gmail.com>
 <CAHmME9qeUw5VsaEoAG=i0=5LfOq4aPGi2KjDHKDjAPorXKJgbA@mail.gmail.com>
 <CAC6SzHJd8DzMBhuoGG=c8gtKzKd1zFs6wndKF0mEZDQW0aB6aQ@mail.gmail.com>
 <20171129135124.GA29970@zx2c4.com>
 <CAC6SzH+yoUtuim6oHypPXmef-oh2rQZTdQXDuN5YAGteXHN7rQ@mail.gmail.com>
 <CAHmME9pjU_5AncEkqYbnSUtB-h5h1nhrD5FXgkBia-sj=8jKrA@mail.gmail.com>
 <CAC6SzHJ8Rd3G7KWng5JxhXV4k2OE+uf5XKQNF3k6bzsDP=wUWA@mail.gmail.com>
 <CAHmME9rquEO5r0cMpTgPsLW790QqbN9DLxuETm-6TfxX9ULsVg@mail.gmail.com>
 <CAC6SzHJJvFUkY-+DWXBP3D86KXtEv0U+vY4VN3ce0v=Fpk4T4g@mail.gmail.com>
 <CAC6SzH+AmT2zfnXBznmY=wMyO7EyHF9DD8BX=2Vpm-qKWnuGzA@mail.gmail.com>
From: d tbsky <tbskyd@gmail.com>
Date: Thu, 30 Nov 2017 14:30:44 +0800
Message-ID: <CAC6SzHLS6udb258FJtky9L5+JhHWs2pRrGePdDRdQb3hCa0Csw@mail.gmail.com>
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

2017-11-30 14:22 GMT+08:00 d tbsky <tbskyd@gmail.com>:
> 2017-11-30 14:15 GMT+08:00 d tbsky <tbskyd@gmail.com>:
>> 2017-11-29 22:49 GMT+08:00 Jason A. Donenfeld <Jason@zx2c4.com>:
>>> On Wed, Nov 29, 2017 at 3:16 PM, d tbsky <tbskyd@gmail.com> wrote:
>>>>      sorry I misunderstand you. you mean I modify the script and run
>>>> in my environment to reveal the problem?
>>>> ok I will try to do it.
>>>
>>> Take what I sent you. Run it. If it breaks, send me the output and
>>> your kernel. If it doesn't break, mess with it until it breaks, and
>>> then send it back to me.
>>
>> Hi jason:
>>
>>  "uname -a" result:
>>
>>  Linux localhost.localdomain 3.10.0-693.5.2.el7.x86_64 #1 SMP Thu Oct
>> 19 10:13:14 CDT 2017 x86_64 x86_64 x86_64 GNU/Linux
>>
>>  your original script runs fine under my environment.
>>  I add  three 3 lines before "ip1 link add veth1"  to reveal the problem:
>>
>> ip1 link add dummy0 type dummy
>> ip1 addr add 10.0.0.10/24 dev dummy0
>> ip1 link set dummy0 up
>>
>
> sorry my fault. incorrect copy paste to email break the script. script
> as attachment.
>
> Regards,
> tbskyd

Hi jason:

   sorry the routing is not correct under the situation. I will add
more rules to see if I can make a normal environment to reveal the
problem.
