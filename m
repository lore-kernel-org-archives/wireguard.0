Return-Path: john@mib-infotech.co.nz
Received: from mail-pf0-f176.google.com (mail-pf0-f176.google.com
 [209.85.192.176])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6b6b2cab
 for <wireguard@lists.zx2c4.com>; Sun, 4 Dec 2016 05:54:20 +0000 (UTC)
Received: by mail-pf0-f176.google.com with SMTP id c4so58368268pfb.1
 for <wireguard@lists.zx2c4.com>; Sat, 03 Dec 2016 21:59:21 -0800 (PST)
Return-Path: <john@mib-infotech.co.nz>
From: John Huttley <john@mib-infotech.co.nz>
Subject: Re: DMVPM appreciation
To: John Huttley <john@mib-infotech.co.nz>
References: <20161203115342.20950-1-list@eworm.de>
 <e1085a46-e38f-c13c-86f5-de312b3a5c05@mib-infotech.co.nz>
Message-ID: <689268d1-473f-6df6-61ba-989f8aed9928@mib-infotech.co.nz>
Date: Sun, 4 Dec 2016 18:57:04 +1300
MIME-Version: 1.0
In-Reply-To: <e1085a46-e38f-c13c-86f5-de312b3a5c05@mib-infotech.co.nz>
Content-Type: text/plain; charset=utf-8
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


> Don't forget we need two more things:
> * A --> C (over UDP)
> * C --> A (over UDP)

>Throw a few weird NAT/PAT and other ACLs in between and try again.

In one direction there is no need, because that's how we established the
tunnel. See below, we could make exposed endpoints a requirement.




>> First. A can talk to C just fine on the VPN. Thats all the
>> authentication required.
>>
>Yes, but in the background A only talks to B over UDP... and B to C
>over UDP.

Sorry I don't get what you mean. Anyone /could/ talk to anyone,
firewalls permitting.


>I think there may be cases where such situation is possible and highly
>desirable.
>The logic being, try to talk directly (using the protocol described
>above), if it doesn't work, continue talking via B.
>Reminds me of STUN and friends.

Actually we can simplify it further. Just make it a requirement of
overlaying that you have a valid listener. Then no UDP magic. Overly
works or it doesn't.

>And an alternative will be centralized database/service advertising
>public keys and endpoints (think PGP keyserver).
>And then comes the WoT and then... Jason will shoot us for bringing
>the complexity he is so fond of avoiding (and I am supporting him) :-D

Agreed. I don't think Jason will be more than mildly interested and it
shouldn't be a part of Wireguard itself.

>Since this functionality can be implemented outside of Wireguard, as a
>simple script (I guess 5 lines of Bash, but will leave the challenge
>open), it is all a matter of convenience.
>Nothing can be gained by "building it in", may be except tiny >convenience.
>If you try to script it, then provide clean documentation/test cases,
>I am sure it can be included in
>https://git.zx2c4.com/WireGuard/plain/contrib/examples/

Agreed.

>Also consider the trust model you are changing, because security DOES
>matter :-)
>As an example, think buying on Amazon from 3rd party, vs. talking to
>them directly:
>(1st -> 2nd case may be possible, 2nd ->1st is highly improbable)

If you are on the VPN, you are by definition, trusted as much as anyone is.

"Improbable" is a policy decision. Overlaying might not even be of
benefit. If C is on bad, slow connection, an overlay to C isn't going to
help. Policy needs to figure that out.



>* 1st case is more secure, but more expensive
>* 1st provides a way to find your party, plus it provides some
>mediatior/trust relationship (at cost)
>* How often did you buy something via Amazon an then went directly to
>the seller to buy more?

This isn't the use case I'm considering. I'm not quite sure what you mean.

>It is all about balancing security/cost and convenience of setup a
>transaction, within some (implicit) trust/insurance model.

Definitely don't know what you mean.

Regards
-Dad
