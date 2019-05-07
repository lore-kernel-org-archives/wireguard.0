Return-Path: <SRS0=sgLz=TL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	T_MIME_MALF autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B12EC04AB1
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 11 May 2019 13:09:03 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB303217D6
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 11 May 2019 13:09:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M8LAY3uV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB303217D6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e86cffa8;
	Sat, 11 May 2019 13:08:35 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0a100445
 for <wireguard@lists.zx2c4.com>; Tue, 7 May 2019 03:42:49 +0000 (UTC)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7ca8e134
 for <wireguard@lists.zx2c4.com>; Tue, 7 May 2019 03:42:49 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id d3so3407285plj.11
 for <wireguard@lists.zx2c4.com>; Mon, 06 May 2019 20:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:mime-version:subject:date:references:to:in-reply-to:message-id;
 bh=fYiSOqSG6fvVEWRlV7mlyf4TfQ8evErQhP+Ahga7TXg=;
 b=M8LAY3uVv6undJq/LECrhB3S1BVXYlz9dqkUX9KRdqMPny8UMuDB4Lk4uGe+kmQwAT
 SrkGl9kLKddpwGqqUh5vTvBWixp2+fphSun10gjYTQ34WMHp7KjGFtMS5jk7OfqQR6XE
 MDwWatL8TPnn2biAGp2HLdZD/N9Y9kPdGu2pLjsv+DwwTq+fdd93+Vh7fJBnhpZ4pSz3
 AM9RAMEppx/kNRlh3Z89C0B9Ig54MdBfquIDecxew0ASgE64tQVLSlVS0T8SrG0Scyes
 xBDdmxnz+F4hUkiIa8HpsN1h9FcgZO7DIriTKyqXPrwCvXQlqUcrEEMPeP89h4kAjK0a
 LTaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:mime-version:subject:date:references:to
 :in-reply-to:message-id;
 bh=fYiSOqSG6fvVEWRlV7mlyf4TfQ8evErQhP+Ahga7TXg=;
 b=pgX6quoJMcb2k2Puv5OyydgjLq34vTTdACVLV7dhsAEz6whlmISjFczHTLk/vvHizD
 OXQHrHxjE8CYJif5jBhpubS+OlTzrUkHsJuQTUv4d38SNoWMwf9GzVNOWgDOVYef8C3r
 zLYnmYvqvW+a0no0PvVJU+6gZ6EKib1DNkUguYbDnTolKsUSGSoEEuSnpCkvnDjqkgcQ
 8n+RIhFx3VciUMGhCHteSvMeABIHvtPOlS33L76UuuRExGv397IcRSm6efTf0Wz1re1J
 0sQMVERA2YHFpW51gjikZAxHSx3yN2Z0Dgf9U81S0iWfULTsodF5OqWTqZQ6kzs/2W+e
 QQgg==
X-Gm-Message-State: APjAAAWTMTfgAqCSoLGkvv+LAzPOdD/2IrudipaKW+mt3gjEU9XqkpWV
 BsShL2hDzWE4j3jV9XS6s2aEmW1KLaM=
X-Google-Smtp-Source: APXvYqx049Yy2J0fRHg2nZkFBVON2pq6PXI2JeKZ460ht16tk88fSayEiBS9IFtAQUG8cU/GR9MTlA==
X-Received: by 2002:a17:902:8203:: with SMTP id
 x3mr16820583pln.11.1557200568189; 
 Mon, 06 May 2019 20:42:48 -0700 (PDT)
Received: from xeon.lan (ip5b403c51.dynamic.kabel-deutschland.de.
 [91.64.60.81])
 by smtp.gmail.com with ESMTPSA id 25sm13974024pfo.145.2019.05.06.20.42.44
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 May 2019 20:42:47 -0700 (PDT)
From: Thomas Dickomeit <thomas.dickomeit@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: WireGuard Digest, Vol 38, Issue 5
Date: Tue, 7 May 2019 05:42:40 +0200
References: <mailman.1563.1557175147.19426.wireguard@lists.zx2c4.com>
To: wireguard@lists.zx2c4.com
In-Reply-To: <mailman.1563.1557175147.19426.wireguard@lists.zx2c4.com>
Message-Id: <F17F1F63-59B9-4996-8983-18F39F90660F@gmail.com>
X-Mailer: Apple Mail (2.3273)
X-Mailman-Approved-At: Sat, 11 May 2019 15:08:34 +0200
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0204118372148976206=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


--===============0204118372148976206==
Content-Type: multipart/signed;
 boundary="Apple-Mail=_24EAE8EF-C540-4BB1-99DE-42D8A32517D0";
 protocol="application/pgp-signature"; micalg=pgp-sha512


