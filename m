Return-Path: oiaohm@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ac04906f
 for <wireguard@lists.zx2c4.com>;
 Sat, 21 Jan 2017 21:40:30 +0000 (UTC)
Received: from mail-yw0-f171.google.com (mail-yw0-f171.google.com
 [209.85.161.171])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dff91f75
 for <wireguard@lists.zx2c4.com>;
 Sat, 21 Jan 2017 21:40:30 +0000 (UTC)
Received: by mail-yw0-f171.google.com with SMTP id l19so115821503ywc.2
 for <wireguard@lists.zx2c4.com>; Sat, 21 Jan 2017 13:51:41 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <9157BE7F-FAC4-4826-8493-E29F1C3D75AB@danrl.com>
References: <CANA3KFU0THGCkVhCsEC4CMfoj394XetYZ_TebyFGTwYiDZ9cBg@mail.gmail.com>
 <CAHmME9qS7ptMcCuvxcobi12hgfYdd4yYcOW5+D_uL6uOGq2f2A@mail.gmail.com>
 <CANA3KFWZP9XmCyWNnb19ywGRa8q57OUNt=42G1yjqkvLYc1kPw@mail.gmail.com>
 <CAHmME9qG4KnuFOCVi6w8fUJ9DVDL9_XjZnWxWPQGQaaPz6UTQw@mail.gmail.com>
 <CANA3KFUyf6NP9hu5i0rWfaKq7a27NQhWg4z-LE2SnTHTrbKM9g@mail.gmail.com>
 <F343B5F3-4A99-4F0D-B5BE-DBDC0CDECE09@danrl.com>
 <CANA3KFWHVtdDTRPqrbOfqJmHU=oh=ZDHitHmjBRO=xv+LnjYJg@mail.gmail.com>
 <1CF3351B-5760-45D6-9D54-4D0A4FC92036@danrl.com>
 <CANA3KFWy1k7L=-FFegh0_3ujw5fx6JSDS15LTbvaKg=a4_gpqQ@mail.gmail.com>
 <9157BE7F-FAC4-4826-8493-E29F1C3D75AB@danrl.com>
From: Peter Dolding <oiaohm@gmail.com>
Date: Sun, 22 Jan 2017 07:51:40 +1000
Message-ID: <CANA3KFX+nR2=g0MkKu3rzwxD3FQ+A7DyWCp-D8+x5xA-cbi9BA@mail.gmail.com>
Subject: Re: Built-in Roaming is limited due to a design fault adding STUN and
 TURN support would be good and make wire-guard connections more
 durable.
To: =?UTF-8?Q?Dan_L=C3=BCdtke?= <mail@danrl.com>
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

On Wed, Jan 18, 2017 at 10:07 PM, Dan L=C3=BCdtke <mail@danrl.com> wrote:
> I don't see a bug here. And no patches. And still no code. Only plenty of=
 tl;dr. I think the only thing we can do is to agree to disagree.

Go to Australia try internode notice you have IPv6 options  Dual Stack
or Dynamic IPv6.   If you choose Dynamic IPv6 say hello Symmetric NAT
.

Now IPv6 offered in Symmetric NAT is here to stay.   Now Australia is
not a area who government regulation forcing it.   Dynamic IPv6 is
sold a security feature for users so that web sites don't see them
coming from the same IP addresses all the time.

Current wireguard cannot punch though a Symmetric NAT be it IPv6 or
IPv4.   Yes in Australia and other countries IPv6 where you will not
be able to connect using basic NAT hole punching due to Symmetric NAT
IPv6.

Really dual stack Ipv6 is not all that is out there.

Question is how to handle it the solution to a Symmetric NAT at both
ends is a Relay of some form.   This does not matter if it IPv6 or
IPv4.

Dynamic IP that is not Symmetric Nat be it IPv6 or IPv4 will have the
same problem of client becoming disconnected from server and needing
to rerun resolve step.

So like it or no Dan there is a bug because the world of Networking
pain points don't change one bit what they are with the introduction
of IPv6 just become less common.   So every problem you have to battle
past with Ipv4 you have to battle past with Ipv6 just less often.

Write code is not something to straight up do.   I am still looking
around at ways to do it.  File socket is one option, memfd is another
is like ebpf using a mmap ring buffer.

Really when wireguard objective is to be fast.   It makes limit sense
to come back to user space just to put packet headers on so the packet
can go to a relay.   Yes one option is also user defined template like
ebpf loaded up by usermode program that wireguard uses and it use a
ring buffer to call back to usermode program if connection appears to
disappear.    Now a special connection for relay or using dynamic dns
because you have dynamic IPv6 of one form or another.

Its not that I have not read carefully before commenting either.   Go
and Rust are market as the usermode programming languages.   Neither
of those languages I use commonly.


Yes Dan you response that hey this is just going to be over head
because with the introduction of IPv6 we don't have to deal with the
old problems is just so far wrong its not funny.

Please not respond with tl;dr all that said is you did not bother
reading.   The issue is you have not read up fully on what IPv6 has
fixed and not fixed and will never fix.   Places were using dynamic
IPv4 when there were tones of IPv4 left for security reasons.
Dyanmic IPv6 is coming back for exactly the same security reasons.
Issue here most don't know the history that dynamic IPv4 and Symmetric
Nats were in use before IPv4 address limits were a problem.   So IPv6
adding more addresses was not going to change everything it will just
restore the networking world back to the way it was before we got
short of IP addresses that world had 4 forms of NAT and dynamic IP
addresses..

Peter Dolding


