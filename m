Return-Path: tbskyd@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 062be3d1
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 14:30:23 +0000 (UTC)
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3baf7aba
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 14:30:23 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id b189so3858579wmd.0
 for <wireguard@lists.zx2c4.com>; Tue, 21 Nov 2017 06:35:23 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHmME9piZhSukf55XY1Un2hO0TZyfHRh+afU8kk6R6yoSA5pQA@mail.gmail.com>
References: <CAC6SzH+Q-1SRVXOoScGhXWraOLdp9_Rud6cMbQ95a51r=eRWTw@mail.gmail.com>
 <CAHmME9piZhSukf55XY1Un2hO0TZyfHRh+afU8kk6R6yoSA5pQA@mail.gmail.com>
From: d tbsky <tbskyd@gmail.com>
Date: Tue, 21 Nov 2017 22:35:22 +0800
Message-ID: <CAC6SzHJZj5BOMek4i=1ykepHSzHRDGKYTj-Cfa4veRbsVuj2WA@mail.gmail.com>
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

2017-11-21 22:15 GMT+08:00 Jason A. Donenfeld <Jason@zx2c4.com>:
> On Tue, Nov 21, 2017 at 2:21 PM, d tbsky <tbskyd@gmail.com> wrote:
>> so at first client  2.2.2.2:51820 connect to server 1.1.1.1:51820
>> but then server use 172.18.1.254(lan ip address) to reply and 51820
>> port is nat to 1085 so the communication is broken.
>
> The server should use 1.1.1.1 to reply. If it's not, that's a bug that
> I should fix. Can you give me a minimal configuration for reproducing
> this setup, so that I can fix whatever issue is occurring?
>
> Thanks,
> Jason

thanks for the quick reply. my wireguard configuration is in the
previous mail, so I think the linux firewall part is what you want.
there is only one thing special in our firewall config. normally when
you use "ip route get 8.8.8.8", you will get a wan ip address through
main routing table(eg 1.1.1.1 in above example) . but since we have
multiple routing tables and there is little entries in main routing
table,  "ip route get 8.8.8.8" will get 172.18.1.254 (lan ip address)
in our firewall.

I don't know how wireguard decide its replying ip address, but it
seems wrong under the situation. maybe it decide it through main
routing table?

our linux firewall environment is RHEL 7.4 and wireguard version is
0.0.20171111 from official repository.

thanks a lot  for help!

Regards,
tbskyd