--Apple-Mail=_24EAE8EF-C540-4BB1-99DE-42D8A32517D0
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_0B41E6CF-117C-492F-9D8E-B46DDCE86BA4"


--Apple-Mail=_0B41E6CF-117C-492F-9D8E-B46DDCE86BA4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hello Wireguard,

Im using on myMacPro 2013  Wireguard since more then a half year, via =
MacPorts, my WireguardServer is my Router with OpenWRT on it, made me a =
Shellscript.sh that fires wireguard up or down so u can launch it =
without opening the Terminal simply over my ShellScript.sh inder MacOS =
Finder =E2=80=A6its working wonderfull under OSX Sierra,

Now my question, I just say, in the AppStore, that there is a Wirguard =
client now AVAIABLE, Thanks for that!!! I Love Wireguard!

sadly, the damn AppleStore doesnt allow me to dl it, as I am still under =
OSX Sierra, is there a link I can dl it from another source then the =
damn AppleStore?

I dont want upgrade to what the AppleStore says, that it requieres OSX =
Majoave for many reasons, anyway, I have all a cool setup, so if it is =
so, that is requires OSX Mojave, I will stick with my solution, but I =
think, it would world also under OSX Sierra, would like to give it a =
try, but as I said, the Damn AppleStore says it requires Mojave sadly=E2=80=
=A6


Thank you!


Mit freundlichen Gr=C3=BC=C3=9Fen


Thomas Dickomeit
thomas.dickomeit@gmail.com

=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=
=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=
=94=E2=80=94

Falls Sie PGP Verschl=C3=BCssellungstechnolgie Benutzen, f=C3=BCgen Sie =
diesen, meinigen =C3=96ffentlichen Schl=C3=BCssel zu Ihrem =
Schl=C3=BCsselbund hinzu, somit k=C3=B6nnen Wir verschl=C3=BCsselt per =
eMail Kommunizieren :





> Am 06.05.2019 um 22:39 schrieb wireguard-request@lists.zx2c4.com:
>=20
> Send WireGuard mailing list submissions to
> 	wireguard@lists.zx2c4.com
>=20
> To subscribe or unsubscribe via the World Wide Web, visit
> 	https://lists.zx2c4.com/mailman/listinfo/wireguard
> or, via email, send a message with subject or body 'help' to
> 	wireguard-request@lists.zx2c4.com
>=20
> You can reach the person managing the list at
> 	wireguard-owner@lists.zx2c4.com
>=20
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of WireGuard digest..."
>=20
>=20
> Today's Topics:
>=20
>   1. MacOS client with local DNS resolver (Peter Baumgartner)
>   2. Request to change IPv4 preference - mobile apps (Will Tisdale)
>   3. WireGuard Android kernel module+gnirehtet? (steamport)
>   4. DNS on macos (Illule)
>   5. Deploy a wireguard on 2 raspberry pi to connect 2 remote lan
>      - Lan2Lan (Paulo Lopes)
>=20
>=20
> ----------------------------------------------------------------------
>=20
> Message: 1
> Date: Fri, 12 Apr 2019 12:07:28 -0600
> From: Peter Baumgartner <pete@lincolnloop.com>
> To: wireguard@lists.zx2c4.com
> Subject: MacOS client with local DNS resolver
> Message-ID:
> 	=
<CAC6K9z=3D3D=3DxMwTBRf3sA_5=3DOKR2R8o6aRa3JedGxzxVEzn-+Bw@mail.gmail.com>=

