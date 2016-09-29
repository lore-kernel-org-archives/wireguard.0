Return-Path: dave.taht@gmail.com
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
 [209.85.220.175])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id effee464
 for <wireguard@lists.zx2c4.com>;
 Thu, 29 Sep 2016 19:53:02 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id t7so88492807qkh.2
 for <wireguard@lists.zx2c4.com>; Thu, 29 Sep 2016 13:03:41 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9pvM_LZhT0VXGj+baUNXJXW1e97Akw3actPYa7_yYeCRg@mail.gmail.com>
References: <CAHmME9p7LbqwSxSXgyjcam5f1cS0yM3E4WuLKnk8Ffm1QhQ4=A@mail.gmail.com>
 <CAA93jw5Uv3bjXSvOnx0fcPYPjPVeVuHehYr4oHeHX+ED7c-2Ng@mail.gmail.com>
 <CAHmME9ps9AacMTk15+6NNZQ9dYi1jMw0Gm_S51PraEni=3Ki1A@mail.gmail.com>
 <CAA93jw7Lt5bq0ExfyhBmu7Lw1pdnPpebyG3v1pdtODsji88ABw@mail.gmail.com>
 <CAHmME9pvM_LZhT0VXGj+baUNXJXW1e97Akw3actPYa7_yYeCRg@mail.gmail.com>
From: Dave Taht <dave.taht@gmail.com>
Date: Thu, 29 Sep 2016 13:03:40 -0700
Message-ID: <CAA93jw4dbVM8ntF8L4+5hZjGP5_362-qa-WCURWUrZG-qsoPag@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] WireGuard ECN Implementation
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Thu, Sep 29, 2016 at 12:05 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrot=
e:
> On Thu, Sep 29, 2016 at 9:03 PM, Dave Taht <dave.taht@gmail.com> wrote:
>> that + 1 was clever. I think you are done... and I should go change the =
blog. :)
>
> Yea I like tricks like that. Anytime you have a range of values in the
> middle, you can just add, modulo, and check the end.

ok. I pushed an update to http://blog.cerowrt.org/post/wireguard/ - it
will take a while to be cache updated.

Now... as for the other stuff in that blog entry (I never got around
to writing parts II and III), I am curious as to your raw PPS with
small packets presently, and if you've figured out how to apply
fq_codel internally yet? :-P

Also the new pacing + bbr stuff coming out from google looks mighty
interesting, do you lose the tcp clock kept there?



--=20
Dave T=C3=A4ht
Let's go make home routers and wifi faster! With better software!
http://blog.cerowrt.org
