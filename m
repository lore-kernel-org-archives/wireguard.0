Return-Path: stromberg@mullvad.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 131196bc
 for <wireguard@lists.zx2c4.com>; Tue, 7 Nov 2017 12:02:15 +0000 (UTC)
Received: from mail-wr0-f172.google.com (mail-wr0-f172.google.com
 [209.85.128.172])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d4ce9cf9
 for <wireguard@lists.zx2c4.com>; Tue, 7 Nov 2017 12:02:15 +0000 (UTC)
Received: by mail-wr0-f172.google.com with SMTP id u97so4158503wrc.1
 for <wireguard@lists.zx2c4.com>; Tue, 07 Nov 2017 04:05:28 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171107093832.GB7891@kroah.com>
References: <CAC4KqtwH_XAXeXHSf9Kxs5t80Qag9GrMwp6SaPnO9bj=GVL-7w@mail.gmail.com>
 <20171107093832.GB7891@kroah.com>
From: =?UTF-8?Q?Fredrik_Str=C3=B6mberg?= <stromberg@mullvad.net>
Date: Tue, 7 Nov 2017 13:05:26 +0100
Message-ID: <CANTUoec-8PeEJLLMASkjG8+bR9XjdXpmaEOeg2MdqZriEkYjPw@mail.gmail.com>
Subject: Re: Production usage of Wireguard
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Tue, Nov 7, 2017 at 10:38 AM, Greg KH <gregkh@linuxfoundation.org> wrote=
:
> On Mon, Nov 06, 2017 at 09:41:18PM +0000, Ferris Ellis wrote:
>> Hello Wireguard mailing list!
>>
>> I have been very interested in the WireGuard project for a little while =
now
>> and am in the process of evaluating it. While benchmarks and code review=
s
>> are useful, they don=E2=80=99t uncover many of the issues that can poten=
tially wake
>> one up at 3am. I=E2=80=99d hunted around on the web for a while but wasn=
=E2=80=99t able to
>> find any articles on running WireGuard in a production environment. I kn=
ow
>> the project is still young but was wondering if anyone on the mailing li=
st
>> had started using WireGuard in production? And, if so, if they=E2=80=99d=
 be willing
>> to share some details about their use case and experience?
>
> There are at least two companies offering Wireguard as a VPN service
> "commercially" right now, so it is being used in that manner already.
>

Hi everyone,

We (Mullvad) use it in production on a bunch of our servers. Here's a
blog post I wrote about it that might be of interest to you Ferris:
https://mullvad.net/blog/2017/9/27/wireguard-future/

> But as "production environment" always means different things for
> different people, perhaps only you can answer this question?  What would
> it take for _you_ to be comfortable with it in your network environment?

I second Greg's question. What are your criteria?

Cheers,
Fredrik Str=C3=B6mberg
