Return-Path: sg5414@g.rit.edu
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2cd6cdf7
 for <wireguard@lists.zx2c4.com>; Tue, 1 Aug 2017 06:08:26 +0000 (UTC)
Received: from mx03a-out01ag.rit.edu (mx03a-out01ag.rit.edu [129.21.3.134])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 293962f6
 for <wireguard@lists.zx2c4.com>; Tue, 1 Aug 2017 06:08:26 +0000 (UTC)
From: Sahil Gupta <sg5414@rit.edu>
Received: by mail-pg0-f70.google.com with SMTP id u7so8393886pgo.6
 for <wireguard@lists.zx2c4.com>; Mon, 31 Jul 2017 23:29:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9qD0WzDA39-GLrkpmnBFoM_Ko=u-LnZLnSWUtiVVXuOxg@mail.gmail.com>
References: <CAA8CD9uo0s0HrYeArMjRS2Hqkrv4hL7tXAfv-vWSkzoANWQ57A@mail.gmail.com>
 <CAHmME9qD0WzDA39-GLrkpmnBFoM_Ko=u-LnZLnSWUtiVVXuOxg@mail.gmail.com>
Date: Tue, 1 Aug 2017 02:29:18 -0400
Message-ID: <CAA8CD9vq6_TGdTafb0YAs+ZQFtR6W24xSSaTVEmDjdPDQuHK4w@mail.gmail.com>
Subject: Re: Tunneling protocol in WireGuard
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: multipart/alternative; boundary="089e0823835860653b0555ab441f"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Reply-To: sg5414@rit.edu
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--089e0823835860653b0555ab441f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

If we go in the history=E2=80=8B of tunneling protocols.
PPP protocol get tunnel by PPTP using GRE tunneling protocol.
L2F by CISCO uses L2F header.
L2TP by Microsoft uses L2TP header.
IPSec uses either ESP,AH or combination of both depending on kind of
security required then attach the other IP header.

So I was wondering if there is some header between IPv4 and IPv6 which
define some control information about tunneled packet.
Or just IPv6 just after IPv4 header and vice versa.

--089e0823835860653b0555ab441f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">If we go in the history=E2=80=8B of tunneling protocols.<b=
r>PPP protocol get tunnel by PPTP using GRE tunneling protocol.<br>L2F by C=
ISCO uses L2F header.<br>L2TP by Microsoft uses L2TP header.<br>IPSec uses =
either ESP,AH or combination of both depending on kind of security required=
 then attach the other IP header.<br><br>So I was wondering if there is som=
e header between IPv4 and IPv6 which define some control information about =
tunneled packet.<br>Or just IPv6 just after IPv4 header and vice versa.<br>=
=C2=A0=C2=A0</div>

--089e0823835860653b0555ab441f--
