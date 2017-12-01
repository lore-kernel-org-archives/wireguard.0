Return-Path: tbskyd@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f85724f2
 for <wireguard@lists.zx2c4.com>; Fri, 1 Dec 2017 07:38:10 +0000 (UTC)
Received: from mail-wr0-f177.google.com (mail-wr0-f177.google.com
 [209.85.128.177])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 761b11de
 for <wireguard@lists.zx2c4.com>; Fri, 1 Dec 2017 07:38:10 +0000 (UTC)
Received: by mail-wr0-f177.google.com with SMTP id z34so9053851wrz.10
 for <wireguard@lists.zx2c4.com>; Thu, 30 Nov 2017 23:44:24 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHmME9rquEO5r0cMpTgPsLW790QqbN9DLxuETm-6TfxX9ULsVg@mail.gmail.com>
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
From: d tbsky <tbskyd@gmail.com>
Date: Fri, 1 Dec 2017 15:44:22 +0800
Message-ID: <CAC6SzHJotdY8ihSdDPBWoz=k9EvN1rUDPR=yvrkutmTEFX75TQ@mail.gmail.com>
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

2017-11-29 22:49 GMT+08:00 Jason A. Donenfeld <Jason@zx2c4.com>:
> On Wed, Nov 29, 2017 at 3:16 PM, d tbsky <tbskyd@gmail.com> wrote:
>>      sorry I misunderstand you. you mean I modify the script and run
>> in my environment to reveal the problem?
>> ok I will try to do it.
>
> Take what I sent you. Run it. If it breaks, send me the output and
> your kernel. If it doesn't break, mess with it until it breaks, and
> then send it back to me.

Hi jason:

      during test in netns environment, I saw something that I never
saw at real world. the steps below:

1. client try connect to multi-home-server.
2. wait for conntrack session timeout both for client and server.
3. server try connect to client. server will use source ip at step1 to connect.

it means at step1, wireguard not only remember client's ip address,
but also remember self source ip address. even though the source
address didn't show at "wg wg0"  user interface.
is the assumption true? I didn't see this behavior in real world.

Regards,
tbskyd
