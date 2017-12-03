Return-Path: tbskyd@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fd7657e9
 for <wireguard@lists.zx2c4.com>; Sun, 3 Dec 2017 17:39:19 +0000 (UTC)
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3390149d
 for <wireguard@lists.zx2c4.com>; Sun, 3 Dec 2017 17:39:18 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id f9so10667808wmh.0
 for <wireguard@lists.zx2c4.com>; Sun, 03 Dec 2017 09:45:51 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAC6SzHJotdY8ihSdDPBWoz=k9EvN1rUDPR=yvrkutmTEFX75TQ@mail.gmail.com>
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
 <CAC6SzHJotdY8ihSdDPBWoz=k9EvN1rUDPR=yvrkutmTEFX75TQ@mail.gmail.com>
From: d tbsky <tbskyd@gmail.com>
Date: Mon, 4 Dec 2017 01:45:50 +0800
Message-ID: <CAC6SzHKGuD9k9Dm3K-1ysW__ny+UH6P3_FHJ+XMNhErAjjNjAg@mail.gmail.com>
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

2017-12-01 15:44 GMT+08:00 d tbsky <tbskyd@gmail.com>:
> 2017-11-29 22:49 GMT+08:00 Jason A. Donenfeld <Jason@zx2c4.com>:
>> On Wed, Nov 29, 2017 at 3:16 PM, d tbsky <tbskyd@gmail.com> wrote:
>>>      sorry I misunderstand you. you mean I modify the script and run
>>> in my environment to reveal the problem?
>>> ok I will try to do it.
>>
>> Take what I sent you. Run it. If it breaks, send me the output and
>> your kernel. If it doesn't break, mess with it until it breaks, and
>> then send it back to me.

Hi Jason:

     sorry for bothering your again. I still can not find the key
point. my testing environment is  rhel 7.4,
I have  tried kernel 3.10,  4.4,  4.14. wireguard 20171111 and 20171127.

I have three things in mind.

1. when wireguard communication established, it will remember self
source ip(although "wg wg0" didn't show) forever until changed next
time. I don't know if the assumption true, could you tell me? I don't
know if this is wireguard feature or netns feature.

2. I build three netns environment, to emulate multi-home-client,
multi-home-server, and a router between client/server. wireguard works
perfect under netns environment.

3. in real world the situation is strange. as I said last time, build
a simple vm with two nic(in the same host bridge)  will reveal the
problem. my vm looks like below:

>ip addr show

1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast
state UP qlen 1000
    link/ether 52:54:00:ff:29:75 brd ff:ff:ff:ff:ff:ff
3: eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast
state UP qlen 1000
    link/ether 52:54:00:31:d3:1a brd ff:ff:ff:ff:ff:ff
    inet 10.99.1.99/24 scope global eth1
       valid_lft forever preferred_lft forever
    inet 10.99.1.100/24 scope global secondary eth1
       valid_lft forever preferred_lft forever

it is the most simple config I could find to reveal the problem.
situation below won't show any problem:
1. single nic
2. two nic but ip bound to first nic
3. two nic but first nic state is "down", not "up".

the problem is the same under kernel 3.10, 4.4, 4.14. when client
connect to server ip "10.99.1.100", server will reply with ip
"10.99.1.99". it is really a puzzle to me. but maybe you can see why
immediately if you have the environment.

thanks a lot for your patience.

Regards,
tbskyd
