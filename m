Return-Path: lazyvirus@gmx.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 98ec6045
 for <wireguard@lists.zx2c4.com>; Tue, 2 May 2017 17:07:57 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e7a2ba82
 for <wireguard@lists.zx2c4.com>; Tue, 2 May 2017 17:07:57 +0000 (UTC)
Date: Tue, 2 May 2017 19:17:26 +0200
From: Bzzzz <lazyvirus@gmx.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: wg-quick can't down my vpn I/F and DNS problem
Message-ID: <20170502191726.7d23b7d7@msi.defcon1>
In-Reply-To: <CAHmME9pSBfUtNBRYugC6o2hR8QhmQEzm4ZrTouzbo2vc9NuTfQ@mail.gmail.com>
References: <20170502172752.4e234cd8@msi.defcon1>
 <CAHmME9rrgXSW5pbg56JwBXwcfey0MS-fT7zF-+SmiBwCa5a7bg@mail.gmail.com>
 <20170502185455.4e88561e@msi.defcon1>
 <CAHmME9pSBfUtNBRYugC6o2hR8QhmQEzm4ZrTouzbo2vc9NuTfQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Tue, 2 May 2017 19:08:10 +0200
"Jason A. Donenfeld" <Jason@zx2c4.com> wrote:

> DNS is solved using the PostUp line. See the man page example -- `man
> wg-quick`.

OK, I'm gonna see that.

> For your down error, can you send precise command line output?

Here's the startup:

# ./SERVER_WG_UP.sh=20
D=C3=A9marrage du SERVEUR VPN WireGuard
[#] ip link add vpnserver type wireguard
[#] wg setconf vpnserver /dev/fd/63
[#] ip address add 10.11.12.1/24 dev vpnserver
[#] ip link set vpnserver up
[#] wg set vpnserver fwmark 51820
[#] ip -4 route add 0.0.0.0/0 dev vpnserver table 51820
[#] ip -4 rule add not fwmark 51820 table 51820
[#] ip -4 rule add table main suppress_prefixlength 0
SERVEUR VPN WireGuard d=C3=A9marr=C3=A9

The ifconfig output:

vpnserver Link encap:UNSPEC  HWaddr
00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00 inet addr:10.11.12.1
P-t-P:10.11.12.1  Mask:255.255.255.0 UP POINTOPOINT RUNNING NOARP
MTU:1420  Metric:1 RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:4 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1=20
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

The wg show vpnserver command output:

# wg show vpnserver
interface: vpnserver
  public key: =E2=80=A6
  private key: (hidden)
  preshared key: (hidden)
  listening port: 1194
  fwmark: 0xca6c

peer: =E2=80=A6
  allowed ips: 0.0.0.0/0


And finally the down command output:

# wg-quick down vpnserver
wg-quick: `vpnserver' is not a WireGuard interface


Jean-Yves
