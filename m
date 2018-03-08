Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dcdcb083
 for <wireguard@lists.zx2c4.com>; Thu, 8 Mar 2018 17:29:38 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a7234b48
 for <wireguard@lists.zx2c4.com>; Thu, 8 Mar 2018 17:29:38 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 04d31c4e
 for <wireguard@lists.zx2c4.com>; Thu, 8 Mar 2018 17:20:46 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 422054ba
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 8 Mar 2018 17:20:46 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id g5so4957902oiy.8
 for <wireguard@lists.zx2c4.com>; Thu, 08 Mar 2018 09:39:16 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87h8pqlbw4.fsf@toke.dk>
References: <87efku1vza.fsf@toke.dk>
 <CAHmME9qg=YXoKxEnikkJe1Li5Pq+yASPUhqN5PmGk6Fx=Y3-1Q@mail.gmail.com>
 <85FE1433-439D-439C-A61E-B17754707077@toke.dk>
 <CAHmME9p0aW2i-EcErua_Hkz-hZc12m47oLR9wvngu5ejVX=Q8A@mail.gmail.com>
 <87h8pqlbw4.fsf@toke.dk>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 8 Mar 2018 18:39:15 +0100
Message-ID: <CAHmME9pgOGghWRv9bMtTvbxrQfNycK9EHEnBu=UQxOz6AQJ2qA@mail.gmail.com>
Subject: Re: Another roaming problem
To: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>
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

Hi Toke,

On Thu, Mar 8, 2018 at 6:23 PM, Toke H=C3=B8iland-J=C3=B8rgensen <toke@toke=
.dk> wrote:
>
> I have a gateway device with two interfaces, one public and one private.
> This device performs NAT, and is also the one running wireguard (as the
> 'server'). The client roams. So I have two cases:
>
>
> C (public IP) --- (public IP) GW (private IP) -- [LAN]
>
> In this case, C talks to GW on GWs public IP; everything works fine.
>
> Second case:
>
> [internet] --- (public IP) GW (private IP) -- [LAN] -- C (private IP)
>
> Here, C talks to GW; it still tries to send packets to the public IP of
> GW (because that is what it's configured to do), but because GW sees
> that the source IP is on its internal subnet, it replies with a source
> address in the private subnet. This works fine as long as the client is
> on the LAN; but once it roams outside, it now thinks that the wireguard
> server lives on the private IP of the GW, which is obviously can't reach
> from its shiny new public IP.
>
> So what I'd want to happen is that GW should keep using its public
> IP as the source of the wireguard packets, even when talking to a client
> on a directly-connected internal subnet. Or, alternatively, that C
> should ignore the source address change of the packets coming from GW
> and keep sending its packets to the public IP it was first configured to
> use...
>

In this case, WireGuard is indeed supposed to make the right decision.
Namely, it should continue replying using the correct source address.
It's not supposed to switch to the internal one. I have the exact same
setup at home, so I just tried things out again to verify, and from my
end it seems to be working fine:

zx2c4@thinkpad ~ $ wg
interface: martino
  public key: 4HUj8boJyeZI70WVxmKhHfGAohtoyFQpWk96OpuFcVY=3D
  private key: (hidden)
  listening port: 53249
  fwmark: 0xca6c

peer: GMvmorUa9WzHAkOVOxQKSrw3F1JruA4bTN1NkWN0T3E=3D
  preshared key: (hidden)
  endpoint: 129.228.12.33:10000
  allowed ips: 0.0.0.0/0, ::/0
  latest handshake: 48 seconds ago
  transfer: 1.06 KiB received, 19.50 KiB sent
zx2c4@thinkpad ~ $ ip link set wwan0 down
zx2c4@thinkpad ~ $ ip link set wlan0 up
zx2c4@thinkpad ~ $ pingg
PING google.com (172.217.19.142) 56(84) bytes of data.
64 bytes from mrs08s04-in-f14.1e100.net (172.217.19.142): icmp_seq=3D1
ttl=3D53 time=3D20.1 ms
64 bytes from mrs08s04-in-f14.1e100.net (172.217.19.142): icmp_seq=3D2
ttl=3D53 time=3D19.1 ms
^C
--- google.com ping statistics ---
2 packets transmitted, 2 received, 0% packet loss, time 1001ms
rtt min/avg/max/mdev =3D 19.181/19.666/20.151/0.485 ms
zx2c4@thinkpad ~ $ wg
interface: martino
  public key: 4HUj8boJyeZI70WVxmKhHfGAohtoyFQpWk96OpuFcVY=3D
  private key: (hidden)
  listening port: 53249
  fwmark: 0xca6c

peer: GMvmorUa9WzHAkOVOxQKSrw3F1JruA4bTN1NkWN0T3E=3D
  preshared key: (hidden)
  endpoint: 129.228.12.33:10000
  allowed ips: 0.0.0.0/0, ::/0
  latest handshake: 5 seconds ago
  transfer: 113.70 KiB received, 85.43 KiB sent

I wonder what might be different about your configuration...

Jason