> Content-Type: text/plain; charset=3D"UTF-8"
>=20
> I'm using the official Mac GUI client (version 0.0.20190409) and am
> having troubles with DNS after connection. I use a local DNS resolver,
> so I have my DNS manually set to 127.0.0.1 on the network interface:
>=20
>    $ scutil --dns | grep scoped -A50
>    DNS configuration (for scoped queries)
>=20
>    resolver #1
>      nameserver[0] : 127.0.0.1
>      if_index : 8 (en0)
>      flags    : Scoped, Request A records, Request AAAA records
>      reach    : 0x00030002 (Reachable,Local Address,Directly Reachable =
Address)
>=20
> Once I activate a Wireguard tunnel, the resolvers are updated to the
> IP of my Wireguard server:
>=20
>    $ scutil --dns | grep scoped -A50
>    DNS configuration (for scoped queries)
>=20
>    resolver #1
>      nameserver[0] : 10.0.77.1
>      if_index : 8 (en0)
>      flags    : Scoped, Request A records
>      reach    : 0x00000002 (Reachable)
>=20
>    resolver #2
>      nameserver[0] : 10.0.77.1
>      if_index : 19 (utun2)
>      flags    : Scoped, Request A records
>      reach    : 0x00000003 (Reachable,Transient Connection)
>=20
> Setting `DNS =3D 127.0.0.1` on the [Interface] section for my client =
has
> no effect.
>=20
> How can I activate the tunnel, but keep my DNS resolver as 127.0.0.1?
>=20
>=20
> ------------------------------
>=20
> Message: 2
> Date: Sun, 14 Apr 2019 18:17:04 +0100
> From: Will Tisdale <will@z3n.uk>
> To: wireguard@lists.zx2c4.com
> Subject: Request to change IPv4 preference - mobile apps
> Message-ID:
> 	=
<CAFWLA-XbDKtYHib8G2ujk7E+fsuPco9uX9NvPsu35Dd_HxVGyA@mail.gmail.com>
> Content-Type: text/plain; charset=3D"UTF-8"
>=20
> Hello,
>=20
> I sent a message to the list about weirdness with IPv4 being preferred
> over IPv6 in the iOS app a few days ago, but it didn't get there for
> whatever reason.
>=20
> I've since done a bit of digging through the code and found that
> preferring IPv4 is intentional, and it's also implemented that way on
> the Android app too.
>=20
> It seems a shame to hobble native IPv6 support for everyone just to
> work around some peoples misconfigured setups.
>=20
> My suggestion/request would be to change the apps to prefer IPv6 as
> default, but add a switch to the apps to disable IPv6 or prefer IPv4
> for those with broken setups.
>=20
> Does that seem reasonable?
>=20
>=20
> Cheers,
>=20
>=20
> -Will
>=20
>=20
> ------------------------------
>=20
> Message: 3
> Date: Thu, 18 Apr 2019 09:47:23 +0000
> From: steamport <steamport@protonmail.com>
> To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
> Subject: WireGuard Android kernel module+gnirehtet?
> Message-ID:
> 	=
<EwYrrc-xpesfT0VwXUQnoXU-HHmFugo8Pj3MZu7o6nDNgazeJIegFKwyCNXABg4fBvsuTbTwA=
nEy52gaBLbzckHhOwUaFEFXOQggOQwGYPM=3D@protonmail.com>
>=20
> Content-Type: text/plain; charset=3D"utf-8"
>=20
> Hey, it appears the WireGuard kernel module doesn't work on top of an =
Android VPN, even if it's a reverse tethering thing like?gnirehtet.
>=20
> Also sorry if this isn't the proper place to report/say this.
>=20
> Sent with ProtonMail Secure Email.
> -------------- next part --------------
> An HTML attachment was scrubbed...
> URL: =
<http://lists.zx2c4.com/pipermail/wireguard/attachments/20190418/edd46c99/=
attachment.html>
> -------------- next part --------------
> A non-text attachment was scrubbed...
> Name: publickey - steamport@protonmail.com - 0x170EF114.asc
> Type: application/pgp-keys
> Size: 678 bytes
> Desc: not available
> URL: =
<http://lists.zx2c4.com/pipermail/wireguard/attachments/20190418/edd46c99/=
attachment.key>
> -------------- next part --------------
> A non-text attachment was scrubbed...
> Name: signature.asc
> Type: application/pgp-signature
> Size: 249 bytes
> Desc: OpenPGP digital signature
> URL: =
<http://lists.zx2c4.com/pipermail/wireguard/attachments/20190418/edd46c99/=
attachment.asc>
>=20
> ------------------------------
>=20
> Message: 4
> Date: Tue, 30 Apr 2019 00:41:14 +0200
> From: Illule <illule@ubstee.fr>
> To: wireguard@lists.zx2c4.com
> Subject: DNS on macos
> Message-ID: <8D6A8B89-F86B-4899-92FB-BCA9D455D79C@ubstee.fr>
> Content-Type: text/plain;	charset=3Dutf-8
>=20
> Hi,
>=20
> On macos the DNS set by wireguard is used as secondary DNS :
> sudo scutil ?dns returns :
> ```
> DNS configuration (for scoped queries)
>=20
> resolver #1
> search domain[0] : home
> nameserver[0] : fe80::924d:4aff:feeb:2eb0%en0
> nameserver[1] : 192.168.137.1
> if_index : 8 (en0)
> flags    : Scoped, Request A records, Request AAAA records
> reach    : 0x00020002 (Reachable,Directly Reachable Address)
>=20
> resolver #2
> nameserver[0] : 10.137.3.3
> if_index : 17 (utun1)
> flags    : Scoped, Request A records
> reach    : 0x00000003 (Reachable,Transient Connection)
> ```
>=20
> Is it wanted ? I?d prefer use my personnal DNS as main resolver. =
Moreover safari seems to being able to use it when a domain is not =
public but not command like dig.
>=20
> Best regards,
>=20
> Illule
>=20
> ------------------------------
>=20
> Message: 5
> Date: Wed, 1 May 2019 15:19:08 +0000
> From: Paulo Lopes <plopes1960@hotmail.com>
> To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
> Subject: Deploy a wireguard on 2 raspberry pi to connect 2 remote lan
> 	- Lan2Lan
> Message-ID:
> 	=
<AM0PR08MB3522DC4AA812C933D8285AFCD43B0@AM0PR08MB3522.eurprd08.prod.outloo=
k.com>
>=20
> Content-Type: text/plain; charset=3D"utf-8"
>=20
> Hi all!!!
>=20
> First, let me thank for the amazing vpn protocol that Wireguard is!!!!
>=20
> I need your advise. As you can see on the picture attach, I have 2 =
raspberry pi. One as a vpn server and the other as a vpn client to =
connect 2 remote Lan.
>=20
> Can you point me what I need to do, if I want to replace the openvpn =
for the wireguard?
>=20
> I can connect 2 rpi with wireguard, but, the others ip machinies on =
the server and client side can?t see each other.
>=20
> With openvpn I needed to inser iroute and add a static route on both =
routers. What I need to with the wireguard?
>=20
> Once again many tahnks for all the help you can give me?
>=20
> -------------- next part --------------
> An HTML attachment was scrubbed...
> URL: =
<http://lists.zx2c4.com/pipermail/wireguard/attachments/20190501/43336e96/=
attachment.html>
> -------------- next part --------------
> A non-text attachment was scrubbed...
> Name: 43065884_1892102284211888_2227626938879442944_n.jpg
> Type: image/jpeg
> Size: 46732 bytes
> Desc: 43065884_1892102284211888_2227626938879442944_n.jpg
> URL: =
<http://lists.zx2c4.com/pipermail/wireguard/attachments/20190501/43336e96/=
attachment.jpg>
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
> End of WireGuard Digest, Vol 38, Issue 5
> ****************************************


