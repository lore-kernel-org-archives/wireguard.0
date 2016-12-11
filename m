Return-Path: andrew@lunn.ch
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 15f25812
 for <wireguard@lists.zx2c4.com>;
 Sun, 11 Dec 2016 15:24:49 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [178.209.37.122])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eac63ab0
 for <wireguard@lists.zx2c4.com>;
 Sun, 11 Dec 2016 15:24:49 +0000 (UTC)
Date: Sun, 11 Dec 2016 16:30:27 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Misalignment, MIPS, and ip_hdr(skb)->version
Message-ID: <20161211153027.GD29761@lunn.ch>
References: <CAHmME9o_eCNXpVztOZKW55kpRtE+1KSEQTQOjUBVn68Y2+or2g@mail.gmail.com>
 <095cac5b-b757-6f4a-e699-8eedf9ed7221@stressinduktion.org>
 <87vauvhwdu.fsf@alice.fifthhorseman.net>
 <CE942916-BF45-44CC-A5F5-3838CF9C93BC@danrl.com>
 <20161211071501.GA32621@kroah.com>
 <CAHmME9q5ifwwishXjXYE3J=sVeR4jYY9fLUgs_FHCP594EZr6g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAHmME9q5ifwwishXjXYE3J=sVeR4jYY9fLUgs_FHCP594EZr6g@mail.gmail.com>
Cc: linux-mips@linux-mips.org,
 =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>,
 LKML <linux-kernel@vger.kernel.org>, Jiri Benc <jbenc@redhat.com>,
 David Miller <davem@davemloft.net>,
 Hannes Frederic Sowa <hannes@stressinduktion.org>,
 Netdev <netdev@vger.kernel.org>, Willy Tarreau <w@1wt.eu>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Felix Fietkau <nbd@nbd.name>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

> 3. Add 3 bytes of padding, set to zero, to the encrypted section just
> before the IP header, marked for future use.
> Pros: satisfies IETF mantras, can use those extra bits in the future
> for interesting protocol extensions for authenticated peers.
> Cons: lowers MTU, marginally more difficult to implement but still
> probably just one or two lines of code.

I'm not a crypto expert, but does this not give you a helping hand in
breaking the crypto? You know the plain text value of these bytes, and
where they are in the encrypted text.

      Andrew
