Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ca1528ce
 for <wireguard@lists.zx2c4.com>; Thu, 8 Mar 2018 16:53:01 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4b424bce
 for <wireguard@lists.zx2c4.com>; Thu, 8 Mar 2018 16:53:01 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7a911684
 for <wireguard@lists.zx2c4.com>; Thu, 8 Mar 2018 16:44:10 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9edc1584
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 8 Mar 2018 16:44:10 +0000 (UTC)
Received: by mail-ot0-f176.google.com with SMTP id r30so6070434otr.2
 for <wireguard@lists.zx2c4.com>; Thu, 08 Mar 2018 09:02:39 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <85FE1433-439D-439C-A61E-B17754707077@toke.dk>
References: <87efku1vza.fsf@toke.dk>
 <CAHmME9qg=YXoKxEnikkJe1Li5Pq+yASPUhqN5PmGk6Fx=Y3-1Q@mail.gmail.com>
 <85FE1433-439D-439C-A61E-B17754707077@toke.dk>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 8 Mar 2018 18:02:38 +0100
Message-ID: <CAHmME9p0aW2i-EcErua_Hkz-hZc12m47oLR9wvngu5ejVX=Q8A@mail.gmail.com>
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

On Thu, Mar 8, 2018 at 5:59 PM, Toke H=C3=B8iland-J=C3=B8rgensen <toke@toke=
.dk> wrote:
>> and so I wonder if a simpler solution would also
>>involve NAT -- namely, configuring "hair pin" NAT?
>
> What's that?

It's the terrible vendor term for hitting the gateway through one of
its IPs (say, the public one) and having it forward packets for you to
another machine on the same LAN. The idea here, being, you'd get to
keep using the same IP address for communicating, even when you're
behind NAT in the private network. (This seems to work well for me at
my house.)

Wikipedia describes it in terms of the p2p discovery issue, which is
slightly different, but still the same underlying concept:
https://en.wikipedia.org/wiki/Hairpinning
