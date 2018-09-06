Return-Path: bounce+1a9445.bb0-wireguard=lists.zx2c4.com@poorlab.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 291d67e9
 for <wireguard@lists.zx2c4.com>; Thu, 6 Sep 2018 00:06:42 +0000 (UTC)
Received: from m32-4.eu.mailgun.net (m32-4.eu.mailgun.net [141.193.32.4])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7c507081
 for <wireguard@lists.zx2c4.com>; Thu, 6 Sep 2018 00:06:41 +0000 (UTC)
Sender: coder@poorlab.com
Received: by mail-qt0-f173.google.com with SMTP id m13-v6so10369262qth.1
 for <wireguard@lists.zx2c4.com>; Wed, 05 Sep 2018 17:06:45 -0700 (PDT)
MIME-Version: 1.0
From: StarBrilliant <coder@poorlab.com>
Date: Thu, 6 Sep 2018 10:06:07 +1000
Message-ID: <CA+7UkwLER55wRDfLT7gNH+cPwSW4ziD-L71HyPix_wXOKFsiWg@mail.gmail.com>
Subject: Let's talk about obfuscation again
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi,

(TL;DR: Please seriously consider preventing WG from being blocked,
for 2/3 of the world's Internet users. No need to break compatibility,
be friendly to PT plugins is a possible solution.)

I have been using WG for months. I understand the fact that Wireguard
wants to keep its protocol simple and easy to audit. I also understand
that we have talked about this topic back in 2016. [1]


## The problem: way too easy to block

I propose this issue again, because Wireguard has recently become a
hot topic in Chinese community with the most strict
<del>Internet</del> Intranet censorship in the world. Chinese
Wireguard users succeeded in access the Internet temporarily, but we
know Wireguard never tries to prevent itself from being blocked.

It is indeed very easy to completely block Wireguard protocol with iptables:
> iptables -A FORWARD -p udp -m length --length 120 -m u32 --u32 "0 >> 22 & 0x3c @ 8 = 0x2000000" -j DROP
(Yes, from prior experience of blocking TLS and OpenVPN, usually
Message ID 2 is blocked instead of Message ID 1, probably for the
intention to consume server resources.)

It is also possible to interfere with the keep-alive packet, since it
is "always on time like a bus" and exactly 32 bytes:
> iptables -A FORWARD -p udp -m length --length 60 -m u32 --u32 "0 >> 22 & 0x3c @ 8 = 0x4000000" -m statistic --mode random --probability 0.4 -j DROP


## But it's unrelated to WG's security model!

I heard someone saying something like below:

On Sat Jul 9 17:49:47 CEST 2016, Bruno Wolff III <bruno@wolff.to> wrote:
> Given the design goals of wireguard, I don't think it is something that would be particularly good to combine with steganography.
> We need real net neutrality, with ISPs not allowed to block traffic based on content.
> We need governments not passing laws to make people compromise their own security.
> Using strong unbreakable encryption when communicating, should be the norm, not something you need to hide.

I interpret those sentences as identical to "Do not use Wireguard if
you live in a country where unlicensed VPN is illegal. Go and ask for
net neutrality instead." But the fact is that 2/3 of the world's
Internet users [2] live in censorship. For most of them, unlicensed
VPN is their only weapon to fight for net neutrality.

The undoubted top-1 encrypted proxy software [3] in China was not
written by a crypto professional and even started with RC4-MD5, not
until 5 years later (2017) did it have AEAD cipher.

People love Wireguard because of its security, flexibility and
efficiency, but only when it can work. It is useless to talk about
security if it does not work.


## Can we solve the problem easily?

What makes Wireguard easy to detect?
- Fixed first 4 bytes
  (0x01000000 through 0x04000000)
- Plaintext nounce counter
  (Could XChaCha20 solve the problem?)
- Fixed sender & receiver ID
  (Two-pass encrypt might work, see below)
- Fixed length handshake & keep-alive
  (148, 92, 32. can we pad them longer?)
- Punctual rekey & keep-alive
  (Can we delay them randomly as IPsec do?)

How can we solve the problem?
- Embed steganography inside Wireguard?
  (Not realistic. Big codebase, potential bugs.)
- Two-pass encrypt so no more plaintext handshake?
  The outer layer could be PSK and does not need to be PFS.
  (Possible but slow. PSK can be shared among sessions, like L2TP/IPsec do.)
- Remain plaintext, but fix padding and timing problem,
  relying Pluggable Transport [4] plugins to do the remaining work.
  (I really recommend this solution.)

I read the tech whitepaper multiple times. I think it is possible
solve the problem in Method 3 without breaking any compatibility. For
Message ID = 1, 2, 3, we can add random data at the end of the packet.
For Message ID = 4 and Length = 0 (keep-alive packet), we can add more
zeros in the encapsulated packet. For the timing problem, we can give
rekey and keep-alive a little bit randomness.

In conclusion, I think we do not need to break the compatibility or
bloat the code base to make Wireguard immune to being detected. We
could either two-pass encrypt the packet, or solve the padding and
timing problem so PT plugins can run on top of it. I hope to see
Wireguard run anywhere without worries, not only on devices owned by
1/3 of the Internet's population.


## Notes

[1] https://lists.zx2c4.com/pipermail/wireguard/2016-July/000184.html
[2] https://www.theverge.com/2016/11/14/13596974/
[3] https://github.com/shadowsocks/shadowsocks (Please switch git branch to see
    the actual code)
[4] https://www.torproject.org/docs/pluggable-transports.html.en#list-of-pts


Best regards.