--Apple-Mail=_0B41E6CF-117C-492F-9D8E-B46DDCE86BA4
Content-Type: multipart/mixed;
	boundary="Apple-Mail=_369A0A03-6A4B-449E-B70C-E2D9DC3AA804"


--Apple-Mail=_369A0A03-6A4B-449E-B70C-E2D9DC3AA804
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D"">Hello Wireguard,<div class=3D""><br class=3D""></div><div =
class=3D"">Im using on myMacPro 2013 &nbsp;Wireguard since more then a =
half year, via MacPorts, my WireguardServer is my Router with OpenWRT on =
it, made me a Shellscript.sh that fires wireguard up or down so u can =
launch it without opening the Terminal simply over my ShellScript.sh =
inder MacOS Finder =E2=80=A6its working wonderfull under OSX =
Sierra,</div><div class=3D""><br class=3D""></div><div class=3D"">Now my =
question, I just say, in the AppStore, that there is a Wirguard client =
now AVAIABLE, Thanks for that!!! I Love Wireguard!</div><div =
class=3D""><br class=3D""></div><div class=3D"">sadly, the damn =
AppleStore doesnt allow me to dl it, as I am still under OSX Sierra, is =
there a link I can dl it from another source then the damn =
AppleStore?</div><div class=3D""><br class=3D""></div><div class=3D"">I =
dont want upgrade to what the AppleStore says, that it requieres OSX =
Majoave for many reasons, anyway, I have all a cool setup, so if it is =
so, that is requires OSX Mojave, I will stick with my solution, but I =
think, it would world also under OSX Sierra, would like to give it a =
try, but as I said, the Damn AppleStore says it requires Mojave =
sadly=E2=80=A6</div><div class=3D""><br class=3D""></div><div =
class=3D""><br class=3D""></div><div class=3D"">Thank you!</div><div =
class=3D""><br class=3D""><div class=3D"">
<div style=3D"color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; orphans: auto; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; widows: =
auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px;"><br =
class=3D"Apple-interchange-newline">Mit freundlichen Gr=C3=BC=C3=9Fen</div=
><div style=3D"color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; orphans: auto; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; widows: =
auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px;"><br class=3D""></div><div style=3D"color:=
 rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: =
0px;"><br class=3D""></div><div style=3D"color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;">Thomas =
Dickomeit</div><div style=3D"color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px;"><a =
href=3D"mailto:thomas.dickomeit@gmail.com" =
class=3D"">thomas.dickomeit@gmail.com</a></div><div style=3D"color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: =
0px;"><br class=3D""></div><div style=3D"color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: =
0px;">=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=
=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=
=E2=80=94=E2=80=94</div><div style=3D"color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px;"><br class=3D""></div><div style=3D"color:=
 rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: =
