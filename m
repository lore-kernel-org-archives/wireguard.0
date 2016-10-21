Return-Path: toke@toke.dk
Received: from mail2.tohojo.dk (mail2.tohojo.dk [77.235.48.147])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4ab8e1f6
 for <wireguard@lists.zx2c4.com>;
 Fri, 21 Oct 2016 09:52:12 +0000 (UTC)
Sender: toke@toke.dk
From: =?utf-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <87mvi0jxsb.fsf@toke.dk>
 <58096029.23859.5C451AE@pageexec.gmail.com>
 <CAHmME9opbKv9c67uCk69K_J3=A0-8p0gkwmJos83wBiMJ9WmCw@mail.gmail.com>
 <5809CB98.15179.767FB18@pageexec.gmail.com>
 <CAHmME9oAnWiN8fx5dGP6+i+rTdxH4fMfxmbsr56Ey7viBwiL-Q@mail.gmail.com>
Date: Fri, 21 Oct 2016 11:53:14 +0200
In-Reply-To: <CAHmME9oAnWiN8fx5dGP6+i+rTdxH4fMfxmbsr56Ey7viBwiL-Q@mail.gmail.com>
 (Jason A. Donenfeld's message of "Fri, 21 Oct 2016 17:47:52 +0900")
Message-ID: <87bmyet4dx.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Emese Revfy <re.emese@gmail.com>, Pipacs <pageexec@gmail.com>,
 Brad Spengler <spender@grsecurity.net>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Error building against grsec-enabled kernel
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

"Jason A. Donenfeld" <Jason@zx2c4.com> writes:

> On Fri, Oct 21, 2016 at 5:02 PM, PaX Team <pageexec@gmail.com> wrote:
>> are you sure it was for satisfying PaX only and not a bug itself? :)
>
> Blurg. I was overly hasty. Note to self: do not prepare conf
> presentations and push code at the same time. Indeed this /should/ be
> ~0, which means "unset". I can't see any bugs by making it 0, but it
> would make things "semantically incorrect", I think.
>
> So the bug is actually in the ipv6 fragmentation code. I just sent a
> patch upstream and CC'd you and Emese.

Wooh! FYI I was seeing the bug being triggered on IPv4 as well...

-Toke
