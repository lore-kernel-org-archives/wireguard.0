Return-Path: adriankoooo@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a743f247
 for <wireguard@lists.zx2c4.com>; Thu, 2 Nov 2017 19:41:12 +0000 (UTC)
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
 [209.85.223.171])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 542e032f
 for <wireguard@lists.zx2c4.com>; Thu, 2 Nov 2017 19:41:12 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id n137so1490799iod.6
 for <wireguard@lists.zx2c4.com>; Thu, 02 Nov 2017 12:43:49 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?QWRyacOhbiBNaWjDoWxrbw==?= <adriankoooo@gmail.com>
Date: Thu, 2 Nov 2017 20:43:27 +0100
Message-ID: <CA+Hw3eYrO9ksGfdLxvK0XhEbqA8x3_gXb1CnAhCiifwfyiY9-A@mail.gmail.com>
Subject: Wireguard: segmentation fault on rPi
To: dkg@fifthhorseman.net, wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary="f403045fae30f6a411055d053450"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--f403045fae30f6a411055d053450
Content-Type: text/plain; charset="UTF-8"

Hi Daniel,

It is possible that the build is wrong on the repo?

Installed WG using source, it is worked, then I decided to install new
version from repo - added the repo into sources.list then I installed the
tools:

# apt update
# apt install wireguard-dkms wireguard-tools

When I try to run wg tool I get: Segmentation Fault.

I am using rPi and armbian.

Regards,
Adrian

--f403045fae30f6a411055d053450
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Daniel,<div><br></div><div>It is possible that the buil=
d is wrong on the repo?</div><div><br></div>Installed WG using source, it i=
s worked, then I decided to install new version from repo - added the repo =
into sources.list then I=C2=A0installed the tools:  <div><br></div># apt up=
date=C2=A0<div># apt install wireguard-dkms wireguard-tools<div><br></div><=
/div><div>When I try to run wg tool I get: Segmentation Fault.</div><div><b=
r></div><div>I am using rPi and armbian.</div><div><br></div><div>Regards,<=
/div><div>Adrian</div></div>

--f403045fae30f6a411055d053450--
