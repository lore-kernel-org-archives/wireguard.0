Return-Path: irish@insaneirish.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f6244cbc
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Apr 2018 00:52:27 +0000 (UTC)
Received: from mail-pl0-f53.google.com (mail-pl0-f53.google.com
 [209.85.160.53])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0349c978
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Apr 2018 00:52:26 +0000 (UTC)
Received: by mail-pl0-f53.google.com with SMTP id bj1-v6so9061029plb.8
 for <wireguard@lists.zx2c4.com>; Sun, 15 Apr 2018 18:06:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9o=N+Qhnst=ep6Cax+rPNhJLRmP-Ha7E=bfVoJhUq9gXA@mail.gmail.com>
References: <CA+bb15uz7jkD2GZhSQANkH9JPi5Sq2g20wrm0avTRFiOMJ55iA@mail.gmail.com>
 <20180415235801.411a50af@natsu>
 <CAHmME9o=N+Qhnst=ep6Cax+rPNhJLRmP-Ha7E=bfVoJhUq9gXA@mail.gmail.com>
From: "Patrick O'Sullivan" <irish@insaneirish.com>
Date: Sun, 15 Apr 2018 21:06:52 -0400
Message-ID: <CA+bb15vcb+FVpg8cda9QxSDHED2ACjLiYp6nxBCi6BG9P0G4EA@mail.gmail.com>
Subject: Re: Why does 'allowed-ips' affect route selection behavior?
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

Hi Jason,

First off--thanks for your work on WireGuard and just wanted to
mention that your appearance on FLOSS Weekly put my over the edge to
try out WireGuard.

> You might want to loosen these up a bit. Anyway, I've pulled it out of the archives for quoting here:

You are probably right. My over-aggression came from an increasing
amount of spam that was spoofing from addresses in my domain.

> Are you using wg-quick(8)?...

Indeed. Mikma's reply pointed me in this direction for investigation.
I had perused the wg man page, but not wg-quick's. I ended up doing
exactly what you said (Table=off) and it did the trick.

I suppose I was a victim of WireGuard's simplicity. I got it up and
running so quickly that I didn't bother to dig into the individual
components more than necessary at first. I ultimately may end up
foregoing wg-quick, but either way I now understand the mechanics to
accomplish what I want.

On Sun, Apr 15, 2018 at 6:26 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> Hi Patrick,
>
> I see some others on the wireguard mailing list have replied to a
> ghost email. That is, I don't have the original that they're replying
> to. Looking into it a bit further, it appears that reasonable spam
> filters -- which includes but is not limited to gmail's -- will have
> your mail immediately bounced, because of your strict dmarc entry
> ("v=DMARC1; p=reject; rua=mailto:dmarc@insaneirish.com"), since
> mailing list servers like lists.zx2c4.com tend to "remail" things. You
> might want to loosen these up a bit. Anyway, I've pulled it out of the
> archives for quoting here:
>
>> Hi Folks,
>>
>> Getting my feet wet with wireguard and enjoying the simplicity and
>> performance thus far. Nonetheless, I have a question about how the
>> normal route selection process is being affected by what's configured
>> for 'allowed-ips'.
>>
>> I set up a peer and configured 'allowed-ips' for 0.0.0.0/0, as I was
>> going to be sending multiple routes over the peer link via BGP and
>> didn't want to keep modifying it. However, even though my default
>> route was over a different interface, this seemed to result in Linux
>> trying to route default traffic over wg0 despite there not being a
>> default route pointing to wg0.
>>
>> Specifically:
>>
>> $ sudo ip route show
>> default via 10.199.199.1 dev wlan0
>> 10.111.111.0/24 dev wg0 proto kernel scope link src 10.111.111.100
>> 10.199.199.0/24 dev wlan0 proto kernel scope link src 10.199.199.131
>>
>> By this route table, traffic to e.g. 4.2.2.1 should use 10.199.199.1.
>> Packet captures were showing traffic trying to instead use wg0. Then I
>> found this:
>>
>> $ sudo ip route get 4.2.2.1
>> 4.2.2.1 dev wg0 table 51820 src 10.111.111.100
>>     cache
>>
>> Can someone please explain this behavior?
>>
>> Obligatory... $ uname -rvm
>> 4.14.30-v7+ #1102 SMP Mon Mar 26 16:45:49 BST 2018 armv7l
>>
>> And... $ dpkg -l | grep wireguard
>> ii  wireguard                       0.0.20180413-1               all
>>        fast, modern, secure kernel VPN tunnel (metapackage)
>> ii  wireguard-dkms                  0.0.20180413-1               all
>>        fast, modern, secure kernel VPN tunnel (DKMS version)
>> ii  wireguard-tools                 0.0.20180413-1               armhf
>>        fast, modern, secure kernel VPN tunnel (userland utilities)
>
> Are you using wg-quick(8)? If so, wg-quick will by default do special
> things to sync up the allowed ips and the system routing table, which
> includes some special case rule tricks for 0.0.0.0/0. It sounds like
> you know what you're doing and don't actually want this behavior. For
> this, you can simply specify Table=off in the [Interface] section.
> This overrides the default value of Table=auto. Alternatively, you can
> choose Table=main if you want those routes added to the default table
> with no special rule tricks. Or, you can choose an arbitrary
> named-table or number if you'd like to add the allowed ips to some
> other routing table. The man page has info.
>
> Jason
