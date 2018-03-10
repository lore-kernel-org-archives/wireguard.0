Return-Path: symgryph@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1f7f7ecd
 for <wireguard@lists.zx2c4.com>;
 Sat, 10 Mar 2018 18:28:09 +0000 (UTC)
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
 [209.85.220.169])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f70860a7
 for <wireguard@lists.zx2c4.com>;
 Sat, 10 Mar 2018 18:28:09 +0000 (UTC)
Received: by mail-qk0-f169.google.com with SMTP id b130so7274012qkg.9
 for <wireguard@lists.zx2c4.com>; Sat, 10 Mar 2018 10:38:03 -0800 (PST)
Return-Path: <symgryph@gmail.com>
Received: from [192.168.3.206] ([98.122.169.29])
 by smtp.gmail.com with ESMTPSA id i11sm2571533qtc.30.2018.03.10.10.38.02
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 10 Mar 2018 10:38:02 -0800 (PST)
From: Thomas Munn <symgryph@gmail.com>
Content-Type: multipart/alternative;
 boundary=Apple-Mail-33F3CF78-2CCD-4781-8DC4-F479E6F4586E
Mime-Version: 1.0 (1.0)
Date: Sat, 10 Mar 2018 13:38:01 -0500
Subject: Re: WireGuard Digest, Vol 24, Issue 14
Message-Id: <A6C68A2C-67A9-4FAB-9FDE-C798768111F9@gmail.com>
References: <mailman.1.1520679601.7763.wireguard@lists.zx2c4.com>
In-Reply-To: <mailman.1.1520679601.7763.wireguard@lists.zx2c4.com>
To: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--Apple-Mail-33F3CF78-2CCD-4781-8DC4-F479E6F4586E
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

wg inside gre inside tvp?

Thomas J Munn


> On Mar 10, 2018, at 06:00, wireguard-request@lists.zx2c4.com wrote:
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
>   1. Re: Another roaming problem (Toke H?iland-J?rgensen)
>   2. TCP Wireguard with socat (Gianluca Gabrielli)
>   3. Policy-based routing (Bruno)
>   4. Re: Policy-based routing (Matthias Urlichs)
>   5. Re: TCP Wireguard with socat (Matthias Urlichs)
>=20
>=20
> ----------------------------------------------------------------------
>=20
> Message: 1
> Date: Fri, 09 Mar 2018 15:53:27 +0100
> From: Toke H?iland-J?rgensen <toke@toke.dk>
> To: "Jason A. Donenfeld" <Jason@zx2c4.com>
> Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
> Subject: Re: Another roaming problem
> Message-ID: <878tb1jo60.fsf@toke.dk>
> Content-Type: text/plain
>=20
> "Jason A. Donenfeld" <Jason@zx2c4.com> writes:
>=20
>> Neat script, looks pretty easy to use. The wg repo has a kprobes
>> script too for extracting ephemeral keys from the kernel:
>>=20
>> https://git.zx2c4.com/WireGuard/tree/contrib/examples/extract-handshakes
>=20
> Neat! Brave new world of debugging ;)
>=20
> /me goes to write some more printk's
>=20
>=20
> -Toke
>=20
>=20
> ------------------------------
>=20
> Message: 2
> Date: Fri, 09 Mar 2018 11:41:45 -0500
> From: Gianluca Gabrielli <tuxmealux@protonmail.com>
> To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
> Subject: TCP Wireguard with socat
> Message-ID:
>    <utLzzyzPJsv-W3vVhU4Sdchg_5A07v9qCxR1DeJ5Wu7RzJHcje1cCEjtEWi4j0aCN05ozn=
9b4VYJQsLovvl6TGPp-kbZ_5kfpReEJHQQXGk=3D@protonmail.com>
>   =20
> Content-Type: text/plain; charset=3DUTF-8
>=20
> Hi everybody,
>=20
> I'm an happy wireguard user since a while, but at that time I need to link=
 two peers and I can only use TCP. I know that there are thousand of other t=
