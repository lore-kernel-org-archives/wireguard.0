Return-Path: dave.taht@gmail.com
Received: from mail-qt0-f170.google.com (mail-qt0-f170.google.com
 [209.85.216.170])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 568ee02b
 for <wireguard@lists.zx2c4.com>; Wed, 7 Dec 2016 18:23:25 +0000 (UTC)
Received: by mail-qt0-f170.google.com with SMTP id n6so387583653qtd.1
 for <wireguard@lists.zx2c4.com>; Wed, 07 Dec 2016 10:28:51 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <e1f43ccf-85eb-8ad5-9bde-8332218fe3f8@mib-infotech.co.nz>
References: <CAHmME9q_HCBTx9K47LQxQcS8qCSfecudG=haMeuBAzJDvoOOEg@mail.gmail.com>
 <e1f43ccf-85eb-8ad5-9bde-8332218fe3f8@mib-infotech.co.nz>
From: Dave Taht <dave.taht@gmail.com>
Date: Wed, 7 Dec 2016 10:28:50 -0800
Message-ID: <CAA93jw5c4WM8zJq5Rdm5c0958cNmtGvAQ-Jjp+ALaz0oE_uCiQ@mail.gmail.com>
Subject: Re: Odd length headers and alignment
To: John Huttley <john@mib-infotech.co.nz>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Instruction traps are really bad news on mips. We had to expressly
patch the entire linux kernel stack in the openwrt project to shift to
shorter loads on some arches (because other things come through the
stack, misaligned).

The fix was pretty simple tho, you just declare the relevant struct

__attribute__((packed, aligned(2)));

(see http://git.razvi.ro/?p=3Dopenwrt.git&a=3Dcommitdiff&h=3Dc0bcd44660e5ff=
27068bbcc1a5e3ee5f2483a9c3
)

Still, I'd support a pad.

On Wed, Dec 7, 2016 at 10:17 AM, John Huttley <john@mib-infotech.co.nz> wro=
te:
> I think an extra byte would be a great idea.
> We can use that in the future to implement a user space
> IUnknown/O_PONIES  end to end negotiation
>
> --John
>
>
>
> On 8/12/2016 7:11 a.m., Jason A. Donenfeld wrote:
>> Hey guys,
>>
>> Wireguard data packets have a 1 byte type, a 4 byte index, an 8 byte
>> nonce, the ciphertext, and then a 16 byte auth tag. Having 13 bytes in
>> the beginning means that when we do in-place decryption, the plaintext
>> winds up starting at an odd-byte, transferring misalignment down to
>> the rest of the stack.
>>
>> Now, in my testing on alignment-sensitive MIPS boxes, I've only had
>> alignment exceptions with this regarding the first byte, which is the
>> version number of the IP header. Since this is just a single byte, the
>> alignment doesn't actually matter. But in practice, the compiler
>> generates a 16-bit load instead of an 8-bit load, which sucks. I may
>> be able to work around this though. Beyond that, I haven't actually
>> observed exceptions from elsewhere in the stack regarding
>> misalignment.
>>
>> So, how much of a problem do you suppose this is? Would it be
>> worthwhile to stick an _extra byte_ in the header, just to get even
>> alignment? Or an extra three bytes to get 16-byte alignment? Or do you
>> suppose this isn't really worth the bloat and MTU loss?
>>
>> Just something to think about...
>>
>> Jason
>> _______________________________________________
>> WireGuard mailing list
>> WireGuard@lists.zx2c4.com
>> https://lists.zx2c4.com/mailman/listinfo/wireguard
>>
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard



--=20
Dave T=C3=A4ht
Let's go make home routers and wifi faster! With better software!
http://blog.cerowrt.org
