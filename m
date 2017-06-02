Return-Path: lesandie@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 041c4e64
 for <wireguard@lists.zx2c4.com>; Fri, 2 Jun 2017 22:33:53 +0000 (UTC)
Received: from mail-yb0-f172.google.com (mail-yb0-f172.google.com
 [209.85.213.172])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fa580001
 for <wireguard@lists.zx2c4.com>; Fri, 2 Jun 2017 22:33:53 +0000 (UTC)
Received: by mail-yb0-f172.google.com with SMTP id o9so5170128yba.3
 for <wireguard@lists.zx2c4.com>; Fri, 02 Jun 2017 15:47:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <c04b7a897d9fce0a@frisell.zx2c4.com>
References: <c04b7a897d9fce0a@frisell.zx2c4.com>
From: Le Sandie <lesandie@gmail.com>
Date: Sat, 3 Jun 2017 00:47:17 +0200
Message-ID: <CAKgwHq-d0vMPLsQ7p1WjW4yiUehDG3vCKYZkodDx+P8yamkCNw@mail.gmail.com>
Subject: Re: [ANNOUNCE] WireGuard Snapshot `0.0.20170531` Available
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary="f403045ea9707cb4e3055101ef8c"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--f403045ea9707cb4e3055101ef8c
Content-Type: text/plain; charset="UTF-8"

Hi all!,

My user feedback :-)

I have tested the WireGuard-0.0.20170531 snapshot between two ARM peers (a
couple of rpi3s with the same snapshot) and it works nice. I haven't had
time to iperf but will do to check that performance raise in ARM SoCs.

Also i tested this snapshot with one ARM peer and the other peer with a
LEDE (17.01.1) router with wireguard and the handshake goes well but no
connectivity between peers. If i downgrade the ARM peer snapshot to
WireGuard-0.0.20170421, both peers see each other with connectivity.
Probably when the openwrt/LEDE package maintainer bump up the package to
the new snapshot it will work.

Best

