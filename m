Return-Path: dkg@fifthhorseman.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dcd88138
 for <wireguard@lists.zx2c4.com>; Thu, 2 Mar 2017 01:37:49 +0000 (UTC)
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f57a2b78
 for <wireguard@lists.zx2c4.com>; Thu, 2 Mar 2017 01:37:49 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: James Wilson <ehdot795@gmail.com>, wireguard@lists.zx2c4.com
Subject: Re: Encapsulation
In-Reply-To: <CACCLhZQtterheuB9NF4ppEAYbLKXtsPzCEnMGdtAS5KKVfPEjQ@mail.gmail.com>
References: <CACCLhZQtterheuB9NF4ppEAYbLKXtsPzCEnMGdtAS5KKVfPEjQ@mail.gmail.com>
Date: Wed, 01 Mar 2017 17:38:01 -0800
Message-ID: <871sugpifa.fsf@alice.fifthhorseman.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Wed 2017-03-01 16:38:05 -0800, James Wilson wrote:
> Hi,
>
> Just out of curiosity, how does a "wireguard packet' look like on the wire
> ??
>
> I'm guessing:
>
>  Ethernet
>  IP
>  UDP
> |------------------|
> | IP               |
> | WG payload       |
> |------------------|
>
>
> What's in the box is encrypted
>
> Is that right ?? If not, what does it look like?

I believe the cleartext (after decryption) is an actual IP packet, so
everything from layer3 up the stack.


If anyone wants to document this sort of thing explicitly in a useful
way, you might consider writing a wireshark dissector:

  https://www.wireshark.org/docs/wsdg_html_chunked/ChDissectAdd.html

and you can clone wireshark's source with:

   git clone https://code.wireshark.org/review/wireshark

The simplest thing would be to start with a dissector for the ciphertext
itself, for the few pieces of metadata that are outside the encrypted
packet (see e.g. §5.4.2 of
https://www.wireguard.io/papers/wireguard.pdf)

If you want to get more clever, you could add a mechanism to the
wireguard module to extract session keys, and then make a decryptor
plugin to wireshark. But start with just the ciphertext ;)

      --dkg
