Return-Path: georgewalkeriv@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 236d0589
 for <wireguard@lists.zx2c4.com>; Thu, 6 Sep 2018 14:45:13 +0000 (UTC)
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 70c82a3b
 for <wireguard@lists.zx2c4.com>; Thu, 6 Sep 2018 14:45:13 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id f62-v6so5754043qke.2
 for <wireguard@lists.zx2c4.com>; Thu, 06 Sep 2018 07:45:27 -0700 (PDT)
Return-Path: <georgewalkeriv@gmail.com>
Content-Type: multipart/alternative;
 boundary=Apple-Mail-2E805334-1C08-472E-B2DC-2BEA89008C95
Mime-Version: 1.0 (1.0)
Subject: Re: Let's talk about obfuscation again
From: George Walker <georgewalkeriv@gmail.com>
In-Reply-To: <20180906094330.273b07be@T-200>
Date: Thu, 6 Sep 2018 10:45:24 -0400
Message-Id: <706D2A48-7DAA-436A-BB99-2AE80822B524@gmail.com>
References: <CA+7UkwLER55wRDfLT7gNH+cPwSW4ziD-L71HyPix_wXOKFsiWg@mail.gmail.com>
 <20180906094330.273b07be@T-200>
To: Dennis Jackson <dennis.jackson@cs.ox.ac.uk>
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--Apple-Mail-2E805334-1C08-472E-B2DC-2BEA89008C95
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

> The userspace daemon would:
>    - 'Clean' Wireguard [handshake/data] packets

The objective of cleaning as described seems to be to make the protocol indi=
stinguishable from exchanging random payloads. But are there any common prot=
ocols of commercial importance that are so inscrutable? If I saw such random=
-looking UDP payloads on the wire I would suspect malware c&c, file sharing (=
who remembers FreeNet?), or a tunnel, depending on data volume and direction=
 =E2=80=94nothing I would hesitate to block (or flag as suspicious) if I wer=
e running a big traffic classifier.

Domain fronting seems like the stealthiest option to me (and if anyone has a=
 reliable way to detect domain fronting, I would love to hear about it!). Bu=
t that doesn=E2=80=99t get you UDP (and NAT traversal); perhaps VOIP/WebRTC m=
imicry could work?


Best,
George


Sent from my iPhone