ools I can use, but I'd like to do it using wireguard.
> My first thought has been to make use of socat, since some newest version a=
 new address type called INTERFACE has been added (http://www.dest-unreach.o=
rg/socat/doc/socat.html#ADDRESS_TYPES), so I tried to use it but I've not be=
en able to make it works.
> This is why I'm here asking your feedbacks, or to collect other ideas to l=
et wireguard works through a TCP tunnel.
>=20
> I wrote all the notes about the tests I made on a pdf, I know that this is=
 not the good way to share with you my results, and I should write it here o=
nce again in plaintext. But for me it will would turn on a waste of time do i=
t again, and it also would be less comprehensible.
> I uploaded the pdf online instead to attach it to this email hence nobody n=
eeds to open it on his personal laptop, but it can be viewed via any browser=
. I personally hate open unknown file on my computer. The pdf can be viewed f=
rom the following link:
> https://drive.google.com/open?id=3D1KrLvU1D0K4YpRHi-jsIjbExh0lFTRQks
>=20
> I will really appreciate any constructive feedback or suggestion on how to=
 easily use wireguard with TCP.
>=20
> Thanks,
> Gianluca
>=20
>=20
>=20
>=20
> ------------------------------
>=20
> Message: 3
> Date: Fri, 9 Mar 2018 16:38:35 -0300
> From: Bruno <bruno@streamfeed.com>
> To: wireguard@lists.zx2c4.com
> Subject: Policy-based routing
> Message-ID: <a81edfe2-2a49-c49a-ea7c-65e60639ecfe@streamfeed.com>
> Content-Type: text/plain; charset=3Dutf-8; format=3Dflowed
>=20
> Hello,
>=20
> I'm trying to set up a policy-based routing on a wireguard instance. I=20
> didn't want to call it server, because it acts more like a proxy.
>=20
> Let's say I have 6 peers plus this wireguard server.
>=20
> Peer 2? Peer 3?? Peer 4
> ?\/?????? \/?????? \/
> ______________________
> |???????????????????? |
> | Wireguard "server"? |
> |???????????????????? |
> |_____________________|
> ?\/?????? \/?????? \/
> Peer 5? Peer 6?? Peer 7
>=20
> Wireguard "server"
> Address =3D 10.0.0.1/24
>=20
> Peers 2-7
> Address =3D 10.0.0.2-7/24, respectively.
>=20
> So, what I'm trying to do is route traffic to Peer 7, for example, if it=20=

> is coming from Peer 2. I can do it doing some `ip rule` and `ip route`=20
> commands. However, wireguard seems to be blocking that traffic. So, I=20
> want peers 5-7 act as gateways to the internet and I would choose it via=20=

> Linux environment.
>=20
> Peers 5-7 would be wireguard servers that would route all traffic to the=20=

> internet. So, on the wireguard instance (10.0.0.1/24, "server"), I have=20=

> to set allowed IPs to peers 5-7 as "0.0.0.0/0", correct? Does wireguard=20=

> accept that? On my tests it would just pick one as allowed IPs as=20
> 0.0.0.0/0 and set others to (none). Then, I couldn't reach traffic=20
> neither from nor to that others peers.
>=20
> On the wireguard "server" I would set allowed-IPs to peers 2-4 as=20
> 10.0.0.2/32-10.0.0.4/32 as I don't need traffic going through it, just=20
> coming from it.
>=20
> Is it possible to achieve that with wireguard?
>=20
> Thanks!
>=20
>=20
>=20
> ------------------------------
>=20
> Message: 4
> Date: Fri, 9 Mar 2018 22:35:00 +0100
> From: Matthias Urlichs <matthias@urlichs.de>
> To: wireguard@lists.zx2c4.com
> Subject: Re: Policy-based routing
> Message-ID: <9181ac49-897b-8412-84e9-1505cc261913@urlichs.de>
> Content-Type: text/plain; charset=3Dutf-8
>=20
> Hi,
>> Is it possible to achieve that with wireguard?=20
>=20
> You need to set up multiple wireguard interfaces (on different ports of
> course).
>=20
> Then you can use traditional Linux routing techniques.
>=20
> --=20
> -- Matthias Urlichs
>=20
>=20
>=20
> ------------------------------
>=20
> Message: 5
> Date: Fri, 9 Mar 2018 22:45:32 +0100
> From: Matthias Urlichs <matthias@urlichs.de>
> To: wireguard@lists.zx2c4.com
> Subject: Re: TCP Wireguard with socat
> Message-ID: <e0bff705-f328-0071-0fb7-0367d36f0074@urlichs.de>
> Content-Type: text/plain; charset=3Dutf-8
>=20
>> On 09.03.2018 17:41, Gianluca Gabrielli wrote:
>> My first thought has been to make use of socat
>=20
> socat can do either packet streams or byte streams. A UDP socket (or a
> tun/tap interface) is a packet stream. TCP is a byte stream. You can't
> forward a packet stream into a byte stream. (Well, OK, socat does allow
> you to set that up, but it won't work.)
>=20
> You need wrap your packets in some sort of frame (simplest: precede each
> with a length word (but think about byte ordering)). I'm sure there are
> programs which do that, or you can write your own. socat can't do it.
>=20
> --=20
> -- Matthias Urlichs
>=20
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
> End of WireGuard Digest, Vol 24, Issue 14
> *****************************************

--Apple-Mail-33F3CF78-2CCD-4781-8DC4-F479E6F4586E
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">wg inside gre inside tvp?<br><br><div id=3D=
"AppleMailSignature"><span style=3D"font-size: 13pt;">Thomas J Munn</span><b=
r><div><div><br></div></div></div><div><br>On Mar 10, 2018, at 06:00, <a hre=
f=3D"mailto:wireguard-request@lists.zx2c4.com">wireguard-request@lists.zx2c4=
.com</a> wrote:<br><br></div><blockquote type=3D"cite"><div><span>Send WireG=
uard mailing list submissions to</span><br><span> &nbsp; &nbsp;<a href=3D"ma=
ilto:wireguard@lists.zx2c4.com">wireguard@lists.zx2c4.com</a></span><br><spa=
n></span><br><span>To subscribe or unsubscribe via the World Wide Web, visit=
</span><br><span> &nbsp; &nbsp;<a href=3D"https://lists.zx2c4.com/mailman/li=
stinfo/wireguard">https://lists.zx2c4.com/mailman/listinfo/wireguard</a></sp=
an><br><span>or, via email, send a message with subject or body 'help' to</s=
pan><br><span> &nbsp; &nbsp;<a href=3D"mailto:wireguard-request@lists.zx2c4.=
com">wireguard-request@lists.zx2c4.com</a></span><br><span></span><br><span>=
You can reach the person managing the list at</span><br><span> &nbsp; &nbsp;=
<a href=3D"mailto:wireguard-owner@lists.zx2c4.com">wireguard-owner@lists.zx2=
c4.com</a></span><br><span></span><br><span>When replying, please edit your S=
ubject line so it is more specific</span><br><span>than "Re: Contents of Wir=
eGuard digest..."</span><br><span></span><br><span></span><br><span>Today's T=
opics:</span><br><span></span><br><span> &nbsp;&nbsp;1. Re: Another roaming p=
roblem (Toke H?iland-J?rgensen)</span><br><span> &nbsp;&nbsp;2. TCP Wireguar=
d with socat (Gianluca Gabrielli)</span><br><span> &nbsp;&nbsp;3. Policy-bas=
ed routing (Bruno)</span><br><span> &nbsp;&nbsp;4. Re: Policy-based routing (=
Matthias Urlichs)</span><br><span> &nbsp;&nbsp;5. Re: TCP Wireguard with soc=
at (Matthias Urlichs)</span><br><span></span><br><span></span><br><span>----=
------------------------------------------------------------------</span><br=
><span></span><br><span>Message: 1</span><br><span>Date: Fri, 09 Mar 2018 15=
:53:27 +0100</span><br><span>From: Toke H?iland-J?rgensen &lt;<a href=3D"mai=
lto:toke@toke.dk">toke@toke.dk</a>&gt;</span><br><span>To: "Jason A. Donenfe=
ld" &lt;<a href=3D"mailto:Jason@zx2c4.com">Jason@zx2c4.com</a>&gt;</span><br=
><span>Cc: WireGuard mailing list &lt;<a href=3D"mailto:wireguard@lists.zx2c=
4.com">wireguard@lists.zx2c4.com</a>&gt;</span><br><span>Subject: Re: Anothe=
r roaming problem</span><br><span>Message-ID: &lt;<a href=3D"mailto:878tb1jo=
60.fsf@toke.dk">878tb1jo60.fsf@toke.dk</a>&gt;</span><br><span>Content-Type:=
 text/plain</span><br><span></span><br><span>"Jason A. Donenfeld" &lt;<a hre=
f=3D"mailto:Jason@zx2c4.com">Jason@zx2c4.com</a>&gt; writes:</span><br><span=
></span><br><blockquote type=3D"cite"><span>Neat script, looks pretty easy t=
o use. The wg repo has a kprobes</span><br></blockquote><blockquote type=3D"=
cite"><span>script too for extracting ephemeral keys from the kernel:</span>=
<br></blockquote><blockquote type=3D"cite"><span></span><br></blockquote><bl=
ockquote type=3D"cite"><span><a href=3D"https://git.zx2c4.com/WireGuard/tree=
/contrib/examples/extract-handshakes">https://git.zx2c4.com/WireGuard/tree/c=
ontrib/examples/extract-handshakes</a></span><br></blockquote><span></span><=
br><span>Neat! Brave new world of debugging ;)</span><br><span></span><br><s=
pan>/me goes to write some more printk's</span><br><span></span><br><span></=
span><br><span>-Toke</span><br><span></span><br><span></span><br><span>-----=
-------------------------</span><br><span></span><br><span>Message: 2</span>=
<br><span>Date: Fri, 09 Mar 2018 11:41:45 -0500</span><br><span>From: Gianlu=
ca Gabrielli &lt;<a href=3D"mailto:tuxmealux@protonmail.com">tuxmealux@proto=
nmail.com</a>&gt;</span><br><span>To: "<a href=3D"mailto:wireguard@lists.zx2=
c4.com">wireguard@lists.zx2c4.com</a>" &lt;<a href=3D"mailto:wireguard@lists=
.zx2c4.com">wireguard@lists.zx2c4.com</a>&gt;</span><br><span>Subject: TCP W=
ireguard with socat</span><br><span>Message-ID:</span><br><span> &nbsp; &nbs=
p;&lt;<a href=3D"mailto:utLzzyzPJsv-W3vVhU4Sdchg_5A07v9qCxR1DeJ5Wu7RzJHcje1c=
CEjtEWi4j0aCN05ozn9b4VYJQsLovvl6TGPp-kbZ_5kfpReEJHQQXGk=3D@protonmail.com">u=
tLzzyzPJsv-W3vVhU4Sdchg_5A07v9qCxR1DeJ5Wu7RzJHcje1cCEjtEWi4j0aCN05ozn9b4VYJQ=
sLovvl6TGPp-kbZ_5kfpReEJHQQXGk=3D@protonmail.com</a>&gt;</span><br><span> &n=
bsp; &nbsp;</span><br><span>Content-Type: text/plain; charset=3DUTF-8</span>=
<br><span></span><br><span>Hi everybody,</span><br><span></span><br><span>I'=
m an happy wireguard user since a while, but at that time I need to link two=
 peers and I can only use TCP. I know that there are thousand of other tools=
 I can use, but I'd like to do it using wireguard.</span><br><span>My first t=
hought has been to make use of socat, since some newest version a new addres=
s type called INTERFACE has been added (<a href=3D"http://www.dest-unreach.o=
rg/socat/doc/socat.html#ADDRESS_TYPES">http://www.dest-unreach.org/socat/doc=
/socat.html#ADDRESS_TYPES</a>), so I tried to use it but I've not been able t=
o make it works.</span><br><span>This is why I'm here asking your feedbacks,=
 or to collect other ideas to let wireguard works through a TCP tunnel.</spa=
n><br><span></span><br><span>I wrote all the notes about the tests I made on=
 a pdf, I know that this is not the good way to share with you my results, a=
nd I should write it here once again in plaintext. But for me it will would t=
urn on a waste of time do it again, and it also would be less comprehensible=
.</span><br><span>I uploaded the pdf online instead to attach it to this ema=
il hence nobody needs to open it on his personal laptop, but it can be viewe=
d via any browser. I personally hate open unknown file on my computer. The p=
df can be viewed from the following link:</span><br><span><a href=3D"https:/=
/drive.google.com/open?id=3D1KrLvU1D0K4YpRHi-jsIjbExh0lFTRQks">https://drive=
.google.com/open?id=3D1KrLvU1D0K4YpRHi-jsIjbExh0lFTRQks</a></span><br><span>=
</span><br><span>I will really appreciate any constructive feedback or sugge=
stion on how to easily use wireguard with TCP.</span><br><span></span><br><s=
pan>Thanks,</span><br><span>Gianluca</span><br><span></span><br><span></span=
><br><span></span><br><span></span><br><span>------------------------------<=
/span><br><span></span><br><span>Message: 3</span><br><span>Date: Fri, 9 Mar=
 2018 16:38:35 -0300</span><br><span>From: Bruno &lt;<a href=3D"mailto:bruno=
@streamfeed.com">bruno@streamfeed.com</a>&gt;</span><br><span>To: <a href=3D=
"mailto:wireguard@lists.zx2c4.com">wireguard@lists.zx2c4.com</a></span><br><=
span>Subject: Policy-based routing</span><br><span>Message-ID: &lt;<a href=3D=
"mailto:a81edfe2-2a49-c49a-ea7c-65e60639ecfe@streamfeed.com">a81edfe2-2a49-c=
49a-ea7c-65e60639ecfe@streamfeed.com</a>&gt;</span><br><span>Content-Type: t=
ext/plain; charset=3Dutf-8; format=3Dflowed</span><br><span></span><br><span=
>Hello,</span><br><span></span><br><span>I'm trying to set up a policy-based=
 routing on a wireguard instance. I </span><br><span>didn't want to call it s=
erver, because it acts more like a proxy.</span><br><span></span><br><span>L=
et's say I have 6 peers plus this wireguard server.</span><br><span></span><=
br><span>Peer 2? Peer 3?? Peer 4</span><br><span> ?\/?????? \/?????? \/</spa=
n><br><span>______________________</span><br><span>|???????????????????? |</=
span><br><span>| Wireguard "server"? |</span><br><span>|????????????????????=
 |</span><br><span>|_____________________|</span><br><span> ?\/?????? \/????=
?? \/</span><br><span>Peer 5? Peer 6?? Peer 7</span><br><span></span><br><sp=
an>Wireguard "server"</span><br><span>Address =3D 10.0.0.1/24</span><br><spa=
n></span><br><span>Peers 2-7</span><br><span>Address =3D 10.0.0.2-7/24, resp=
ectively.</span><br><span></span><br><span>So, what I'm trying to do is rout=
e traffic to Peer 7, for example, if it </span><br><span>is coming from Peer=
 2. I can do it doing some `ip rule` and `ip route` </span><br><span>command=
s. However, wireguard seems to be blocking that traffic. So, I </span><br><s=
pan>want peers 5-7 act as gateways to the internet and I would choose it via=
 </span><br><span>Linux environment.</span><br><span></span><br><span>Peers 5=
-7 would be wireguard servers that would route all traffic to the </span><br=
><span>internet. So, on the wireguard instance (10.0.0.1/24, "server"), I ha=
ve </span><br><span>to set allowed IPs to peers 5-7 as "0.0.0.0/0", correct?=
 Does wireguard </span><br><span>accept that? On my tests it would just pick=
 one as allowed IPs as </span><br><span>0.0.0.0/0 and set others to (none). T=
hen, I couldn't reach traffic </span><br><span>neither from nor to that othe=
rs peers.</span><br><span></span><br><span>On the wireguard "server" I would=
 set allowed-IPs to peers 2-4 as </span><br><span>10.0.0.2/32-10.0.0.4/32 as=
 I don't need traffic going through it, just </span><br><span>coming from it=
.</span><br><span></span><br><span>Is it possible to achieve that with wireg=
uard?</span><br><span></span><br><span>Thanks!</span><br><span></span><br><s=
pan></span><br><span></span><br><span>------------------------------</span><=
br><span></span><br><span>Message: 4</span><br><span>Date: Fri, 9 Mar 2018 2=
2:35:00 +0100</span><br><span>From: Matthias Urlichs &lt;<a href=3D"mailto:m=
atthias@urlichs.de">matthias@urlichs.de</a>&gt;</span><br><span>To: <a href=3D=
"mailto:wireguard@lists.zx2c4.com">wireguard@lists.zx2c4.com</a></span><br><=
span>Subject: Re: Policy-based routing</span><br><span>Message-ID: &lt;<a hr=
ef=3D"mailto:9181ac49-897b-8412-84e9-1505cc261913@urlichs.de">9181ac49-897b-=
8412-84e9-1505cc261913@urlichs.de</a>&gt;</span><br><span>Content-Type: text=
/plain; charset=3Dutf-8</span><br><span></span><br><span>Hi,</span><br><bloc=
kquote type=3D"cite"><span>Is it possible to achieve that with wireguard? </=
span><br></blockquote><span></span><br><span>You need to set up multiple wir=
eguard interfaces (on different ports of</span><br><span>course).</span><br>=
<span></span><br><span>Then you can use traditional Linux routing techniques=
.</span><br><span></span><br><span>-- </span><br><span>-- Matthias Urlichs</=
span><br><span></span><br><span></span><br><span></span><br><span>----------=
--------------------</span><br><span></span><br><span>Message: 5</span><br><=
span>Date: Fri, 9 Mar 2018 22:45:32 +0100</span><br><span>From: Matthias Url=
ichs &lt;<a href=3D"mailto:matthias@urlichs.de">matthias@urlichs.de</a>&gt;<=
/span><br><span>To: <a href=3D"mailto:wireguard@lists.zx2c4.com">wireguard@l=
ists.zx2c4.com</a></span><br><span>Subject: Re: TCP Wireguard with socat</sp=
an><br><span>Message-ID: &lt;<a href=3D"mailto:e0bff705-f328-0071-0fb7-0367d=
36f0074@urlichs.de">e0bff705-f328-0071-0fb7-0367d36f0074@urlichs.de</a>&gt;<=
/span><br><span>Content-Type: text/plain; charset=3Dutf-8</span><br><span></=
span><br><span>On 09.03.2018 17:41, Gianluca Gabrielli wrote:</span><br><blo=
ckquote type=3D"cite"><span>My first thought has been to make use of socat</=
span><br></blockquote><span></span><br><span>socat can do either packet stre=
ams or byte streams. A UDP socket (or a</span><br><span>tun/tap interface) i=
s a packet stream. TCP is a byte stream. You can't</span><br><span>forward a=
 packet stream into a byte stream. (Well, OK, socat does allow</span><br><sp=
an>you to set that up, but it won't work.)</span><br><span></span><br><span>=
You need wrap your packets in some sort of frame (simplest: precede each</sp=
an><br><span>with a length word (but think about byte ordering)). I'm sure t=
here are</span><br><span>programs which do that, or you can write your own. s=
ocat can't do it.</span><br><span></span><br><span>-- </span><br><span>-- Ma=
tthias Urlichs</span><br><span></span><br><span></span><br><span></span><br>=
<span>------------------------------</span><br><span></span><br><span>Subjec=
t: Digest Footer</span><br><span></span><br><span>__________________________=
_____________________</span><br><span>WireGuard mailing list</span><br><span=
><a href=3D"mailto:WireGuard@lists.zx2c4.com">WireGuard@lists.zx2c4.com</a><=
/span><br><span><a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguar=
d">https://lists.zx2c4.com/mailman/listinfo/wireguard</a></span><br><span></=
span><br><span></span><br><span>------------------------------</span><br><sp=
an></span><br><span>End of WireGuard Digest, Vol 24, Issue 14</span><br><spa=
n>*****************************************</span><br></div></blockquote></b=
ody></html>=

--Apple-Mail-33F3CF78-2CCD-4781-8DC4-F479E6F4586E--
