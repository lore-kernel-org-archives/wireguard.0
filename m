Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b855f3fd
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Aug 2016 01:05:57 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e7faab52
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Aug 2016 01:05:57 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9d242aeb
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Aug 2016 01:05:57 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id o80so202392100wme.1
 for <wireguard@lists.zx2c4.com>; Tue, 16 Aug 2016 18:11:10 -0700 (PDT)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 17 Aug 2016 03:11:08 +0200
Message-ID: <CAHmME9ojjGjoBq78Vem4gG3gya_=xRP+fr7+0DBzvuot5OAJPg@mail.gmail.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: multipart/alternative; boundary=001a1140d864f7cf9f053a3a2369
Subject: [WireGuard] The Bikeshed Thread: Replacing AllowedIPs
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a1140d864f7cf9f053a3a2369
Content-Type: text/plain; charset=UTF-8

"AllowedIPs" is terrible. The best suggestions so far are "TunnelIPs" and
"TunneledIPs"/"TunnelledIPs".

TunnelIPs is more succinct and doesn't have US-vs-British spelling
ambiguities. TunneledIPs makes it clearer that the IPs are _in_ the tunnel
and doesn't put a lower case L next to an upper case i.

I'll make a decision in one week. Fill the thread with ideas!

Jason

--001a1140d864f7cf9f053a3a2369
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&quot;AllowedIPs&quot; is terrible. The best suggestions s=
o far are &quot;TunnelIPs&quot; and &quot;TunneledIPs&quot;/&quot;Tunnelled=
IPs&quot;.
<div><br></div><div>TunnelIPs is more succinct and doesn&#39;t have US-vs-B=
ritish spelling ambiguities. TunneledIPs makes it clearer that the IPs are =
_in_ the tunnel and doesn&#39;t put a lower case L next to an upper case i.=
</div><div><br></div><div>I&#39;ll make a decision in one week. Fill the th=
read with ideas!</div><div><br></div><div>Jason</div></div>

--001a1140d864f7cf9f053a3a2369--