0px;">Falls Sie PGP Verschl=C3=BCssellungstechnolgie Benutzen, f=C3=BCgen =
Sie diesen, meinigen =C3=96ffentlichen Schl=C3=BCssel zu Ihrem =
Schl=C3=BCsselbund hinzu, somit k=C3=B6nnen Wir verschl=C3=BCsselt per =
eMail Kommunizieren :</div><div style=3D"color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;"><br =
class=3D""></div><div style=3D"color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px;"><br class=3D""></div><br =
class=3D"Apple-interchange-newline"><span></span></div></div></body></html=
>=

--Apple-Mail=_369A0A03-6A4B-449E-B70C-E2D9DC3AA804
Content-Disposition: attachment;
	filename*=utf-8''Thomas%20Dickomeit%20%20%E2%80%93%20O%CC%88ffentlicherPGPSchlu%CC%88ssel.asc
Content-Type: application/x-apple-msg-attachment;
	x-unix-mode=0666;
	name="=?utf-8?Q?Thomas_Dickomeit__=E2=80=93_O=CC=88ffentlicherPGPSchlu=CC=88sse?=
 =?utf-8?Q?l=2Easc?="
Content-Transfer-Encoding: 7bit

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
cJJynwAHmXO26CQKhp7jVriv7X2E6e8=
=eKct
-----END PGP PUBLIC KEY BLOCK-----

--Apple-Mail=_369A0A03-6A4B-449E-B70C-E2D9DC3AA804
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><div class=3D""><div class=3D""><span></span>
</div>
<br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">Am 06.05.2019 um 22:39 schrieb <a =
href=3D"mailto:wireguard-request@lists.zx2c4.com" =
class=3D"">wireguard-request@lists.zx2c4.com</a>:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div class=3D"">Send =
WireGuard mailing list submissions to<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><a =
href=3D"mailto:wireguard@lists.zx2c4.com" =
class=3D"">wireguard@lists.zx2c4.com</a><br class=3D""><br class=3D"">To =
subscribe or unsubscribe via the World Wide Web, visit<br class=3D""><span=
 class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>https://lists.zx2c4.com/mailman/listinfo/wireguard<br =
class=3D"">or, via email, send a message with subject or body 'help' =
to<br class=3D""><span class=3D"Apple-tab-span" style=3D"white-space:pre">=
	</span>wireguard-request@lists.zx2c4.com<br class=3D""><br =
class=3D"">You can reach the person managing the list at<br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>wireguard-owner@lists.zx2c4.com<br class=3D""><br class=3D"">When =
replying, please edit your Subject line so it is more specific<br =
class=3D"">than "Re: Contents of WireGuard digest..."<br class=3D""><br =
class=3D""><br class=3D"">Today's Topics:<br class=3D""><br class=3D""> =
&nbsp;&nbsp;1. MacOS client with local DNS resolver (Peter =
Baumgartner)<br class=3D""> &nbsp;&nbsp;2. Request to change IPv4 =
preference - mobile apps (Will Tisdale)<br class=3D""> &nbsp;&nbsp;3. =
WireGuard Android kernel module+gnirehtet? (steamport)<br class=3D""> =
&nbsp;&nbsp;4. DNS on macos (Illule)<br class=3D""> &nbsp;&nbsp;5. =
Deploy a wireguard on 2 raspberry pi to connect 2 remote lan<br =
class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- Lan2Lan (Paulo Lopes)<br =
class=3D""><br class=3D""><br =
class=3D"">---------------------------------------------------------------=
-------<br class=3D""><br class=3D"">Message: 1<br class=3D"">Date: Fri, =
12 Apr 2019 12:07:28 -0600<br class=3D"">From: Peter Baumgartner =
&lt;pete@lincolnloop.com&gt;<br class=3D"">To: =
wireguard@lists.zx2c4.com<br class=3D"">Subject: MacOS client with local =
DNS resolver<br class=3D"">Message-ID:<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>&lt;CAC6K9z=3D3D=3DxMwTBRf3sA_5=3DOKR2R8o6aRa3JedGxzxVEzn-+Bw@mail.=
gmail.com&gt;<br class=3D"">Content-Type: text/plain; charset=3D"UTF-8"<br=
 class=3D""><br class=3D"">I'm using the official Mac GUI client =
