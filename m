Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 83827ad6
 for <wireguard@lists.zx2c4.com>;
 Sun, 11 Dec 2016 15:31:08 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f874be10
 for <wireguard@lists.zx2c4.com>;
 Sun, 11 Dec 2016 15:31:08 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2f10f90e
 for <wireguard@lists.zx2c4.com>;
 Sun, 11 Dec 2016 15:31:08 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 64d4ecd8
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 11 Dec 2016 15:31:07 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id f82so32618151wmf.1
 for <wireguard@lists.zx2c4.com>; Sun, 11 Dec 2016 07:37:02 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20161211153027.GD29761@lunn.ch>
References: <CAHmME9o_eCNXpVztOZKW55kpRtE+1KSEQTQOjUBVn68Y2+or2g@mail.gmail.com>
 <095cac5b-b757-6f4a-e699-8eedf9ed7221@stressinduktion.org>
 <87vauvhwdu.fsf@alice.fifthhorseman.net>
 <CE942916-BF45-44CC-A5F5-3838CF9C93BC@danrl.com>
 <20161211071501.GA32621@kroah.com>
 <CAHmME9q5ifwwishXjXYE3J=sVeR4jYY9fLUgs_FHCP594EZr6g@mail.gmail.com>
 <20161211153027.GD29761@lunn.ch>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 11 Dec 2016 16:37:00 +0100
Message-ID: <CAHmME9qKiAb3s98=-5PRuBWyQYECq_U56jTODSyiU_A=cuwYHQ@mail.gmail.com>
Subject: Re: Misalignment, MIPS, and ip_hdr(skb)->version
To: Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mips@linux-mips.org,
 =?UTF-8?B?TcOlbnMgUnVsbGfDpXJk?= <mans@mansr.com>,
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

On Sun, Dec 11, 2016 at 4:30 PM, Andrew Lunn <andrew@lunn.ch> wrote:
> I'm not a crypto expert, but does this not give you a helping hand in
> breaking the crypto? You know the plain text value of these bytes, and
> where they are in the encrypted text.

You also know with some probability that there's going to be an IP
header and a TCP header, each with predictable fields. Maybe you're
reasonably certain there's an HTTP header in there too. Gasp! But fear
not...

Symmetric ciphers are generally not considered secure if they fall to
what's called a "known plaintext attack". Fortunately, modern ciphers
like AES and ChaCha20 and most others that you're aware of are
generally believed to be secure against KPA.
