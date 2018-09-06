Return-Path: stromberg@mullvad.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 417e22c0
 for <wireguard@lists.zx2c4.com>; Thu, 6 Sep 2018 15:19:45 +0000 (UTC)
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fd2eb01b
 for <wireguard@lists.zx2c4.com>; Thu, 6 Sep 2018 15:19:45 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id w11-v6so11843816wrc.5
 for <wireguard@lists.zx2c4.com>; Thu, 06 Sep 2018 08:20:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <706D2A48-7DAA-436A-BB99-2AE80822B524@gmail.com>
References: <CA+7UkwLER55wRDfLT7gNH+cPwSW4ziD-L71HyPix_wXOKFsiWg@mail.gmail.com>
 <20180906094330.273b07be@T-200>
 <706D2A48-7DAA-436A-BB99-2AE80822B524@gmail.com>
From: =?UTF-8?Q?Fredrik_Str=C3=B6mberg?= <stromberg@mullvad.net>
Date: Thu, 6 Sep 2018 17:19:57 +0200
Message-ID: <CANTUoeduZaKnONmZ5tKBm0mCV98MSV4_o0kYJOxEkKo8-FW4sA@mail.gmail.com>
Subject: Re: Let's talk about obfuscation again
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi everyone,

First of all, censorship circumvention is an important societal
problem to solve. It is also clearly outside of the scope of
WireGuard. Any suggested protocol change with that motive will
increase the complexity of the code base, which increases the risk of
vulnerabilities. This would hurt all WireGuard users.

Secondly, the experience from Tor's Pluggable Transports, Psiphon,
Lantern, and various VPN services, clearly shows that DPI
circumvention methods need to be updated regularly. Whatever ideas you
have will be fingerprinted and blocked eventually.

Using Pluggable Transports seem like a good solution. Simply divert
WireGuard traffic to a local UDP port, which then sends it using a
Pluggable Transport over the Internet to the other WireGuard peer.