(version 0.0.20190409) and am<br class=3D"">having troubles with DNS =
after connection. I use a local DNS resolver,<br class=3D"">so I have my =
DNS manually set to 127.0.0.1 on the network interface:<br class=3D""><br =
class=3D""> &nbsp;&nbsp;&nbsp;$ scutil --dns | grep scoped -A50<br =
class=3D""> &nbsp;&nbsp;&nbsp;DNS configuration (for scoped queries)<br =
class=3D""><br class=3D""> &nbsp;&nbsp;&nbsp;resolver #1<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;nameserver[0] : 127.0.0.1<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if_index : 8 (en0)<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;flags &nbsp;&nbsp;&nbsp;: Scoped, Request =
A records, Request AAAA records<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;reach &nbsp;&nbsp;&nbsp;: 0x00030002 =
(Reachable,Local Address,Directly Reachable Address)<br class=3D""><br =
class=3D"">Once I activate a Wireguard tunnel, the resolvers are updated =
to the<br class=3D"">IP of my Wireguard server:<br class=3D""><br =
class=3D""> &nbsp;&nbsp;&nbsp;$ scutil --dns | grep scoped -A50<br =
class=3D""> &nbsp;&nbsp;&nbsp;DNS configuration (for scoped queries)<br =
class=3D""><br class=3D""> &nbsp;&nbsp;&nbsp;resolver #1<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;nameserver[0] : 10.0.77.1<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if_index : 8 (en0)<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;flags &nbsp;&nbsp;&nbsp;: Scoped, Request =
A records<br class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;reach =
&nbsp;&nbsp;&nbsp;: 0x00000002 (Reachable)<br class=3D""><br class=3D""> =
&nbsp;&nbsp;&nbsp;resolver #2<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;nameserver[0] : 10.0.77.1<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if_index : 19 (utun2)<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;flags &nbsp;&nbsp;&nbsp;: Scoped, Request =
A records<br class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;reach =
&nbsp;&nbsp;&nbsp;: 0x00000003 (Reachable,Transient Connection)<br =
class=3D""><br class=3D"">Setting `DNS =3D 127.0.0.1` on the [Interface] =
section for my client has<br class=3D"">no effect.<br class=3D""><br =
class=3D"">How can I activate the tunnel, but keep my DNS resolver as =
127.0.0.1?<br class=3D""><br class=3D""><br =
class=3D"">------------------------------<br class=3D""><br =
class=3D"">Message: 2<br class=3D"">Date: Sun, 14 Apr 2019 18:17:04 =
+0100<br class=3D"">From: Will Tisdale &lt;will@z3n.uk&gt;<br =
class=3D"">To: wireguard@lists.zx2c4.com<br class=3D"">Subject: Request =
to change IPv4 preference - mobile apps<br class=3D"">Message-ID:<br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>&lt;CAFWLA-XbDKtYHib8G2ujk7E+fsuPco9uX9NvPsu35Dd_HxVGyA@mail.gmail.=
com&gt;<br class=3D"">Content-Type: text/plain; charset=3D"UTF-8"<br =
class=3D""><br class=3D"">Hello,<br class=3D""><br class=3D"">I sent a =
message to the list about weirdness with IPv4 being preferred<br =
class=3D"">over IPv6 in the iOS app a few days ago, but it didn't get =
there for<br class=3D"">whatever reason.<br class=3D""><br class=3D"">I've=
 since done a bit of digging through the code and found that<br =
class=3D"">preferring IPv4 is intentional, and it's also implemented =
that way on<br class=3D"">the Android app too.<br class=3D""><br =
class=3D"">It seems a shame to hobble native IPv6 support for everyone =
just to<br class=3D"">work around some peoples misconfigured setups.<br =
class=3D""><br class=3D"">My suggestion/request would be to change the =
apps to prefer IPv6 as<br class=3D"">default, but add a switch to the =
apps to disable IPv6 or prefer IPv4<br class=3D"">for those with broken =
setups.<br class=3D""><br class=3D"">Does that seem reasonable?<br =
class=3D""><br class=3D""><br class=3D"">Cheers,<br class=3D""><br =
class=3D""><br class=3D"">-Will<br class=3D""><br class=3D""><br =
class=3D"">------------------------------<br class=3D""><br =
class=3D"">Message: 3<br class=3D"">Date: Thu, 18 Apr 2019 09:47:23 =
+0000<br class=3D"">From: steamport &lt;steamport@protonmail.com&gt;<br =
class=3D"">To: "wireguard@lists.zx2c4.com" =
&lt;wireguard@lists.zx2c4.com&gt;<br class=3D"">Subject: WireGuard =
Android kernel module+gnirehtet?<br class=3D"">Message-ID:<br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>&lt;EwYrrc-xpesfT0VwXUQnoXU-HHmFugo8Pj3MZu7o6nDNgazeJIegFKwyCNXABg4=
fBvsuTbTwAnEy52gaBLbzckHhOwUaFEFXOQggOQwGYPM=3D@protonmail.com&gt;<br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><br class=3D"">Content-Type: text/plain; charset=3D"utf-8"<br =
class=3D""><br class=3D"">Hey, it appears the WireGuard kernel module =
doesn't work on top of an Android VPN, even if it's a reverse tethering =
thing like?gnirehtet.<br class=3D""><br class=3D"">Also sorry if this =
isn't the proper place to report/say this.<br class=3D""><br =
class=3D"">Sent with ProtonMail Secure Email.<br class=3D"">--------------=
 next part --------------<br class=3D"">An HTML attachment was =
