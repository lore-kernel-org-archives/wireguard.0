Return-Path: rcwhelan@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6336a9a1
 for <wireguard@lists.zx2c4.com>;
 Sat, 18 Nov 2017 23:39:37 +0000 (UTC)
Received: from mail-qt0-f170.google.com (mail-qt0-f170.google.com
 [209.85.216.170])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8d8bd2e9
 for <wireguard@lists.zx2c4.com>;
 Sat, 18 Nov 2017 23:39:37 +0000 (UTC)
Received: by mail-qt0-f170.google.com with SMTP id a19so11020405qtb.3
 for <wireguard@lists.zx2c4.com>; Sat, 18 Nov 2017 15:44:17 -0800 (PST)
MIME-Version: 1.0
From: Ryan Whelan <rcwhelan@gmail.com>
Date: Sat, 18 Nov 2017 18:44:15 -0500
Message-ID: <CAM3m09QZc=kJoXUQvCpCVQG62TeDX0B4BdcuUU3A9T2Lfg10VQ@mail.gmail.com>
Subject: Another allowed-ips question
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: multipart/alternative; boundary="001a1137b42a5cae5d055e4a6e64"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a1137b42a5cae5d055e4a6e64
Content-Type: text/plain; charset="UTF-8"

I'm working on a system where Wireguard machines can connect directly to
one another as well as communicate with one another via an intermediary
router (or 'server').

When 2 machines directly connect to one another, the allowed-ips setting is
obviously a non-issue; what i'm struggling with is if they are unable to
communicate directly and build routes to one another via an intermediary
router (which is also connected to each 'client' via wireguard).  Unless
the 'server' NATs the traffic, the allowed-ips setting will prevent the
'clients' from communicating.  Am i missing something?

I'm trying to avoid building a wg interface for each peer connection if
possible, but i'm failing to see any other way around it.  Either NAT at
the intermediary router or create an interface per-peer.

Are there other options?

--001a1137b42a5cae5d055e4a6e64
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m working on a system where Wireguard machines can c=
onnect directly to one another as well as communicate with one another via =
an intermediary router (or &#39;server&#39;).=C2=A0<div><br></div><div>When=
 2 machines directly connect to one another, the allowed-ips setting is obv=
iously a non-issue; what i&#39;m struggling with is if they are unable to c=
ommunicate directly and build routes to one another via an intermediary rou=
ter (which is also connected to each &#39;client&#39; via wireguard).=C2=A0=
 Unless the &#39;server&#39; NATs the traffic, the allowed-ips setting will=
 prevent the &#39;clients&#39; from communicating.=C2=A0 Am i missing somet=
hing?</div><div><br></div><div>I&#39;m trying to avoid building a wg interf=
ace for each peer connection if possible, but i&#39;m failing to see any ot=
her way around it.=C2=A0 Either NAT at the intermediary router or create an=
 interface per-peer.</div><div><br></div><div>Are there other options?</div=
></div>

--001a1137b42a5cae5d055e4a6e64--
