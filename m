Return-Path: pageexec@gmail.com
Received: from r00tworld.com (r00tworld.com [212.85.137.150])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 59dfdd09
 for <wireguard@lists.zx2c4.com>;
 Fri, 21 Oct 2016 09:45:13 +0000 (UTC)
From: "PaX Team" <pageexec@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 21 Oct 2016 11:46:08 +0200
MIME-Version: 1.0
Message-ID: <5809E3E0.20338.7C6D35E@pageexec.gmail.com>
In-reply-to: <CAHmME9oAnWiN8fx5dGP6+i+rTdxH4fMfxmbsr56Ey7viBwiL-Q@mail.gmail.com>
References: <87mvi0jxsb.fsf@toke.dk>,
 <5809CB98.15179.767FB18@pageexec.gmail.com>,
 <CAHmME9oAnWiN8fx5dGP6+i+rTdxH4fMfxmbsr56Ey7viBwiL-Q@mail.gmail.com>
Content-type: text/plain; charset=US-ASCII
Cc: Emese Revfy <re.emese@gmail.com>,
 =?UTF-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
 Brad Spengler <spender@grsecurity.net>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Error building against grsec-enabled kernel
Reply-To: pageexec@gmail.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 21 Oct 2016 at 17:47, Jason A. Donenfeld wrote:

> On Fri, Oct 21, 2016 at 5:02 PM, PaX Team <pageexec@gmail.com> wrote:
> > are you sure it was for satisfying PaX only and not a bug itself? :)
> 
> Blurg. I was overly hasty. Note to self: do not prepare conf
> presentations and push code at the same time. Indeed this /should/ be
> ~0, which means "unset". I can't see any bugs by making it 0, but it
> would make things "semantically incorrect", I think.
> 
> So the bug is actually in the ipv6 fragmentation code. I just sent a
> patch upstream and CC'd you and Emese.

thanks, i'm wondering if the tree should be audited for similar cases as we
have open issues that have the same symptom (and ideally such fields changes
would be done in accessor functions...). btw, your second submission has a
few extra hunks disclosing debug code and full paths on your system, you probably
didn't intend it ;).

> I'll use CONFIG_PAX_CONSTIFY_PLUGIN.

in general, plugin dependence should be expressed by plugin specific defines
(CONSTIFY_PLUGIN in your case) and not by the config option as the two may
not always correlate (e.g., it used to be possible to compile the kernel with
a plugin-incapable gcc while enabling plugin dependent features and in such
cases depending on the config option could produce unintended results).

> Upstream uses __read_mostly for that structure always, everywhere else.

FYI, i added detection for such cases in the plugin but it'd also be possible to
simply override these interfering section attributes. i went with the compile
error instead of the fixup as this way people pay attention (and i'm forced
to fix the fallout in PaX) but it's also less convenient for out-of-tree code...
