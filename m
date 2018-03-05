Return-Path: symgryph@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c6a3480c
 for <wireguard@lists.zx2c4.com>; Mon, 5 Mar 2018 22:31:04 +0000 (UTC)
Received: from mail-qt0-f171.google.com (mail-qt0-f171.google.com
 [209.85.216.171])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fb6e7dfc
 for <wireguard@lists.zx2c4.com>; Mon, 5 Mar 2018 22:31:04 +0000 (UTC)
Received: by mail-qt0-f171.google.com with SMTP id v90so22326385qte.12
 for <wireguard@lists.zx2c4.com>; Mon, 05 Mar 2018 14:40:21 -0800 (PST)
Return-Path: <symgryph@gmail.com>
Received: from [10.14.149.90] ([8.42.18.7])
 by smtp.gmail.com with ESMTPSA id m78sm2495150qke.8.2018.03.05.14.40.20
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 05 Mar 2018 14:40:20 -0800 (PST)
From: Thomas Munn <symgryph@gmail.com>
Content-Type: multipart/alternative;
 boundary=Apple-Mail-C6E14A04-BF44-42FD-B972-E1A0B81B2B7D
Mime-Version: 1.0 (1.0)
Date: Mon, 5 Mar 2018 17:40:19 -0500
Subject: Re: WireGuard Digest, Vol 24, Issue 4
Message-Id: <6E740604-EC34-4F3B-B790-A9A97C53A209@gmail.com>
References: <mailman.1.1520247601.29698.wireguard@lists.zx2c4.com>
In-Reply-To: <mailman.1.1520247601.29698.wireguard@lists.zx2c4.com>
To: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--Apple-Mail-C6E14A04-BF44-42FD-B972-E1A0B81B2B7D
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

what is the go and rust git uri?

Thomas J Munn


