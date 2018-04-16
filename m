Return-Path: tim@sedlmeyer.us
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0d8619ee
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Apr 2018 12:14:45 +0000 (UTC)
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
 [209.85.223.195])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3892e465
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Apr 2018 12:14:44 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id a7so1897438ioc.12
 for <wireguard@lists.zx2c4.com>; Mon, 16 Apr 2018 05:29:16 -0700 (PDT)
Return-Path: <tim@sedlmeyer.us>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com.
 [209.85.223.170])
 by smtp.gmail.com with ESMTPSA id n7-v6sm4355626itg.0.2018.04.16.05.29.15
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 16 Apr 2018 05:29:15 -0700 (PDT)
Sender: Timothy Sedlmeyer <tim@sedlmeyer.us>
Received: by mail-io0-f170.google.com with SMTP id k8so7000287ioc.2
 for <wireguard@lists.zx2c4.com>; Mon, 16 Apr 2018 05:29:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9o=N+Qhnst=ep6Cax+rPNhJLRmP-Ha7E=bfVoJhUq9gXA@mail.gmail.com>
References: <CA+bb15uz7jkD2GZhSQANkH9JPi5Sq2g20wrm0avTRFiOMJ55iA@mail.gmail.com>
 <20180415235801.411a50af@natsu>
 <CAHmME9o=N+Qhnst=ep6Cax+rPNhJLRmP-Ha7E=bfVoJhUq9gXA@mail.gmail.com>
From: Tim Sedlmeyer <tim@sedlmeyer.org>
Date: Mon, 16 Apr 2018 08:29:14 -0400
Message-ID: <CAK_h9uHc2HsQDKOMyPz+ZcGw6EB+reHTK41b-1JzQ8Fu3unxfg@mail.gmail.com>
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

More recent versions of the 2.1 series of mailman have features to
wrap messages from senders using DMARC instead of just straight
remailing them to help address this issue.

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
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
