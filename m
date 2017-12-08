Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 32249665
 for <wireguard@lists.zx2c4.com>; Fri, 8 Dec 2017 02:18:57 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 511c5147
 for <wireguard@lists.zx2c4.com>; Fri, 8 Dec 2017 02:18:57 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 56bced1f
 for <wireguard@lists.zx2c4.com>; Fri, 8 Dec 2017 02:18:56 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 190c4c35
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 8 Dec 2017 02:18:55 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id l6so6318832oih.11
 for <wireguard@lists.zx2c4.com>; Thu, 07 Dec 2017 18:26:01 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <878tee2obd.fsf@fifthhorseman.net>
References: <20171111044854.GA7956@zx2c4.com>
 <CAB=oiXZYChYMzqK4cufNy+Gr-QHK7jE=h8-9+zQMx67_xsLVoQ@mail.gmail.com>
 <20171207133759.GA395@wolff.to> <878tee2obd.fsf@fifthhorseman.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 8 Dec 2017 03:25:59 +0100
Message-ID: <CAHmME9ost0G308+Qfit-JaBkZotYmJvdERXw0KkYYs3vZMEG7Q@mail.gmail.com>
Subject: Re: WireGuard Upstreaming Roadmap (November 2017)
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
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

On Thu, Dec 7, 2017 at 10:57 PM, Daniel Kahn Gillmor
<dkg@fifthhorseman.net> wrote:
> On Thu 2017-12-07 07:37:59 -0600, Bruno Wolff III wrote:
>> On Thu, Dec 07, 2017 at 11:22:04 +0100,
>>   Stefan Tatschner <rumpelsepp@sevenbyte.org> wrote:
>>>
>>>Assuming I am right according the crypto agility, what's the upgrade
>>>path if any of the involved cryptographic algorithms will be declared
>>>insecure/broken? From my point of view wireguard tries to stay as
>>>simple as possible and in general that's a good idea. I am just a bit
>>>worrying about the possible lack of a clear upgrade path once
>>>wireguard is mainlined.
>>
>> Having alternate crypto paths is also a weakness. There have been lots of
>> downgrade attacks against systems that incorporate agility.
>
> this is clearly true, but it doesn't answer the question that Stefan was
> asking.
>
> As i understand it, for the current form of wireguard, the only way to
> resolve the sort of problem described will be to create a "wireguard2"
> which uses new, better primitives.  and it will probably need to listen
> on a different port than "traditional wireguard" if you have any intent
> on supporting both variants at the same time on the same host.
>
> As upgrade paths go, this isn't too terrible, but it's not exactly
> pretty either.  it'd be great to hear if folks have better ideas.

Moved this to another thread.
