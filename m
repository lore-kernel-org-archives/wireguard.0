Return-Path: me.kalin@gmail.com
Received: from mail-yw0-f180.google.com (mail-yw0-f180.google.com
 [209.85.161.180])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 60b79ded
 for <wireguard@lists.zx2c4.com>; Sun, 4 Dec 2016 02:56:25 +0000 (UTC)
Received: by mail-yw0-f180.google.com with SMTP id r204so237954021ywb.0
 for <wireguard@lists.zx2c4.com>; Sat, 03 Dec 2016 19:01:25 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <e1085a46-e38f-c13c-86f5-de312b3a5c05@mib-infotech.co.nz>
References: <20161203115342.20950-1-list@eworm.de>
 <e1085a46-e38f-c13c-86f5-de312b3a5c05@mib-infotech.co.nz>
From: Kalin KOZHUHAROV <me.kalin@gmail.com>
Date: Sun, 4 Dec 2016 12:01:04 +0900
Message-ID: <CAKXLc7fcgr__ibNFcew55DKm4Z77zRJgrXCqth3sue3yRHV1ZQ@mail.gmail.com>
Subject: Re: DMVPM appreciation
To: John Huttley <john@mib-infotech.co.nz>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hmm...
Really good high level theory ...

On Sun, Dec 4, 2016 at 3:07 AM, John Huttley <john@mib-infotech.co.nz> wrote:
> So lets consider a simplified case
> A <-> B <-> C
>
> A is sending a lot of data to C.
>
> Policy triggers starting a direct A <-> C tunnel.
>
> We need public key and endpoint to set up a tunnel.
>

Don't forget we need two more things:
* A --> C (over UDP)
* C --> A (over UDP)

Throw a few weird NAT/PAT and other ACLs in between and try again.

> First. A can talk to C just fine on the VPN. Thats all the
> authentication required.
>
Yes, but in the background A only talks to B over UDP... and B to C over UDP.

> A and C swap public keys
> Endpoints? you could look up myip.com, but there is one perfect way.
> A asks B, because  if two nodes are peered, they always know the
> endpoint of their peer.
> In this case B knows how to contact A.
> B passes that back to A
> A then passes that to C along with A's public key
>
>
> Ok, UDP Rendevous and we have a A <-> C tunnel, no NHRP required.
> The routing daemon engages and a new route becomes active.
>
I think there may be cases where such situation is possible and highly
desirable.
The logic being, try to talk directly (using the protocol described
above), if it doesn't work, continue talking via B.
Reminds me of STUN and friends.

And an alternative will be centralized database/service advertising
public keys and endpoints (think PGP keyserver).
And then comes the WoT and then... Jason will shoot us for bringing
the complexity he is so fond of avoiding (and I am supporting him) :-D

Since this functionality can be implemented outside of Wireguard, as a
simple script (I guess 5 lines of Bash, but will leave the challenge
open), it is all a matter of convenience.
Nothing can be gained by "building it in", may be except tiny convenience.
If you try to script it, then provide clean documentation/test cases,
I am sure it can be included in
https://git.zx2c4.com/WireGuard/plain/contrib/examples/

Also consider the trust model you are changing, because security DOES matter :-)
As an example, think buying on Amazon from 3rd party, vs. talking to
them directly:
(1st -> 2nd case may be possible, 2nd ->1st is highly improbable)

* 1st case is more secure, but more expensive
* 1st provides a way to find your party, plus it provides some
mediatior/trust relationship (at cost)
* How often did you buy something via Amazon an then went directly to
the seller to buy more?

It is all about balancing security/cost and convenience of setup a
transaction, within some (implicit) trust/insurance model.

Cheers,
Kalin.
