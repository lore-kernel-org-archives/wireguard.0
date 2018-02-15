Return-Path: e1326252@student.tuwien.ac.at
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0b05911d
 for <wireguard@lists.zx2c4.com>;
 Thu, 15 Feb 2018 14:28:58 +0000 (UTC)
Received: from mail1.student.tuwien.ac.at (mail1.student.tuwien.ac.at
 [193.170.73.221])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fce24e13
 for <wireguard@lists.zx2c4.com>;
 Thu, 15 Feb 2018 14:28:58 +0000 (UTC)
Subject: Re: NetworkManager Plugin
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <7d5325a3-fa07-f67f-a31e-aadd44458d41@student.tuwien.ac.at>
 <CAHmME9qVoBkdu35n4aGdZ8nCH6ONZhcGb=WCGx2LGbyHgJMTSw@mail.gmail.com>
 <CAFi5oX6LM+A=jbPmhffc4wT+pKmMg8xi=2ebSMg=s7Qg2AY_sw@mail.gmail.com>
 <cba131ba-cd15-8bf4-cdd1-4d46ad774d41@student.tuwien.ac.at>
 <CAHmME9rZU8y8mjHhHkVJ9foRW8Wuk5QMoijMfVU=_4LHfg7F-w@mail.gmail.com>
From: Maximilian Moser <e1326252@student.tuwien.ac.at>
Message-ID: <db120c3b-a9f3-6769-6baa-c3be86bbd78c@student.tuwien.ac.at>
Date: Thu, 15 Feb 2018 15:35:53 +0100
MIME-Version: 1.0
In-Reply-To: <CAHmME9rZU8y8mjHhHkVJ9foRW8Wuk5QMoijMfVU=_4LHfg7F-w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: Jordan DeBeer <debee1jp@gmail.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey Jason,


>> I actually just wanted to get this thesis over with and thought, why not
>> post the result to the mailing list
>> I'll probably focus more on the written part of the
>> thesis, so fixing the issues will probably have to wait a while on my part.
> I'm certainly not interested in "throw it over the fence" coding. I'm
> happy to work with you on "the acceptance and the possible prospect of
> this thing getting packaged for distros," as you wrote, but only if
> you're actually committed to maintaining it. It sounds to me like this
> is something in your mind that is "over with"? That's disapointing.

Oh sorry, that wasn't my intention to say. What I meant is that I wanted 
to get a working prototype ASAP, and if nobody is interested in it 
anymore, that's that.

However, this does not seem to be the case and I'll be glad to continue 
development on it. :)


Max


On 15/02/18 15:07, Jason A. Donenfeld wrote:
> Hi Max,
>
> On Thu, Feb 15, 2018 at 1:34 AM, Maximilian Moser
> <e1326252@student.tuwien.ac.at> wrote:
>> I actually just wanted to get this thesis over with and thought, why not
>> post the result to the mailing list
>> I'll probably focus more on the written part of the
>> thesis, so fixing the issues will probably have to wait a while on my part.
> I'm certainly not interested in "throw it over the fence" coding. I'm
> happy to work with you on "the acceptance and the possible prospect of
> this thing getting packaged for distros," as you wrote, but only if
> you're actually committed to maintaining it. It sounds to me like this
> is something in your mind that is "over with"? That's disapointing.
>
>> Regarding the issues... About some of them, I did know in one way or the
>> other.
>> So I'm somewhat excited about the acceptance and the possible prospect of
>> this thing getting packaged for distros :D
> As I wrote earlier, this is going to require a lot of work to actually
> bring to fruition. The first priority should be entirely dispensing
> with the use of wg-quick. In order to aid these efforts, I spent some
> time writing a mini single-file-c library that you can drop into your
> project as a means for talking to the kernel and configuring devices
> directly:
>
> https://git.zx2c4.com/WireGuard/tree/contrib/examples/embeddable-wg-library/README
>
> Should be pretty straight-forward to integrate. You'll basically only
> need to use the "wg_set_device" function, and perhaps the
> "wg_key_from_base64" function too.
>
> Jason