On Wed, May 31, 2017 at 4:35 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA256
>
> Hello,
>
> A new snapshot, `0.0.20170531`, has been tagged in the git repository.
>
> Please note that this snapshot is, like the rest of the project at this
> point
> in time, experimental, and does not consitute a real release that would be
> considered secure and bug-free. WireGuard is generally thought to be fairly
> stable, and most likely will not crash your computer (though it may).
> However, as this is a pre-release snapshot, it comes with no guarantees,
> and
> its security is not yet to be depended on; it is not applicable for CVEs.
>
> With all that said, if you'd like to test this snapshot out, there are a
> few relevent changes.
>
> == Changes ==
>
>   This rather large snapshot touches quite a few sensitive areas, so I'm
>   releasing it now rather than later to receive feedback on any possible
> issues.
>   It also contains fixes, so everybody should upgrade.
>
>   * man: fix psk mention in wg-quick man page
>   * man: update wg-quick(8) to show Debian resolvconf braindamage
>
>   Documentation cleanups.
>
>   * wg-quick: use src routing for default routes in v6
>
>   ip-rule(8) doesn't do the right thing with source addresses, unless we
>   explicitly set it inside the route. This fixes wg-quick on IPv6 systems.
>
>   * curve25519: actually, do some things on heap sometimes
>   * curve25519: align the basepoint to 32 bytes
>   * curve25519: add NEON versions for ARM
>   * data: enable BH during parallel crypto on ARM/NEON
>   * chacha20poly1305: move constants to rodata
>   * chacha20poly1305: add NEON versions for ARM and ARM64
>
>   We now have faster primitives on ARM and ARM64 processors, which should
>   improve performance.
>
>   * handshake: process in parallel
>
>   Handshakes are now processed in parallel using all cores, which should
> improve
>   throughput during a storm.
>
>   * noise: no need to store ephemeral public key
>   * noise: precompute static-static ECDH operation
>
>   We can precompute the ECDH(s, s) calculation, which improves handshake
>   initiation message performance by double.
>
>   * style: spaces after for loops
>   * peer: use iterator macro instead of callback
>
>   The most unreadable C ever produced. It might be wise to find a
> sexier-looking
>   alternative at some point.
>
>   * compat: remove warning for < 4.1
>   * compat: ship padata if kernel doesn't have it
>
>   The usual array of annoying compat things.
>
>   * rust test: convert screech test to snow
>   * rust test: add icmp ping
>
>   We now use Jake's snow library for Noise in the test, which we've
> expanded to
>   complete a ping.
>
>   * config: do not error out when getting if no peers
>   * tools: allow creating device with no peers
>
>   Fixing some small things in the tool/config interaction.
>
>   * device: keep going when share_check fails
>   * routingtable: remove unnecessary check in node_placement()
>   * config: it's faster to memcpy than strncpy
>   * timers: fix typo in comment
>
>   Nits.
>
>   * debug: print interface name in dmesg
>
>   For those who compile with `make debug`, you'll be happy to see a bit
> better
>   information in dmesg.
>
>   * timers: rework handshake reply control flow
>   * timers: the completion of a handshake also is on key confirmation
>   * timers: reset retry-attempt counter when not retrying
>
>   Tightening up our timer implementation, which is quite important.
>
> As always, the source is available at https://git.zx2c4.com/WireGuard/ and
> information about the project is available at https://www.wireguard.io/ .
>
> This snapshot is available in tarball form here:
>   https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20170531.tar.xz
>   SHA2-256: 2eb7d9aaf11dcb35e5066837bb1c768398ad3655744fdeb656bd7e7c7ad7
> cacc
>   BLAKE2b-256: 64e5d061e0d03133b781b902d3b5b6
> 1658b6d9f664b304325476d5add3a701ca
>
> If you're a snapshot package maintainer, please bump your package version.
> If
> you're a user, the WireGuard team welcomes any and all feedback on this
> latest
> snapshot.
>
> Thank you,
> Jason Donenfeld
>
>
> -----BEGIN PGP SIGNATURE-----
>
> iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAlku1IoQHGphc29uQHp4
> MmM0LmNvbQAKCRBJ/HASpd4Drh/KD/4iyKcLlhBivsvC9pGbIcAL9nvsnFq7dkOz
> MILh3048lMRGCts7RsgH7+Q6Yzzn0HwbwPfAugsjcXrGJGhVwSx5WP5H9oD1ev+1
> A9H+zVU4srLBJa/khC3ccjYNmOHEiC2ugv6DSy8cNn4cnH/2YPbhocqhnrvVnEKU
> 4ESXcF35/iuc6c3XJCd9EK1bF7263zIodDS3HkBh31muV4x8POr7m897v78AIUJb
> GR7w5P6y27kH2VU0onobLXQ0vfy2Nr3SHSZwu7HBFdXAX//okB+sdmMloBUmqgx3
> wNT0rjcd6KB4W8w44Cj2i61p2d8o+Up50r7EA0E+rU8oIVrQXkmpkeLBWkmzHD6H
> ZlZVMxSfosW+2yIslWzjJ7EOHn72FI5ANXoP0IQymON2NVhbegevI3+HbxrR+tvQ
> sAQHvIwsfJ116ACrISYt1xo7b2mMmGjS8/XNcpqGaIkqLGwxHJ7kJiOlzl0lBtaP
> cSHzjeVMD4BKo63UQioLGUkIL7lj36L9VK46gBZ3C0HvllgOfHv6MOUD+Ev1vw7N
> 4z4UjmhuiHDq7xQ1Bq5haH8d6Pager5ece4DMKN5YUrYmQIikLTEGFcktGsow9ym
> mUoeYskrkhw2uJN32Dr6nDHdxG+WQaGIMk+CpIoCh7e6dRa7eYJ9MeNaF2/Pl5TL
> F7yVoGQFgQ==
> =llZj
> -----END PGP SIGNATURE-----
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>



-- 
Lt. Col. Sandie

--f403045ea9707cb4e3055101ef8c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hi all!,<br><br></div><div>My user feedback=
 :-)<br></div><div><br></div>I have tested the WireGuard-0.0.20170531 snaps=
hot between two ARM peers (a couple of rpi3s with the same snapshot) and it=
 works nice. I haven&#39;t had time to iperf but will do to check that perf=
