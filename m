Return-Path: john@mib-infotech.co.nz
Received: from mail-pg0-f53.google.com (mail-pg0-f53.google.com [74.125.83.53])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0a4ca9f4
 for <wireguard@lists.zx2c4.com>; Wed, 7 Dec 2016 18:14:50 +0000 (UTC)
Received: by mail-pg0-f53.google.com with SMTP id f188so163996256pgc.3
 for <wireguard@lists.zx2c4.com>; Wed, 07 Dec 2016 10:20:16 -0800 (PST)
Return-Path: <john@mib-infotech.co.nz>
Received: from ?IPv6:2001:4428:200:8171:5ce4:cf2b:3df:a171?
 ([2001:4428:200:8171:5ce4:cf2b:3df:a171])
 by smtp.googlemail.com with ESMTPSA id 71sm44325431pft.25.2016.12.07.10.20.12
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Dec 2016 10:20:14 -0800 (PST)
Subject: Re: Odd length headers and alignment
To: wireguard@lists.zx2c4.com
References: <CAHmME9q_HCBTx9K47LQxQcS8qCSfecudG=haMeuBAzJDvoOOEg@mail.gmail.com>
From: John Huttley <john@mib-infotech.co.nz>
Message-ID: <e1f43ccf-85eb-8ad5-9bde-8332218fe3f8@mib-infotech.co.nz>
Date: Thu, 8 Dec 2016 07:17:59 +1300
MIME-Version: 1.0
In-Reply-To: <CAHmME9q_HCBTx9K47LQxQcS8qCSfecudG=haMeuBAzJDvoOOEg@mail.gmail.com>
Content-Type: text/plain; charset=windows-1252
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

I think an extra byte would be a great idea.
We can use that in the future to implement a user space
IUnknown/O_PONIES  end to end negotiation

--John



On 8/12/2016 7:11 a.m., Jason A. Donenfeld wrote:
> Hey guys,
> 
> Wireguard data packets have a 1 byte type, a 4 byte index, an 8 byte
> nonce, the ciphertext, and then a 16 byte auth tag. Having 13 bytes in
> the beginning means that when we do in-place decryption, the plaintext
> winds up starting at an odd-byte, transferring misalignment down to
> the rest of the stack.
> 
> Now, in my testing on alignment-sensitive MIPS boxes, I've only had
> alignment exceptions with this regarding the first byte, which is the
> version number of the IP header. Since this is just a single byte, the
> alignment doesn't actually matter. But in practice, the compiler
> generates a 16-bit load instead of an 8-bit load, which sucks. I may
> be able to work around this though. Beyond that, I haven't actually
> observed exceptions from elsewhere in the stack regarding
> misalignment.
> 
> So, how much of a problem do you suppose this is? Would it be
> worthwhile to stick an _extra byte_ in the header, just to get even
> alignment? Or an extra three bytes to get 16-byte alignment? Or do you
> suppose this isn't really worth the bloat and MTU loss?
> 
> Just something to think about...
> 
> Jason
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
> 