> On Sep 6, 2018, at 4:43 AM, Dennis Jackson <dennis.jackson@cs.ox.ac.uk> wr=
ote:
>=20
> Hi,=20
>=20
> I've been thinking about this issue as well and I agree it's an
> important one to solve. However, Wireguard's key selling points are its
> performance, simple configuration and minimal code size and I don't
> think we can compromise this. So I was wondering if a userspace program
> which obfuscates outgoing Wireguard packets and de-obfuscates incoming
> packets might solve the problem, without impacting Wireguard's key
> features.=20
>=20
> The userspace daemon would:
>    - 'Clean' Wireguard handshake packets,=20
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
>      passed to a pluggable transport.=20
>    - On the receiving end the daemon reverses the transformation
>      and delivers the packets to Wireguard.
>=20
> Outcome:
>    + Clear separation between codebases
>    + No matter how badly implemented, the userspace daemon can't
>      compromise authenticity or confidentiality.=20
>    + Easily extensible
>    + Wireguard doesn't need to know about the transformation, it
>      just sends its packets to a listener on the loopback
>      interface.
>    - Performance hit from the packet indirection, ECB encryption
>      etc
>    - Still needs Wireguard to disable cookies, add timing jitter
>      on handshake / keep-alive packets.=20
>=20
> I'm sure there are alternatives/better solutions. This is just a
> sketch to show it is possible without altering Wireguard's codebase or
> functionality. If you have any comments or criticism, I'd be interested
> in refining the idea further.=20
>=20
> Kind regards,
> Dennis
>=20
> On Thu, 6 Sep 2018 10:06:07 +1000
> StarBrilliant <coder@poorlab.com> wrote:
>=20
>> Hi,
>>=20
>> (TL;DR: Please seriously consider preventing WG from being blocked,
>> for 2/3 of the world's Internet users. No need to break compatibility,
>> be friendly to PT plugins is a possible solution.)
>>=20
>> I have been using WG for months. I understand the fact that Wireguard
>> wants to keep its protocol simple and easy to audit. I also understand
>> that we have talked about this topic back in 2016. [1]
>>=20
>>=20
>> ## The problem: way too easy to block
>>=20
>> I propose this issue again, because Wireguard has recently become a
>> hot topic in Chinese community with the most strict
>> <del>Internet</del> Intranet censorship in the world. Chinese
>> Wireguard users succeeded in access the Internet temporarily, but we
>> know Wireguard never tries to prevent itself from being blocked.
>>=20
>> It is indeed very easy to completely block Wireguard protocol with
>> iptables:
>>> iptables -A FORWARD -p udp -m length --length 120 -m u32 --u32 "0
>>>>> 22 & 0x3c @ 8 =3D 0x2000000" -j DROP =20
>> (Yes, from prior experience of blocking TLS and OpenVPN, usually
>> Message ID 2 is blocked instead of Message ID 1, probably for the
>> intention to consume server resources.)
>>=20
>> It is also possible to interfere with the keep-alive packet, since it
>> is "always on time like a bus" and exactly 32 bytes:
>>> iptables -A FORWARD -p udp -m length --length 60 -m u32 --u32 "0 >>
>>> 22 & 0x3c @ 8 =3D 0x4000000" -m statistic --mode random --probability
>>> 0.4 -j DROP =20
>>=20
>>=20
>> ## But it's unrelated to WG's security model!
>>=20
>> I heard someone saying something like below:
>>=20
>> On Sat Jul 9 17:49:47 CEST 2016, Bruno Wolff III <bruno@wolff.to>
>> wrote:
>>> Given the design goals of wireguard, I don't think it is something
>>> that would be particularly good to combine with steganography. We
>>> need real net neutrality, with ISPs not allowed to block traffic
>>> based on content. We need governments not passing laws to make
>>> people compromise their own security. Using strong unbreakable
>>> encryption when communicating, should be the norm, not something
>>> you need to hide. =20
>>=20
>> I interpret those sentences as identical to "Do not use Wireguard if
>> you live in a country where unlicensed VPN is illegal. Go and ask for
>> net neutrality instead." But the fact is that 2/3 of the world's
>> Internet users [2] live in censorship. For most of them, unlicensed
>> VPN is their only weapon to fight for net neutrality.
>>=20
>> The undoubted top-1 encrypted proxy software [3] in China was not
>> written by a crypto professional and even started with RC4-MD5, not
>> until 5 years later (2017) did it have AEAD cipher.
>>=20
>> People love Wireguard because of its security, flexibility and
>> efficiency, but only when it can work. It is useless to talk about
>> security if it does not work.
>>=20
>>=20
>> ## Can we solve the problem easily?
>>=20
>> What makes Wireguard easy to detect?
>> - Fixed first 4 bytes
>>  (0x01000000 through 0x04000000)
>> - Plaintext nounce counter
>>  (Could XChaCha20 solve the problem?)
>> - Fixed sender & receiver ID
>>  (Two-pass encrypt might work, see below)
>> - Fixed length handshake & keep-alive
>>  (148, 92, 32. can we pad them longer?)
>> - Punctual rekey & keep-alive
>>  (Can we delay them randomly as IPsec do?)
>>=20
>> How can we solve the problem?
>> - Embed steganography inside Wireguard?
>>  (Not realistic. Big codebase, potential bugs.)
>> - Two-pass encrypt so no more plaintext handshake?
>>  The outer layer could be PSK and does not need to be PFS.
>>  (Possible but slow. PSK can be shared among sessions, like
>> L2TP/IPsec do.)
>> - Remain plaintext, but fix padding and timing problem,
>>  relying Pluggable Transport [4] plugins to do the remaining work.
>>  (I really recommend this solution.)
>>=20
>> I read the tech whitepaper multiple times. I think it is possible
>> solve the problem in Method 3 without breaking any compatibility. For
>> Message ID =3D 1, 2, 3, we can add random data at the end of the packet.
>> For Message ID =3D 4 and Length =3D 0 (keep-alive packet), we can add mor=
e
>> zeros in the encapsulated packet. For the timing problem, we can give
>> rekey and keep-alive a little bit randomness.
>>=20
>> In conclusion, I think we do not need to break the compatibility or
>> bloat the code base to make Wireguard immune to being detected. We
>> could either two-pass encrypt the packet, or solve the padding and
>> timing problem so PT plugins can run on top of it. I hope to see
>> Wireguard run anywhere without worries, not only on devices owned by
>> 1/3 of the Internet's population.
>>=20
>>=20
>> ## Notes
>>=20
>> [1] https://lists.zx2c4.com/pipermail/wireguard/2016-July/000184.html
>> [2] https://www.theverge.com/2016/11/14/13596974/
>> [3] https://github.com/shadowsocks/shadowsocks (Please switch git
>> branch to see the actual code)
>> [4]
>> https://www.torproject.org/docs/pluggable-transports.html.en#list-of-pts
>>=20
>>=20
>> Best regards.
>> _______________________________________________
>> WireGuard mailing list
>> WireGuard@lists.zx2c4.com
>> https://lists.zx2c4.com/mailman/listinfo/wireguard
>=20
>=20
>=20
> --=20
> PGP Fingerprint: 5B93 F0B9 D6A8 9BC1 546B C98C 6105 A775 8CD2 46AC
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard

