Return-Path: mail@danrl.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 75c2eb2a
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Feb 2017 13:23:46 +0000 (UTC)
Received: from mx.cakelie.net (mx.cakelie.net [45.76.39.236])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 426567e5
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Feb 2017 13:23:45 +0000 (UTC)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Subject: Re: [wireguard-devel] : wg output format
From: =?utf-8?Q?Dan_L=C3=BCdtke?= <mail@danrl.com>
In-Reply-To: <CADdae-jTbEV27UJMTV8aABg7K0C1pCBhSejUc8yrBpNxwJ5ePw@mail.gmail.com>
Date: Fri, 17 Feb 2017 14:24:02 +0100
Message-Id: <427618D1-5371-4D9E-81B3-2992CE84300C@danrl.com>
References: <CADdae-jTbEV27UJMTV8aABg7K0C1pCBhSejUc8yrBpNxwJ5ePw@mail.gmail.com>
To: nicolas prochazka <prochazka.nicolas@gmail.com>
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hello Nicolas,

been there, asked that. The answer was negative.
I know, it is no fun to parse.
See here how I worked around it:
-> =
https://github.com/danrl/lede-luci/blob/58833aa2df97ba93a9512f3b0c428cf558=
fa2235/applications/luci-app-wireguard/luasrc/view/wireguard.htm

JSON output would have saved me about 100+ lines of LUA code.

Still considering patching the wg util.
Hopefully, this LUA code helps you to get started. Feel free to share =
your solution, I am still interested in getting JSON out of wg for some =
other project.

Cheers,

Dan


> On 17 Feb 2017, at 11:25, nicolas prochazka =
<prochazka.nicolas@gmail.com> wrote:
>=20
> hello,=20
> wg show, showconf .... output format is not easy to parse.
> Can you add a json output , with all information about peers , conf ( =
endpoint, pubkey,handshake ... ) in a single line
>=20
> Regards,=20
> Nicolas Prochazka
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
