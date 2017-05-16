Return-Path: ygh@mysterious.site
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ac5f0a6e
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 May 2017 16:22:30 +0000 (UTC)
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e0b0d56f
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 May 2017 16:22:30 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 8F559125C
 for <wireguard@lists.zx2c4.com>; Tue, 16 May 2017 12:33:47 -0400 (EDT)
Received: from [192.168.33.129] (li1552-224.members.linode.com
 [139.162.72.224])
 by mail.messagingengine.com (Postfix) with ESMTPA id E3D09249D2
 for <wireguard@lists.zx2c4.com>; Tue, 16 May 2017 12:33:45 -0400 (EDT)
Subject: Re: Text-based IPC for Userspace Implementations
To: wireguard@lists.zx2c4.com
References: <CAHmME9pGX9zH+A9ouz0g8g6R7ZheZ=sKu_seAZ8r-DtBRdY_Rw@mail.gmail.com>
 <87vap1gd2w.fsf@alrua-kau>
From: Guanhao Yin <sopium@mysterious.site>
Message-ID: <0f5ecdc1-bda0-ec74-024c-e73b8791bb11@mysterious.site>
Date: Wed, 17 May 2017 00:33:43 +0800
MIME-Version: 1.0
In-Reply-To: <87vap1gd2w.fsf@alrua-kau>
Content-Type: text/plain; charset=UTF-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi,

在 2017年05月16日 21:12, Toke Høiland-Jørgensen 写道:
> "Jason A. Donenfeld" <Jason@zx2c4.com> writes:
>
>> Hey guys,
>>
>> Currently wg(8) talks to the kernel by passing structs through an
>> ioctl. Due to upstream demands, this is going to be changed to
>> netlink, and we'll ditch those structs. wg(8) previously tried to
>> re-use those same structs for userspace implementations, passing them
>> through a unix socket. Implementors did not like dealing with this.
>> Since the structs are going for the kernel stuff, we might as well
>> move to something better, too, for the userspace stuff. Therefore
>> wg(8) now has a very simple text-based IPC format over unix sockets
>> (or Windows named pipes) that can be easily implemented in nearly
>> every language, even bash.
>>
>> I've written a small description of it here:
https://www.wireguard.io/xplatform/
>>
>> This will be part of the next snapshot.
>>
>> Any questions?

Good! 😄.

In the “configuration protocol” section, I think “wg(8) responds to
...” should be “An userspace implementation respondes to ...”?

A text based format is certainly easier to deal with than C
structs. Hope I can find some time to finally implement it in
WireGuard.rs.

That said, I still like the idea that an userspace implementation
being usable without wg(8): it just takes a configuration and runs it,
simple and straightforward.

>
> I applaud the general idea of moving to a text-based interface. But why
> invent Yet Another Configuration Format?
>
> I guess you could say that key=value pairs are fairly straight forward;
> but from the examples it looks like there's an implicit nested
> structure? I.e. a public_key=xxx line denotes the start of a new
> endpoint, and the following keys are logically part of that endpoint?
> Or? If this is the case, you'll need a stateful parser to parse it,
> which is not immediately obvious from the description, and is bound to
> trip people up at some point...
>
> So why not avoid any possible confusion and just emit JSON? Or another
> well-established serialisation format where the nesting can be made
> explicit... :)

+1 for well-established serialisation format.


Guanhao Yin
