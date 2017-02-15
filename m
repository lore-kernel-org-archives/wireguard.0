Return-Path: saschagrunert@icloud.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 70e0a34e
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Feb 2017 18:29:59 +0000 (UTC)
Received: from st11p01im-asmtp002.me.com (st11p01im-asmtp002.me.com
 [17.172.204.152])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 124d2ee8
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Feb 2017 18:29:59 +0000 (UTC)
Received: from process-dkim-sign-daemon.st11p01im-asmtp002.me.com by
 st11p01im-asmtp002.me.com
 (Oracle Communications Messaging Server 7.0.5.38.0 64bit (built Feb 26 2016))
 id <0OLF01100HOLIU00@st11p01im-asmtp002.me.com> for wireguard@lists.zx2c4.com;
 Wed, 15 Feb 2017 18:29:58 +0000 (GMT)
Content-type: text/plain; charset=utf-8
MIME-version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Subject: Re: Rust Version
From: Sascha Grunert <saschagrunert@icloud.com>
In-reply-to: <20170215182515.GA9852@c3po>
Date: Wed, 15 Feb 2017 19:29:55 +0100
Message-id: <94F76D79-1813-49E1-AA25-0CE27B3A460D@icloud.com>
References: <3937BCFE-F4EB-4E95-A46E-A87ECA8D9414@icloud.com>
 <20170215182515.GA9852@c3po>
To: Michael Gerlach <n3ph@terminal21.de>
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey n3ph,

The DPI could do a simple classification of the stream which could =
others use within network blocking scenarios. The content should be =
safe, but with obfuscation or maybe tor support it would be even =
=E2=80=9EWhisle blower safe=E2=80=9C.

Best regards,
Sascha

> Am 15.02.2017 um 19:25 schrieb Michael Gerlach <n3ph@terminal21.de>:
>=20
> Hey Sascha,
>=20
> correct me if I am wrong - I am wondering what DPI should do with a
> crypto-stream and what "obfuscating" could improve at this point?
>=20
> Best regards,
>=20
>=20
> n3ph
>=20
> On Wed, Feb 15, 2017 at 06:47:36PM +0100, Sascha Grunert wrote:
>> Hey WireGuard developers,
>>=20
>> I just wanted to know what the current status of the cross platform =
version of wireguard is and would vote for a Rust implementation.
>>=20
>> I am willing to support the development since I have network =
programming background and know Rust.
>>=20
>> Further it would be cool to add obfuscation support to the protocol =
to make it Deep Packet Inspection (DPI) safe.=20
>>=20
>> Best regards,
>> Sascha
>> _______________________________________________
>> WireGuard mailing list
>> WireGuard@lists.zx2c4.com
>> https://lists.zx2c4.com/mailman/listinfo/wireguard
>=20
> --=20
> Please use PGP - https://en.wikipedia.org/wiki/Pretty_Good_Privacy
>=20
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