--Apple-Mail-2E805334-1C08-472E-B2DC-2BEA89008C95
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><blockquote type=3D"cite"><font color=3D"#0=
00000"><span style=3D"caret-color: rgb(0, 0, 0); background-color: rgba(255,=
 255, 255, 0);">The userspace daemon would:<br>&nbsp; &nbsp;- 'Clean' Wiregu=
ard [handshake/data] packets</span></font></blockquote><div><br></div><div>T=
he objective of cleaning as described seems to be to make the protocol indis=
tinguishable from exchanging random payloads. But are there any common proto=
cols of commercial importance that are so inscrutable? If I saw such random-=
looking UDP payloads on the wire I would suspect malware c&amp;c, file shari=
ng (who remembers FreeNet?), or a tunnel, depending on data volume and direc=
tion =E2=80=94nothing I would hesitate to block (or flag as suspicious) if I=
 were running a big traffic classifier.</div><div><br></div><div>Domain fron=
ting seems like the stealthiest option to me (and if anyone has a reliable w=
ay to detect domain fronting, I would love to hear about it!). But that does=
n=E2=80=99t get you UDP (and NAT traversal); perhaps VOIP/WebRTC mimicry cou=
ld work?</div><div><br></div><div><br></div><div>Best,</div><div>George</div=
><div><br></div><div><br></div><div id=3D"AppleMailSignature">Sent from my i=
Phone</div><div><br>On Sep 6, 2018, at 4:43 AM, Dennis Jackson &lt;<a href=3D=
"mailto:dennis.jackson@cs.ox.ac.uk">dennis.jackson@cs.ox.ac.uk</a>&gt; wrote=
:<br><br></div><blockquote type=3D"cite"><div><span>Hi, </span><br><span></s=
pan><br><span>I've been thinking about this issue as well and I agree it's a=
n</span><br><span>important one to solve. However, Wireguard's key selling p=
oints are its</span><br><span>performance, simple configuration and minimal c=
ode size and I don't</span><br><span>think we can compromise this. So I was w=
ondering if a userspace program</span><br><span>which obfuscates outgoing Wi=
reguard packets and de-obfuscates incoming</span><br><span>packets might sol=
ve the problem, without impacting Wireguard's key</span><br><span>features. <=
/span><br><span></span><br><span>The userspace daemon would:</span><br><span=
> &nbsp; &nbsp;- 'Clean' Wireguard handshake packets, </span><br><span> &nbs=
p; &nbsp; &nbsp; &nbsp;* Randomise the packet type field</span><br><span> &n=
bsp; &nbsp; &nbsp; &nbsp;* Convert the ephemeral key to Elligator encoding</=
span><br><span> &nbsp; &nbsp; &nbsp; &nbsp;* Randomise the mac field if unus=
ed</span><br><span> &nbsp; &nbsp; &nbsp; &nbsp;* Random padding to alter pac=
ket lengths</span><br><span> &nbsp; &nbsp;- 'Clean' Data packets</span><br><=
span> &nbsp; &nbsp; &nbsp; &nbsp;* The header is exactly 16 bytes and non-re=
peating so</span><br><span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;transform with=
 AES-ECB</span><br><span> &nbsp; &nbsp; &nbsp; &nbsp;* The key could be deri=
