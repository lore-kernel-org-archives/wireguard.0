Return-Path: riccardo@rcrdbrt.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 65efb9ac
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Apr 2018 11:45:52 +0000 (UTC)
Received: from mail.rcrdbrt.com (rcrdbrt.com [45.32.6.71])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 62227cbf
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Apr 2018 11:45:52 +0000 (UTC)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Date: Wed, 25 Apr 2018 13:46:39 +0200
From: Riccardo Berto <riccardo@rcrdbrt.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Troubleshooting WireGuard connections
In-Reply-To: <4135c3da139c0ca98fafc5fd20d11b18@rcrdbrt.com>
References: <628776a245ad4895630fd727c80e8bf1@rcrdbrt.com>
 <CAHmME9rFZMXcjZgFQBrZHDCbqmYT+MdBEJmS6f6=5=F-7nrJBA@mail.gmail.com>
 <33d0fd1f4c60919b98b50e2b9d04fe78@rcrdbrt.com>
 <2c17e7ba2590353afa04fc1619d726c2@rcrdbrt.com>
 <CAHmME9oFYswr1KjBGiP+2iMHDGYmZhpv_SovCMT3xxMMErK19A@mail.gmail.com>
 <9896807f0c6cbee1c7c99647a3c289cc@rcrdbrt.com>
 <f541248bfc8b47975b34acbc1c7bfa9b@rcrdbrt.com>
 <CAHmME9rtK1JvGs3JNYo4Jd9RPuTX9hx0cJy+a=7vEAJkVVa_ng@mail.gmail.com>
 <CAHmME9rDJT5bOJdUn_b9nrUgBbfUWYu2cpQXRhWuAHOGcVczsw@mail.gmail.com>
 <CAHmME9okxTTCUtnJxCL9ERF1mFQN7_CzN4dM-sOL3KC4J6uBvA@mail.gmail.com>
 <4135c3da139c0ca98fafc5fd20d11b18@rcrdbrt.com>
Message-ID: <ec6ebd88a3bedf31a721b887b7a5fdf9@rcrdbrt.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 2018-04-20 22:31, Riccardo Berto wrote:
> On 2018-04-20 21:51, Jason A. Donenfeld wrote:
>> Could you let me know which kernel the non-working rapsis are running?
>> Also, have you tried this over different internet connections and
>> experienced the same thing?
> 
> I haven't tried this under different internet connection but one thing
> I must add is that the laptop is under the same local network of the
> raspberrys, they have the same gateway and the laptop works in 100% of
> the cases I tried it, both while pinging from the raspberrys and not.
> 
> Parallel execution on the raspberry of `tcpdump -vv -ni eth0 'port
> 51820'` while pinging the server:
> 
> 22:26:50.084184 IP (tos 0x88, ttl 64, id 45462, offset 0, flags
> [none], proto UDP (17), length 176)
>     192.168.1.155.51820 > server-ip.51820: [bad udp cksum 0xf657 ->
> 0xb3e7!] UDP, length 148
> 22:26:50.186665 IP (tos 0x0, ttl 48, id 31466, offset 0, flags [none],
> proto UDP (17), length 120)
>     server-ip.51820 > 192.168.1.155.51820: [udp sum ok] UDP, length 92
> 22:26:50.187667 IP (tos 0x0, ttl 64, id 45466, offset 0, flags [none],
> proto UDP (17), length 156)
>     192.168.1.155.51820 > server-ip.51820: [bad udp cksum 0xf643 ->
> 0x0316!] UDP, length 128
> 22:26:51.098777 IP (tos 0x0, ttl 64, id 45520, offset 0, flags [none],
> proto UDP (17), length 156)
>     192.168.1.155.51820 > server-ip.51820: [bad udp cksum 0xf643 ->
> 0x6049!] UDP, length 128
> 22:26:52.138753 IP (tos 0x0, ttl 64, id 45595, offset 0, flags [none],
> proto UDP (17), length 156)
>     192.168.1.155.51820 > server-ip.51820: [bad udp cksum 0xf643 ->
> 0x5608!] UDP, length 128
> 22:26:53.178751 IP (tos 0x0, ttl 64, id 45691, offset 0, flags [none],
> proto UDP (17), length 156)
>     192.168.1.155.51820 > server-ip.51820: [bad udp cksum 0xf643 ->
> 0x7eb3!] UDP, length 128
> 22:26:54.218760 IP (tos 0x0, ttl 64, id 45734, offset 0, flags [none],
> proto UDP (17), length 156)
>     192.168.1.155.51820 > server-ip.51820: [bad udp cksum 0xf643 ->
> 0x240c!] UDP, length 128
> 22:27:05.259544 IP (tos 0x88, ttl 64, id 46342, offset 0, flags
> [none], proto UDP (17), length 176)
>     192.168.1.155.51820 > server-ip.51820: [bad udp cksum 0xf657 ->
> 0x5a78!] UDP, length 148
> 22:27:05.359976 IP (tos 0x0, ttl 48, id 33703, offset 0, flags [none],
> proto UDP (17), length 120)
>     server-ip.51820 > 192.168.1.155.51820: [udp sum ok] UDP, length 92
> 22:27:05.360960 IP (tos 0x0, ttl 64, id 46348, offset 0, flags [none],
> proto UDP (17), length 60)
>     192.168.1.155.51820 > server-ip.51820: [bad udp cksum 0xf5e3 ->
> 0x7f66!] UDP, length 32
> 
> 192.168.1.155 listed there is the static IP address of the raspberry
> pi in my local network.
> 
> Raspberry is running archlinuxarm with kernel: "Linux rpi3-two
> 4.14.34-1-ARCH #1 SMP Mon Apr 16 19:15:19 UTC 2018 armv7l GNU/Linux"

I tried the RPis with another connection and they worked briefly but 
most of the time they don't respond. I configured another laptop under 
the same other network connection and everything works seamlessly. It 
seems that the RPis just don't like WireGuard. I might have some network 
misconfiguration on them but I really can't figure it out.