scrubbed...<br class=3D"">URL: =
&lt;http://lists.zx2c4.com/pipermail/wireguard/attachments/20190418/edd46c=
99/attachment.html&gt;<br class=3D"">-------------- next part =
--------------<br class=3D"">A non-text attachment was scrubbed...<br =
class=3D"">Name: publickey - steamport@protonmail.com - =
0x170EF114.asc<br class=3D"">Type: application/pgp-keys<br =
class=3D"">Size: 678 bytes<br class=3D"">Desc: not available<br =
class=3D"">URL: =
&lt;http://lists.zx2c4.com/pipermail/wireguard/attachments/20190418/edd46c=
99/attachment.key&gt;<br class=3D"">-------------- next part =
--------------<br class=3D"">A non-text attachment was scrubbed...<br =
class=3D"">Name: signature.asc<br class=3D"">Type: =
application/pgp-signature<br class=3D"">Size: 249 bytes<br =
class=3D"">Desc: OpenPGP digital signature<br class=3D"">URL: =
&lt;http://lists.zx2c4.com/pipermail/wireguard/attachments/20190418/edd46c=
99/attachment.asc&gt;<br class=3D""><br =
class=3D"">------------------------------<br class=3D""><br =
class=3D"">Message: 4<br class=3D"">Date: Tue, 30 Apr 2019 00:41:14 =
+0200<br class=3D"">From: Illule &lt;illule@ubstee.fr&gt;<br =
class=3D"">To: wireguard@lists.zx2c4.com<br class=3D"">Subject: DNS on =
macos<br class=3D"">Message-ID: =
&lt;8D6A8B89-F86B-4899-92FB-BCA9D455D79C@ubstee.fr&gt;<br =
class=3D"">Content-Type: text/plain;<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>charset=3Dutf-8<br class=3D""><br =
class=3D"">Hi,<br class=3D""><br class=3D"">On macos the DNS set by =
wireguard is used as secondary DNS :<br class=3D"">sudo scutil ?dns =
returns :<br class=3D"">```<br class=3D"">DNS configuration (for scoped =
queries)<br class=3D""><br class=3D"">resolver #1<br class=3D""> search =
domain[0] : home<br class=3D""> nameserver[0] : =
fe80::924d:4aff:feeb:2eb0%en0<br class=3D""> nameserver[1] : =
192.168.137.1<br class=3D""> if_index : 8 (en0)<br class=3D""> flags =
&nbsp;&nbsp;&nbsp;: Scoped, Request A records, Request AAAA records<br =
class=3D""> reach &nbsp;&nbsp;&nbsp;: 0x00020002 (Reachable,Directly =
Reachable Address)<br class=3D""><br class=3D"">resolver #2<br class=3D"">=
 nameserver[0] : 10.137.3.3<br class=3D""> if_index : 17 (utun1)<br =
class=3D""> flags &nbsp;&nbsp;&nbsp;: Scoped, Request A records<br =
class=3D""> reach &nbsp;&nbsp;&nbsp;: 0x00000003 (Reachable,Transient =
Connection)<br class=3D"">```<br class=3D""><br class=3D"">Is it wanted =
? I?d prefer use my personnal DNS as main resolver. Moreover safari =
seems to being able to use it when a domain is not public but not =
command like dig.<br class=3D""><br class=3D"">Best regards,<br =
class=3D""><br class=3D"">Illule<br class=3D""><br =
class=3D"">------------------------------<br class=3D""><br =
class=3D"">Message: 5<br class=3D"">Date: Wed, 1 May 2019 15:19:08 =
+0000<br class=3D"">From: Paulo Lopes &lt;plopes1960@hotmail.com&gt;<br =
class=3D"">To: "wireguard@lists.zx2c4.com" =
&lt;wireguard@lists.zx2c4.com&gt;<br class=3D"">Subject: Deploy a =
wireguard on 2 raspberry pi to connect 2 remote lan<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>- =
Lan2Lan<br class=3D"">Message-ID:<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>&lt;AM0PR08MB3522DC4AA812C933D8285AFCD43B0@AM0PR08MB3522.eurprd08.p=
rod.outlook.com&gt;<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><br class=3D"">Content-Type: =
text/plain; charset=3D"utf-8"<br class=3D""><br class=3D"">Hi all!!!<br =
class=3D""><br class=3D"">First, let me thank for the amazing vpn =
protocol that Wireguard is!!!!<br class=3D""><br class=3D"">I need your =
advise. As you can see on the picture attach, I have 2 raspberry pi. One =
as a vpn server and the other as a vpn client to connect 2 remote =
Lan.<br class=3D""><br class=3D"">Can you point me what I need to do, if =
I want to replace the openvpn for the wireguard?<br class=3D""><br =
class=3D"">I can connect 2 rpi with wireguard, but, the others ip =
machinies on the server and client side can?t see each other.<br =
class=3D""><br class=3D"">With openvpn I needed to inser iroute and add =
a static route on both routers. What I need to with the wireguard?<br =
class=3D""><br class=3D"">Once again many tahnks for all the help you =
can give me?<br class=3D""><br class=3D"">-------------- next part =
--------------<br class=3D"">An HTML attachment was scrubbed...<br =
class=3D"">URL: =
&lt;http://lists.zx2c4.com/pipermail/wireguard/attachments/20190501/43336e=
96/attachment.html&gt;<br class=3D"">-------------- next part =
--------------<br class=3D"">A non-text attachment was scrubbed...<br =
class=3D"">Name: 43065884_1892102284211888_2227626938879442944_n.jpg<br =
class=3D"">Type: image/jpeg<br class=3D"">Size: 46732 bytes<br =
class=3D"">Desc: 43065884_1892102284211888_2227626938879442944_n.jpg<br =
class=3D"">URL: =
&lt;http://lists.zx2c4.com/pipermail/wireguard/attachments/20190501/43336e=
96/attachment.jpg&gt;<br class=3D""><br =
class=3D"">------------------------------<br class=3D""><br =
class=3D"">Subject: Digest Footer<br class=3D""><br =
class=3D"">_______________________________________________<br =
class=3D"">WireGuard mailing list<br =
class=3D"">WireGuard@lists.zx2c4.com<br =
class=3D"">https://lists.zx2c4.com/mailman/listinfo/wireguard<br =
class=3D""><br class=3D""><br class=3D"">------------------------------<br=
 class=3D""><br class=3D"">End of WireGuard Digest, Vol 38, Issue 5<br =
