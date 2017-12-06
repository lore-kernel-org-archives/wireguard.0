Return-Path: toke@toke.dk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 94895af8
 for <wireguard@lists.zx2c4.com>; Wed, 6 Dec 2017 12:26:37 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [52.28.52.200])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5b0b876a
 for <wireguard@lists.zx2c4.com>; Wed, 6 Dec 2017 12:26:37 +0000 (UTC)
Date: Wed, 06 Dec 2017 13:33:23 +0100
In-Reply-To: <CAM3m09QrRs=20aTOdDXtWg3dgCVemRgAXZ91=WTWTf_+d-ax4A@mail.gmail.com>
References: <CAM3m09QrRs=20aTOdDXtWg3dgCVemRgAXZ91=WTWTf_+d-ax4A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Subject: Re: Babel over wireguard
To: Ryan Whelan <rcwhelan@gmail.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
From: =?ISO-8859-1?Q?Toke_H=F8iland-J=F8rgensen?= <toke@toke.dk>
Message-ID: <BF2C7924-EBFC-480C-AA52-D92CB818F3D3@toke.dk>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>



On 6 December 2017 13:07:56 CET, Ryan Whelan <rcwhelan@gmail=2Ecom> wrote:
>I'm looking to run babel over wireguard links and running into issues=2E=
=20
>I
>seem to be unable to get Bird or the reference implementation of Babel
>to
>bind to any wireguard interfaces=2E  Is this a known issue? or has anyone
>found a config that works?

You need to manually add link-local IPs (fe80:: something) to the wireguar=
d interface=2E Also, since wireguard doesn't support multicast it is only l=
ikely to work on point-to-point links with AllowedIPs set to ::/0 (or somet=
hing else that includes the Babel multicast address)=2E

-Toke