> On Mar 5, 2018, at 06:00, wireguard-request@lists.zx2c4.com wrote:
>=20
> Send WireGuard mailing list submissions to
>    wireguard@lists.zx2c4.com
>=20
> To subscribe or unsubscribe via the World Wide Web, visit
>    https://lists.zx2c4.com/mailman/listinfo/wireguard
> or, via email, send a message with subject or body 'help' to
>    wireguard-request@lists.zx2c4.com
>=20
> You can reach the person managing the list at
>    wireguard-owner@lists.zx2c4.com
>=20
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of WireGuard digest..."
>=20
>=20
> Today's Topics:
>=20
>   1. [ANNOUNCE] WireGuard Snapshot `0.0.20180304` Available
>      (Jason A. Donenfeld)
>   2. Tunsafe Windows client for wireguard (not opensource yet they
>      say (Henrique Carrega)
>   3. Re: Tunsafe Windows client for wireguard (not opensource yet
>      they say (Jason A. Donenfeld)
>=20
>=20
> ----------------------------------------------------------------------
>=20
> Message: 1
> Date: Sun, 04 Mar 2018 18:54:23 +0100
> From: "Jason A. Donenfeld" <Jason@zx2c4.com>
> To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
> Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20180304` Available
> Message-ID: <b97b4ced2749b831@frisell.zx2c4.com>
> Content-Type: text/plain; charset=3DUTF-8
>=20
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA256
>=20
> Hello,
>=20
> A new snapshot, `0.0.20180304`, has been tagged in the git repository.
>=20
> Please note that this snapshot is, like the rest of the project at this po=
int
> in time, experimental, and does not consitute a real release that would be=

> considered secure and bug-free. WireGuard is generally thought to be fairl=
y
> stable, and most likely will not crash your computer (though it may).
> However, as this is a pre-release snapshot, it comes with no guarantees, a=
nd
> its security is not yet to be depended on; it is not applicable for CVEs.
>=20
> With all that said, if you'd like to test this snapshot out, there are a
> few relevent changes.
>=20
> =3D=3D Changes =3D=3D
>=20
>  * NOTICE: off the grid
>=20
>  Do note that I'll be going off the grid from the end of this coming week u=
ntil
>  April 1. This snapshot is expected to be fairly stable in the interim.
>=20
>  * queueing: skb_reset: mark as xnet
>=20
>  This allows cgroups to classify packets.
>=20
>  * contrib: embedded-wg-library: add ability to add and del interfaces
>  * contrib: embedded-wg-library: add key generation functions
>=20
>  The embeddable library gains a few extra tricks, for people implementing
>  plugins for various network managers.
>=20
>  * crypto: read only after init
>  * allowedips: fix comment style
>  * messages: MESSAGE_TOTAL is unused
>  * global: in gnu code, use un-underscored asm
>  * noise: fix function prototype
>=20
>  Small cleanups.
>=20
>  * compat: workaround netlink refcount bug
>=20
>  An upstream refcounting bug meant that in certain situations it became
>  impossible to unload the module. So, we work around it in the compat code=
. The
>  problem has been fixed in 4.16.
>=20
>  * contrib: keygen-html: rewrite in pure javascript
>  * Revert "contrib: keygen-html: rewrite in pure javascript"
>=20
>  We nearly moved away from emscripten'ing the fiat32 code, but the resulta=
nt
>  floating point javascript was just too terrifying.
>=20
>  * Kconfig: require DST_CACHE explicitly
>=20
>  Required for certain frankenkernels.
>=20
>  * compat: use correct -include path
>=20
>  Fixes certain out-of-tree build systems.
>=20
>  * noise: align static_identity keys
>=20
>  Gives us better alignment of private keys.
>=20
>  * wg-quick: if resolvconf/interface-order exists, use it
>  * wg-quick: if resolvconf/run/iface exists, use it
>=20
>  Better compatibility with Debian's resolvconf.
>=20
>  * contrib: add extract-handshakes kprobe example
>=20
>  Small utility for extracting ephemeral key data from the kernel's memory.=
 More
>  information can be found here:
>  https://lists.zx2c4.com/pipermail/wireguard/2018-February/002439.html
>=20
> As always, the source is available at https://git.zx2c4.com/WireGuard/ and=

> information about the project is available at https://www.wireguard.com/ .=

>=20
> This snapshot is available in tarball form here:
>  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20180304.tar.xz
>  SHA2-256: efb1652f0da67fb2731040439b6abb820a5e2f1bc177aa15c5dce68ea332778=
7
>  BLAKE2b-256: 9b49122b546d334a431b12e5b62582a094db737f2497652e55b415570910=
7c40
>=20
> If you're a snapshot package maintainer, please bump your package version.=
 If
> you're a user, the WireGuard team welcomes any and all feedback on this la=
test
> snapshot.
>=20
> Finally, WireGuard development thrives on donations. By popular demand, we=

> have a webpage for this: https://www.wireguard.com/donations/
>=20
> Thank you,
> Jason Donenfeld
>=20
>=20
> -----BEGIN PGP SIGNATURE-----
>=20
> iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAlqcMrsQHGphc29uQHp4
> MmM0LmNvbQAKCRBJ/HASpd4DrndND/0ZkzKOnLdYS6NNX+qvdKhwQ4XeOznqAOEo
> 22z9T/4NalrDe5X8I7LWIwN65KVpcGvoghi5AHI0k4QMGLwdtth+W5beLVhY/U6P
> iS2TtdC/5Tp4ovP2ohRn+Ckz6fAP3d+TrV8YWnXi17zrGYjFXXGXSHI98C589Syz
> FHyYB1Q1YiGB96wilYCdV+uc23esTTenUQudq/KwJV71I7XpuFVKAZ9uWli/1Jv1
> HOk0TTglxDA3orqtPNP1WHxVuKasktvBy4MPNg3B2Ilbdvsmf3cuta1Pyr5ulX47
> QwIlr+D+xBFeIbQVYQZsY5eqv6dvAbRcgvZnsxjTohO3X+9s3JTIoPkB+qssiSkT
> yP9zhe7JRbLGd6Y+Ys68tKEJQAEtLnGqduj4Lwe0vfcMZ9ItlcsCG4ICxhSrbyIR
> F3zKrVlVypWgwjzHOoa8jg7+XEzRfnTAoYHZLxRdV5oB3yQFXn+a41HNZF9BQl00
> 65g9A5pBDxkcbiwkT884GtAt+bekbFSvb8+bYr0LgbgIt7DAW5z+fe09mlATv3W/
> uJpateTM7irm8O3BDvxUh+GGIIqKMNbteUX8nRcPLwMqtJpgC5GCvocjbfJRXIt2
> IwnYYPzvQfyDZz5HPQaaXmIInF+EZFBC310tCkwKk5T72+/+zJuGmMjF4EayplrG
> SGQYvER10Q=3D=3D
> =3DLTAE
> -----END PGP SIGNATURE-----
>=20
>=20
> ------------------------------
>=20
> Message: 2
> Date: Mon, 5 Mar 2018 08:26:23 +0000
> From: Henrique Carrega <hcarrega@gmail.com>
> To: wireguard@lists.zx2c4.com
> Subject: Tunsafe Windows client for wireguard (not opensource yet they
>    say
> Message-ID: <41222FCF-F9F5-4FEC-AA71-73C48F4DA4BA@gmail.com>
> Content-Type: text/plain; charset=3D"us-ascii"
>=20
> https://tunsafe.com/
>=20
> https://reddit.com/r/VPN/comments/82183o/tunsafe_a_high_performance_wiregu=
ard_vpn_client/
> Sent from my iPhone
> -------------- next part --------------
> An HTML attachment was scrubbed...
> URL: <http://lists.zx2c4.com/pipermail/wireguard/attachments/20180305/e7c2=
813d/attachment-0001.html>
>=20
> ------------------------------
>=20
> Message: 3
> Date: Mon, 5 Mar 2018 10:19:35 +0100
> From: "Jason A. Donenfeld" <Jason@zx2c4.com>
> To: Henrique Carrega <hcarrega@gmail.com>
> Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
> Subject: Re: Tunsafe Windows client for wireguard (not opensource yet
>    they say
> Message-ID:
>    <CAHmME9r95cjSXK8YitGuHxFp0EfrMKhQEGXL5Ux=3DrMXLt=3DU5FA@mail.gmail.com=
>
> Content-Type: text/plain; charset=3D"UTF-8"
>=20
> Hi Henrique,
>=20
> Thanks for posting this.
>=20
> Please stay away from this software, and generally be wary of
> closed-source WireGuard implementations trying to fill the void. This
> one was written by a community-unfriendly proprietary author, and
> we've got little way of ensuring protocol compliance or basic
> security. Especially from my discussions from him, it's clear what
> he's up to, and this seems like some nastiness. Should I spend my time
> reverse engineering this software and discovering zero-days? Probably
> not a good use of my time, despite my usual love of this sort of
> thing.
>=20
> One aspect of the WireGuard project is that we're taking development
> very carefully and slowly, not jumping to premature releases, and
> really studying every bit of what we produce in order to ship the
> least-vulnerable and most-correct code we possibly can. We're still
> shipping code -- it's not an approach that results in a complete
> standstill -- but it does mean that in these intervening periods,
> there will be propheteers and cowboys coming out of the woodwork to
> fill the void.
>=20
> It's quite easy to make a tiny tunneling protocol that's reasonably
> fast and does a few things; if you look on Github there are hundreds.
> It's quite another thing to write robust and secure software intend to
> last for a long time. That's what we're working on here.
>=20
> Fortunately we have two very nice projects that are rapidly
> approaching maturity: one in Go and one in Rust. I fully welcome
> future OSS authors into the project. When I'm back from visiting
> family at the beginning of April, I think we'll be in a good place to
> have a few first releases.
>=20
> I'll also do what I can to see that people aren't peddling junk and
> calling it wireguard, so as to reduce user confusion, but this of
> course isn't a very easy endeavor. I'm open to suggestions on how to
> approach this.
>=20
> Regards,
> Jason
>=20
>=20
> ------------------------------
>=20
> Subject: Digest Footer
>=20
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>=20
>=20
> ------------------------------
>=20
> End of WireGuard Digest, Vol 24, Issue 4
> ****************************************

--Apple-Mail-C6E14A04-BF44-42FD-B972-E1A0B81B2B7D
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">what is the go and rust git uri?<br><br><di=
v id=3D"AppleMailSignature"><span style=3D"font-size: 13pt;">Thomas J Munn</=
span><br><div><div><br></div></div></div><div><br>On Mar 5, 2018, at 06:00, <=
a href=3D"mailto:wireguard-request@lists.zx2c4.com">wireguard-request@lists.=
zx2c4.com</a> wrote:<br><br></div><blockquote type=3D"cite"><div><span>Send W=
ireGuard mailing list submissions to</span><br><span> &nbsp; &nbsp;<a href=3D=
"mailto:wireguard@lists.zx2c4.com">wireguard@lists.zx2c4.com</a></span><br><=
span></span><br><span>To subscribe or unsubscribe via the World Wide Web, vi=
sit</span><br><span> &nbsp; &nbsp;<a href=3D"https://lists.zx2c4.com/mailman=
/listinfo/wireguard">https://lists.zx2c4.com/mailman/listinfo/wireguard</a><=
/span><br><span>or, via email, send a message with subject or body 'help' to=
</span><br><span> &nbsp; &nbsp;<a href=3D"mailto:wireguard-request@lists.zx2=
c4.com">wireguard-request@lists.zx2c4.com</a></span><br><span></span><br><sp=
an>You can reach the person managing the list at</span><br><span> &nbsp; &nb=
sp;<a href=3D"mailto:wireguard-owner@lists.zx2c4.com">wireguard-owner@lists.=
zx2c4.com</a></span><br><span></span><br><span>When replying, please edit yo=
ur Subject line so it is more specific</span><br><span>than "Re: Contents of=
 WireGuard digest..."</span><br><span></span><br><span></span><br><span>Toda=
y's Topics:</span><br><span></span><br><span> &nbsp;&nbsp;1. [ANNOUNCE] Wire=
Guard Snapshot `0.0.20180304` Available</span><br><span> &nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;(Jason A. Donenfeld)</span><br><span> &nbsp;&nbsp;2. Tunsafe Wind=
ows client for wireguard (not opensource yet they</span><br><span> &nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;say (Henrique Carrega)</span><br><span> &nbsp;&nbsp;3. R=
e: Tunsafe Windows client for wireguard (not opensource yet</span><br><span>=
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;they say (Jason A. Donenfeld)</span><br><span=
></span><br><span></span><br><span>-----------------------------------------=
-----------------------------</span><br><span></span><br><span>Message: 1</s=
pan><br><span>Date: Sun, 04 Mar 2018 18:54:23 +0100</span><br><span>From: "J=
ason A. Donenfeld" &lt;<a href=3D"mailto:Jason@zx2c4.com">Jason@zx2c4.com</a=
>&gt;</span><br><span>To: "WireGuard mailing list" &lt;<a href=3D"mailto:wir=
eguard@lists.zx2c4.com">wireguard@lists.zx2c4.com</a>&gt;</span><br><span>Su=
bject: [ANNOUNCE] WireGuard Snapshot `0.0.20180304` Available</span><br><spa=
n>Message-ID: &lt;<a href=3D"mailto:b97b4ced2749b831@frisell.zx2c4.com">b97b=
4ced2749b831@frisell.zx2c4.com</a>&gt;</span><br><span>Content-Type: text/pl=
ain; charset=3DUTF-8</span><br><span></span><br><span>-----BEGIN PGP SIGNED M=
ESSAGE-----</span><br><span>Hash: SHA256</span><br><span></span><br><span>He=
llo,</span><br><span></span><br><span>A new snapshot, `0.0.20180304`, has be=
en tagged in the git repository.</span><br><span></span><br><span>Please not=
e that this snapshot is, like the rest of the project at this point</span><b=
r><span>in time, experimental, and does not consitute a real release that wo=
uld be</span><br><span>considered secure and bug-free. WireGuard is generall=
y thought to be fairly</span><br><span>stable, and most likely will not cras=
h your computer (though it may).</span><br><span>However, as this is a pre-r=
elease snapshot, it comes with no guarantees, and</span><br><span>its securi=
ty is not yet to be depended on; it is not applicable for CVEs.</span><br><s=
pan></span><br><span>With all that said, if you'd like to test this snapshot=
 out, there are a</span><br><span>few relevent changes.</span><br><span></sp=
an><br><span>=3D=3D Changes =3D=3D</span><br><span></span><br><span> &nbsp;*=
 NOTICE: off the grid</span><br><span></span><br><span> &nbsp;Do note that I=
'll be going off the grid from the end of this coming week until</span><br><=
span> &nbsp;April 1. This snapshot is expected to be fairly stable in the in=
terim.</span><br><span></span><br><span> &nbsp;* queueing: skb_reset: mark a=
s xnet</span><br><span></span><br><span> &nbsp;This allows cgroups to classi=
fy packets.</span><br><span></span><br><span> &nbsp;* contrib: embedded-wg-l=
ibrary: add ability to add and del interfaces</span><br><span> &nbsp;* contr=
ib: embedded-wg-library: add key generation functions</span><br><span></span=
><br><span> &nbsp;The embeddable library gains a few extra tricks, for peopl=
e implementing</span><br><span> &nbsp;plugins for various network managers.<=
/span><br><span></span><br><span> &nbsp;* crypto: read only after init</span=
><br><span> &nbsp;* allowedips: fix comment style</span><br><span> &nbsp;* m=
essages: MESSAGE_TOTAL is unused</span><br><span> &nbsp;* global: in gnu cod=
e, use un-underscored asm</span><br><span> &nbsp;* noise: fix function proto=
type</span><br><span></span><br><span> &nbsp;Small cleanups.</span><br><span=
></span><br><span> &nbsp;* compat: workaround netlink refcount bug</span><br=
><span></span><br><span> &nbsp;An upstream refcounting bug meant that in cer=
tain situations it became</span><br><span> &nbsp;impossible to unload the mo=
dule. So, we work around it in the compat code. The</span><br><span> &nbsp;p=
roblem has been fixed in 4.16.</span><br><span></span><br><span> &nbsp;* con=
trib: keygen-html: rewrite in pure javascript</span><br><span> &nbsp;* Rever=
t "contrib: keygen-html: rewrite in pure javascript"</span><br><span></span>=
<br><span> &nbsp;We nearly moved away from emscripten'ing the fiat32 code, b=
ut the resultant</span><br><span> &nbsp;floating point javascript was just t=
oo terrifying.</span><br><span></span><br><span> &nbsp;* Kconfig: require DS=
T_CACHE explicitly</span><br><span></span><br><span> &nbsp;Required for cert=
ain frankenkernels.</span><br><span></span><br><span> &nbsp;* compat: use co=
rrect -include path</span><br><span></span><br><span> &nbsp;Fixes certain ou=
t-of-tree build systems.</span><br><span></span><br><span> &nbsp;* noise: al=
ign static_identity keys</span><br><span></span><br><span> &nbsp;Gives us be=
tter alignment of private keys.</span><br><span></span><br><span> &nbsp;* wg=
-quick: if resolvconf/interface-order exists, use it</span><br><span> &nbsp;=
* wg-quick: if resolvconf/run/iface exists, use it</span><br><span></span><b=
r><span> &nbsp;Better compatibility with Debian's resolvconf.</span><br><spa=
n></span><br><span> &nbsp;* contrib: add extract-handshakes kprobe example</=
span><br><span></span><br><span> &nbsp;Small utility for extracting ephemera=
l key data from the kernel's memory. More</span><br><span> &nbsp;information=
 can be found here:</span><br><span> &nbsp;<a href=3D"https://lists.zx2c4.co=
m/pipermail/wireguard/2018-February/002439.html">https://lists.zx2c4.com/pip=
ermail/wireguard/2018-February/002439.html</a></span><br><span></span><br><s=
pan>As always, the source is available at <a href=3D"https://git.zx2c4.com/W=
ireGuard/">https://git.zx2c4.com/WireGuard/</a> and</span><br><span>informat=
ion about the project is available at <a href=3D"https://www.wireguard.com/"=
>https://www.wireguard.com/</a> .</span><br><span></span><br><span>This snap=
shot is available in tarball form here:</span><br><span> &nbsp;<a href=3D"ht=
tps://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20180304.tar.xz">https:=
//git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20180304.tar.xz</a></span><=
br><span> &nbsp;SHA2-256: efb1652f0da67fb2731040439b6abb820a5e2f1bc177aa15c5=
dce68ea3327787</span><br><span> &nbsp;BLAKE2b-256: 9b49122b546d334a431b12e5b=
62582a094db737f2497652e55b4155709107c40</span><br><span></span><br><span>If y=
ou're a snapshot package maintainer, please bump your package version. If</s=
pan><br><span>you're a user, the WireGuard team welcomes any and all feedbac=
k on this latest</span><br><span>snapshot.</span><br><span></span><br><span>=
Finally, WireGuard development thrives on donations. By popular demand, we</=
span><br><span>have a webpage for this: <a href=3D"https://www.wireguard.com=
/donations/">https://www.wireguard.com/donations/</a></span><br><span></span=
><br><span>Thank you,</span><br><span>Jason Donenfeld</span><br><span></span=
><br><span></span><br><span>-----BEGIN PGP SIGNATURE-----</span><br><span></=
span><br><span>iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAlqcMrsQHGphc29uQ=
Hp4</span><br><span>MmM0LmNvbQAKCRBJ/HASpd4DrndND/0ZkzKOnLdYS6NNX+qvdKhwQ4Xe=
OznqAOEo</span><br><span>22z9T/4NalrDe5X8I7LWIwN65KVpcGvoghi5AHI0k4QMGLwdtth=
+W5beLVhY/U6P</span><br><span>iS2TtdC/5Tp4ovP2ohRn+Ckz6fAP3d+TrV8YWnXi17zrGY=
jFXXGXSHI98C589Syz</span><br><span>FHyYB1Q1YiGB96wilYCdV+uc23esTTenUQudq/KwJ=
V71I7XpuFVKAZ9uWli/1Jv1</span><br><span>HOk0TTglxDA3orqtPNP1WHxVuKasktvBy4MP=
Ng3B2Ilbdvsmf3cuta1Pyr5ulX47</span><br><span>QwIlr+D+xBFeIbQVYQZsY5eqv6dvAbR=
cgvZnsxjTohO3X+9s3JTIoPkB+qssiSkT</span><br><span>yP9zhe7JRbLGd6Y+Ys68tKEJQA=
EtLnGqduj4Lwe0vfcMZ9ItlcsCG4ICxhSrbyIR</span><br><span>F3zKrVlVypWgwjzHOoa8j=
g7+XEzRfnTAoYHZLxRdV5oB3yQFXn+a41HNZF9BQl00</span><br><span>65g9A5pBDxkcbiwk=
T884GtAt+bekbFSvb8+bYr0LgbgIt7DAW5z+fe09mlATv3W/</span><br><span>uJpateTM7ir=
m8O3BDvxUh+GGIIqKMNbteUX8nRcPLwMqtJpgC5GCvocjbfJRXIt2</span><br><span>IwnYYP=
zvQfyDZz5HPQaaXmIInF+EZFBC310tCkwKk5T72+/+zJuGmMjF4EayplrG</span><br><span>S=
GQYvER10Q=3D=3D</span><br><span>=3DLTAE</span><br><span>-----END PGP SIGNATU=
RE-----</span><br><span></span><br><span></span><br><span>------------------=
------------</span><br><span></span><br><span>Message: 2</span><br><span>Dat=
e: Mon, 5 Mar 2018 08:26:23 +0000</span><br><span>From: Henrique Carrega &lt=
;<a href=3D"mailto:hcarrega@gmail.com">hcarrega@gmail.com</a>&gt;</span><br>=
<span>To: <a href=3D"mailto:wireguard@lists.zx2c4.com">wireguard@lists.zx2c4=
.com</a></span><br><span>Subject: Tunsafe Windows client for wireguard (not o=
pensource yet they</span><br><span> &nbsp; &nbsp;say</span><br><span>Message=
-ID: &lt;<a href=3D"mailto:41222FCF-F9F5-4FEC-AA71-73C48F4DA4BA@gmail.com">4=
1222FCF-F9F5-4FEC-AA71-73C48F4DA4BA@gmail.com</a>&gt;</span><br><span>Conten=
t-Type: text/plain; charset=3D"us-ascii"</span><br><span></span><br><span><a=
 href=3D"https://tunsafe.com/">https://tunsafe.com/</a></span><br><span></sp=
an><br><span><a href=3D"https://reddit.com/r/VPN/comments/82183o/tunsafe_a_h=
igh_performance_wireguard_vpn_client/">https://reddit.com/r/VPN/comments/821=
83o/tunsafe_a_high_performance_wireguard_vpn_client/</a></span><br><span>Sen=
t from my iPhone</span><br><span>-------------- next part --------------</sp=
an><br><span>An HTML attachment was scrubbed...</span><br><span>URL: &lt;<a h=
ref=3D"http://lists.zx2c4.com/pipermail/wireguard/attachments/20180305/e7c28=
13d/attachment-0001.html">http://lists.zx2c4.com/pipermail/wireguard/attachm=
ents/20180305/e7c2813d/attachment-0001.html</a>&gt;</span><br><span></span><=
br><span>------------------------------</span><br><span></span><br><span>Mes=
sage: 3</span><br><span>Date: Mon, 5 Mar 2018 10:19:35 +0100</span><br><span=
>From: "Jason A. Donenfeld" &lt;<a href=3D"mailto:Jason@zx2c4.com">Jason@zx2=
c4.com</a>&gt;</span><br><span>To: Henrique Carrega &lt;<a href=3D"mailto:hc=
arrega@gmail.com">hcarrega@gmail.com</a>&gt;</span><br><span>Cc: WireGuard m=
ailing list &lt;<a href=3D"mailto:wireguard@lists.zx2c4.com">wireguard@lists=
.zx2c4.com</a>&gt;</span><br><span>Subject: Re: Tunsafe Windows client for w=
ireguard (not opensource yet</span><br><span> &nbsp; &nbsp;they say</span><b=
r><span>Message-ID:</span><br><span> &nbsp; &nbsp;&lt;<a href=3D"mailto:CAHm=
ME9r95cjSXK8YitGuHxFp0EfrMKhQEGXL5Ux=3DrMXLt=3DU5FA@mail.gmail.com">CAHmME9r=
95cjSXK8YitGuHxFp0EfrMKhQEGXL5Ux=3DrMXLt=3DU5FA@mail.gmail.com</a>&gt;</span=
><br><span>Content-Type: text/plain; charset=3D"UTF-8"</span><br><span></spa=
n><br><span>Hi Henrique,</span><br><span></span><br><span>Thanks for posting=
 this.</span><br><span></span><br><span>Please stay away from this software,=
 and generally be wary of</span><br><span>closed-source WireGuard implementa=
tions trying to fill the void. This</span><br><span>one was written by a com=
munity-unfriendly proprietary author, and</span><br><span>we've got little w=
ay of ensuring protocol compliance or basic</span><br><span>security. Especi=
ally from my discussions from him, it's clear what</span><br><span>he's up t=
o, and this seems like some nastiness. Should I spend my time</span><br><spa=
n>reverse engineering this software and discovering zero-days? Probably</spa=
n><br><span>not a good use of my time, despite my usual love of this sort of=
</span><br><span>thing.</span><br><span></span><br><span>One aspect of the W=
ireGuard project is that we're taking development</span><br><span>very caref=
ully and slowly, not jumping to premature releases, and</span><br><span>real=
ly studying every bit of what we produce in order to ship the</span><br><spa=
n>least-vulnerable and most-correct code we possibly can. We're still</span>=
<br><span>shipping code -- it's not an approach that results in a complete</=
span><br><span>standstill -- but it does mean that in these intervening peri=
ods,</span><br><span>there will be propheteers and cowboys coming out of the=
 woodwork to</span><br><span>fill the void.</span><br><span></span><br><span=
>It's quite easy to make a tiny tunneling protocol that's reasonably</span><=
br><span>fast and does a few things; if you look on Github there are hundred=
s.</span><br><span>It's quite another thing to write robust and secure softw=
are intend to</span><br><span>last for a long time. That's what we're workin=
g on here.</span><br><span></span><br><span>Fortunately we have two very nic=
e projects that are rapidly</span><br><span>approaching maturity: one in Go a=
nd one in Rust. I fully welcome</span><br><span>future OSS authors into the p=
roject. When I'm back from visiting</span><br><span>family at the beginning o=
f April, I think we'll be in a good place to</span><br><span>have a few firs=
t releases.</span><br><span></span><br><span>I'll also do what I can to see t=
hat people aren't peddling junk and</span><br><span>calling it wireguard, so=
 as to reduce user confusion, but this of</span><br><span>course isn't a ver=
y easy endeavor. I'm open to suggestions on how to</span><br><span>approach t=
his.</span><br><span></span><br><span>Regards,</span><br><span>Jason</span><=
br><span></span><br><span></span><br><span>------------------------------</s=
pan><br><span></span><br><span>Subject: Digest Footer</span><br><span></span=
><br><span>_______________________________________________</span><br><span>W=
ireGuard mailing list</span><br><span><a href=3D"mailto:WireGuard@lists.zx2c=
4.com">WireGuard@lists.zx2c4.com</a></span><br><span><a href=3D"https://list=
s.zx2c4.com/mailman/listinfo/wireguard">https://lists.zx2c4.com/mailman/list=
info/wireguard</a></span><br><span></span><br><span></span><br><span>-------=
-----------------------</span><br><span></span><br><span>End of WireGuard Di=
gest, Vol 24, Issue 4</span><br><span>**************************************=
**</span><br></div></blockquote></body></html>=

--Apple-Mail-C6E14A04-BF44-42FD-B972-E1A0B81B2B7D--