class=3D"">****************************************<br =
class=3D""></div></div></blockquote></div><br =
class=3D""></div></body></html>=

--Apple-Mail=_369A0A03-6A4B-449E-B70C-E2D9DC3AA804--

--Apple-Mail=_0B41E6CF-117C-492F-9D8E-B46DDCE86BA4--

--Apple-Mail=_24EAE8EF-C540-4BB1-99DE-42D8A32517D0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE+QMmkPX6VKOjhAiV/ENsLJS3+lsFAlzQ/rAACgkQ/ENsLJS3
+lt2cg/+LwqF+ECIIBNrXtcjCZ/nNKlEPfxSU6XW65WFPm+kITtatKoK77o1yed3
HfJzhCxrALXsTQyYnZf33+QihwY0HpU32+EdXEx499k5UlhNtVijLYYGpMdTxyqf
hIo5VY319SrHcsB4tYfGAJgrqjUEso8aBUI2D57cUjJCp8l9AfNW3bajwBooHS3M
82qBafa8oiUI+k5STDDXoHK6xyjVqisgeVDCpxNk3J3j0DbQya3KsxZs0j9LrxmA
y+29GhERxxIqvKr+5zMHx27E+djt9P9c0kpay74qgwpN6BjEA1MONVZjeatl78iQ
ZSpKu8DDdcGKfp4HV4IMTr9aB8UkLoZ1v0E1kHK/P39hIRstqkDieqJv2OqygLRo
AoLW/GE+tW07PTcczoxly6C32lLq2yYpjvH6Wt47f3KUaUFSJojBknNNw3loWn/q
on1CbyIsnlxUR4GkPKFNZX9NpcbEVmyc8ah6okwYg+CGrM6EQ7N8RGNjTbgpuHkU
AXrip5Euz4LyHrCa7GN/Bfp20XFIQ/LaXm+2ZAGn3/x+9Ndicx4hIN1zNY60DLws
foytL8B7gqkMzfYW1qxBeQ3zfWshCjmt65+3oLkzbsdqGdsej3S0F93CNLRNjx1J
b3nDIpeyHDD0HSwHRVOgfsC90yMQIShNUsQPBhIjiArzy4N3kpA=
=kibJ
-----END PGP SIGNATURE-----

--Apple-Mail=_24EAE8EF-C540-4BB1-99DE-42D8A32517D0--

--===============0204118372148976206==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============0204118372148976206==--