ved from a PSK and the public</span><br><span> &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;keys used in the handshake (ensuring keys don't</span><br><span> &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;repeat)</span><br><span> &nbsp; &nbsp; &nbsp; &n=
bsp;* Or Wireguard could provide a hook for a "post-master</span><br><span> &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;secret" which might be useful for many exte=
nsions</span><br><span> &nbsp; &nbsp;- The resulting stream would (hopefully=
) be uniformly</span><br><span> &nbsp; &nbsp; &nbsp;distributed which can ei=
ther be transmitted directly or</span><br><span> &nbsp; &nbsp; &nbsp;passed t=
o a pluggable transport. </span><br><span> &nbsp; &nbsp;- On the receiving e=
nd the daemon reverses the transformation</span><br><span> &nbsp; &nbsp; &nb=
sp;and delivers the packets to Wireguard.</span><br><span></span><br><span>O=
utcome:</span><br><span> &nbsp; &nbsp;+ Clear separation between codebases</=
span><br><span> &nbsp; &nbsp;+ No matter how badly implemented, the userspac=
e daemon can't</span><br><span> &nbsp; &nbsp; &nbsp;compromise authenticity o=
r confidentiality. </span><br><span> &nbsp; &nbsp;+ Easily extensible</span>=
<br><span> &nbsp; &nbsp;+ Wireguard doesn't need to know about the transform=
ation, it</span><br><span> &nbsp; &nbsp; &nbsp;just sends its packets to a l=
istener on the loopback</span><br><span> &nbsp; &nbsp; &nbsp;interface.</spa=
n><br><span> &nbsp; &nbsp;- Performance hit from the packet indirection, ECB=
 encryption</span><br><span> &nbsp; &nbsp; &nbsp;etc</span><br><span> &nbsp;=
 &nbsp;- Still needs Wireguard to disable cookies, add timing jitter</span><=
br><span> &nbsp; &nbsp; &nbsp;on handshake / keep-alive packets. </span><br>=
<span></span><br><span>I'm sure there are alternatives/better solutions. Thi=
s is just a</span><br><span>sketch to show it is possible without altering W=
ireguard's codebase or</span><br><span>functionality. If you have any commen=
ts or criticism, I'd be interested</span><br><span>in refining the idea furt=
her. </span><br><span></span><br><span>Kind regards,</span><br><span>Dennis<=
/span><br><span></span><br><span>On Thu, 6 Sep 2018 10:06:07 +1000</span><br=
><span>StarBrilliant &lt;<a href=3D"mailto:coder@poorlab.com">coder@poorlab.=
com</a>&gt; wrote:</span><br><span></span><br><blockquote type=3D"cite"><spa=
n>Hi,</span><br></blockquote><blockquote type=3D"cite"><span></span><br></bl=
ockquote><blockquote type=3D"cite"><span>(TL;DR: Please seriously consider p=
reventing WG from being blocked,</span><br></blockquote><blockquote type=3D"=
cite"><span>for 2/3 of the world's Internet users. No need to break compatib=
ility,</span><br></blockquote><blockquote type=3D"cite"><span>be friendly to=
 PT plugins is a possible solution.)</span><br></blockquote><blockquote type=
=3D"cite"><span></span><br></blockquote><blockquote type=3D"cite"><span>I ha=
ve been using WG for months. I understand the fact that Wireguard</span><br>=
</blockquote><blockquote type=3D"cite"><span>wants to keep its protocol simp=
le and easy to audit. I also understand</span><br></blockquote><blockquote t=
ype=3D"cite"><span>that we have talked about this topic back in 2016. [1]</s=
pan><br></blockquote><blockquote type=3D"cite"><span></span><br></blockquote=
><blockquote type=3D"cite"><span></span><br></blockquote><blockquote type=3D=
"cite"><span>## The problem: way too easy to block</span><br></blockquote><b=
lockquote type=3D"cite"><span></span><br></blockquote><blockquote type=3D"ci=
te"><span>I propose this issue again, because Wireguard has recently become a=
</span><br></blockquote><blockquote type=3D"cite"><span>hot topic in Chinese=
 community with the most strict</span><br></blockquote><blockquote type=3D"c=
ite"><span>&lt;del&gt;Internet&lt;/del&gt; Intranet censorship in the world.=
 Chinese</span><br></blockquote><blockquote type=3D"cite"><span>Wireguard us=
ers succeeded in access the Internet temporarily, but we</span><br></blockqu=
ote><blockquote type=3D"cite"><span>know Wireguard never tries to prevent it=
self from being blocked.</span><br></blockquote><blockquote type=3D"cite"><s=
pan></span><br></blockquote><blockquote type=3D"cite"><span>It is indeed ver=
y easy to completely block Wireguard protocol with</span><br></blockquote><b=
lockquote type=3D"cite"><span>iptables:</span><br></blockquote><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><span>iptables -A FORWARD -p udp -m l=
ength --length 120 -m u32 --u32 "0</span><br></blockquote></blockquote><bloc=
kquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><bl=
ockquote type=3D"cite"><span>22 &amp; 0x3c @ 8 =3D 0x2000000" -j DROP &nbsp;=
</span><br></blockquote></blockquote></blockquote></blockquote><blockquote t=
ype=3D"cite"><span>(Yes, from prior experience of blocking TLS and OpenVPN, u=
sually</span><br></blockquote><blockquote type=3D"cite"><span>Message ID 2 i=
s blocked instead of Message ID 1, probably for the</span><br></blockquote><=
blockquote type=3D"cite"><span>intention to consume server resources.)</span=
><br></blockquote><blockquote type=3D"cite"><span></span><br></blockquote><b=
lockquote type=3D"cite"><span>It is also possible to interfere with the keep=
-alive packet, since it</span><br></blockquote><blockquote type=3D"cite"><sp=
an>is "always on time like a bus" and exactly 32 bytes:</span><br></blockquo=
te><blockquote type=3D"cite"><blockquote type=3D"cite"><span>iptables -A FOR=
WARD -p udp -m length --length 60 -m u32 --u32 "0 &gt;&gt;</span><br></block=
quote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span=
>22 &amp; 0x3c @ 8 =3D 0x4000000" -m statistic --mode random --probability</=
span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote typ=
e=3D"cite"><span>0.4 -j DROP &nbsp;</span><br></blockquote></blockquote><blo=
ckquote type=3D"cite"><span></span><br></blockquote><blockquote type=3D"cite=
"><span></span><br></blockquote><blockquote type=3D"cite"><span>## But it's u=
nrelated to WG's security model!</span><br></blockquote><blockquote type=3D"=
cite"><span></span><br></blockquote><blockquote type=3D"cite"><span>I heard s=
omeone saying something like below:</span><br></blockquote><blockquote type=3D=
"cite"><span></span><br></blockquote><blockquote type=3D"cite"><span>On Sat J=
ul 9 17:49:47 CEST 2016, Bruno Wolff III &lt;<a href=3D"mailto:bruno@wolff.t=
o">bruno@wolff.to</a>&gt;</span><br></blockquote><blockquote type=3D"cite"><=
span>wrote:</span><br></blockquote><blockquote type=3D"cite"><blockquote typ=
e=3D"cite"><span>Given the design goals of wireguard, I don't think it is so=
mething</span><br></blockquote></blockquote><blockquote type=3D"cite"><block=
quote type=3D"cite"><span>that would be particularly good to combine with st=
eganography. We</span><br></blockquote></blockquote><blockquote type=3D"cite=
"><blockquote type=3D"cite"><span>need real net neutrality, with ISPs not al=
lowed to block traffic</span><br></blockquote></blockquote><blockquote type=3D=
"cite"><blockquote type=3D"cite"><span>based on content. We need governments=
 not passing laws to make</span><br></blockquote></blockquote><blockquote ty=
pe=3D"cite"><blockquote type=3D"cite"><span>people compromise their own secu=
rity. Using strong unbreakable</span><br></blockquote></blockquote><blockquo=
te type=3D"cite"><blockquote type=3D"cite"><span>encryption when communicati=
ng, should be the norm, not something</span><br></blockquote></blockquote><b=
lockquote type=3D"cite"><blockquote type=3D"cite"><span>you need to hide. &n=
bsp;</span><br></blockquote></blockquote><blockquote type=3D"cite"><span></s=
pan><br></blockquote><blockquote type=3D"cite"><span>I interpret those sente=
nces as identical to "Do not use Wireguard if</span><br></blockquote><blockq=
uote type=3D"cite"><span>you live in a country where unlicensed VPN is illeg=
al. Go and ask for</span><br></blockquote><blockquote type=3D"cite"><span>ne=
t neutrality instead." But the fact is that 2/3 of the world's</span><br></b=
lockquote><blockquote type=3D"cite"><span>Internet users [2] live in censors=
hip. For most of them, unlicensed</span><br></blockquote><blockquote type=3D=
"cite"><span>VPN is their only weapon to fight for net neutrality.</span><br=
></blockquote><blockquote type=3D"cite"><span></span><br></blockquote><block=
quote type=3D"cite"><span>The undoubted top-1 encrypted proxy software [3] i=
n China was not</span><br></blockquote><blockquote type=3D"cite"><span>writt=
en by a crypto professional and even started with RC4-MD5, not</span><br></b=
lockquote><blockquote type=3D"cite"><span>until 5 years later (2017) did it h=
ave AEAD cipher.</span><br></blockquote><blockquote type=3D"cite"><span></sp=
an><br></blockquote><blockquote type=3D"cite"><span>People love Wireguard be=
cause of its security, flexibility and</span><br></blockquote><blockquote ty=
pe=3D"cite"><span>efficiency, but only when it can work. It is useless to ta=
lk about</span><br></blockquote><blockquote type=3D"cite"><span>security if i=
t does not work.</span><br></blockquote><blockquote type=3D"cite"><span></sp=
an><br></blockquote><blockquote type=3D"cite"><span></span><br></blockquote>=
<blockquote type=3D"cite"><span>## Can we solve the problem easily?</span><b=
r></blockquote><blockquote type=3D"cite"><span></span><br></blockquote><bloc=
kquote type=3D"cite"><span>What makes Wireguard easy to detect?</span><br></=
blockquote><blockquote type=3D"cite"><span>- Fixed first 4 bytes</span><br><=
/blockquote><blockquote type=3D"cite"><span> &nbsp;(0x01000000 through 0x040=
00000)</span><br></blockquote><blockquote type=3D"cite"><span>- Plaintext no=
unce counter</span><br></blockquote><blockquote type=3D"cite"><span> &nbsp;(=
Could XChaCha20 solve the problem?)</span><br></blockquote><blockquote type=3D=
"cite"><span>- Fixed sender &amp; receiver ID</span><br></blockquote><blockq=
uote type=3D"cite"><span> &nbsp;(Two-pass encrypt might work, see below)</sp=
an><br></blockquote><blockquote type=3D"cite"><span>- Fixed length handshake=
 &amp; keep-alive</span><br></blockquote><blockquote type=3D"cite"><span> &n=
bsp;(148, 92, 32. can we pad them longer?)</span><br></blockquote><blockquot=
e type=3D"cite"><span>- Punctual rekey &amp; keep-alive</span><br></blockquo=
te><blockquote type=3D"cite"><span> &nbsp;(Can we delay them randomly as IPs=
ec do?)</span><br></blockquote><blockquote type=3D"cite"><span></span><br></=
blockquote><blockquote type=3D"cite"><span>How can we solve the problem?</sp=
an><br></blockquote><blockquote type=3D"cite"><span>- Embed steganography in=
side Wireguard?</span><br></blockquote><blockquote type=3D"cite"><span> &nbs=
p;(Not realistic. Big codebase, potential bugs.)</span><br></blockquote><blo=
ckquote type=3D"cite"><span>- Two-pass encrypt so no more plaintext handshak=
e?</span><br></blockquote><blockquote type=3D"cite"><span> &nbsp;The outer l=
ayer could be PSK and does not need to be PFS.</span><br></blockquote><block=
quote type=3D"cite"><span> &nbsp;(Possible but slow. PSK can be shared among=
 sessions, like</span><br></blockquote><blockquote type=3D"cite"><span>L2TP/=
IPsec do.)</span><br></blockquote><blockquote type=3D"cite"><span>- Remain p=
laintext, but fix padding and timing problem,</span><br></blockquote><blockq=
uote type=3D"cite"><span> &nbsp;relying Pluggable Transport [4] plugins to d=
o the remaining work.</span><br></blockquote><blockquote type=3D"cite"><span=
> &nbsp;(I really recommend this solution.)</span><br></blockquote><blockquo=
te type=3D"cite"><span></span><br></blockquote><blockquote type=3D"cite"><sp=
an>I read the tech whitepaper multiple times. I think it is possible</span><=
br></blockquote><blockquote type=3D"cite"><span>solve the problem in Method 3=
 without breaking any compatibility. For</span><br></blockquote><blockquote t=
ype=3D"cite"><span>Message ID =3D 1, 2, 3, we can add random data at the end=
 of the packet.</span><br></blockquote><blockquote type=3D"cite"><span>For M=
essage ID =3D 4 and Length =3D 0 (keep-alive packet), we can add more</span>=
<br></blockquote><blockquote type=3D"cite"><span>zeros in the encapsulated p=
acket. For the timing problem, we can give</span><br></blockquote><blockquot=
e type=3D"cite"><span>rekey and keep-alive a little bit randomness.</span><b=
r></blockquote><blockquote type=3D"cite"><span></span><br></blockquote><bloc=
kquote type=3D"cite"><span>In conclusion, I think we do not need to break th=
e compatibility or</span><br></blockquote><blockquote type=3D"cite"><span>bl=
oat the code base to make Wireguard immune to being detected. We</span><br><=
/blockquote><blockquote type=3D"cite"><span>could either two-pass encrypt th=
e packet, or solve the padding and</span><br></blockquote><blockquote type=3D=
"cite"><span>timing problem so PT plugins can run on top of it. I hope to se=
e</span><br></blockquote><blockquote type=3D"cite"><span>Wireguard run anywh=
ere without worries, not only on devices owned by</span><br></blockquote><bl=
ockquote type=3D"cite"><span>1/3 of the Internet's population.</span><br></b=
lockquote><blockquote type=3D"cite"><span></span><br></blockquote><blockquot=
e type=3D"cite"><span></span><br></blockquote><blockquote type=3D"cite"><spa=
n>## Notes</span><br></blockquote><blockquote type=3D"cite"><span></span><br=
></blockquote><blockquote type=3D"cite"><span>[1] <a href=3D"https://lists.z=
x2c4.com/pipermail/wireguard/2016-July/000184.html">https://lists.zx2c4.com/=
pipermail/wireguard/2016-July/000184.html</a></span><br></blockquote><blockq=
uote type=3D"cite"><span>[2] <a href=3D"https://www.theverge.com/2016/11/14/=
13596974/">https://www.theverge.com/2016/11/14/13596974/</a></span><br></blo=
ckquote><blockquote type=3D"cite"><span>[3] <a href=3D"https://github.com/sh=
adowsocks/shadowsocks">https://github.com/shadowsocks/shadowsocks</a> (Pleas=
e switch git</span><br></blockquote><blockquote type=3D"cite"><span>branch t=
o see the actual code)</span><br></blockquote><blockquote type=3D"cite"><spa=
n>[4]</span><br></blockquote><blockquote type=3D"cite"><span><a href=3D"http=
s://www.torproject.org/docs/pluggable-transports.html.en#list-of-pts">https:=
//www.torproject.org/docs/pluggable-transports.html.en#list-of-pts</a></span=
><br></blockquote><blockquote type=3D"cite"><span></span><br></blockquote><b=
lockquote type=3D"cite"><span></span><br></blockquote><blockquote type=3D"ci=
te"><span>Best regards.</span><br></blockquote><blockquote type=3D"cite"><sp=
an>_______________________________________________</span><br></blockquote><b=
lockquote type=3D"cite"><span>WireGuard mailing list</span><br></blockquote>=
<blockquote type=3D"cite"><span><a href=3D"mailto:WireGuard@lists.zx2c4.com"=
>WireGuard@lists.zx2c4.com</a></span><br></blockquote><blockquote type=3D"ci=
te"><span><a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard">htt=
ps://lists.zx2c4.com/mailman/listinfo/wireguard</a></span><br></blockquote><=
span></span><br><span></span><br><span></span><br><span>-- </span><br><span>=
PGP Fingerprint: 5B93 F0B9 D6A8 9BC1 546B C98C 6105 A775 8CD2 46AC</span><br=
></div></blockquote><blockquote type=3D"cite"><div><span>___________________=
____________________________</span><br><span>WireGuard mailing list</span><b=
r><span><a href=3D"mailto:WireGuard@lists.zx2c4.com">WireGuard@lists.zx2c4.c=
om</a></span><br><span><a href=3D"https://lists.zx2c4.com/mailman/listinfo/w=
ireguard">https://lists.zx2c4.com/mailman/listinfo/wireguard</a></span><br><=
/div></blockquote></body></html>=

--Apple-Mail-2E805334-1C08-472E-B2DC-2BEA89008C95--
