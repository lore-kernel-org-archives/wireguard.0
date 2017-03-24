Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c939a59c
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Mar 2017 01:11:01 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7af0631b
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Mar 2017 01:11:01 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 83deb40f
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Mar 2017 01:11:00 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 73079612
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Mar 2017 01:11:00 +0000 (UTC)
Received: by mail-ot0-f172.google.com with SMTP id y88so382306ota.2
 for <wireguard@lists.zx2c4.com>; Thu, 23 Mar 2017 18:15:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <eb21fbc6-206d-68a6-994f-50dce322b534@med.uni-frankfurt.de>
References: <eb21fbc6-206d-68a6-994f-50dce322b534@med.uni-frankfurt.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 24 Mar 2017 02:15:35 +0100
Message-ID: <CAHmME9oiBaUets1JUp5SVP41XdPd04zJYuiN24QuqYsUttCqcA@mail.gmail.com>
Subject: Re: unable to set allowed-ips
To: Thomas Sattler <sattler@med.uni-frankfurt.de>
Content-Type: multipart/alternative; boundary=001a11492f9a1e5606054b6fbbbc
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a11492f9a1e5606054b6fbbbc
Content-Type: text/plain; charset=UTF-8

Be sure userland wg(8) is built from the same source as kernel land
wireguard module.

I'll have the module actually detect this mismatch itself in later versions.

--001a11492f9a1e5606054b6fbbbc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Be sure userland wg(8) is built=
 from the same source as kernel land wireguard module.</div><div class=3D"g=
mail_extra"><br></div><div class=3D"gmail_extra">I&#39;ll have the module a=
ctually detect this mismatch itself in later versions.</div></div>

--001a11492f9a1e5606054b6fbbbc--