ormance raise in ARM SoCs. <br><br></div>Also i tested this snapshot with o=
ne ARM peer and the other peer with a LEDE (17.01.1) router with wireguard =
and the handshake goes well but no connectivity between peers. If i downgra=
de the ARM peer snapshot to WireGuard-0.0.20170421, both peers see each oth=
er with connectivity. Probably when the openwrt/LEDE package maintainer bum=
p up the package to the new snapshot it will work.<br><br></div>Best<br></d=
iv><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Wed, May 31=
, 2017 at 4:35 PM, Jason A. Donenfeld <span dir=3D"ltr">&lt;<a href=3D"mail=
to:Jason@zx2c4.com" target=3D"_blank">Jason@zx2c4.com</a>&gt;</span> wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">-----BEGIN PGP SIGNED MESSAGE-----<br>
Hash: SHA256<br>
<br>
Hello,<br>
<br>
A new snapshot, `0.0.20170531`, has been tagged in the git repository.<br>
<br>
Please note that this snapshot is, like the rest of the project at this poi=
nt<br>
in time, experimental, and does not consitute a real release that would be<=
br>
considered secure and bug-free. WireGuard is generally thought to be fairly=
<br>
stable, and most likely will not crash your computer (though it may).<br>
However, as this is a pre-release snapshot, it comes with no guarantees, an=
d<br>
its security is not yet to be depended on; it is not applicable for CVEs.<b=
r>
<br>
With all that said, if you&#39;d like to test this snapshot out, there are =
a<br>
few relevent changes.<br>
<br>
=3D=3D Changes =3D=3D<br>
<br>
=C2=A0 This rather large snapshot touches quite a few sensitive areas, so I=
&#39;m<br>
=C2=A0 releasing it now rather than later to receive feedback on any possib=
le issues.<br>
=C2=A0 It also contains fixes, so everybody should upgrade.<br>
<br>
=C2=A0 * man: fix psk mention in wg-quick man page<br>
=C2=A0 * man: update wg-quick(8) to show Debian resolvconf braindamage<br>
<br>
=C2=A0 Documentation cleanups.<br>
<br>
=C2=A0 * wg-quick: use src routing for default routes in v6<br>
<br>
=C2=A0 ip-rule(8) doesn&#39;t do the right thing with source addresses, unl=
ess we<br>
=C2=A0 explicitly set it inside the route. This fixes wg-quick on IPv6 syst=
ems.<br>
<br>
=C2=A0 * curve25519: actually, do some things on heap sometimes<br>
=C2=A0 * curve25519: align the basepoint to 32 bytes<br>
=C2=A0 * curve25519: add NEON versions for ARM<br>
=C2=A0 * data: enable BH during parallel crypto on ARM/NEON<br>
=C2=A0 * chacha20poly1305: move constants to rodata<br>
=C2=A0 * chacha20poly1305: add NEON versions for ARM and ARM64<br>
<br>
=C2=A0 We now have faster primitives on ARM and ARM64 processors, which sho=
uld<br>
=C2=A0 improve performance.<br>
<br>
=C2=A0 * handshake: process in parallel<br>
<br>
=C2=A0 Handshakes are now processed in parallel using all cores, which shou=
ld improve<br>
=C2=A0 throughput during a storm.<br>
<br>
=C2=A0 * noise: no need to store ephemeral public key<br>
=C2=A0 * noise: precompute static-static ECDH operation<br>
<br>
=C2=A0 We can precompute the ECDH(s, s) calculation, which improves handsha=
ke<br>
=C2=A0 initiation message performance by double.<br>
<br>
=C2=A0 * style: spaces after for loops<br>
=C2=A0 * peer: use iterator macro instead of callback<br>
<br>
=C2=A0 The most unreadable C ever produced. It might be wise to find a sexi=
er-looking<br>
=C2=A0 alternative at some point.<br>
<br>
=C2=A0 * compat: remove warning for &lt; 4.1<br>
=C2=A0 * compat: ship padata if kernel doesn&#39;t have it<br>
<br>
=C2=A0 The usual array of annoying compat things.<br>
<br>
=C2=A0 * rust test: convert screech test to snow<br>
=C2=A0 * rust test: add icmp ping<br>
<br>
=C2=A0 We now use Jake&#39;s snow library for Noise in the test, which we&#=
39;ve expanded to<br>
=C2=A0 complete a ping.<br>
<br>
=C2=A0 * config: do not error out when getting if no peers<br>
=C2=A0 * tools: allow creating device with no peers<br>
<br>
=C2=A0 Fixing some small things in the tool/config interaction.<br>
<br>
=C2=A0 * device: keep going when share_check fails<br>
=C2=A0 * routingtable: remove unnecessary check in node_placement()<br>
=C2=A0 * config: it&#39;s faster to memcpy than strncpy<br>
=C2=A0 * timers: fix typo in comment<br>
<br>
=C2=A0 Nits.<br>
<br>
=C2=A0 * debug: print interface name in dmesg<br>
<br>
=C2=A0 For those who compile with `make debug`, you&#39;ll be happy to see =
a bit better<br>
=C2=A0 information in dmesg.<br>
<br>
=C2=A0 * timers: rework handshake reply control flow<br>
=C2=A0 * timers: the completion of a handshake also is on key confirmation<=
br>
=C2=A0 * timers: reset retry-attempt counter when not retrying<br>
<br>
=C2=A0 Tightening up our timer implementation, which is quite important.<br=
>
<br>
As always, the source is available at <a href=3D"https://git.zx2c4.com/Wire=
Guard/" rel=3D"noreferrer" target=3D"_blank">https://git.zx2c4.com/<wbr>Wir=
eGuard/</a> and<br>
information about the project is available at <a href=3D"https://www.wiregu=
ard.io/" rel=3D"noreferrer" target=3D"_blank">https://www.wireguard.io/</a>=
 .<br>