>
>> On 18 Jan 2017, at 12:21, Peter Dolding <oiaohm@gmail.com> wrote:
>>
>>> On Wed, Jan 18, 2017 at 4:11 PM, Dan L=C3=BCdtke <mail@danrl.com> wrote=
:
>>> Two things I have not seen so far:
>>> - government regulations that enforce NAT
>>> - ISPs (let alone carriers) "upgrading" their networks to ipv6 nat (i m=
yself have run both, isp + carrier networks, and i call BS on your future o=
utlook regarding nat ipv6)
>>> - code from you in this thread
>>>
>> https://en.wikipedia.org/wiki/Internet_censorship
>> When you start looking into countries that are red in the "World map
>> showing the status of YouTube blocking"  you will find some of those
>> its mandatory to have a NAT between ISP and open internet even for
>> IPv6.  Yes the area of infect users is currently small.  But when you
>> look a countries implementing more regulations we cannot be sure how
>> small this will remain.
>>
>> I would say your outlook is wishful thinking that is willing to ignore
>> about 10 percent of the users on the internet who don't have well
>> behaved Carriers or Governments.
>>
>> So Dan you are doing a works for me arguement what is the most invalid
>> arguement to-do in many cases.   Its lets sweep a bug under a carpet
>> and not consider it.
>>
>> The problem is the type of NAT used.
>> https://en.wikipedia.org/wiki/Network_address_translation#Symmetric_NAT
>>
>> Symmetric NAT  this nicely randomises what address users behind it are
>> coming from.    Usage of Symmetric NAT does not have to have anything
>> to-do with reducing the number of IP addresses in usage.   Symmetric
>> NAT can have equal number of users to internet address.
>>
>> Symmetric NAT is the brick wall from hell to hole punching.    The
>> main objective of a Symmetric NAT is that something in the internet
>> that has not had a packet from something behind the Symmetric NAT
>> blocked by default.   Add in symmetric NAT randomising IP to IP
>> mapping.     So after IPv4 disappears what Symmetric NAT still has a
>> usage in IPv6.
>>
>> Teredo that is IPv6 over IPv4 fails if both ends are behind Symmetric
>> NAT.    Normal STUN for NAT punching falls over if both ends are
>> behind Symmetric NAT this does not matter if it IPv4 or iPv6.
>> Symmetric NAT randomising ip to ip mapping bring hell.   So you opened
>> up a connection after so much time the Symmetric NAT forgets and you
>> attempt to send another packet to a end and it picks out a new IP
>> address at random to use.
>>
>> The three types cone style NAT will stay in usage by client routers by
>> different Carriers even after IPv6 is dominate everywhere as it make
>> sense at that point so being able to punch though those at times will
>> still be required.
>>
>> So the 4 types of common NAT are not going anywhere were they were
>> used for common sense reasons.   The Carrier NAT attempting to push
>> massive numbers of users though limited addresses will hopefully
>> disappear due to IPv6.
>>
>> Basically Dan is about time you step back look at NAT how it used and
>> where is used and why.    The change to IPv6 is only really getting
>> rid of one form of NAT  being the carrier nat that were non Symmetric
>> NAT based on Symmetric NAT ideas that at times had massive problems
>> like completely running out of ports due to not enough address because
>> attempting to push too many clients out too few of addresses.
>>
>> If somewhere has a pure Symmetric NAT where the number of external
>> address match the number of internal address for IPv4 for security
>> reasons doing the same thing on IPv6 has the same logical reasons.
>> So logically sane placed Symmetric NAT will remain and when you have
>> to get though them the same problems will remain.
>>
>> The reality is the 4 common types of NAT can be deployed sanely
>> without massive over-stacking.   Under IPv6 the worse we should see is
>> hopefully only 2 NAT deep.     Possible 3 mode cone NAT in router and
>> Carrier with a Symmetric NAT between you and the internet. as long as
>> what ever is design can get though this worse case all cases will be
>> covered.   .  Why hopefully only 2 nat deep It is possible to have
>> like ADSL router NAT + a WIFI router doing NAT and Carrier doing
>> Symmetric NAT but the wifi NAT level is kinda self inflicted by user
>> on self not forced on user by carrier this is an improvement over the
>> 3 to 4 deep in nat by carrier in some places..
>>
>> Dan attempting to code when the required interfaces to make it work
>> don't exist and have not been debated does not make much sense.   Also
>> attempting to tell boss time this will need roughly to give something
>> functional also not be guessed when you are in the location that there
>> is a framework problem.
>>
>> IPv6 is improving something things.   But IPv6 is not a magic bullet
>> to cure all the issues of having at times to get through NAT.
>>
>> Basically it is BS the that existence of NAT can be ignored because
>> IPv6 fixes everything.   IPv6 pure once fully deployed by all carriers
>> should reduce the number of NAT you have to cross on the internet.
>> The big elephant in the room is that IPv6 is only going to reduce the
>> number of NAT in the internet not remove them all.
>>
>> So working out how to handle the case that end user has found
>> themselves on the wrong side of deployed NATs applies to IPv4 and IPv6
>> with IPv6 hopefully being less glitch due to lower numbers of NAT in
>> the mix.
>>
>> Think if a company can use an accounts that is behind a Symmetric NAT
>> without having to pay extra or do extra government regulation  for a
>> static public internet IP address might reduce their costs of doing
>> business.    Also consider the ones most commonly going to be stuck
>> behind Symmetric NAT are also the places that will have massive
>> amounts of government regulation that can forbid having private keys
>> on overseas servers and and using overseas vpn servers.   Using a
>> Relay/TURN server is hair splitting as it not a overseas VPN server
>> its only an overseas relay at worst.
>>
>> Reality Dan look out side your small conner of the earth.   New
>> standards does not change how messed up world internet regulations by
>> different governments are or different carriers stunts to make more
>> money.
>>
>> .
>> Peter Dolding
>