StarBrilliant: You indicated that some aspect of WireGuard ("solve the
padding and timing problem so PT plugins can run on top of it")
prevents Pluggable Transports from working. Please elaborate.

Cheers,
Fredrik Stromberg

On Thu, Sep 6, 2018 at 4:45 PM, George Walker <georgewalkeriv@gmail.com> wr=
ote:
> The userspace daemon would:
>    - 'Clean' Wireguard [handshake/data] packets
>
>
> The objective of cleaning as described seems to be to make the protocol
> indistinguishable from exchanging random payloads. But are there any comm=
on
> protocols of commercial importance that are so inscrutable? If I saw such
> random-looking UDP payloads on the wire I would suspect malware c&c, file
> sharing (who remembers FreeNet?), or a tunnel, depending on data volume a=
nd
> direction =E2=80=94nothing I would hesitate to block (or flag as suspicio=
us) if I
> were running a big traffic classifier.
>
> Domain fronting seems like the stealthiest option to me (and if anyone ha=
s a
> reliable way to detect domain fronting, I would love to hear about it!). =
But
> that doesn=E2=80=99t get you UDP (and NAT traversal); perhaps VOIP/WebRTC=
 mimicry
> could work?
>
>
> Best,
> George
>
>
> Sent from my iPhone
>
> On Sep 6, 2018, at 4:43 AM, Dennis Jackson <dennis.jackson@cs.ox.ac.uk>
> wrote:
>
> Hi,
>
> I've been thinking about this issue as well and I agree it's an
> important one to solve. However, Wireguard's key selling points are its
> performance, simple configuration and minimal code size and I don't
> think we can compromise this. So I was wondering if a userspace program
> which obfuscates outgoing Wireguard packets and de-obfuscates incoming
> packets might solve the problem, without impacting Wireguard's key
> features.
>
> The userspace daemon would:
>    - 'Clean' Wireguard handshake packets,
>        * Randomise the packet type field
>        * Convert the ephemeral key to Elligator encoding
>        * Randomise the mac field if unused
>        * Random padding to alter packet lengths
>    - 'Clean' Data packets
>        * The header is exactly 16 bytes and non-repeating so
>          transform with AES-ECB
>        * The key could be derived from a PSK and the public
>          keys used in the handshake (ensuring keys don't
>          repeat)
>        * Or Wireguard could provide a hook for a "post-master
>          secret" which might be useful for many extensions
>    - The resulting stream would (hopefully) be uniformly
>      distributed which can either be transmitted directly or
>      passed to a pluggable transport.
>    - On the receiving end the daemon reverses the transformation
>      and delivers the packets to Wireguard.
>
> Outcome:
>    + Clear separation between codebases
>    + No matter how badly implemented, the userspace daemon can't
>      compromise authenticity or confidentiality.
>    + Easily extensible
>    + Wireguard doesn't need to know about the transformation, it
>      just sends its packets to a listener on the loopback
>      interface.
>    - Performance hit from the packet indirection, ECB encryption
>      etc
>    - Still needs Wireguard to disable cookies, add timing jitter
>      on handshake / keep-alive packets.
>
> I'm sure there are alternatives/better solutions. This is just a
> sketch to show it is possible without altering Wireguard's codebase or
> functionality. If you have any comments or criticism, I'd be interested
> in refining the idea further.
>
> Kind regards,
> Dennis
>
> On Thu, 6 Sep 2018 10:06:07 +1000
> StarBrilliant <coder@poorlab.com> wrote:
>
> Hi,
>
>
> (TL;DR: Please seriously consider preventing WG from being blocked,
>
> for 2/3 of the world's Internet users. No need to break compatibility,
>
> be friendly to PT plugins is a possible solution.)
>
>
> I have been using WG for months. I understand the fact that Wireguard
>
> wants to keep its protocol simple and easy to audit. I also understand
>
> that we have talked about this topic back in 2016. [1]
>
>
>
> ## The problem: way too easy to block
>
>
> I propose this issue again, because Wireguard has recently become a
>
> hot topic in Chinese community with the most strict
>
> <del>Internet</del> Intranet censorship in the world. Chinese
>
> Wireguard users succeeded in access the Internet temporarily, but we
>
> know Wireguard never tries to prevent itself from being blocked.
>
>
> It is indeed very easy to completely block Wireguard protocol with
>
> iptables:
>
> iptables -A FORWARD -p udp -m length --length 120 -m u32 --u32 "0
>
> 22 & 0x3c @ 8 =3D 0x2000000" -j DROP
>
> (Yes, from prior experience of blocking TLS and OpenVPN, usually
>
> Message ID 2 is blocked instead of Message ID 1, probably for the
>
> intention to consume server resources.)
>
>
> It is also possible to interfere with the keep-alive packet, since it
>
> is "always on time like a bus" and exactly 32 bytes:
>
> iptables -A FORWARD -p udp -m length --length 60 -m u32 --u32 "0 >>
>
> 22 & 0x3c @ 8 =3D 0x4000000" -m statistic --mode random --probability
>
> 0.4 -j DROP
>
>
>
> ## But it's unrelated to WG's security model!
>
>
> I heard someone saying something like below:
>
>
> On Sat Jul 9 17:49:47 CEST 2016, Bruno Wolff III <bruno@wolff.to>
>
> wrote:
>
> Given the design goals of wireguard, I don't think it is something
>
> that would be particularly good to combine with steganography. We
>
> need real net neutrality, with ISPs not allowed to block traffic
>
> based on content. We need governments not passing laws to make
>
> people compromise their own security. Using strong unbreakable
>
> encryption when communicating, should be the norm, not something
>
> you need to hide.
>
>
> I interpret those sentences as identical to "Do not use Wireguard if
>
> you live in a country where unlicensed VPN is illegal. Go and ask for
>
> net neutrality instead." But the fact is that 2/3 of the world's
>
> Internet users [2] live in censorship. For most of them, unlicensed
>
> VPN is their only weapon to fight for net neutrality.
>
>
> The undoubted top-1 encrypted proxy software [3] in China was not
>
> written by a crypto professional and even started with RC4-MD5, not
>
> until 5 years later (2017) did it have AEAD cipher.
>
>
> People love Wireguard because of its security, flexibility and
>
> efficiency, but only when it can work. It is useless to talk about
>
> security if it does not work.
>
>
>
> ## Can we solve the problem easily?
>
>
> What makes Wireguard easy to detect?
>
> - Fixed first 4 bytes
>
>  (0x01000000 through 0x04000000)
>
> - Plaintext nounce counter
>
>  (Could XChaCha20 solve the problem?)
>
> - Fixed sender & receiver ID
>
>  (Two-pass encrypt might work, see below)
>
> - Fixed length handshake & keep-alive
>
>  (148, 92, 32. can we pad them longer?)
>
> - Punctual rekey & keep-alive
>
>  (Can we delay them randomly as IPsec do?)
>
>
> How can we solve the problem?
>
> - Embed steganography inside Wireguard?
>
>  (Not realistic. Big codebase, potential bugs.)
>
> - Two-pass encrypt so no more plaintext handshake?
>
>  The outer layer could be PSK and does not need to be PFS.
>
>  (Possible but slow. PSK can be shared among sessions, like
>
> L2TP/IPsec do.)
>
> - Remain plaintext, but fix padding and timing problem,
>
>  relying Pluggable Transport [4] plugins to do the remaining work.
>
>  (I really recommend this solution.)
>
>
> I read the tech whitepaper multiple times. I think it is possible
>
> solve the problem in Method 3 without breaking any compatibility. For
>
> Message ID =3D 1, 2, 3, we can add random data at the end of the packet.
>
> For Message ID =3D 4 and Length =3D 0 (keep-alive packet), we can add mor=
e
>
> zeros in the encapsulated packet. For the timing problem, we can give
>
> rekey and keep-alive a little bit randomness.
>
>
> In conclusion, I think we do not need to break the compatibility or
>
> bloat the code base to make Wireguard immune to being detected. We
>
> could either two-pass encrypt the packet, or solve the padding and
>
> timing problem so PT plugins can run on top of it. I hope to see
>
> Wireguard run anywhere without worries, not only on devices owned by
>
> 1/3 of the Internet's population.
>
>
>
> ## Notes
>
>
> [1] https://lists.zx2c4.com/pipermail/wireguard/2016-July/000184.html
>
> [2] https://www.theverge.com/2016/11/14/13596974/
>
> [3] https://github.com/shadowsocks/shadowsocks (Please switch git
>
> branch to see the actual code)
>
> [4]
>
> https://www.torproject.org/docs/pluggable-transports.html.en#list-of-pts
>
>
>
> Best regards.
>
> _______________________________________________
>
> WireGuard mailing list
>
> WireGuard@lists.zx2c4.com
>
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>
>
>
>
> --
> PGP Fingerprint: 5B93 F0B9 D6A8 9BC1 546B C98C 6105 A775 8CD2 46AC
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>
