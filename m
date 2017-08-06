Return-Path: lazyvirus@gmx.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d834a687
 for <wireguard@lists.zx2c4.com>; Sun, 6 Aug 2017 20:48:49 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c4d40856
 for <wireguard@lists.zx2c4.com>; Sun, 6 Aug 2017 20:48:49 +0000 (UTC)
Date: Sun, 6 Aug 2017 23:10:21 +0200
From: Bzzzz <lazyvirus@gmx.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Many users
Message-ID: <20170806231021.3482e97c@msi.defcon1>
In-Reply-To: <20170806205739.GA3134@zx2c4.com>
References: <20170806210237.4dbbed42@msi.defcon1>
 <CAHmME9op6iHuOxRHaRvgmKetoMEM1RtY=x7S_Fug=6m6CpWGfg@mail.gmail.com>
 <20170806223412.0f22e55a@msi.defcon1>
 <20170806205739.GA3134@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Sun, 6 Aug 2017 22:57:42 +0200
"Jason A. Donenfeld" <Jason@zx2c4.com> wrote:

> On Sun, Aug 06, 2017 at 10:34:12PM +0200, Bzzzz wrote:
> > I guess, when you're talking about "thousands of interfaces", you
> > mean virtual ones ? Do you recall how many machines he was using ?  
> 
> On the same machine, I mean.

Now I'm sure.

> I guess you could simulate this kind of thing with:
> 
> printf '[Interface]\nPrivateKey=%s\n' "$(wg genkey)" > conf
> head -c $(( 33 * 10000 )) /dev/urandom | base64 | tr -d '\n' | fold -b
> -w 44 | sed -n 's/\(.*\)../[Peer]\nPublicKey=\1A=/p' >> conf for i in
> {1..10000}; do ip link add wg$i type wireguard; wg setconf
> wg$i ./conf; done

Nice piece of code.

> Careful, though!
> 
> > 
> > BTW, for such cases may be it could be interesting to link WG to a
> > sqlite DB ?  
> 
> I've actually got something for this coming through the pipeline soon.
> I'll keep the list posted when it's ready.

Now, THIS will be a very nice thing - and so much better when
adding|removing a user than a huge configuration file.

As there's no real hurry, I'll wait for this feature to appear.

Thanks for your answers.

JY
