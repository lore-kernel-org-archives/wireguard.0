Return-Path: toke@toke.dk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 61797e12
 for <wireguard@lists.zx2c4.com>; Thu, 8 Mar 2018 17:40:55 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [52.28.52.200])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d3b5c733
 for <wireguard@lists.zx2c4.com>; Thu, 8 Mar 2018 17:40:54 +0000 (UTC)
Date: Thu, 08 Mar 2018 18:50:27 +0100
In-Reply-To: <CAHmME9pgOGghWRv9bMtTvbxrQfNycK9EHEnBu=UQxOz6AQJ2qA@mail.gmail.com>
References: <87efku1vza.fsf@toke.dk>
 <CAHmME9qg=YXoKxEnikkJe1Li5Pq+yASPUhqN5PmGk6Fx=Y3-1Q@mail.gmail.com>
 <85FE1433-439D-439C-A61E-B17754707077@toke.dk>
 <CAHmME9p0aW2i-EcErua_Hkz-hZc12m47oLR9wvngu5ejVX=Q8A@mail.gmail.com>
 <87h8pqlbw4.fsf@toke.dk>
 <CAHmME9pgOGghWRv9bMtTvbxrQfNycK9EHEnBu=UQxOz6AQJ2qA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Subject: Re: Another roaming problem
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
From: =?ISO-8859-1?Q?Toke_H=F8iland-J=F8rgensen?= <toke@toke.dk>
Message-ID: <7088098E-63F5-4ECB-A298-24444987482E@toke.dk>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>



On 8 March 2018 18:39:15 CET, "Jason A=2E Donenfeld" <Jason@zx2c4=2Ecom> w=
rote:
>Hi Toke,
>
>On Thu, Mar 8, 2018 at 6:23 PM, Toke H=C3=B8iland-J=C3=B8rgensen <toke@to=
ke=2Edk>
>wrote:
>>
>> I have a gateway device with two interfaces, one public and one
>private=2E
>> This device performs NAT, and is also the one running wireguard (as
>the
>> 'server')=2E The client roams=2E So I have two cases:
>>
>>
>> C (public IP) --- (public IP) GW (private IP) -- [LAN]
>>
>> In this case, C talks to GW on GWs public IP; everything works fine=2E
>>
>> Second case:
>>
>> [internet] --- (public IP) GW (private IP) -- [LAN] -- C (private IP)
>>
>> Here, C talks to GW; it still tries to send packets to the public IP
>of
>> GW (because that is what it's configured to do), but because GW sees
>> that the source IP is on its internal subnet, it replies with a
>source
>> address in the private subnet=2E This works fine as long as the client
>is
>> on the LAN; but once it roams outside, it now thinks that the
>wireguard
>> server lives on the private IP of the GW, which is obviously can't
>reach
>> from its shiny new public IP=2E
>>
>> So what I'd want to happen is that GW should keep using its public
>> IP as the source of the wireguard packets, even when talking to a
>client
>> on a directly-connected internal subnet=2E Or, alternatively, that C
>> should ignore the source address change of the packets coming from GW
>> and keep sending its packets to the public IP it was first configured
>to
>> use=2E=2E=2E
>>
>
>In this case, WireGuard is indeed supposed to make the right decision=2E
>Namely, it should continue replying using the correct source address=2E
>It's not supposed to switch to the internal one=2E I have the exact same
>setup at home, so I just tried things out again to verify, and from my
>end it seems to be working fine:
>
>zx2c4@thinkpad ~ $ wg
>interface: martino
>  public key: 4HUj8boJyeZI70WVxmKhHfGAohtoyFQpWk96OpuFcVY=3D
>  private key: (hidden)
>  listening port: 53249
>  fwmark: 0xca6c
>
>peer: GMvmorUa9WzHAkOVOxQKSrw3F1JruA4bTN1NkWN0T3E=3D
>  preshared key: (hidden)
>  endpoint: 129=2E228=2E12=2E33:10000
>  allowed ips: 0=2E0=2E0=2E0/0, ::/0
>  latest handshake: 48 seconds ago
>  transfer: 1=2E06 KiB received, 19=2E50 KiB sent
>zx2c4@thinkpad ~ $ ip link set wwan0 down
>zx2c4@thinkpad ~ $ ip link set wlan0 up
>zx2c4@thinkpad ~ $ pingg
>PING google=2Ecom (172=2E217=2E19=2E142) 56(84) bytes of data=2E
>64 bytes from mrs08s04-in-f14=2E1e100=2Enet (172=2E217=2E19=2E142): icmp_=
seq=3D1
>ttl=3D53 time=3D20=2E1 ms
>64 bytes from mrs08s04-in-f14=2E1e100=2Enet (172=2E217=2E19=2E142): icmp_=
seq=3D2
>ttl=3D53 time=3D19=2E1 ms
>^C
>--- google=2Ecom ping statistics ---
>2 packets transmitted, 2 received, 0% packet loss, time 1001ms
>rtt min/avg/max/mdev =3D 19=2E181/19=2E666/20=2E151/0=2E485 ms
>zx2c4@thinkpad ~ $ wg
>interface: martino
>  public key: 4HUj8boJyeZI70WVxmKhHfGAohtoyFQpWk96OpuFcVY=3D
>  private key: (hidden)
>  listening port: 53249
>  fwmark: 0xca6c
>
>peer: GMvmorUa9WzHAkOVOxQKSrw3F1JruA4bTN1NkWN0T3E=3D
>  preshared key: (hidden)
>  endpoint: 129=2E228=2E12=2E33:10000
>  allowed ips: 0=2E0=2E0=2E0/0, ::/0
>  latest handshake: 5 seconds ago
>  transfer: 113=2E70 KiB received, 85=2E43 KiB sent
>
>I wonder what might be different about your configuration=2E=2E=2E

Well, I do generally setup routing in a somewhat unusual manner=2E

I can try to capture some packet dumps tomorrow to poke into it a bit more=
=2E Anything in particular I should look for?

-Toke