<br>
This snapshot is available in tarball form here:<br>
=C2=A0 <a href=3D"https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20=
170531.tar.xz" rel=3D"noreferrer" target=3D"_blank">https://git.zx2c4.com/<=
wbr>WireGuard/snapshot/WireGuard-<wbr>0.0.20170531.tar.xz</a><br>
=C2=A0 SHA2-256: 2eb7d9aaf11dcb35e5066837bb1c76<wbr>8398ad3655744fdeb656bd7=
e7c7ad7<wbr>cacc<br>
=C2=A0 BLAKE2b-256: 64e5d061e0d03133b781b902d3b5b6<wbr>1658b6d9f664b3043254=
76d5add3a7<wbr>01ca<br>
<br>
If you&#39;re a snapshot package maintainer, please bump your package versi=
on. If<br>
you&#39;re a user, the WireGuard team welcomes any and all feedback on this=
 latest<br>
snapshot.<br>
<br>
Thank you,<br>
Jason Donenfeld<br>
<br>
<br>
-----BEGIN PGP SIGNATURE-----<br>
<br>
iQJEBAEBCAAuFiEEq5lC5tSkz8NBJi<wbr>CnSfxwEqXeA64FAlku1IoQHGphc29u<wbr>QHp4<=
br>
MmM0LmNvbQAKCRBJ/HASpd4Drh/KD/<wbr>4iyKcLlhBivsvC9pGbIcAL9nvsnFq7<wbr>dkOz<=
br>
MILh3048lMRGCts7RsgH7+<wbr>Q6Yzzn0HwbwPfAugsjcXrGJGhVwSx5<wbr>WP5H9oD1ev+1<=
br>
A9H+zVU4srLBJa/<wbr>khC3ccjYNmOHEiC2ugv6DSy8cNn4cn<wbr>H/2YPbhocqhnrvVnEKU<=
br>
4ESXcF35/<wbr>iuc6c3XJCd9EK1bF7263zIodDS3HkB<wbr>h31muV4x8POr7m897v78AIUJb<=
br>
GR7w5P6y27kH2VU0onobLXQ0vfy2Nr<wbr>3SHSZwu7HBFdXAX//okB+<wbr>sdmMloBUmqgx3<=
br>
wNT0rjcd6KB4W8w44Cj2i61p2d8o+<wbr>Up50r7EA0E+<wbr>rU8oIVrQXkmpkeLBWkmzHD6H<=
br>
ZlZVMxSfosW+<wbr>2yIslWzjJ7EOHn72FI5ANXoP0IQymO<wbr>N2NVhbegevI3+HbxrR+tvQ<=
br>
sAQHvIwsfJ116ACrISYt1xo7b2mMmG<wbr>jS8/<wbr>XNcpqGaIkqLGwxHJ7kJiOlzl0lBtaP<=
br>
cSHzjeVMD4BKo63UQioLGUkIL7lj36<wbr>L9VK46gBZ3C0HvllgOfHv6MOUD+<wbr>Ev1vw7N<=
br>
4z4UjmhuiHDq7xQ1Bq5haH8d6Pager<wbr>5ece4DMKN5YUrYmQIikLTEGFcktGso<wbr>w9ym<=
br>
mUoeYskrkhw2uJN32Dr6nDHdxG+<wbr>WQaGIMk+<wbr>CpIoCh7e6dRa7eYJ9MeNaF2/Pl5TL<=
br>
F7yVoGQFgQ=3D=3D<br>
=3DllZj<br>
-----END PGP SIGNATURE-----<br>
______________________________<wbr>_________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com">WireGuard@lists.zx2c4.com</a><=
br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/<wbr>mailman/listinfo/wire=
guard</a><br>
</blockquote></div><br><br clear=3D"all"><br>-- <br><div class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature">Lt. Col. Sandie</div>
</div>

--f403045ea9707cb4e3055101ef8c--
