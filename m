Return-Path: mailing-porcus@porcus.ch
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e9e1dd67
 for <wireguard@lists.zx2c4.com>;
 Wed, 11 Jan 2017 21:39:38 +0000 (UTC)
Received: from mel.porcus.ch (mel.porcus.ch [46.20.250.35])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 42beb00a
 for <wireguard@lists.zx2c4.com>;
 Wed, 11 Jan 2017 21:39:38 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_EF927EA6-8F8B-4693-8E60-25547D885230"
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: Maximum number of interfaces + Debug 
From: Will van Gulik <mailing-porcus@porcus.ch>
In-Reply-To: <20170111095837.GB11399@tuxmachine.polynome.dn42>
Date: Wed, 11 Jan 2017 22:49:26 +0100
Message-Id: <364A8AFB-28FA-41BB-A6E4-FBB65C4BB069@porcus.ch>
References: <698F0489-3376-4D52-A48E-A4C9F344D817@porcus.ch>
 <9F550D1D-A374-48D6-881E-D626BB250E8F@porcus.ch>
 <20170111095837.GB11399@tuxmachine.polynome.dn42>
To: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--Apple-Mail=_EF927EA6-8F8B-4693-8E60-25547D885230
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi Baptiste,

> On 11 Jan 2017, at 10:58, Baptiste Jonglez =
<baptiste@bitsofnetworks.org> wrote:
>=20
> Hi Will,
>=20
>=20
> There have been backwards-incompatible changes recently: can you make =
sure
> that you use the exact same wireguard version on all peers?

I was using the same version (Debian package 0.0.20161230-1 from =
Unstable). However my bug occured between the package version and the =
compiled version from 0.0.20170105 . So I'll retry with both same kernel =
modules. Because at least for that try, I have a mismatch. But for my =
previous experiments all the version were the same.

Additional question, is it better to use  one interface with a big =
subnet and multiple remote peers or an interface by peer with a /30 or a =
/31 ?=20

Cheers,=20

Will

>=20
>> Any clue, ideas, else ?
>>=20
>> Cheers,
>>=20
>> Will
>>=20
>>> On 03 Jan 2017, at 09:52, Will van Gulik <mailing-porcus@porcus.ch> =
wrote:
>>>=20
>>> Hi,
>>>=20
>>> I'm trying to use multiple wireguard tunnel in one VM at the same =
time, but it seems that only the first two I configured are working. I'm =
currently trying with 5 interfaces, I see the incoming packet in tcpdump =
but no reaction of the destination host with all the wg interfaces.
>>>=20
>>> I'm not sure there is a limitation on that, I could totally have =
missed that. Should I use 1 interface with multiple peers rather than =
multiple interface ?
>>>=20
>>> I'm testing that on a Debian with 4.8.7-1, running on a KVM host.
>>>=20
>>> Any insight ?
>>>=20
>>> Kind regards,
>>>=20
>>> Will
>>> _______________________________________________
>>> WireGuard mailing list
>>> WireGuard@lists.zx2c4.com
>>> https://lists.zx2c4.com/mailman/listinfo/wireguard
>>=20
>> _______________________________________________
>> WireGuard mailing list
>> WireGuard@lists.zx2c4.com <mailto:WireGuard@lists.zx2c4.com>
>> https://lists.zx2c4.com/mailman/listinfo/wireguard =
<https://lists.zx2c4.com/mailman/listinfo/wireguard>

--Apple-Mail=_EF927EA6-8F8B-4693-8E60-25547D885230
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D"">Hi Baptiste,<div class=3D""><br class=3D""></div><div =
class=3D""><div><blockquote type=3D"cite" class=3D""><div class=3D"">On =
11 Jan 2017, at 10:58, Baptiste Jonglez &lt;<a =
href=3D"mailto:baptiste@bitsofnetworks.org" =
class=3D"">baptiste@bitsofnetworks.org</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><span =
style=3D"font-family: Helvetica; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">Hi Will,</span><br style=3D"font-family: =
Helvetica; font-size: 14px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: =
0px;" class=3D""><br class=3D""><br style=3D"font-family: Helvetica; =
font-size: 14px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><span style=3D"font-family: Helvetica; font-size: 14px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; float: none; display: =
inline !important;" class=3D"">There have been backwards-incompatible =
changes recently: can you make sure</span><br style=3D"font-family: =
Helvetica; font-size: 14px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: =
0px;" class=3D""><span style=3D"font-family: Helvetica; font-size: 14px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; float: none; display: =
inline !important;" class=3D"">that you use the exact same wireguard =
version on all peers?</span><br style=3D"font-family: Helvetica; =
font-size: 14px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""></div></blockquote><div><br class=3D""></div><div>I was using =
the same version (Debian package&nbsp;0.0.20161230-1 from Unstable). =
However my bug occured between the package version and the compiled =
version from&nbsp;0.0.20170105 . So I'll retry with both same kernel =
modules. Because at least for that try, I have a mismatch. But for my =
previous experiments all the version were the same.</div><div><br =
class=3D""></div><div>Additional question, is it better to use &nbsp;one =
interface with a big subnet and multiple remote peers or an interface by =
peer with a /30 or a /31 ?&nbsp;</div><div><br =
class=3D""></div><div>Cheers,&nbsp;</div><div><br =
class=3D""></div><div>Will</div><br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D""><br style=3D"font-family: Helvetica; =
font-size: 14px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><blockquote type=3D"cite" style=3D"font-family: Helvetica; =
font-size: 14px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D"">Any clue, ideas, else ?<br class=3D""><br class=3D"">Cheers,<br=
 class=3D""><br class=3D"">Will<br class=3D""><br class=3D""><blockquote =
type=3D"cite" class=3D"">On 03 Jan 2017, at 09:52, Will van Gulik &lt;<a =
href=3D"mailto:mailing-porcus@porcus.ch" =
class=3D"">mailing-porcus@porcus.ch</a>&gt; wrote:<br class=3D""><br =
class=3D"">Hi,<br class=3D""><br class=3D"">I'm trying to use multiple =
wireguard tunnel in one VM at the same time, but it seems that only the =
first two I configured are working. I'm currently trying with 5 =
interfaces, I see the incoming packet in tcpdump but no reaction of the =
destination host with all the wg interfaces.<br class=3D""><br =
class=3D"">I'm not sure there is a limitation on that, I could totally =
have missed that. Should I use 1 interface with multiple peers rather =
than multiple interface ?<br class=3D""><br class=3D"">I'm testing that =
on a Debian with 4.8.7-1, running on a KVM host.<br class=3D""><br =
class=3D"">Any insight ?<br class=3D""><br class=3D"">Kind regards,<br =
class=3D""><br class=3D"">Will<br =
class=3D"">_______________________________________________<br =
class=3D"">WireGuard mailing list<br class=3D""><a =
href=3D"mailto:WireGuard@lists.zx2c4.com" =
class=3D"">WireGuard@lists.zx2c4.com</a><br =
class=3D"">https://lists.zx2c4.com/mailman/listinfo/wireguard<br =
class=3D""></blockquote><br =
class=3D"">_______________________________________________<br =
class=3D"">WireGuard mailing list<br class=3D""><a =
href=3D"mailto:WireGuard@lists.zx2c4.com" =
class=3D"">WireGuard@lists.zx2c4.com</a><br class=3D""><a =
href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" =
class=3D"">https://lists.zx2c4.com/mailman/listinfo/wireguard</a></blockqu=
ote></div></blockquote></div><br class=3D""></div></body></html>=

--Apple-Mail=_EF927EA6-8F8B-4693-8E60-25547D885230--
