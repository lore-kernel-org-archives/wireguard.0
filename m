Return-Path: toke@toke.dk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 01721045
 for <wireguard@lists.zx2c4.com>; Thu, 8 Mar 2018 16:49:42 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [52.28.52.200])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8b8692b8
 for <wireguard@lists.zx2c4.com>; Thu, 8 Mar 2018 16:49:42 +0000 (UTC)
Date: Thu, 08 Mar 2018 17:59:13 +0100
In-Reply-To: <CAHmME9qg=YXoKxEnikkJe1Li5Pq+yASPUhqN5PmGk6Fx=Y3-1Q@mail.gmail.com>
References: <87efku1vza.fsf@toke.dk>
 <CAHmME9qg=YXoKxEnikkJe1Li5Pq+yASPUhqN5PmGk6Fx=Y3-1Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Subject: Re: Another roaming problem
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
From: =?ISO-8859-1?Q?Toke_H=F8iland-J=F8rgensen?= <toke@toke.dk>
Message-ID: <85FE1433-439D-439C-A61E-B17754707077@toke.dk>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>



On 8 March 2018 17:18:47 CET, "Jason A=2E Donenfeld" <Jason@zx2c4=2Ecom> w=
rote:
>Hi Toke,
>
>On Thu, Mar 8, 2018 at 3:29 PM, Toke H=C3=B8iland-J=C3=B8rgensen <toke@to=
ke=2Edk>
>wrote:
>> So is there a way to either tell the client not to change its idea of
>> the endpoint, or to tell the server to always use a certain source
>> address for outgoing packets?
>
>There have been some discussions on adding another [gasp] nob to clamp
>an endpoint, for this reason and some other related ones=2E But the
>source address caching is supposed to be sticky=2E That is -- it's
>supposed to be that WireGuard will use the correct source address
>based on in the prior incoming packet=2E I can try to reproduce to see
>if perhaps you're uncovering some incorrect behavior here=2E More
>generally speaking, it seems like this problem is occurring for you
>because of NAT=20

Well, in the sense that this wouldn't be a problem if there was no NAT on =
the internet, sure=2E=2E=2E

But other than that, how is it related to NAT?

> and so I wonder if a simpler solution would also
>involve NAT -- namely, configuring "hair pin" NAT?

What's that?

-Toke
